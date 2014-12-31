weight(apple, 3).
weight(banana, 5).
weight(chair, 7).

weight([], 0).
weight([H|T], Total) :-
	weight([H|T], Total, 0).

weight([H|T], Total, Running) :-
	weight(H, First),
	H \= [],
	weight(T, Rest, First),
	Running is First + Rest,
	Running = Total.
