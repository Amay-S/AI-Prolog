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

%%%%% SECTION: networkSolve
%%%%% Below, you should define rules for the predicate "solve", which takes in your list of
%%%%% variables and finds an assignment for each variable which solves the problem.
%%%%%
%%%%% You should also define rules for the predicate "solve_and_print" which calls your
%%%%% solve predicate and prints out the results in an easy to read, human readable format.
%%%%% The predicate "solve_and_print" should take in no arguments
% Define the list of all computer systems in the network
computer_systems([1, 2, 3, 4, 5, 6]).

% The solve predicate that finds a path between two nodes in the network
solve(From, To, Path) :-
    computer_systems(Systems),
    member(From, Systems),    % Choose a start node
    member(To, Systems),      % Choose an end node
    From \= To,               % Origin and destination should not be the same
    trip(From, To, Path).     % Check if there is a path between the chosen nodes

% The solve_and_print predicate to display solutions in a readable format
solve_and_print :-
    solve(From, To, Path),
    write('From System: '), write(From), nl,    % Display the starting node
    write('To System: '), write(To), nl,        % Display the end node
    write('Path: '), write(Path), nl, nl,       % Display the path between nodes
    fail. % Ensures that Prolog will backtrack to find all possible solutions

solve_and_print. % Ensures that the predicate succeeds after all solutions are found



%%%%% SECTION: trip
%%%%% Below, you should define rules for the predicate "trip", which takes in 
%%%%% two computer systems and returns the list of locations in between them.
%%%%% The signature of this predicate is trip(From,To,Path)
% Define the direct connections between systems.
connected(6, 5).
connected(5, 3).
connected(3, 2).
connected(2, 1).
connected(4, 3).

% Base case: Origin and Destination are the same.
trip(Origin, Origin, [Origin]).

% Recursive case: Find a path from Origin to Destination.
trip(Origin, Destination, [Origin|Path]) :-
    connected(Origin, Next),       % Direct connection from Origin to Next
    not(member(Next, [Origin])),   % Prevent cycles
    trip(Next, Destination, Path). % Find a path from Next to Destination