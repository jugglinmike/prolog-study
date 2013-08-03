customer(george, 'new york', ccc).
customer(daniel, boston, bbb).
customer(gerald, pheonix, bbb).
customer(erica, denver, aaa).

item(1, skates, 4).
item(2, sneakers, 2).
item(3, pencil, 10).

inventory(1, 5).
inventory(2, 5).
inventory(3, 15).

stock(Name) :- item(ID, Name, Price), inventory(ID, Y), write(Y).
