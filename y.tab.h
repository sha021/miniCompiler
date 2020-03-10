/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    NUMBER = 258,
    FUNCTION = 259,
    BEGIN_PARAMS = 260,
    END_PARAMS = 261,
    BEGIN_LOCALS = 262,
    END_LOCALS = 263,
    BEGIN_BODY = 264,
    END_BODY = 265,
    INTEGER = 266,
    ARRAY = 267,
    OF = 268,
    IF = 269,
    THEN = 270,
    ENDIF = 271,
    ELSE = 272,
    WHILE = 273,
    DO = 274,
    FOR = 275,
    BEGINLOOP = 276,
    ENDLOOP = 277,
    CONTINUE = 278,
    READ = 279,
    WRITE = 280,
    AND = 281,
    OR = 282,
    NOT = 283,
    TRUE = 284,
    FALSE = 285,
    RETURN = 286,
    SUB = 287,
    ADD = 288,
    MULT = 289,
    DIV = 290,
    MOD = 291,
    EQ = 292,
    NEQ = 293,
    LT = 294,
    GT = 295,
    LTE = 296,
    GTE = 297,
    IDENT = 298,
    SEMICOLON = 299,
    COLON = 300,
    COMMA = 301,
    L_PAREN = 302,
    R_PAREN = 303,
    L_SQUARE_BRACKET = 304,
    R_SQUARE_BRACKET = 305,
    ASSIGN = 306
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 45 "mini_l.y" /* yacc.c:1909  */

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

#line 140 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
