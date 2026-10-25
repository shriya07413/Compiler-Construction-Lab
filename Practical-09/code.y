%{
//Shriya Yerane  24070521197
#include <stdio.h>
#include <math.h>
#define YYSTYPE double
int yylex(void);
void yyerror(const char *s);
%}
%token NUMBER
%token INC DEC
%token INVALID
%left '+' '-'
%left '*' '/' '%'
%right '^'
%%
input:
    | input line
    ;
line:
      expr '\n'
        {
            printf("Result = %g\n", $1);
        }
    | '\n'
        {
        }
    | error '\n'
        {
            printf("Error: Invalid expression. Please try again.\n");
            yyerrok;
        }
    ;
expr:
      NUMBER
        {
            $$ = $1;
        }

    | expr '+' expr
        {
            $$ = $1 + $3;
        }

    | expr '-' expr
        {
            $$ = $1 - $3;
        }

    | expr '*' expr
        {
            $$ = $1 * $3;
        }

    | expr '/' expr
        {
            if ($3 == 0)
            {
                yyerror("Division by zero");
                $$ = 0;
            }
            else
            {
                $$ = $1 / $3;
            }
