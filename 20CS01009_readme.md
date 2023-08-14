
# Assignment 3
## Name:Ankit Patel  
### Roll no:20CS01009



### Section 1
#### PART1
According to Precendence
1. `[ \n\t]+`  ignore all spaces newline and tabs
2. `(0|1)*0000(0|1)*` This Regex detects the longest String which contains 4 0's
3. `.*` this pattern matches all the input string so if the above regex doesnt accept this is used to rejecting
 
#### PART2
1. `[ \n\t]+` ignore all spaces newline and tabs
2. `((1)*(0(1*)0)*(1)*)*` Matches Even zero's (accepts)
3. `((0)*(1(0*)1)*(0)*)*` Matches Odd zero's (rejects)
4. `(0|1)*` Matches any one's and zero's  (accepts)

#### PART3

1. `[abc]*(aa|bb)[abc]*` matches any string which contains aa | bb in it then checks if its length is 8 or not
2. .* Anyother string [Rejects]


### Section 2
Pattern Classes
1. digit   `[0-9]`
2. digits  `{digit}+`
3. number  `{digits}(\.{digits})?(E[+-]?{digits})?`
4. letter  `[a-zA-Z]`
5. id      `{letter}({letter}|{digit})*`
6. relop   `(==|>=|<=|=|<>)`

#### Rules
1. Keywords
2. relop
3. Identifier
4. Number
5. `[ \n]` skip whitespaces
6. `.` Unexpected Token

### Section 3
Token Categories
1. Data Types: Recognizes `INT, FLOAT,CHAR` data types.
2. Keywords: Identifies `if, for, while` keywords.
3. Input/Output: Detects `input, display` constructs.
4. Parentheses and Braces: Matches ` ( , ), { , }`.
5. Comma and Semicolon: Identifies `comma, semicolon` punctuation.
6. Relational Operators: Recognizes `==, !=, <, <=, >, and >=` operators.
7. Assignment Operator: Identifies `=`.
8. Arithmetic Operators: Detects ` +, -, *, / ` operators.
9. Numbers: Matches `integer and floating-point numbers `.
10. Identifiers: Identifies `valid variable , function `.
11. Main Function: Recognizes the ` main() ` function.


### How to Run

1. Create a input file `i.txt` which will used to pass input for each file
2. for each File.l <Filename.l> 
```bash
  flex <Filename.l> && gcc -o <Filename.l> lex.yy.c -lfl && ./<Filename.l>
```


## TEST

### Question 1 (A)
INPUT
```txt
  1100110
  0101010
  1001011
  1111101
  0000000
  00001101
  11010000
```
OUTPUT
```bash
$ flex 20CS01009_A3_Q1A.l && gcc -o 20CS01009_A3_Q1A lex.yy.c -lfl && ./20CS01009_A3_Q1A

rejected
rejected
rejected
rejected
accepted
accepted
accepted
```

### Question 1 (B)
INPUT
``` txt
  1001         
  0110         
  101          
  110          
  0101         
  000          
  1111         
  001          
  000000       
  101010101    
```

OUTPUT
```bash
$ flex 20CS01009_A3_Q1B.l && gcc -o 20CS01009_A3_Q1B lex.yy.c -lfl && ./20CS01009_A3_Q1B

accepted 1001
accepted 0110
rejected  1101
rejected  1110
accepted 0101
rejected  1000
accepted 1111
accepted 001
accepted 000000
accepted 101010101
```


### Question 1 (C)

INPUT
```txt
abacabca
bbaaaccc
aaabbbcc
ccbaaacc
abbaaccc
aaaaaaa
ababababb
bbbbbbbbbbb
bbacbaaa
caabbbcc
cbbaaacc
bacbaacb
bccbaaaa
```
OUTPUT
```bash
$ flex 20CS01009_A3_Q1C.l && gcc -o 20CS01009_A3_Q1C lex.yy.c -lfl && ./20CS01009_A3_Q1C 

rejected: abacabca
Valid: bbaaaccc
Valid: aaabbbcc
Valid: ccbaaacc
Valid: abbaaccc
rejected: aaaaaaa
rejected: ababababb
rejected: bbbbbbbbbbb
Valid: bbacbaaa
Valid: caabbbcc
Valid: cbbaaacc
Valid: bacbaacb
Valid: bccbaaaa
```

### Question 2

INPUT
```txt
if a<=2 then
  a =2
else
    a = 1
```
OUTPUT
```bash
$ flex 20CS01009_A3_Q2.l && gcc -o 20CS01009_A3_Q2 lex.yy.c -lfl && ./20CS01009_A3_Q2 

KEYWORD: if
ID:      a
RELOP:   <=
NUMBER:  2
KEYWORD: then
ID:      a
RELOP:   =
NUMBER:  2
KEYWORD: else
ID:      a
RELOP:   =
NUMBER:  1
```

### Question 2

INPUT
```txt
main()
{
    INT i=0;
    INT total=0;
    FLOAT count;
    CHAR ch;
    input(count);
 
    for(i=0;i<10;i++)
    {
        input(x);
        total= total+x;
    }
 
    display(total);
}
```
OUTPUT
```bash
$ flex 20CS01009_A3_Q3.l && gcc -o 20CS01009_A3_Q3 lex.yy.c -lfl && ./20CS01009_A3_Q3 

MAIN function :       main
Left Parenthesis:      (
Right Parenthesis:     )
Left Curly Brace:      {
Data Type:            INT
Identifier:             i
Assignment Operator:   =
Number:                 0
Semicolon:             ;
Data Type:            INT
Identifier:             total
Assignment Operator:   =
Number:                 0
Semicolon:             ;
Data Type:            FLOAT
Identifier:             count
Semicolon:             ;
Data Type:            CHAR
Identifier:             ch
Semicolon:             ;
Input Construct:       input
Left Parenthesis:      (
Identifier:             count
Right Parenthesis:     )
Semicolon:             ;
Keyword:               for
Left Parenthesis:      (
Identifier:             i
Assignment Operator:   =
Number:                 0
Semicolon:             ;
Identifier:             i
Relational Operator:   <
Number:                 10
Semicolon:             ;
Identifier:             i
Arithmetic Operator:    ++
Right Parenthesis:     )
Left Curly Brace:      {
Input Construct:       input
Left Parenthesis:      (
Identifier:             x
Right Parenthesis:     )
Semicolon:             ;
Identifier:             total
Assignment Operator:   =
Identifier:             total
Arithmetic Operator:    +
Identifier:             x
Semicolon:             ;
Right Curly Brace:     }
Output Construct:      display
Left Parenthesis:      (
Identifier:             total
Right Parenthesis:     )
Semicolon:             ;
Right Curly Brace:     }
```
