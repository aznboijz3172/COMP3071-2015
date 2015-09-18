
numeral(0). % Base case
numeral(succ(X)):- numeral(X). % Recursive

add(0,X,X).                           % base clause
add(succ(X),Y,succ(Z)):- add(X,Y,Z).  % recursive clause

% _ is an anonymous variable.

greater_than(succ(_),0).
greater_than(succ(X),succ(Y)):-greater_than(X,Y).
