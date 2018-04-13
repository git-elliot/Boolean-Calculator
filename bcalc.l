%{
#include <stdlib.h>
void yyerror(char *);
#include "bcalc.tab.h"
%}
%%
not return NOT;
and return AND;
or return OR;
xor return XOR;
xnor return XNOR;
nand return NAND;
nor return NOR;
[a-z] {
          yylval = *yytext - 'a';
          return VARIABLE;
       }

[0-1]+ {
           yylval = atoi(yytext);
           return BOOLEAN;
        }

[()=\n] { return *yytext; }
[ \t] ;
,  {return *yytext; } 
. yyerror("invalid character");
%%
int yywrap(void) {
return 1;
}
