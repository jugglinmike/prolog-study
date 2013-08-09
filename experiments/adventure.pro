room(kitchen).
room(office).
room(hall).
room('dining room').
room(cellar).

:- dynamic location/2.
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

% SWI Prolog defines predicates statically by default. Predicates that are
% intended to be dynamic (such as this one for the player's current location)
% need to be explicitly declared as such.
:- dynamic here/1.
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

list_inventory :-
  inventory(Item),
  tab(2),
  write(Item), nl,
  fail.
list_inventory.

look :-
  here(Place),
  write('You are in the '), write(Place), nl,
  write('You can see:'), nl, list_things(Place),
  write('You can go to:'), nl, list_connections(Place).

goto(Place) :-
  can_go(Place),
  write("A"),
  move(Place),
  look.
goto(Place) :-
  write('You can\'t get to '),
  write(Place),
  write(' from here.').

can_go(Place) :-
  here(Here),
  door(Here, Place).

move(Place) :-
  retract(here(Current)),
  asserta(here(Place)).

take(Item) :-
  can_take(Item),
  take_item(Item).
take(Item) :-
  write('There is no '),
  write(Item),
  write(' here.'), nl.

can_take(Item) :-
  here(Here),
  location(Item, Here).

take_item(Item) :-
  retract(location(Item, Here)),
  asserta(inventory(Item)),
  write('Taken.'), nl.

inventory :-
  write('You have:'), nl,
  list_inventory.

put(Item) :-
  inventory(Item),
  here(Here),
  retract(inventory(Item)),
  assertz(location(Item, Here)),
  write('You put '), write(Item), write(' in the '),
  write(Here), write('.'), nl.
put(Item) :-
  write('You don\'t have '), write(Item), write(' in your inventory.'), nl.
