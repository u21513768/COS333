% Base case, empty list results in empty list
stripNegativesAndZerosDuplicatePositives([], []).

% If the head is negative or zero, skip it and process the rest of the list.
stripNegativesAndZerosDuplicatePositives([H|T], Result) :-
    H =< 0,
    stripNegativesAndZerosDuplicatePositives(T, Result).

% If the head is positive, duplicate it and process the rest of the list.
stripNegativesAndZerosDuplicatePositives([H|T], [H, H | Rest]) :-
    H > 0,
    stripNegativesAndZerosDuplicatePositives(T, Rest).
