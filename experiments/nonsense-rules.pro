a(a1, 1).
a(A, 2).
a(a3, N).

b(1, b1).
b(2, B).
b(N, b3).

c(X, Y) :- a(X, N), b(N, Y).

d(X, Y) :- a(X, N), b(Y, N).
d(X, Y) :- a(N, X), b(N, Y).

% ?- a(X, 2).
% Guess: true
% ?- b(X, kalamazoo).
% Guess: X=2
% ?- c(X, b3).
% Guess: X=a1, true, true, X=a3, X=a3
