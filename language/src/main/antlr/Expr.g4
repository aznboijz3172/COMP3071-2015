grammar Expr;		
prog:	block ;
block:  (statement NEWLINE)* ;
statement: id=ID '=' right=expr
    | keyword=OUTPUT sub=expr
    | keyword=(IF|WHILE) '(' left=expr condition=(LT|GT|EQ) right=expr ')' NEWLINE loop=block 'done' ;
expr:	left=expr op=(TIMES|DIVIDE|MOD) right=expr
    |	left=expr op=(PLUS|MINUS) right=expr
    |	number=INT
    |	id=ID
    |	'(' sub=expr ')'
    ;
OUTPUT : 'output';
IF      : 'if' ;
WHILE : 'while' ;
ID      : [a-zA-Z_$][a-zA-Z_$0-9]* ;
NEWLINE : [\r\n]+ ;
INT     : [0-9]+ ;
PLUS    : '+' ;
MINUS   : '-' ;
TIMES   : '*' ;
DIVIDE  : '/' ;
MOD : '%' ;
LT : '<' ;
GT : '>' ;
EQ : '=' ;
WS : (' ' | '\t')+ -> skip;