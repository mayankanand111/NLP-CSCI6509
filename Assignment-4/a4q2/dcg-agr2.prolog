member(X, [X|_]).
member(X, [_|L]) :- member(X,L).

s(s(Tn,Tv)) --> np(Tn,A), vp(Tv,A).
np(np(Td,Tn),A) --> d(Td), n(Tn,A).
d(d(the)) --> [the].

n(n(Npl),pl) --> [Npl],{ atom_concat(Nsg, 's', Npl), n(_,sg,[Nsg],[]) }.
n(n(X),sg) --> [X], { member(X, [dog, cat, turtle, rabbit]) }.

vp(vp(X),pl) --> [X], { member(X, [run, walk, swim, crawl]) }.
vp(vp(Vsg),sg) --> [Vsg],{atom_concat(Vpl,'s',Vsg), vp(_,pl,[Vpl],[]) }.