weight(apple, 3).
weight(banana, 5).
weight(chair, 7).

weight([], 0).
weight([H|T], Total) :-
	weight(H, First),
	Rest is Total - First,
	weight(T, Rest).
