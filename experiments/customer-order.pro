% customer/3
% Name, Location, Credit Rating
customer(george, 'new york', ccc).
customer(daniel, boston, bbb).
customer(gerald, pheonix, bbb).
customer(erica, denver, aaa).

% item/3
% Item ID, Item Name, Reorder Point
item(1, skates, 4).
item(2, sneakers, 2).
item(3, pencil, 10).

% inventory/2
% Item ID, Amount in Stock
inventory(1, 5).
inventory(2, 5).
inventory(3, 9).

stock(Name) :- item(ID, Name, Price), inventory(ID, Y), write(Y).

% Write a predicate valid_order/3 that checks whether a customer order is
% valid. The arguments should be customer, item, and quantity. The predicate
% should succeed only if the customer is a valid customer with a good credit
% rating, the item is in stock, and the quantity ordered is less than the
% quantity in stock.
valid_order(Name, ItemName, Quantity) :-
  customer(Name, _, aaa),
  item(ItemID, ItemName, _),
  inventory(ItemID, Stock),
  Quantity =< Stock.

% Write a reorder/1 predicate which checks inventory levels in the inventory
% record against the reorder quantity in the item record. It should write a
% message indicating whether or not it's time to reorder.
reorder(Name) :-
  item(ID, Name, ReorderLvl),
  inventory(ID, Stock),
  write('It is '),
  ReorderLvl =< Stock, write('not '), fail.
reorder(Name) :-
  item(_, Name, _),
  write('time to reorder item "'), write(Name), write('"').
reorder(Name) :- write('Item not recognized').
