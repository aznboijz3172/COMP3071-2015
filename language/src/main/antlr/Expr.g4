grammar Expr;		
prog:	(statement NEWLINE)* ;
statement: id=ID '=' right=expr ;
expr:	left=expr op=(TIMES|DIVIDE) right=expr
    |	left=expr op=(PLUS|MINUS) right=expr
    |	number=INT
    |	id=ID
    |	'(' sub=expr ')'
    ;
ID      : [a-zA-Z_$][a-zA-Z_$0-9]* ;
NEWLINE : [\r\n]+ ;
INT     : [0-9]+ ;
PLUS    : '+' ;
MINUS   : '-' ;
TIMES   : '*' ;
DIVIDE  : '/' ;
