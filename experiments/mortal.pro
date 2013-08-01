% mortal/1
% For all X, X is a mortal if X is a person
mortal(X) :- person(X).

% person/1
person(socrates).
person(plato).
person(zeno).
person(aristotle).

% mortal_report/0
mortal_report :-
  write('Known mortals are:'), nl,
  mortal(X),
  write(X), nl,
  fail.
