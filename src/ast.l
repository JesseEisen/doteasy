D           [0-9]
L           [a-zA-Z_]

%{
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}

%%

#                     {  return SHARP; }
:                     {  return COLON; }
->                    {  yylval.string = strdup(yytext); return ARROW; }
\n                    /* ignore */
({L}|{D})+            {  yylval.string = strdup(yytext); return ID;}
L?\"(\\.|[^\\"])*\"   {  yylval.string = strdup(yytext); return STRING; }
[ \t]+                /* do nothing */
.                     /* ignore */

%%

int yywrap(void) {
    return 1;
}

