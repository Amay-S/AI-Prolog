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

%%%%% SECTION: deepestNesting
%%%%% Predicate definition: deepestNesting(List, Depth)

% Base case: an empty list has depth 0.
deepestNesting([], 0).

% If the head is a list, compute its depth and compare with the depth of the tail.
deepestNesting([Head|Tail], Depth) :-
    is_list(Head),
    deepestNesting(Head, DepthHead),
    deepestNesting(Tail, DepthTail),
    NewDepthHead is DepthHead + 1,
    Depth is max(NewDepthHead, DepthTail).

% If the head is not a list, treat it as having a depth of 1 and then compute the depth of the tail.
deepestNesting([_Head|Tail], Depth) :-
    deepestNesting(Tail, DepthTail),
    Depth is max(1, DepthTail).

/*

[eclipse 1]: ['q4_deepest_nesting.pl'].
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
q4_deepest_nesting.pl compiled 1424 bytes in 0.00 seconds

Yes (0.05s cpu)
[eclipse 2]: deepestNesting([ [], abc, 1, [6, 7, [8] ] ], 3).

Yes (0.00s cpu, solution 1, maybe more) ? 
[eclipse 3]:  deepestNesting([ [a, [ [ [] ] ] ], [j], b], Depth).

Depth = 4
Yes (0.00s cpu, solution 1, maybe more) ? 

*/