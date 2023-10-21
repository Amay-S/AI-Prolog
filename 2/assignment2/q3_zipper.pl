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

%%%%% SECTION: zipper
%%%%% Predicate definition: zipper(List1, List2, Zipper)

% Base case: When one list is empty, the Zipper is just the other list.
zipper([], List2, List2).
zipper(List1, [], List1).

% Recursive case: Take one element from List1 and one from List2 alternately.
zipper([H1|T1], [H2|T2], [H1, H2|ZipperRest]) :-
    zipper(T1, T2, ZipperRest).


/*

[eclipse 1]: ['q3_zipper.pl'].
source_processor.eco loaded in 0.00 seconds
hash.eco   loaded in 0.00 seconds
compiler_common.eco loaded in 0.01 seconds
compiler_normalise.eco loaded in 0.01 seconds
compiler_map.eco loaded in 0.00 seconds
compiler_analysis.eco loaded in 0.00 seconds
compiler_peephole.eco loaded in 0.01 seconds
compiler_codegen.eco loaded in 0.00 seconds
compiler_varclass.eco loaded in 0.01 seconds
compiler_indexing.eco loaded in 0.00 seconds
compiler_regassign.eco loaded in 0.00 seconds
asm.eco    loaded in 0.01 seconds
module_options.eco loaded in 0.00 seconds
ecl_compiler.eco loaded in 0.05 seconds
q3_zipper.pl compiled 952 bytes in 0.00 seconds

Yes (0.05s cpu)
[eclipse 2]:  zipper([1, 2, a, b], [f, g, c, d], [1, f, 2, g, a, c, b, d]).

Yes (0.00s cpu, solution 1, maybe more) ? 
[eclipse 3]: zipper([a, b, c, d], [1, 2], Zipper).

Zipper = [a, 1, b, 2, c, d]
Yes (0.00s cpu, solution 1, maybe more) ? 

*/