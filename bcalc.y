%{
 #include <stdio.h>
void yyerror(char *);
int yylex(void);
int sym[26];
%}

%token BOOLEAN VARIABLE
%token AND OR NOT NAND NOR XOR XNOR
%left AND OR NOT NAND NOR XOR XNOR
%%
program:
program statement '\n'
|
;
statement:
expr { printf("%d\n", $1); }
| VARIABLE '=' expr { sym[$1] = $3; }
| statement ',' statement
;


expr: 
BOOLEAN
| VARIABLE        { $$ = sym[$1];}
| expr OR expr   { if($1==1||$3 ==1){$$=1;}else{$$=0;} }
| expr AND expr   { $$ = $1 * $3;}
| expr NAND expr  { if( $1 * $3 ==1){$$=0;}else{$$=1;}}
| expr XOR expr   { if( $1 ==0 && $3==1 || $1 ==1 && $3==0){ $$=1; }else{$$=0 ;} }
| expr NOR expr  { if($1==0&&$3 ==0){$$=1;}else{$$=0;} }
| expr XNOR expr  { if( $1 ==0 && $3==0 || $1 ==1 && $3==1){ $$=1; }else{$$=0;} }
| NOT expr        { if($2==1){ $$=0; }else{ $$=1;} } 
| '(' expr ')'    { $$ = $2; }

;
%%
#include "lex.yy.c"
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
int main(void) {
yyparse();
return 0;
}
