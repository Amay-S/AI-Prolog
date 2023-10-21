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

%%%%% SECTION: partitionMonths
%%%%% Predicate definition: partitionMonths(Months, Prices, Increase, Decrease)

% Base case: less than two months left, no more comparisons to be made.
partitionMonths([_], [_], [], []).
partitionMonths([], [], [], []).

partitionMonths([M1, M2 | RestMonths], [P1, P2 | RestPrices], [M2 | Increase], Decrease) :-
    P2 >= P1,  % The price increased or stayed the same
    partitionMonths([M2 | RestMonths], [P2 | RestPrices], Increase, Decrease).

partitionMonths([M1, M2 | RestMonths], [P1, P2 | RestPrices], Increase, [M2 | Decrease]) :-
    P2 < P1,  % The price decreased
    partitionMonths([M2 | RestMonths], [P2 | RestPrices], Increase, Decrease).

/*

[eclipse 1]: ['q5_partition_months'].
source_processor.eco loaded in 0.00 seconds
hash.eco   loaded in 0.00 seconds
compiler_common.eco loaded in 0.01 seconds
compiler_normalise.eco loaded in 0.01 seconds
compiler_map.eco loaded in 0.00 seconds
compiler_analysis.eco loaded in 0.00 seconds
compiler_peephole.eco loaded in 0.00 seconds
compiler_codegen.eco loaded in 0.01 seconds
compiler_varclass.eco loaded in 0.00 seconds
compiler_indexing.eco loaded in 0.01 seconds
compiler_regassign.eco loaded in 0.00 seconds
asm.eco    loaded in 0.00 seconds
module_options.eco loaded in 0.00 seconds
ecl_compiler.eco loaded in 0.05 seconds
File q5_partition_months.pl, line 22: Singleton variable M1
File q5_partition_months.pl, line 26: Singleton variable M1
q5_partition_months.pl compiled 2208 bytes in 0.00 seconds

Yes (0.05s cpu)
[eclipse 2]: partitionMonths([jan, feb, mar, apr, may, jun, jul],
[7.90, 8.00, 8.15, 8.05, 8.04, 8.05, 8.5], [feb , mar, jun, jul], [apr, may]).

Yes (0.00s cpu, solution 1, maybe more) ? 
[eclipse 3]:  partitionMonths([january, february, march, april],
[56.20, 56.25, 56.25, 56.50], Increase, Decrease        ).

Increase = [february, march, april]
Decrease = []
Yes (0.00s cpu, solution 1, maybe more) ? 

*/