
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

%%%%% SECTION: constants
%%%%% You do not have to add anything to this section, but feel free to change the currentYear value to test your program

orderNames([first, second, third, fourth, fifth, sixth, seventh, eighth, ninth, tenth, 
            eleventh, twelfth, thirteenth, fourteenth, fifteenth, sixteenth, seventeenth, eighteenth, nineteenth, twentytieth]).

currentYear(2023).


%%%%% SECTION: database
%%%%% Put statements for albumArtist, albumYear, albumGenre, and trackList below
%%%%% Assignment 4 - Question 1

% albumArtist(AlbumName, ArtistName)
albumArtist('Midnights', 'Taylor Swift').
albumArtist('Folklore', 'Taylor Swift').
albumArtist('Divide', 'Ed Sheeran').
albumArtist('Abbey Road', 'The Beatles').
albumArtist('Thriller', 'Michael Jackson').
albumArtist('Dark Side of the Moon', 'Pink Floyd').
albumArtist('Rumours', 'Fleetwood Mac').
albumArtist('Back to Black', 'Amy Winehouse').
albumArtist('25', 'Adele').
albumArtist('Born to Die', 'Lana Del Rey').

% albumYear(AlbumName, Year)
albumYear('Midnights', 2022).
albumYear('Folklore', 2020).
albumYear('Divide', 2017).
albumYear('Abbey Road', 1969).
albumYear('Thriller', 1982).
albumYear('Dark Side of the Moon', 1973).
albumYear('Rumours', 1977).
albumYear('Back to Black', 2006).
albumYear('25', 2015).
albumYear('Born to Die', 2012).

% albumGenre(AlbumName, Genre)
albumGenre('Midnights', pop).
albumGenre('Folklore', indie_folk).
albumGenre('Divide', pop).
albumGenre('Abbey Road', rock).
albumGenre('Thriller', pop).
albumGenre('Dark Side of the Moon', rock).
albumGenre('Rumours', rock).
albumGenre('Back to Black', soul).
albumGenre('25', soul).
albumGenre('Born to Die', indie_pop).


% trackList(AlbumName, List of song(SongName, SongLength))
trackList('Midnights', [song('Maroon', 210), song('Lavender Haze', 205), song('Willow', 221)]).
trackList('Folklore', [song('Cardigan', 240), song('The 1', 220), song('Exile', 270)]).
trackList('Divide', [song('Shape of You', 233), song('Perfect', 263), song('Galway Girl', 170)]).
trackList('Abbey Road', [song('Come Together', 259), song('Something', 182), song('Oh! Darling', 204)]).
trackList('Thriller', [song('Beat It', 258), song('Billie Jean', 294), song('Thriller', 358)]).
trackList('Dark Side of the Moon', [song('Time', 413), song('Money', 382), song('Us and Them', 462)]).
trackList('Rumours', [song('Dreams', 255), song('Go Your Own Way', 231), song('The Chain', 270)]).
trackList('Back to Black', [song('Rehab', 235), song('You Know Im No Good', 256), song('Back to Black', 240)]).
trackList('25', [song('Hello', 295), song('Send My Love', 223), song('I Miss You', 228)]).
trackList('Born to Die', [song('Video Games', 282), song('Born to Die', 285), song('Blue Jeans', 200)]).


%%%%% SECTION: helpers
%%%%% Add the predicates isSong(Song), songLength(Song, Length), onAlbum(Song, Album), albumLength(Album, Length), and atNamedIndex(List, Entry, Element)
%%%%% Another other helper predicates you wish to add for your lexicon or the parser should be added here
%%%%% Assignment 4 - Question 2


%%%%% Predicate isSong(Name)
isSong(Name) :- 
    trackList(_, Songs),
    member(song(Name, _), Songs).

%%%%% Predicate songLength(Name, Length)
songLength(Name, Length) :- 
    trackList(_, Songs),
    member(song(Name, Length), Songs).

%%%%% Predicate onAlbum(SongName, AlbumName)
onAlbum(SongName, AlbumName) :- 
    trackList(AlbumName, Songs),
    member(song(SongName, _), Songs).

%%%%% Predicate albumLength(AlbumName, Length)
albumLength(AlbumName, TotalLength) :-
    trackList(AlbumName, Songs),
    sumSongLengths(Songs, TotalLength).

sumSongLengths([], 0).
sumSongLengths([song(_, Length)|Rest], TotalLength) :-
    sumSongLengths(Rest, RestLength),
    TotalLength is Length + RestLength.

%%%%% Predicate atNamedIndex(List, IndexName, Element)
atNamedIndex(List, IndexName, Element) :-
    orderNames(OrderNames),
    nth1(Index, OrderNames, IndexName),
    nth1(Index, List, Element).


%%%%% SECTION: articles
%%%%% Put the rules/statements defining the proper_nouns below
%%%%% Assignment 4 - Question 3

article(a).
article(an).
article(the).
article(any).

%%%%% SECTION: proper_nouns
%%%%% Put the rules/statements defining the proper_nouns below
%%%%% Assignment 4 - Question 3

proper_noun(X) :- albumArtist(X, _). % Album names
proper_noun(X) :- albumArtist(_, X). % Artist names
proper_noun(X) :- trackList(_, Songs), member(song(X, _), Songs). % Song names
proper_noun(X) :- number(X). % Numbers

%%%%% SECTION: common_nouns
%%%%% Put the rules/statements defining the common_nouns below
%%%%% Assignment 4 - Question 3

common_noun(album).
common_noun(record).
common_noun(artist).
common_noun(song).
common_noun(track).
common_noun(length).
common_noun(genre).
common_noun(release_year).

%%%%% SECTION: adjectives
%%%%% Put the rules/statements defining the adjectives below
%%%%% Assignment 4 - Question 3

% Short and long for songs and albums
adjective(short, song) :- songLength(_, Length), Length < 180. % Less than 3 minutes
adjective(long, song) :- songLength(_, Length), Length >= 360. % At least 6 minutes
adjective(short, album) :- albumLength(_, Length), Length < 600. % Less than 10 minutes
adjective(long, album) :- albumLength(_, Length), Length >= 3600. % At least an hour

% Old and new for albums
adjective(old, album) :- albumYear(_, Year), Year < 2000.
adjective(new, album) :- albumYear(_, Year), currentYear(Current), Year == Current.

% Genre as adjective
adjective(Genre, song) :- albumGenre(Album, Genre), trackList(Album, Songs), member(song(_, _), Songs).
adjective(Genre, album) :- albumGenre(_, Genre).

% Artist as adjective
adjective(Artist, song) :- albumArtist(Album, Artist), trackList(Album, Songs), member(song(_, _), Songs).
adjective(Artist, album) :- albumArtist(_, Artist).

% Named indices (e.g., first, second) for songs in an album
adjective(Index, song) :- orderNames(OrderNames), nth1(N, OrderNames, Index), trackList(_, Songs), nth1(N, Songs, song(_, _)).


%%%%% SECTION: prepositions
%%%%% Put the rules/statements defining the prepositions below
%%%%% Assignment 4 - Question 3

preposition(on, song, album) :- trackList(_, _).
preposition(by, _, artist) :- albumArtist(_, _).
preposition(released_in, _, year) :- albumYear(_, _).
preposition(of, _, attribute) :- % attribute can be length, genre, etc.
preposition(released_before, album, album) :- albumYear(_, _).
preposition(released_after, album, album) :- albumYear(_, _).
preposition(with, _, attribute) :- % attribute can be length, genre, etc.


%%%%% SECTION: PARSER
%%%%% For testing your lexicon for question 3, we will use the default parser initially given to you.
%%%%% For testing your answers for question 4, we will use your parser below

what(Words, Ref) :- np(Words, Ref).

/* Noun phrase can be a proper name or can start with an article */

np([Name],Name) :- proper_noun(Name).
np([Art|Rest], What) :- article(Art), np2(Rest, What).


/* If a noun phrase starts with an article, then it must be followed
   by another noun phrase that starts either with an adjective
   or with a common noun. */

np2([Adj|Rest],What) :- adjective(Adj,What), np2(Rest, What).
np2([Noun|Rest], What) :- common_noun(Noun, What), mods(Rest,What).

/* Modifier(s) provide an additional specific info about nouns.
   Modifier can be a prepositional phrase followed by none, one or more
   additional modifiers.  */

mods([], _).
mods(Words, What) :-
	appendLists(Start, End, Words),
	prepPhrase(Start, What),	mods(End, What).

prepPhrase([Prep|Rest], What) :-
	preposition(Prep, What, Ref), np(Rest, Ref).

appendLists([], L, L).
appendLists([H|L1], L2, [H|L3]) :-  appendLists(L1, L2, L3).

