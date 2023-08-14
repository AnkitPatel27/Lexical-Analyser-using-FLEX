%{
#include<stdio.h>
#include<string.h>
%}

%%

[ \n\t]+ {}
((1)*(0(1*)0)*(1)*)* {printf("accepted %s\n",yytext);}
((0)*(1(0*)1)*(0)*)* {printf("rejected  1%s\n",yytext);}
(0|1)* {printf("accepts %s\n",yytext);}

%%

//int yywrap(void){return 1;}
int yywrap(void){}

int main(int argc, char *argv[]) {
    extern FILE *yyin;
    yyin = fopen("i.txt", "r");
    yylex();
    return 0;
}
