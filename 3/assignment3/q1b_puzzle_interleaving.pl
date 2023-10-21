% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Amay Shah
%%%%% NAME: Farhan Ali
%%%%% NAME:
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below
%

%%%%% SECTION: puzzleInterleaving
%%%%% Below, you should define rules for the predicate "solve", which takes in your list of
%%%%% variables and finds an assignment for each variable which solves the problem.
%%%%%
%%%%% You should also define rules for the predicate "solve_and_print" which calls your
%%%%% solve predicate and prints out the results in an easy to read, human readable format.
%%%%% The predicate "solve_and_print" should take in no arguments


% Define possible digits
digit(0).
digit(1).
digit(2).
digit(3).
digit(4).
digit(5).
digit(6).
digit(7).
digit(8).
digit(9).

% Predicate to ensure a digit is not zero
not_zero(D) :- 
    digit(D), 
    D \= 0.

% Ensure all elements of a list are distinct
all_different([]).
all_different([H|T]) :- 
    not(member(H, T)), 
    all_different(T).

solve(L, E, T, I, S, O, V, A, P) :-
    % Generate L, A, P first as they have direct multiplications
    not_zero(L),
    not_zero(A),
    not_zero(P),

    % Generate other digits
    digit(E),
    digit(S),
    digit(O),
    digit(V),
    digit(I),
    not_zero(T),

    % Ensure all digits are distinct
    all_different([L, E, T, I, S, O, V, A, P]),

    % Test L x P = ITS
    LP is L * P,
    S is LP mod 10,
    Car1 is LP // 10,
    I is Car1 mod 10,
    T is Car1 // 100,

    % Test L x A = LOVE
    LA is L * A,
    E is LA mod 10,
    Car2 is LA // 10,
    V is Car2 mod 10,
    O is Car2 // 100,

    % Test L x L 
    LL is L * L,
    T is LL mod 10,
    Car3 is LL // 10,
    O is Car3 mod 10,
    L is Car3 // 100.

solve_and_print :-
    solve(L, E, T, I, S, O, V, A, P),
    write('L = '), write(L), nl,
    write('E = '), write(E), nl,
    write('T = '), write(T), nl,
    write('I = '), write(I), nl,
    write('S = '), write(S), nl,
    write('O = '), write(O), nl,
    write('V = '), write(V), nl,
    write('A = '), write(A), nl,
    write('P = '), write(P), nl.
