%{
 #include <stdio.h>
 #include <stdlib.h> 
 #include <iostream>
 #include <sstream>
 #include <string>
 void yyerror(const char *msg);
 extern int currLine;
 extern int currPos;
 extern FILE * yyin;
 int yylex();
 
 using namespace std;
 struct program_struct {string code;};
 struct function_struct {string code;};
 struct help_dec_semi_struct {string code;};
 struct help_dec_semi_par_struct {string code;};
 struct help_state_semi_struct {string code;};
 struct declaration_struct {string code;};
 struct declaration_par_struct {string code;};
 struct help_id_comma_struct {string code; string resultId;};
 struct help_array_struct {string code;};
 struct statement_struct{string code;};
 struct bool_expr_struct {string code; string resultId;};
 struct help_if_then_struct {string code; string resultId;};
 struct help_or_rae_struct {string code;};
 struct help_var_comma_struct {string code;  string resultId;};
 struct relation_and_expr_struct {string code;  string resultId;};
 struct help_and_re_struct{string code;};
 struct relation_expr_struct {string code;   string resultId;};
 struct help_re_choices_struct {string code; string resultId;};
 struct comp_struct {string code;};
 struct expression_struct {string code;   string resultId;};
 struct help_pm_me_struct {string code;};
 struct multiplicative_expr_struct {string code;  string resultId;};
 struct help_mdm_term_struct {string code; string resultId;};
 struct term_struct {string code;   string resultId;};
 struct help_vne_choices_struct {string code;   string reslutId;};
 struct help_expr_struct {string code; string resultId;};
 struct var_struct{string code;  string resultId;};
 struct ident_struct {string code;  string resultId;};
 struct number_struct {string code;  string resultId;}; 
%}
%union{
    int ival;
    char *sval;
    struct program_struct *program_semval;
    struct help_dec_semi_struct *help_dec_semi_semval;
    struct help_dec_semi_par_struct *help_dec_semi_par_semval;
    struct function_struct *function_semval;
    struct help_state_semi_struct *help_state_semi_semval;
    struct declaration_struct *declaration_semval;
    struct declaration_par_struct *declaration_par_semval;
    struct help_id_comma_struct *help_id_comma_semval;
    struct help_array_struct *help_array_semval;
    struct statement_struct *statement_semval;
    struct bool_expr_struct *bool_expr_semval;
    struct help_if_then_struct *help_if_then_semval;
    struct help_or_rae_struct *help_or_rae_semval;
    struct help_var_comma_struct *help_var_comma_semaval;
    struct relation_and_expr_struct *relation_and_expr_semval;
    struct help_and_re_struct *help_and_re_semval;
    struct relation_and_expr_struct *relation_expr_semval;
    struct help_re_choices_struct *help_re_choices_semval;
    struct comp_struct *comp_semval;
    struct expression_struct *expression_semval;
    struct help_pm_me_struct *help_pm_me_semval;
    struct multiplicative_expr_struct *multiplicative_expr_semval;
    struct help_mdm_term_struct *help_mdm_term_semval;
    struct term_struct *term_semval;
    struct help_vne_choices_struct *help_vne_choices_semval;
    struct help_expr_struct *help_expr_semval;
    struct var_struct *var_semval;
    struct ident_struct *ident_semval;
    struct number_struct *number_semval;
}
%error-verbose

%start program 
%token NUMBER FUNCTION BEGIN_PARAMS END_PARAMS BEGIN_LOCALS END_LOCALS BEGIN_BODY END_BODY INTEGER ARRAY OF IF THEN ENDIF ELSE WHILE DO FOR BEGINLOOP ENDLOOP CONTINUE READ WRITE AND OR NOT TRUE FALSE RETURN SUB ADD MULT DIV MOD EQ NEQ LT GT LTE GTE IDENT SEMICOLON COLON COMMA L_PAREN R_PAREN L_SQUARE_BRACKET R_SQUARE_BRACKET ASSIGN
%type <ival> NUMBER
%type <sval> IDENT
%type <program_semval> program
%type <function_semval> function
%type <help_dec_semi_semval> help_dec_semi
%type <help_dec_semi_par_semval> help_dec_semi_par
%type <help_state_semi_semval> help_state_semi
%type <declaration_semval> declaration
%type <declaration_par_semval> declaration_par
%type <help_array_semval> help_array
%type <statement_semval> statement
%type <bool_expr_semval> bool_expr
%type <help_if_then_semval> help_if_then
%type <help_or_rae_semval> help_or_rae
%type <help_var_comma_semaval> help_var_comma
%type <relation_and_expr_semval> relation_and_expr
%type <help_id_comma_semval> help_id_comma
%type <help_and_re_semval> help_and_re
%type <relation_expr_semval> relation_expr
%type <help_re_choices_semval> help_re_choices
%type <comp_semval> comp
%type <expression_semval> expression
%type <help_pm_me_semval> help_pm_me
%type <multiplicative_expr_semval> multiplicative_expr
%type <help_mdm_term_semval> help_mdm_term
%type <term_semval> term
%type <help_vne_choices_semval> help_vne_choices
%type <help_expr_semval> help_expr
%type <var_semval> var
%type <ident_semval> ident
%type <number_semval> number
%left L_PAREN R_PAREN
%left L_SQUARE_BRACKET R_SQUARE_BRACKET
%left MULT DIV MOD 
%left ADD SUB 
%left LT LTE GT GTE EQ NEQ
%right NOT 
%left AND 
%left OR
%right ASSIGN
%%
program:  
    | function program {
         $$ = new program_struct; 
         ostringstream oss;
         oss << $1->code;
         $$->code = oss.str();
         cout << "-------------------" << endl;
         cout << $$->code << endl;
         delete $1;
      };

function:       FUNCTION ident SEMICOLON BEGIN_PARAMS help_dec_semi_par END_PARAMS BEGIN_LOCALS help_dec_semi END_LOCALS BEGIN_BODY help_state_semi END_BODY {printf("function -> FUNCTION ident SEMICOLON BEGIN_PARAMS help_dec_semi END_PARAMS BEGIN_LOCALS help_dec_semi END_LOCALS BEGIN_BODY help_state_semi END_BODY\n");
   $$ = new function_struct;
   ostringstream oss;
   oss << "function " << $2->code <<endl;
   // For parameter declaratoin
   oss << $8->code;
   // For local declaration
   oss << $11->code;
   $$->code = oss.str();  
}
   ;

help_dec_semi_par:	{printf("help_dec_semi -> epsilon\n");}
            |  declaration_par SEMICOLON help_dec_semi_par {printf("help_dec_semi -> declaration SEMICOLON help_dec_semi\n");
                  $$ = new help_dec_semi_par_struct;
                  ostringstream oss;
                  oss << $1->code << $3->code;
                  $$->code = oss.str();
               }
                ;

help_dec_semi:	{printf("help_dec_semi -> epsilon\n");}
            |  declaration SEMICOLON help_dec_semi {printf("help_dec_semi -> declaration SEMICOLON help_dec_semi\n");
                  $$ = new help_dec_semi_struct;
                  ostringstream oss;
                  oss << $1->code;
                  $$->code = oss.str();
               }
                ;
                
help_state_semi:     statement SEMICOLON {printf("help_state_semi -> statement SEMICOLON\n");
                        $$ = new help_state_semi_struct;
                        ostringstream oss;
                        oss << $1->code;
                        $$->code = oss.str();
                     }
   |  statement SEMICOLON help_state_semi {printf("help_state_semi -> statement SEMICOLON help_state_semi\n");
         $$ = new help_state_semi_struct;
         ostringstream oss;
         oss << $1->code << endl;
         oss << $3->code << endl;
         $$->code = oss.str();
   }
               ;

declaration_par:	ident COLON help_array INTEGER {
                     printf("declarationPAR -> ident COLON help_array INTEGER\n");
                     $$ = new declaration_par_struct;
                     ostringstream oss;
                     oss << ". " << $1->code << endl;
                     cout <<"------------------afdfadsadfsadfsds------\n"; 
                     oss << "= " << $1->code << ", $0" <<endl; 
                     $$->code = oss.str();
               }
               | ident COMMA declaration_par {
                  printf("declaraton_par -> ident COMMA declaration\n");
                  $$ = new declaration_par_struct;
                  ostringstream oss;
                  oss << ". " << $1->code << endl;
                  oss << $3->code;
                  $$->code = oss.str();
                  delete $1;
               }
		        ;

declaration:	ident COLON help_array INTEGER {
                  printf("declaration -> ident COLON help_array INTEGER\n");
                  $$ = new declaration_struct;
                  ostringstream oss;
                  oss << ". " << $1->code << endl;
                  $$->code = oss.str();
               }
               | ident COMMA declaration {
                  printf("ident COMMA declaration\n");
                  $$ = new declaration_struct;
                  ostringstream oss;
                  oss << ". " << $1->code << endl;
                  oss << $3->code;
                  $$->code = oss.str();
                  delete $1;
               }
		        ;


help_array:	   {printf("help_array -> epsilon\n");}
                | ARRAY L_SQUARE_BRACKET number R_SQUARE_BRACKET OF {printf("help_array -> ARRAY L_SQUARE_BRACKET number R_SQUARE_BRACKET OF\n");}
		        ;

statement:     IF bool_expr THEN help_if_then ENDIF
	|  WHILE bool_expr BEGINLOOP help_state_semi ENDLOOP {printf("statement -> WHILE bool_expr BEGINLOOP help_state_semi ENDLOOP\n");}
   |  DO BEGINLOOP help_state_semi ENDLOOP WHILE bool_expr {printf("statement ->  DO BEGINLOOP help_state_semi ENDLOOP WHILE bool_expr\n");}
   |  FOR var ASSIGN number SEMICOLON bool_expr SEMICOLON var ASSIGN expression BEGINLOOP help_state_semi ENDLOOP {printf("statement ->  FOR var ASSIGN number SEMICOLON bool_expr SEMICOLON var ASSIGN expression BEGINLOOP help_state_semi ENDLOOP\n");}
   |  READ help_var_comma {
         printf("statement -> READ help_var_comma\n");
         $$ = new statement_struct;
         ostringstream oss;
         oss << ".< " << $2->code;
         $$->code = oss.str();
      }                
   |  WRITE help_var_comma {
         printf("statement -> WRITE help_var_comma\n");
         $$ = new statement_struct;
         ostringstream oss;
         oss << ".> " << $2->code;
         $$->code = oss.str();
      }
   |  CONTINUE {printf("statement -> CONTINUE\n");}
   |  RETURN expression {printf("statement -> RETURN expression\n");}
   |  var ASSIGN expression {printf("statement -> var ASSIGN expression\n");}
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
                | var {printf("help_var_comma -> var\n");
                     $$ = new help_var_comma_struct;
                     ostringstream oss;
                     oss << $1->code;
                     $$->code = oss.str();
                  }
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

var:           ident {printf("var -> ident\n");
                  $$ = new var_struct;
                  ostringstream oss;
                  oss << $1->code;
                  $$->code = oss.str();
               }
                | ident L_SQUARE_BRACKET expression R_SQUARE_BRACKET {printf("var -> ident L_SQUARE_BRACKET expression R_SQUARE_BRACKET\n");}
                ;

ident:         IDENT {printf("ident -> IDENT %s\n", $1);
               $$ = new ident_struct;
               ostringstream oss;
               oss << $1;
               $$->resultId = oss.str();
               $$->code = oss.str();
               } 
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
