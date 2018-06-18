%{
    #include <stdio.h>
    #include <stdlib.h>
    void yyerror(char *);
    int yylex(void);
    #include "graph.h"
%}

%token SHARP COLON
%union
{
    char *string;
}

%token <string> ID
%token <string> STRING
%token <string> ARROW

%%
ast:
   | ast statement
   ;

statement:
         predefine
         |
         labelset
         |
         rawcontent
         ;

predefine:
         SHARP ID COLON ID
         {
             newgraph($2, $4);
         }
         ;

labelset:
        ID COLON STRING
        {
            nodeset($1, $3);
        }
        ;


rawcontent:
          ID ARROW ID
          {
            appendraw($1,$2,$3);
          }

%%

void yyerror(char *error)
{
    fprintf(stderr, "yacc: %s\n", error);
}

int main(void) {
    yyparse();
    output();
    return 0;
}
