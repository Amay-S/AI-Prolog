% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Farhan Ali
%%%%% NAME: Amay Shah
%%%%% NAME:
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below
%

%%%%% SECTION: appendT
%%%%% Add your rules for appendT(Term1,Term2,Result) below
% Base case: Appending nil (empty list) to any list results in the original list.
appendT(nil, L, L).

% Recursive case: Append the tail of the first list and the entire second list.
% The result is the head of the first list combined with the result of the recursive call.
appendT(next(H1, T1), L2, next(H1, T3)) :-
    appendT(T1, L2, T3).

%%%%% SECTION: list2term
%%%%% Add your rules for list2term(List,Term) below
% Base case: An empty list is represented as nil
list2term([], nil).

% Recursive case: Head is an atom
list2term([H|T], next(H, TermT)) :-
    atom(H),
    list2term(T, TermT).

% Recursive case: Head is another list
list2term([H|T], next(TermH, TermT)) :-
    \+ atom(H),       % Head is not an atom
    list2term(H, TermH),
    list2term(T, TermT).

%%%%% SECTION: flat
%%%%% Add your rules for flat(Term,FlatTerm) below
% Base case: Empty list is flattened to nil
flat(nil, nil).

% Recursive case: If the head of the term is an atom
flat(next(H, T), next(H, FlatT)) :-
    atom(H),
    flat(T, FlatT).

% Recursive case: If the head of the term is a nested term
flat(next(H, T), FlatTerm) :-
    \+ atom(H),              % H is not an atom
    flat(H, FlatH),          % Flatten the head
    flat(T, FlatT),          % Flatten the tail
    appendT(FlatH, FlatT, FlatTerm).  % Use appendT to combine the flattened head and tail