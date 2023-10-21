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

%%%%% SECTION: articleAuthor
% Put your atomic statements for the articleAuthor predicate in this section

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


%%%%% SECTION: articleTopic
% Put your atomic statements for the articleTopic predicate in this section

articleTopic(intro_java, service_servlet).
articleTopic(intro_java, spring_boot).
articleTopic(intro_c, computing_system).
articleTopic(intro_c, operating_system).
articleTopic(intro_python, machine_learning).
articleTopic(intro_python, web_development).
articleTopic(intro_javascript, node_js).
articleTopic(intro_javascript, react_js).
articleTopic(intro_css, background_img).
articleTopic(intro_css, bootstrap_grid).


%%%%% SECTION: collabDist
% Put your rules for collabDist in this section

collabDist(Author1, Author2, MaxDist) :-
    MaxDist >= 0, 
    articleAuthor(_, Author1),
    articleAuthor(_, Author2),
    Author1 = Author2.

collabDist(Author1, Author2, MaxDist) :- 
    MaxDist = 0, 
    articleAuthor(Article, Author1),
    articleAuthor(Article, Author2),
    Author1 \= Author2.

collabDist(Author1, Author2, MaxDist) :- 
    MaxDist > 0, 
    MaxDist1 is MaxDist - 1, 
    articleAuthor(Article, Author1), 
    articleAuthor(Article, AuthorIntermediate), 
    Author1 \= AuthorIntermediate,
    collabDist(AuthorIntermediate, Author2, MaxDist1).



%%%% SECTION: collabDistWithAI
% Put your rules for collabDistWithAI in this section

collabDistWithAI(Author1, Author2, 0, none) :- 
    articleAuthor(_, Author1), 
    articleAuthor(_, Author2), 
    Author1 = Author2, 
    \+ (articleAuthor(Article, Author1), articleTopic(Article, ai)).

collabDistWithAI(Author1, Author2, 0, at_least_one) :- 
    articleAuthor(_, Author1), 
    articleAuthor(_, Author2), 
    Author1 = Author2, 
    articleAuthor(Article, Author1), 
    articleTopic(Article, ai).

collabDistWithAI(Author1, Author2, MaxDist, none) :- 
    MaxDist > 0, 
    articleAuthor(Article, Author1), 
    articleAuthor(Article, Author2), 
    Author1 \= Author2, 
    \+ articleTopic(Article, ai).

collabDistWithAI(Author1, Author2, MaxDist, at_least_one) :- 
    MaxDist > 0, 
    articleAuthor(Article, Author1), 
    articleAuthor(Article, Author2), 
    Author1 \= Author2, 
    articleTopic(Article, ai).

collabDistWithAI(Author1, Author2, MaxDist, AI) :- 
    MaxDist > 0, 
    MaxDist1 is MaxDist - 1, 
    articleAuthor(Article, Author1), 
    articleAuthor(Article, AuthorIntermediate), 
    Author1 \= AuthorIntermediate, 
    collabDistWithAI(AuthorIntermediate, Author2, MaxDist1, AI).

