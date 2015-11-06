grammar Expr;		
prog:	(expr NEWLINE)* ;
expr:	left=expr op=(TIMES|DIVIDE) right=expr
    |	left=expr op=(PLUS|MINUS) right=expr
    |	number=INT
    |	'(' sub=expr ')'
    ;
NEWLINE : [\r\n]+ ;
INT     : [0-9]+ ;
PLUS    : '+' ;
MINUS   : '-' ;
TIMES   : '*' ;
DIVIDE  : '/' ;
