f(a).
f(b).
g(a).
g(b).
h(b).
k(X):- f(X), h(X), g(X).

/* child(X,Y) means X is the child of Y */
child(anna,bridget).
child(bridget,caroline).
child(caroline,donna).
child(donna,emily).

/* Recursion example */
member(X,[Y|Z]):- X=Y; member(X,Z).

/*
    descend(X,Y) right now means X is the child or grandchild of Y.
    try making it work for child, grandchild, great-grandchild, etc.
    through recursion.
descend(X,Y):- child(X,Y).
descend(X,Y):- child(X,Z), child(Z,Y).
 */

% Beware: this won't work
% descend(X,Z):- descend(Y,Z),child(X,Y). /* recursive case */
% descend(X,Y):- child(X,Y). /* base case */

descend(X,Y):- child(X,Y). /* base case */
descend(X,Z):- child(X,Y), descend(Y,Z). /* recursive case */

% Hint: This is similar to the listtrans function
a2b([],[]).
a2b([a|Tail],[b|Tail2]):- a2b(Tail,Tail2).
