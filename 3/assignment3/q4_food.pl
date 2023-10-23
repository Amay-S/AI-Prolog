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

%%%%% SECTION: foodSolve
%%%%% Below, you should define rules for the predicate "solve", which takes in your list of
%%%%% variables and finds an assignment for each variable which solves the problem.
%%%%%
%%%%% You should also define rules for the predicate "solve_and_print" which calls your
%%%%% solve predicate and prints out the results in an easy to read, human readable format.
%%%%% The predicate "solve_and_print" should take in no arguments


%%% Predicate to define weekdays
weekday(monday).
weekday(tuesday).
weekday(wednesday).
weekday(thursday).
weekday(friday).

%%% Dishes
dish(egg_rolls).
dish(chow_mein).
dish(sour_soup).
dish(fried_rice).
dish(peking_duck).

%%% Drinks
drink(tea).
drink(coffee).
drink(milk).
drink(juice).
drink(water).

%% Meals are represented as meal(Day, FirstDish, SecondDish, Drink)
%% This will generate a valid combination of meals
generate_and_constrain(Meal) :-
    weekday(Day),
    dish(FirstDish),
    dish(SecondDish),
    drink(Drink),
    FirstDish \= SecondDish,
    Meal = meal(Day, FirstDish, SecondDish, Drink),
    constraint(Meal).

%% Constraints
constraint(meal(tuesday, chow_mein, _, _)).
constraint(meal(_, peking_duck, chow_mein, _)).
constraint(meal(tuesday, _, peking_duck, _)).
constraint(meal(wednesday, peking_duck, _, _)).
constraint(meal(_, sour_soup, _, _)) :- fail. %% Sour soup cant be the second dish
constraint(meal(monday, egg_rolls, _, _)) :- fail.
constraint(meal(thursday, egg_rolls, _, _)) :- fail.
constraint(meal(tuesday, sour_soup, _, _)) :- fail.
constraint(meal(wednesday, sour_soup, _, _)) :- fail.
constraint(meal(thursday, sour_soup, _, _)) :- fail.
constraint(meal(friday, _, _, juice)).

%% Solve
solve([M1, M2, M3, M4, M5]) :-
    generate_and_constrain(M1),
    generate_and_constrain(M2), M2 \= M1,
    generate_and_constrain(M3), M3 \= M2, M3 \= M1,
    generate_and_constrain(M4), M4 \= M3, M4 \= M2, M4 \= M1,
    generate_and_constrain(M5), M5 \= M4, M5 \= M3, M5 \= M2, M5 \= M1.

%% Print a single meal
print_meal(meal(Day, FirstDish, SecondDish, Drink)) :-
    write('Day: '), write(Day), nl,
    write('First Dish: '), write(FirstDish), nl,
    write('Second Dish: '), write(SecondDish), nl,
    write('Drink: '), write(Drink), nl, nl.

%% Print a list of meals
print_meals([]).
print_meals([Meal|Rest]) :-
    print_meal(Meal),
    print_meals(Rest).

%% Solve and print
solve_and_print :-
    solve(Meals),
    print_meals(Meals).