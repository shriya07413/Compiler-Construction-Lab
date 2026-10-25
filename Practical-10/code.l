%{
//Shriya Yerane 24070521197
#include <stdio.h>
#include "y.tab.h"
%}

%%

"for" { return FOR; }
"("   { return LPAREN; }
")"   { return RPAREN; }
"{"   { return LBRACE; }
"}"   { return RBRACE; }
";"   { return SEMICOLON; }
"="   { return ASSIGN; }

[a-zA-Z]+ { return IDENTIFIER; }
[0-9]+    { return NUMBER; }

[ \t\n];

. { printf("Invalid character: %s\n", yytext); }

%%

int yywrap(void) {
    return 1;
}
