grammar Expr;
@header {
package grammars;
}




/** The start rule; begin parsing here. */
prog:   stat+ ; 

stat:   expr NEWLINE                # printExpt
    |   ID '=' expr NEWLINE         # assign
    |   NEWLINE                     # blank
    ;

expr:   expr (MUL|'/') expr # MulDiv
    |   expr ('+'|'-') expr # AddSub
    |   INT                 # int
    |   ID                  # id
    |   '(' expr ')'        # parens
    ;

ID  :   [a-zA-Z]+ ;      // match identifiers <label id="code.tour.expr.3"/>
INT :   [0-9]+ ;         // match integers
NEWLINE:'\r'? '\n' ;     // return newlines to parser (is end-statement signal)
WS  :   [ \t]+ -> skip ; // toss out whitespace
MUL : '*' ;
DIV : '/' ;
ADD : '+' ;
SUB : '-' ;

