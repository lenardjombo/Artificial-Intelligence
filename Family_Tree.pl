male(sang).
male(amakalu).
male(oruko).
male(muthungu).
male(mino).
male(levi).
male(osama).
male(mike).
male(john).
male(james).
male(kim).
male(brian).
male(david).
male(calvin).
male(jombo).
male(edwin).
male(johnte).


female(samantha).
female(vivian).
female(faith).
female(volka).
female(annette).
female(joan).
female(fridah).
female(mercy).
female(mary).
female(ann).
female(victoria).
female(emily).
female(lilian).

parent(sang,mino).
parent(sang,oruko).
parent(sang,osama).
parent(sang,john).
parent(sang,james).
parent(sang,emily).
parent(mino,muthungu).
parent(oruko,mike).
parent(oruko,david).
parent(jombo,mike).

parent(faith,mino).
parent(faith,oruko).
parent(faith,osama).
parent(faith,john).
parent(faith,emily).
parent(annette,muthungu).
parent(oruko,david).
parent(muthungu,ann).
parent(emily,mike).
parent(calvin,jombo).
parent(calvin,edwin).
parent(calvin,jonte).
parent(lilian,jombo).
parent(lilian,edwin).
parent(lilian,jonte).


brother(X,Y) :- father(Z,X), father(Z,Y).
grandparent(Z,Y) :- parent(Z,X), parent(X,Y).
greatgrandparent(Z,Y) :- grandparent(Z,X),parent(X,Y).
sibling(X,Y) :- parent(Z,X),parent(Z,Y).
maternaluncle(Z,Y) :- parent(A,Z),parent(A,X),sibling(Z,X), parent(X,Y),female(A).
paternalunlce(Z,Y) :- parent(A,Z),parent(A,X),sibling(Z,X), parent(X,Y),male(A).
maternalgrandfather(Z,X) :- parent(Z,Y),parent(Y,X),female(Y).
paternalgrandfather(Z,X) :- parent(Z,Y),parent(Y,X),male(Y).
maternalgrandmother(Z,X) :- parent(Z,Y),parent(Y,X),female(Y).
paternalgrandmother(Z,X) :- parent(Z,Y),parent(Y,X),male(Y).
auntie(Z,Y) :- sibling(Z,X), parent(X,Y),female(Z).

%grandparent,
%greatgrandparent,
%maternal uncle,
%paternal uncle,
%maternal grandfather,
%paternal grandfather,
%maternal grandmother,paternal grandfather

%20 diseases
%Classification of living things
