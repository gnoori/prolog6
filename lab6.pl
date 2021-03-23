% Guzel Noori.
% Lab 6 - CS 362.

subseq([], []).
subseq(X, [_|RestY]) :- subseq(X, RestY).
subseq([Item|RestX], [Item|RestY]) :- subseq(RestX, RestY).

contains([H|T], X) :- 
    H = X; contains(T, X).

unionA([], U, U).
unionA([H|T], [], U) :-
    unionA(T, H, U), !.
    unionA([H|T], S, U) :- 
        union(H, S, X), unionA(T, X, U).

hittingSet([], _).
hittingSet([H|T], S) :-
    member(X, S), contains(H, X), hittingSet(T, S).

len(1).
len(X) :- len(Y), X is Y+1.


minHittingSet(Sets, Solution) :-
    ord_union(Sets, U), len(X), subseq(Solution, U), length(Solution, X), hittingSet(Sets, Solution),!.
