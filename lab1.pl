directTrain(avon, braintree).
directTrain(quincy,avon).
directTrain(newton,boston).
directTrain(boston,avon).
directTrain(braintree,milton).
directTrain(westwood,newton).
directTrain(canton, westwood).

travelBetween(X,Y):- directTrain(X,Y).
travelBetween(X,Z):- directTrain(X,Y),travelBetween(Y,Z).
travelBetween(X,Z):- directTrain(Y,X),travelBetween(Z,Y).

tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).

listtran([],[]).
listtran([G|T],[E|T2]):-tran(G,E),listtran(T,T2).





 
