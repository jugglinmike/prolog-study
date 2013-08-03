% Trying to figure out how to represent a reciprical relationship on my own...
door(a, b).
door(b, c).

door(X, Y) :- door(Y, X), \+ X = Y.
