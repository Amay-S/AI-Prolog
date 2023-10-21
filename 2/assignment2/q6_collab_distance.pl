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

%% To help you test your collabDistance, you may put your knowledge base below. Do not put it under the colladDistance
%% section. You may also delete your test knowledge based before submission, as we will not be marking it

%%%%% KB

articleAuthor(a1, tom).
articleAuthor(a1, jennifer).
articleAuthor(a2, jennifer).
articleAuthor(a2, tina).
articleAuthor(intro_java, john_doe).
articleAuthor(intro_java, dana_white).
articleAuthor(intro_c, sara_wilson).
articleAuthor(intro_c, david_villa).
articleAuthor(intro_python, leo_messi).
articleAuthor(intro_python, chris_james).
articleAuthor(intro_javascript, thomas_clark).
articleAuthor(intro_javascript, patrick_mahone).
articleAuthor(intro_css, john_cena).
articleAuthor(intro_css, under_taker).


%%%%% SECTION: collabDistance
%%%%% Predicate definition: collabDist(Author1, Author2, MaxDist, Authors, Articles)

collabDist(Author1, Author2, MaxDist, Authors, Articles) :-
    collabDistAux(Author1, Author2, MaxDist, [Author1], RevAuthors, [], RevArticles),
    reverse(RevAuthors, Authors),
    reverse(RevArticles, Articles).

collabDistAux(Author, Author, _, VisitedAuthors, VisitedAuthors, VisitedArticles, VisitedArticles).

collabDistAux(Author1, Author2, MaxDist, TempAuthors, Authors, TempArticles, Articles) :-
    MaxDist > 0,
    articleAuthor(Article, Author1),
    \+ member(Article, TempArticles),
    articleAuthor(Article, Intermediate),
    Intermediate \= Author1,
    \+ member(Intermediate, TempAuthors),
    NewMaxDist is MaxDist - 1,
    collabDistAux(Intermediate, Author2, NewMaxDist, [Intermediate|TempAuthors], Authors, [Article|TempArticles], Articles).

/*

[eclipse 1]: ['q6_collab_distance.pl'].
source_processor.eco loaded in 0.00 seconds
hash.eco   loaded in 0.00 seconds
compiler_common.eco loaded in 0.01 seconds
compiler_normalise.eco loaded in 0.01 seconds
compiler_map.eco loaded in 0.00 seconds
compiler_analysis.eco loaded in 0.00 seconds
compiler_peephole.eco loaded in 0.01 seconds
compiler_codegen.eco loaded in 0.00 seconds
compiler_varclass.eco loaded in 0.00 seconds
compiler_indexing.eco loaded in 0.01 seconds
compiler_regassign.eco loaded in 0.00 seconds
asm.eco    loaded in 0.01 seconds
module_options.eco loaded in 0.00 seconds
ecl_compiler.eco loaded in 0.05 seconds
q6_collab_distance.pl compiled 4296 bytes in 0.00 seconds

Yes (0.05s cpu)
[eclipse 2]: collabDist(tom, tina, 2, Authors, Articles).

Authors = [tom, jennifer, tina]
Articles = [a1, a2]
Yes (0.00s cpu, solution 1, maybe more) ? 
[eclipse 3]: collabDist(tom, G, 2, Authors, Articles).

G = tom
Authors = [tom]
Articles = []

*/
