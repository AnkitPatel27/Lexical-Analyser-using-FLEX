%{
#include <stdio.h>
%}

%%
[abc]*(aa|bb)[abc]*   { if (yyleng==8) printf("Valid: %s\n", yytext);
                        else printf("rejected: %s\n", yytext);}
[ \n]*                { }
.*                    { printf("rejected: %s\n", yytext);}
%%

int main() {
    extern FILE *yyin;
    yyin = fopen("i.txt", "r");
    yylex();
    return 0;
}
