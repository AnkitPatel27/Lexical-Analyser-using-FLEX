%{
    #include <stdio.h>    
%}

digit   [0-9]
digits  {digit}+
number  {digits}(\.{digits})?(E[+-]?{digits})?
letter  [a-zA-Z]
id      {letter}({letter}|{digit})*
relop   (==|>=|<=|=|<>)

%%

"if"        { printf("KEYWORD: if\n"); }
"else"      { printf("KEYWORD: else\n"); }
"then"      { printf("KEYWORD: then\n"); }
{relop}     { printf("RELOP:   %s\n", yytext); }
{id}        { printf("ID:      %s\n", yytext); }
{number}    { printf("NUMBER:  %s\n", yytext); }
[ \n]       { /* Skip whitespace and newline characters */ }
.           {printf("UNEXPECTED TOKEN%s\n", yytext);}

%%

int main(int argc, char* argv[]) {
    extern FILE *yyin;
    yyin = fopen("i.txt", "r");
    yylex();
    fclose(yyin);
    return 0;
}
