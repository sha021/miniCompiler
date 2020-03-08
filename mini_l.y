%{
 #include <stdio.h>
 #include <stdlib.h> 
 void yyerror(const char *msg);
 extern int currLine;
 extern int currPos;
 FILE * yyin;
 int yylex();
%}
%union{
    int ival;
    char *sval;
}
%error-verbose

%start program 
%token NUMBER FUNCTION BEGIN_PARAMS END_PARAMS BEGIN_LOCALS END_LOCALS BEGIN_BODY END_BODY INTEGER ARRAY OF IF THEN ENDIF ELSE WHILE DO FOR BEGINLOOP ENDLOOP CONTINUE READ WRITE AND OR NOT TRUE FALSE RETURN SUB ADD MULT DIV MOD EQ NEQ LT GT LTE GTE IDENT SEMICOLON COLON COMMA L_PAREN R_PAREN L_SQUARE_BRACKET R_SQUARE_BRACKET ASSIGN
%type <ival> NUMBER
%type <sval> IDENT
%left L_PAREN R_PAREN
%left L_SQUARE_BRACKET R_SQUARE_BRACKET
%left MULT DIV MOD 
%left ADD SUB 
$left LT LTE GT GTE EQ NEQ
%right NOT 
%left AND 
%left OR
%right ASSIGN
%%

program: {printf("program -> epsilon\n");}
    | function program {printf("program -> function program\n");}
    ;

function:       FUNCTION ident SEMICOLON BEGIN_PARAMS help_dec_semi END_PARAMS BEGIN_LOCALS help_dec_semi END_LOCALS BEGIN_BODY help_state_semi END_BODY {printf("function -> FUNCTION ident SEMICOLON BEGIN_PARAMS help_dec_semi END_PARAMS BEGIN_LOCALS help_dec_semi END_LOCALS BEGIN_BODY help_state_semi END_BODY\n");}
   ;

help_dec_semi:	{printf("help_dec_semi -> epsilon\n");}
                |   declaration SEMICOLON help_dec_semi {printf("help_dec_semi -> declaration SEMICOLON help_dec_semi\n");}
                ;
                
help_state_semi:     statement SEMICOLON {printf("help_state_semi -> statement SEMICOLON\n");}
                |    statement SEMICOLON help_state_semi {printf("help_state_semi -> statement SEMICOLON help_state_semi\n");}
               ;
					
declaration:	help_id_comma COLON help_array INTEGER {printf("declaration -> help_id_comma COLON help_array INTEGER\n");}
		        ;

help_id_comma:	ident COMMA help_id_comma {printf("help_id_comma -> ident COMMA help_id_comma\n");}
		        | ident {printf("help_id_comma -> ident\n");}
		        ;

help_array:	   {printf("help_array -> epsilon\n");}
                | ARRAY L_SQUARE_BRACKET number R_SQUARE_BRACKET OF {printf("help_array -> ARRAY L_SQUARE_BRACKET number R_SQUARE_BRACKET OF\n");}
		        ;

statement:     IF bool_expr THEN help_if_then ENDIF {printf("statement -> IF bool_expr THEN help_if_then ENDIF\n");}
		          | WHILE bool_expr BEGINLOOP help_state_semi ENDLOOP {printf("statement -> WHILE bool_expr BEGINLOOP help_state_semi ENDLOOP\n");}
                | DO BEGINLOOP help_state_semi ENDLOOP WHILE bool_expr {printf("statement ->  DO BEGINLOOP help_state_semi ENDLOOP WHILE bool_expr\n");}
                | FOR var ASSIGN number SEMICOLON bool_expr SEMICOLON var ASSIGN expression BEGINLOOP help_state_semi ENDLOOP {printf("statement ->  FOR var ASSIGN number SEMICOLON bool_expr SEMICOLON var ASSIGN expression BEGINLOOP help_state_semi ENDLOOP\n");}
                | READ help_var_comma {printf("statement -> READ help_var_comma\n");}                
                | WRITE help_var_comma {printf("statement -> WRITE help_var_comma\n");}
                | CONTINUE {printf("statement -> CONTINUE\n");}
                | RETURN expression {printf("statement -> RETURN expression\n");}
                | var ASSIGN expression {printf("statement -> var ASSIGN expression\n");}
                ;		

bool_expr:	    relation_and_expr help_or_rae {printf("bool_exp -> relation_and_expr help_or_rae\n");}
		        ;

help_if_then:   help_state_semi {printf("help_if_then -> help_state_semi\n");}
                | help_state_semi ELSE help_state_semi{printf("help_if_then -> help_state_semi ELSE help_state_semi\n");}
                ;

help_or_rae:	{printf("help_or_rae -> epsilon\n");}
		        | OR relation_and_expr help_or_rae {printf("help_or_rae -> OR relation_and_expr help_or_rae\n");}
		        ;

help_var_comma: var COMMA help_var_comma {printf("help_var_comma -> var COMMA help_var_comma\n");}
                | var {printf("help_var_comma -> var\n");}
                ;

relation_and_expr:	relation_expr help_and_re {printf("relation_and_expr -> relation_expr help_and_re\n");}
			        ;

help_and_re:	{printf("help_and_re -> epsilon\n");}
            | AND relation_expr help_and_re {printf("help_and_re -> AND relation_expr help_and_re\n");}
		        ;

relation_expr:  NOT help_re_choices {printf("relation_expr -> NOT help_re_choices\n");}
                | help_re_choices {printf("relation_expr -> help_re_choices\n");}
                ;

help_re_choices:    expression comp expression {printf("help_re_choices -> expression comp expression\n");}
                    | TRUE {printf("help_re_choices -> TRUE\n");}
                    | FALSE {printf("help_re_choices -> FALSE\n");}
                    | L_PAREN bool_expr R_PAREN {printf("help_re_choices -> L_PAREN bool_expr R_PAREN\n");}
                    ;

comp:           EQ {printf("comp -> EQ\n");}
                | NEQ {printf("comp -> NEQ\n");}
                | LT {printf("comp -> LT\n");}
                | GT {printf("comp -> GT\n");}
                | LTE {printf("comp -> LTE\n");}
                | GTE {printf("comp -> GTE\n");}
                ;

expression:     multiplicative_expr help_pm_me {printf("expression -> multiplicative_expr help_pm_me\n");}
                ;

help_pm_me:     {printf("help_pm_me -> epsilon\n");}
                | ADD multiplicative_expr help_pm_me {printf("help_pm_me -> ADD multiplicative_expr help_pm_me\n");}
                | SUB multiplicative_expr help_pm_me {printf("help_pm_me -> SUB multiplicative_expr help_pm_me\n");}
                ;

multiplicative_expr:    term help_mdm_term {printf("multiplicative_expr -> term help_mdm_term\n");}
                        ;

help_mdm_term:  {printf("help_mdm_term -> epsilon\n");}
                | MULT term help_mdm_term {printf("help_mdm_term -> MULT term help_mdm_term\n");}
                | DIV term help_mdm_term {printf("help_mdm_term -> DIV term help_mdm_term\n");}
                | MOD term help_mdm_term {printf("help_mdm_term -> MOD term help_mdm_term\n");}
                ;

term:           SUB help_vne_choices {printf("term -> SUB help_vne_choices\n");}
                | help_vne_choices {printf("term -> help_vne_choices\n");}
                | ident L_PAREN help_expr R_PAREN {printf("term -> ident L_PAREN help_expr R_PAREN\n");}
                | ident L_PAREN R_PAREN {printf("term -> ident L_PAREN R_PAREN\n");}
                ;

help_vne_choices:       var {printf("help_vne_choices -> var\n");}
                        | number {printf("help_vne_choices -> number\n");}
                        | L_PAREN expression R_PAREN {printf("help_vne_choices -> L_PAREN expression R_PAREN\n");}
                        ;

help_expr:       expression {printf("help_expr -> expression\n");}
                | expression COMMA help_expr {printf("help_expr -> expression COMMA help_expr\n");}
                ;

var:            ident {printf("var -> ident\n");}
                | ident L_SQUARE_BRACKET expression R_SQUARE_BRACKET {printf("var -> ident L_SQUARE_BRACKET expression R_SQUARE_BRACKET\n");}
                ;

ident:         IDENT {printf("ident -> IDENT %s\n", $1);} 
number:        NUMBER {printf("number -> NUMBER %d\n", $1);}
%%

int main(int argc, char **argv) {
   if (argc > 1) {
      yyin = fopen(argv[1], "r");
      if (yyin == NULL){
         printf("syntax: %s filename\n", argv[0]);
      }
   }
   yyparse(); // Calls yylex() for tokens.
   return 0;
}

void yyerror(const char *msg) {
   printf("** Line %d, position %d: %s\n", currLine, currPos, msg);
}

