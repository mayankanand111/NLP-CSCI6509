isGrandChild(X,Z) :- isChild(X,Y), isChild(Y,Z).
isChild(john,mary).
isChild(ann,john).
isChild(tom,john).