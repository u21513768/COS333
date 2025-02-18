married(peter, mary).
married(lilly, joseph).
ownsPet(peter, rover).
ownsPet(mary, fluffy).
ownsPet(joseph, tweety).
ownsPet(lilly, fluffy).

% Quintin d'Hotman de Villiers u21513768

% household(X, Y) is true when X is in the same household as Y.
household(X, Y) :- married(X, Y).
household(X, Y) :- married(Y, X).

% householdPet(O1, O2, P) is true when pet P is owned by either O1 or
% O2 and they both live in same house.
householdPet(O1, O2, P) :- ownsPet(O1, P), household(O1, O2).
householdPet(O1, O2, P) :- ownsPet(O2, P), household(O1, O2).

% wanderingPet(P) is true when pet P is a household pet of two households.
wanderingPet(P) :- householdPet(X, Y, P), householdPet(A, B, P), (X \= A ; Y \= B), (X \= B ; Y \= A).

% base case, empty list.
addPositives([], 0).
% the head is positive, adds the value to the sum and recursively calls
% itself with the rest of the list.
addPositives([H|T], X) :-
    H > 0,
    addPositives(T, Y),
    X is H + Y.
% the head is negative, calls the rest of the list recursively and
% doesn't add the head.
addPositives([H|T], X) :-
    H =< 0,
    addPositives(T, X).

% base case, empty list.
getEverySecondValue([], []).
% only one element.
getEverySecondValue([_], []).
% at least 2 elements.
getEverySecondValue([_, Second|Tail], [Second|Result]) :-
    getEverySecondValue(Tail, Result).
