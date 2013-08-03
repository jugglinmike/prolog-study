animal(cat).
animal(dog).
animal(chicken).

plant(celery).
plant(tree).
plant(flower).

food(cookie).
food(chicken).
food(celery).

% This is apparently a syntax arror
isA(Type, Thing) :- Type(Thing).
