%{
#include <stdio.h>
%}

%%
"INT"|"int"      { printf("Data Type:            INT\n"); }
"FLOAT"|"float"  { printf("Data Type:            FLOAT\n"); }
"CHAR"|"char"    { printf("Data Type:            CHAR\n"); }
"main"           { printf("MAIN function :       main\n"); }

"if"            { printf("Keyword:               if\n"); }
"for"           { printf("Keyword:               for\n"); }
"while"         { printf("Keyword:               while\n"); }

"input"         { printf("Input Construct:       input\n"); }
"display"       { printf("Output Construct:      display\n"); }

[(]             { printf("Left Parenthesis:      (\n"); }
[)]             { printf("Right Parenthesis:     )\n"); }
[{]             { printf("Left Curly Brace:      {\n"); }
[}]             { printf("Right Curly Brace:     }\n"); }
[,]             { printf("Comma:                 ,\n"); }
[;]             { printf("Semicolon:             ;\n"); }

"=="|"!="|"<"|"<="|">"|">="     { printf("Relational Operator:   %s\n", yytext); }
"="                             { printf("Assignment Operator:   =\n"); }
"+"|"-"|"*"|"/"|"++"|"--"  { printf("Arithmetic Operator:    %s\n", yytext); }

[0-9]+                 { printf("Number:                 %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier:             %s\n", yytext); }


[ \t\n\r]       ; // Skip whitespace characters
.               { printf("Unknown Token: %s\n", yytext); }
%%

int main(int argc, char* argv[]) {
    extern FILE *yyin;
    yyin = fopen("i.txt", "r");
    yylex();
    return 0;
}
