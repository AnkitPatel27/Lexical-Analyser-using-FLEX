%{
#include<stdio.h>
#include<string.h>
%}

%%
[ \n\t]+ {}
(0|1)*0000(0|1)* {printf("accepted\n");}
.* {printf("rejected\n");}
%%

int yywrap(void){return 1;}

int main(int argc, char *argv[]) {
    extern FILE *yyin;
    yyin = fopen("i.txt", "r");
    yylex();
    return 0;
}
