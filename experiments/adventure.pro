room(kitchen).
room(office).
room(hall).
room('dining room').
room(cellar).

location(desk, office).
location(apple, kitchen).
location(flashlight, desk).
location('washing machine', cellar).
location(brocolli, kitchen).
location(crackers, kitchen).
location(computer, office).

door(X, Y) :- connect(X, Y); connect(Y, X).

connect(office, hall).
connect(kitchen, office).
connect(hall, 'dining room').
connect(kitchen, cellar).
connect('dining room', kitchen).

edible(apple).
edible(crackers).
tastes_yucky(brocolli).

turned_off(flashlight).

here(kitchen).

food(X) :- edible(X); tastes_yucky(X).

where_food(Thing, Location) :-
  location(Thing, Location),
  food(Thing).

list_things(Place) :-
  location(X, Place),
  tab(2),
  write(X),
  nl,
  fail.
list_things(_).

list_connections(Place) :-
  door(Place, X),
  tab(2),
  write(X),
  nl,
  fail.
list_connections(_).

look :-
  here(Place),
  write('You are in the '), write(Place), nl,
  write('You can see:'), nl, list_things(Place),
  write('You can go to:'), nl, list_connections(Place).
