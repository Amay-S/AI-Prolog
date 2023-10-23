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

% Given digit predicate
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

% Predicate to ensure all elements in a list are distinct
all_different([]).
all_different([H|T]) :- 
    not(member(H, T)), 
    all_different(T).

% Interleaved solve predicate
solve(L, E, T, I, S, O, V, A, P) :-
    % Assign values to L, E, T because they are used in all multiplications
    digit(L), L \= 0,
    digit(E),
    digit(T), T \= 0,
    LET is L * 100 + E * 10 + T,
    
    % Assign values to I, S as they represent the result of the first multiplication
    digit(I), I \= 0,
    digit(S),
    ITS is I * 100 + T * 10 + S,

    % Check constraint for the multiplication of LET by P (last digit of LAP)
    digit(P),
    Temp1 is LET * P,
    Temp1 mod 1000 =:= ITS,  % The last three digits should match ITS

    % Assign values to O, V for the second multiplication and its result
    digit(O),
    digit(V),
    LOVE is L * 1000 + O * 100 + V * 10 + E,

    % Assign value to A, the second digit of LAP
    digit(A), A \= 0,
    LAP is L * 100 + A * 10 + P,

    TOOLS is LET * LAP,
    TOOLS =:= ITS + 10 * LOVE + 100 * LET,
    
    % Ensure all digits are distinct
    all_different([L, E, T, I, S, O, V, A, P]).

% Predicate to print the solution
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


