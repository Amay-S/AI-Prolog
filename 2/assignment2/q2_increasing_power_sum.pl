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


%%%%% SECTION: increasingPowerSum
%%%%% Predicate definition: increasingPowerSum(List, Power, PowerInc, Sum)

increasingPowerSum([], _, _, 0).
increasingPowerSum([Head|Tail], Power, PowerInc, Sum) :-
    NewPower is Power + PowerInc,
    increasingPowerSum(Tail, NewPower, PowerInc, TailSum),
    Sum is TailSum + Head^Power.

/*

[eclipse 1]: ['q2_increasing_power_sum.pl'].
source_processor.eco loaded in 0.00 seconds
hash.eco   loaded in 0.01 seconds
compiler_common.eco loaded in 0.01 seconds
compiler_normalise.eco loaded in 0.00 seconds
compiler_map.eco loaded in 0.01 seconds
compiler_analysis.eco loaded in 0.01 seconds
compiler_peephole.eco loaded in 0.00 seconds
compiler_codegen.eco loaded in 0.01 seconds
compiler_varclass.eco loaded in 0.00 seconds
compiler_indexing.eco loaded in 0.00 seconds
compiler_regassign.eco loaded in 0.01 seconds
asm.eco    loaded in 0.00 seconds
module_options.eco loaded in 0.00 seconds
ecl_compiler.eco loaded in 0.06 seconds
q2_increasing_power_sum.pl compiled 1016 bytes in 0.00 seconds

Yes (0.06s cpu)
[eclipse 2]: increasingPowerSum([1, 2, 3, 4], 1, 2, 16636).

Yes (0.00s cpu)
[eclipse 3]:  increasingPowerSum([5, 4, 3], 1, 0, X).

X = 12
Yes (0.00s cpu)

*/