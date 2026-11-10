// Table 3: direct QC-X4 constructions.
// 52 records, manuscript Nos. 223-274.
// CSV matrices and Magma matrices have exactly the same row order.
// Table3Generators[No] = <Gsrc1,Gsrc2,W1,W2,lambda,GX4>.

F<w>:=GF(4);
function HDag(X)
    return Transpose(Matrix(BaseRing(X),Nrows(X),Ncols(X),[z^2:z in Eltseq(X)]));
end function;
Table3Generators:=AssociativeArray();
Table3Parameters:=AssociativeArray();
Table3DistanceTypes:=AssociativeArray();

// Table 3, No. 223 | GQ01
// [[18,4,9;10]]_2, distance exact.
Gsrc1:=Matrix(F,6,15,[
    1,0,0,0,0,0,0,0,1,0,1,w,w,w^2,w^2,
    0,1,0,0,0,0,w,1,1,w,0,0,w,w,w^2,
    0,0,1,0,0,0,w^2,w^2,1,w^2,w^2,w,1,0,0,
    0,0,0,1,0,0,1,1,w^2,w^2,w^2,w,0,1,w^2,
    0,0,0,0,1,0,w^2,1,1,0,0,w^2,1,1,1,
    0,0,0,0,0,1,w^2,w^2,0,0,w,w,0,1,w^2
]);
Gsrc2:=Matrix(F,2,3,[
    1,0,w^2,
    0,1,w
]);
W1:=Matrix(F,2,15,[
    0,w^2,1,1,1,w,1,1,0,1,w^2,0,1,w^2,1,
    w^2,0,1,w^2,1,0,w^2,1,1,1,w,1,1,0,1
]);
W2:=Matrix(F,2,3,[
    0,w,w^2,
    w^2,0,w
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 15 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,6,18,[
    1,0,0,0,0,w,1,1,1,0,w,1,w,1,w,0,0,0,
    0,1,0,0,w,w^2,1,1,w^2,w,1,0,0,w^2,w^2,0,0,0,
    0,0,1,0,w^2,1,w,w^2,w,w^2,1,w,w,w,0,0,0,0,
    0,0,0,1,1,w^2,0,w,w,w^2,w,0,1,w^2,0,0,0,0,
    0,w^2,1,1,1,w,1,1,0,1,w^2,0,1,w^2,1,0,w,w^2,
    w^2,0,1,w^2,1,0,w^2,1,1,1,w,1,1,0,1,w^2,0,w
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=15 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [15+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[223]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 18 and Dimension(Q) eq 6;
assert Dimension(HermitianHull(Q)) eq 2;
Table3Parameters[223]:=[18,4,9,10];
Table3DistanceTypes[223]:="exact";

// Table 3, No. 224 | GQ02
// [[21,5,9;10]]_2, distance exact.
Gsrc1:=Matrix(F,8,18,[
    1,0,0,0,0,0,0,0,w^2,0,w,w,w,1,1,0,1,0,
    0,1,0,0,0,0,0,0,w^2,0,w,0,1,w^2,0,w,1,1,
    0,0,1,0,0,0,0,0,w^2,w^2,w,w^2,w,w^2,w^2,w^2,0,w,
    0,0,0,1,0,0,0,0,w^2,w^2,w,1,1,w,0,w^2,w,w^2,
    0,0,0,0,1,0,0,0,w,w,w,1,0,0,w,w^2,w,0,
    0,0,0,0,0,1,0,0,1,0,1,1,1,w,w,1,1,w,
    0,0,0,0,0,0,1,0,w^2,1,1,1,0,w,0,w,w^2,1,
    0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,w,w,w,w,0,0
]);
Gsrc2:=Matrix(F,2,3,[
    1,0,1,
    0,1,1
]);
W1:=Matrix(F,2,18,[
    1,0,w,0,w,1,w^2,1,1,w,w^2,w^2,w,1,w^2,w,1,w,
    w,1,w^2,w,1,w,1,0,w,0,w,1,w^2,1,1,w,w^2,w^2
]);
W2:=Matrix(F,2,3,[
    0,1,1,
    1,0,1
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 18 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,8,21,[
    1,0,0,0,0,0,1,1,w^2,w,0,w^2,0,1,w^2,0,w,1,0,0,0,
    0,1,0,0,0,0,w^2,w^2,w^2,1,w^2,w^2,0,w^2,1,w,w^2,w,0,0,0,
    0,0,1,0,0,0,0,0,w^2,w^2,w,w^2,w,w^2,w^2,w^2,0,w,0,0,0,
    0,0,0,1,0,0,w^2,1,w,w^2,w,w,w^2,1,w,0,0,0,0,0,0,
    0,0,0,0,1,0,w,w^2,1,w,w,w^2,1,w,w^2,1,w^2,w,0,0,0,
    0,0,0,0,0,1,1,w,w^2,0,1,0,w,w^2,1,0,w,w^2,0,0,0,
    1,0,w,0,w,1,w^2,1,1,w,w^2,w^2,w,1,w^2,w,1,w,0,1,1,
    w,1,w^2,w,1,w,1,0,w,0,w,1,w^2,1,1,w,w^2,w^2,1,0,1
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=18 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [18+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[224]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 21 and Dimension(Q) eq 8;
assert Dimension(HermitianHull(Q)) eq 3;
Table3Parameters[224]:=[21,5,9,10];
Table3DistanceTypes[224]:="exact";

// Table 3, No. 225 | Q50_003
// [[24,4,10;10]]_2, distance exact.
Gsrc1:=Matrix(F,9,21,[
    0,0,0,1,1,w^2,w^2,0,0,0,w^2,w^2,w,w,0,0,0,w,w,1,1,
    1,0,1,0,0,w,1,w,0,w,0,0,w^2,w,w^2,0,w^2,0,0,1,w^2,
    0,1,0,w^2,0,w,1,0,w,0,1,0,w^2,w,0,w^2,0,w,0,1,w^2,
    w,w^2,0,1,1,w^2,0,w,w^2,0,1,1,w^2,0,w,w^2,0,1,1,w^2,0,
    1,0,1,1,0,1,w^2,1,0,1,1,0,1,w^2,1,0,1,1,0,1,w^2,
    w,w^2,1,0,w,0,1,1,w,w^2,0,1,0,w^2,w^2,1,w,0,w^2,0,w,
    1,0,0,w^2,1,1,w,w,0,0,1,w,w,w^2,w^2,0,0,w,w^2,w^2,1,
    w^2,w,1,1,0,0,w,w^2,w,1,1,0,0,w,w^2,w,1,1,0,0,w,
    w,w,w,0,0,0,0,1,1,1,0,0,0,0,w^2,w^2,w^2,0,0,0,0
]);
Gsrc2:=Matrix(F,2,3,[
    1,1,1,
    1,w^2,w
]);
W1:=Matrix(F,2,21,[
    w^2,w,1,1,0,0,w,w^2,w,1,1,0,0,w,w^2,w,1,1,0,0,w,
    w,w,w,0,0,0,0,1,1,1,0,0,0,0,w^2,w^2,w^2,0,0,0,0
]);
W2:=Matrix(F,2,3,[
    1,1,1,
    1,w^2,w
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 21 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,9,24,[
    0,0,0,1,1,w^2,w^2,0,0,0,w^2,w^2,w,w,0,0,0,w,w,1,1,0,0,0,
    1,0,1,0,0,w,1,w,0,w,0,0,w^2,w,w^2,0,w^2,0,0,1,w^2,0,0,0,
    0,1,0,w^2,0,w,1,0,w,0,1,0,w^2,w,0,w^2,0,w,0,1,w^2,0,0,0,
    w,w^2,0,1,1,w^2,0,w,w^2,0,1,1,w^2,0,w,w^2,0,1,1,w^2,0,0,0,0,
    1,0,1,1,0,1,w^2,1,0,1,1,0,1,w^2,1,0,1,1,0,1,w^2,0,0,0,
    w,w^2,1,0,w,0,1,1,w,w^2,0,1,0,w^2,w^2,1,w,0,w^2,0,w,0,0,0,
    1,0,0,w^2,1,1,w,w,0,0,1,w,w,w^2,w^2,0,0,w,w^2,w^2,1,0,0,0,
    w^2,w,1,1,0,0,w,w^2,w,1,1,0,0,w,w^2,w,1,1,0,0,w,1,1,1,
    w,w,w,0,0,0,0,1,1,1,0,0,0,0,w^2,w^2,w^2,0,0,0,0,1,w^2,w
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=21 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [21+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[225]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 24 and Dimension(Q) eq 9;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[225]:=[24,4,10,10];
Table3DistanceTypes[225]:="exact";

// Table 3, No. 226 | Q50_004
// [[24,6,9;10]]_2, distance exact.
Gsrc1:=Matrix(F,10,21,[
    1,w^2,1,w^2,w^2,0,w^2,1,w^2,1,w^2,w^2,0,w^2,1,w^2,1,w^2,w^2,0,w^2,
    1,w,w^2,1,0,0,0,w,w^2,1,w,0,0,0,w^2,1,w,w^2,0,0,0,
    0,1,0,1,w^2,1,w^2,0,1,0,1,w^2,1,w^2,0,1,0,1,w^2,1,w^2,
    w,1,0,w^2,w^2,w^2,0,w,1,0,w^2,w^2,w^2,0,w,1,0,w^2,w^2,w^2,0,
    w^2,w,0,w^2,1,1,0,w,1,0,w,w^2,w^2,0,1,w^2,0,1,w,w,0,
    1,1,w^2,0,1,0,w^2,w^2,w^2,w,0,w^2,0,w,w,w,1,0,w,0,1,
    0,1,0,0,0,w^2,w^2,0,w^2,0,0,0,w,w,0,w,0,0,0,1,1,
    1,w,0,0,0,w,0,w,w^2,0,0,0,w^2,0,w^2,1,0,0,0,1,0,
    w^2,0,w,w^2,0,0,0,w,0,1,w,0,0,0,1,0,w^2,1,0,0,0,
    0,1,0,w^2,w^2,1,w,0,w,0,1,1,w,w^2,0,w^2,0,w,w,w^2,1
]);
Gsrc2:=Matrix(F,2,3,[
    1,w^2,w,
    1,w,w^2
]);
W1:=Matrix(F,2,21,[
    w^2,0,w,w^2,0,0,0,w,0,1,w,0,0,0,1,0,w^2,1,0,0,0,
    0,1,0,w^2,w^2,1,w,0,w,0,1,1,w,w^2,0,w^2,0,w,w,w^2,1
]);
W2:=Matrix(F,2,3,[
    1,w^2,w,
    1,w,w^2
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 21 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,10,24,[
    1,w^2,1,w^2,w^2,0,w^2,1,w^2,1,w^2,w^2,0,w^2,1,w^2,1,w^2,w^2,0,w^2,0,0,0,
    1,w,w^2,1,0,0,0,w,w^2,1,w,0,0,0,w^2,1,w,w^2,0,0,0,0,0,0,
    0,1,0,1,w^2,1,w^2,0,1,0,1,w^2,1,w^2,0,1,0,1,w^2,1,w^2,0,0,0,
    w,1,0,w^2,w^2,w^2,0,w,1,0,w^2,w^2,w^2,0,w,1,0,w^2,w^2,w^2,0,0,0,0,
    w^2,w,0,w^2,1,1,0,w,1,0,w,w^2,w^2,0,1,w^2,0,1,w,w,0,0,0,0,
    1,1,w^2,0,1,0,w^2,w^2,w^2,w,0,w^2,0,w,w,w,1,0,w,0,1,0,0,0,
    0,1,0,0,0,w^2,w^2,0,w^2,0,0,0,w,w,0,w,0,0,0,1,1,0,0,0,
    1,w,0,0,0,w,0,w,w^2,0,0,0,w^2,0,w^2,1,0,0,0,1,0,0,0,0,
    w^2,0,w,w^2,0,0,0,w,0,1,w,0,0,0,1,0,w^2,1,0,0,0,1,w^2,w,
    0,1,0,w^2,w^2,1,w,0,w,0,1,1,w,w^2,0,w^2,0,w,w,w^2,1,1,w,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=21 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [21+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[226]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 24 and Dimension(Q) eq 10;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[226]:=[24,6,9,10];
Table3DistanceTypes[226]:="exact";

// Table 3, No. 227 | QB_27_6_9_9
// [[27,6,9;9]]_2, distance exact.
Gsrc1:=Matrix(F,10,21,[
    0,0,1,w,0,1,w^2,0,0,1,w,0,1,w^2,0,0,1,w,0,1,w^2,
    1,w,0,w^2,w^2,1,1,w^2,1,0,w,w,w^2,w^2,w,w^2,0,1,1,w,w,
    1,1,w^2,0,0,1,1,1,1,w^2,0,0,1,1,1,1,w^2,0,0,1,1,
    w,1,0,0,1,w,1,w,1,0,0,1,w,1,w,1,0,0,1,w,1,
    w^2,w,w,0,1,w,0,w^2,w,w,0,1,w,0,w^2,w,w,0,1,w,0,
    0,0,w,w,w^2,w^2,1,0,0,1,1,w,w,w^2,0,0,w^2,w^2,1,1,w,
    w^2,w,w,1,w,w^2,1,1,w^2,w^2,w,w^2,1,w,w,1,1,w^2,1,w,w^2,
    w^2,w^2,1,1,0,0,1,1,1,w,w,0,0,w,w,w,w^2,w^2,0,0,w^2,
    w,w^2,w,1,1,w,1,w^2,1,w^2,w,w,w^2,w,1,w,1,w^2,w^2,1,w^2,
    w^2,w,0,w^2,0,1,1,1,w^2,0,1,0,w,w,w,1,0,w,0,w^2,w^2
]);
Gsrc2:=Matrix(F,4,6,[
    1,w^2,1,w^2,1,w^2,
    w,1,1,w^2,w^2,w,
    w,0,w^2,0,1,0,
    0,1,0,w,0,w^2
]);
W1:=Matrix(F,2,21,[
    w,w^2,w,1,1,w,1,w^2,1,w^2,w,w,w^2,w,1,w,1,w^2,w^2,1,w^2,
    w^2,w,0,w^2,0,1,1,1,w^2,0,1,0,w,w,w,1,0,w,0,w^2,w^2
]);
W2:=Matrix(F,2,6,[
    w,0,w^2,0,1,0,
    0,1,0,w,0,w^2
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 21 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,12,27,[
    0,0,1,w,0,1,w^2,0,0,1,w,0,1,w^2,0,0,1,w,0,1,w^2,0,0,0,0,0,0,
    1,w,0,w^2,w^2,1,1,w^2,1,0,w,w,w^2,w^2,w,w^2,0,1,1,w,w,0,0,0,0,0,0,
    1,1,w^2,0,0,1,1,1,1,w^2,0,0,1,1,1,1,w^2,0,0,1,1,0,0,0,0,0,0,
    w,1,0,0,1,w,1,w,1,0,0,1,w,1,w,1,0,0,1,w,1,0,0,0,0,0,0,
    w^2,w,w,0,1,w,0,w^2,w,w,0,1,w,0,w^2,w,w,0,1,w,0,0,0,0,0,0,0,
    0,0,w,w,w^2,w^2,1,0,0,1,1,w,w,w^2,0,0,w^2,w^2,1,1,w,0,0,0,0,0,0,
    w^2,w,w,1,w,w^2,1,1,w^2,w^2,w,w^2,1,w,w,1,1,w^2,1,w,w^2,0,0,0,0,0,0,
    w^2,w^2,1,1,0,0,1,1,1,w,w,0,0,w,w,w,w^2,w^2,0,0,w^2,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w^2,1,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w^2,w^2,w,
    w,w^2,w,1,1,w,1,w^2,1,w^2,w,w,w^2,w,1,w,1,w^2,w^2,1,w^2,w,0,w^2,0,1,0,
    w^2,w,0,w^2,0,1,1,1,w^2,0,1,0,w,w,w,1,0,w,0,w^2,w^2,0,1,0,w,0,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=21 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [21+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[227]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 27 and Dimension(Q) eq 12;
assert Dimension(HermitianHull(Q)) eq 6;
Table3Parameters[227]:=[27,6,9,9];
Table3DistanceTypes[227]:="exact";

// Table 3, No. 228 | Q50_005
// [[27,7,9;10]]_2, distance exact.
Gsrc1:=Matrix(F,12,24,[
    1,w,w,0,w^2,1,1,0,1,w,w,0,w^2,1,1,0,1,w,w,0,w^2,1,1,0,
    1,1,w,w,1,0,1,0,w^2,w^2,1,1,w^2,0,w^2,0,w,w,w^2,w^2,w,0,w,0,
    1,w^2,w^2,1,1,w,w^2,w,w,1,1,w,w,w^2,1,w^2,w^2,w,w,w^2,w^2,1,w,1,
    w^2,w^2,w,w,1,0,w,w,w^2,w^2,w,w,1,0,w,w,w^2,w^2,w,w,1,0,w,w,
    w,w^2,w^2,0,0,0,w,w,w,w^2,w^2,0,0,0,w,w,w,w^2,w^2,0,0,0,w,w,
    w,1,w,0,w,0,0,1,1,w^2,1,0,1,0,0,w^2,w^2,w,w^2,0,w^2,0,0,w,
    w,0,0,0,0,0,w,1,1,0,0,0,0,0,1,w^2,w^2,0,0,0,0,0,w^2,w,
    w^2,1,0,0,1,w,w^2,0,w,w^2,0,0,w^2,1,w,0,1,w,0,0,w,w^2,1,0,
    1,w,0,w,w,0,1,0,w,w^2,0,w^2,w^2,0,w,0,w^2,1,0,1,1,0,w^2,0,
    1,0,0,1,w^2,w^2,0,w,w,0,0,w,1,1,0,w^2,w^2,0,0,w^2,w,w,0,1,
    w^2,w,0,w^2,1,0,0,w,w^2,w,0,w^2,1,0,0,w,w^2,w,0,w^2,1,0,0,w,
    w,w,w,0,1,0,0,1,1,1,1,0,w^2,0,0,w^2,w^2,w^2,w^2,0,w,0,0,w
]);
Gsrc2:=Matrix(F,2,3,[
    1,1,1,
    1,w^2,w
]);
W1:=Matrix(F,2,24,[
    w^2,w,0,w^2,1,0,0,w,w^2,w,0,w^2,1,0,0,w,w^2,w,0,w^2,1,0,0,w,
    w,w,w,0,1,0,0,1,1,1,1,0,w^2,0,0,w^2,w^2,w^2,w^2,0,w,0,0,w
]);
W2:=Matrix(F,2,3,[
    1,1,1,
    1,w^2,w
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 24 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,12,27,[
    1,w,w,0,w^2,1,1,0,1,w,w,0,w^2,1,1,0,1,w,w,0,w^2,1,1,0,0,0,0,
    1,1,w,w,1,0,1,0,w^2,w^2,1,1,w^2,0,w^2,0,w,w,w^2,w^2,w,0,w,0,0,0,0,
    1,w^2,w^2,1,1,w,w^2,w,w,1,1,w,w,w^2,1,w^2,w^2,w,w,w^2,w^2,1,w,1,0,0,0,
    w^2,w^2,w,w,1,0,w,w,w^2,w^2,w,w,1,0,w,w,w^2,w^2,w,w,1,0,w,w,0,0,0,
    w,w^2,w^2,0,0,0,w,w,w,w^2,w^2,0,0,0,w,w,w,w^2,w^2,0,0,0,w,w,0,0,0,
    w,1,w,0,w,0,0,1,1,w^2,1,0,1,0,0,w^2,w^2,w,w^2,0,w^2,0,0,w,0,0,0,
    w,0,0,0,0,0,w,1,1,0,0,0,0,0,1,w^2,w^2,0,0,0,0,0,w^2,w,0,0,0,
    w^2,1,0,0,1,w,w^2,0,w,w^2,0,0,w^2,1,w,0,1,w,0,0,w,w^2,1,0,0,0,0,
    1,w,0,w,w,0,1,0,w,w^2,0,w^2,w^2,0,w,0,w^2,1,0,1,1,0,w^2,0,0,0,0,
    1,0,0,1,w^2,w^2,0,w,w,0,0,w,1,1,0,w^2,w^2,0,0,w^2,w,w,0,1,0,0,0,
    w^2,w,0,w^2,1,0,0,w,w^2,w,0,w^2,1,0,0,w,w^2,w,0,w^2,1,0,0,w,1,1,1,
    w,w,w,0,1,0,0,1,1,1,1,0,w^2,0,0,w^2,w^2,w^2,w^2,0,w,0,0,w,1,w^2,w
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=24 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [24+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[228]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 27 and Dimension(Q) eq 12;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[228]:=[27,7,9,10];
Table3DistanceTypes[228]:="exact";

// Table 3, No. 229 | QB_27_7_10_12
// [[27,7,10;12]]_2, distance exact.
Gsrc1:=Matrix(F,9,21,[
    w^2,w^2,0,0,w,w,w,w^2,w^2,0,0,w,w,w,w^2,w^2,0,0,w,w,w,
    w^2,w,w,w^2,w^2,w^2,w^2,w^2,w,w,w^2,w^2,w^2,w^2,w^2,w,w,w^2,w^2,w^2,w^2,
    w^2,w^2,w^2,w^2,1,w^2,w,w^2,w^2,w^2,w^2,1,w^2,w,w^2,w^2,w^2,w^2,1,w^2,w,
    w,w^2,w^2,w,w,1,w^2,1,w,w,1,1,w^2,w,w^2,1,1,w^2,w^2,w,1,
    0,w^2,w,0,w^2,w,w^2,0,1,w^2,0,1,w^2,1,0,w,1,0,w,1,w,
    w^2,w,1,0,1,w^2,0,1,w^2,w,0,w,1,0,w,1,w^2,0,w^2,w,0,
    1,w^2,w^2,w,1,1,1,w,1,1,w^2,w,w,w,w^2,w,w,1,w^2,w^2,w^2,
    1,1,w^2,0,w,0,w^2,w^2,w^2,w,0,1,0,w,w,w,1,0,w^2,0,1,
    w^2,w,w,w,1,1,w^2,w,1,1,1,w^2,w^2,w,1,w^2,w^2,w^2,w,w,1
]);
Gsrc2:=Matrix(F,4,6,[
    w^2,w,w^2,w,w^2,w,
    w,1,w^2,w,1,w^2,
    0,1,0,w^2,0,w,
    1,0,w^2,0,w,0
]);
W1:=Matrix(F,2,21,[
    1,1,w^2,0,w,0,w^2,w^2,w^2,w,0,1,0,w,w,w,1,0,w^2,0,1,
    w^2,w,w,w,1,1,w^2,w,1,1,1,w^2,w^2,w,1,w^2,w^2,w^2,w,w,1
]);
W2:=Matrix(F,2,6,[
    0,1,0,w^2,0,w,
    1,0,w^2,0,w,0
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 21 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,11,27,[
    w^2,w^2,0,0,w,w,w,w^2,w^2,0,0,w,w,w,w^2,w^2,0,0,w,w,w,0,0,0,0,0,0,
    w^2,w,w,w^2,w^2,w^2,w^2,w^2,w,w,w^2,w^2,w^2,w^2,w^2,w,w,w^2,w^2,w^2,w^2,0,0,0,0,0,0,
    w^2,w^2,w^2,w^2,1,w^2,w,w^2,w^2,w^2,w^2,1,w^2,w,w^2,w^2,w^2,w^2,1,w^2,w,0,0,0,0,0,0,
    w,w^2,w^2,w,w,1,w^2,1,w,w,1,1,w^2,w,w^2,1,1,w^2,w^2,w,1,0,0,0,0,0,0,
    0,w^2,w,0,w^2,w,w^2,0,1,w^2,0,1,w^2,1,0,w,1,0,w,1,w,0,0,0,0,0,0,
    w^2,w,1,0,1,w^2,0,1,w^2,w,0,w,1,0,w,1,w^2,0,w^2,w,0,0,0,0,0,0,0,
    1,w^2,w^2,w,1,1,1,w,1,1,w^2,w,w,w,w^2,w,w,1,w^2,w^2,w^2,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,w,w^2,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,w,1,w^2,
    1,1,w^2,0,w,0,w^2,w^2,w^2,w,0,1,0,w,w,w,1,0,w^2,0,1,0,1,0,w^2,0,w,
    w^2,w,w,w,1,1,w^2,w,1,1,1,w^2,w^2,w,1,w^2,w^2,w^2,w,w,1,1,0,w^2,0,w,0
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=21 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [21+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[229]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 27 and Dimension(Q) eq 11;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[229]:=[27,7,10,12];
Table3DistanceTypes[229]:="exact";

// Table 3, No. 230 | Q50_006
// [[30,4,13;16]]_2, distance exact.
Gsrc1:=Matrix(F,9,27,[
    0,0,0,0,1,w,0,w,1,0,0,0,0,1,w,0,w,1,0,0,0,0,1,w,0,w,1,
    1,0,w^2,w,w^2,w^2,w,w^2,1,w,0,1,w^2,1,1,w^2,1,w,w^2,0,w,1,w,w,1,w,w^2,
    0,1,1,w,0,w^2,0,w,1,0,w,w,w^2,0,1,0,w^2,w,0,w^2,w^2,1,0,w,0,1,w^2,
    1,w,w,1,w^2,0,w,1,0,1,w,w,1,w^2,0,w,1,0,1,w,w,1,w^2,0,w,1,0,
    1,w,1,0,w,0,0,w,0,w^2,1,w^2,0,1,0,0,1,0,w,w^2,w,0,w^2,0,0,w^2,0,
    0,1,1,0,w,w^2,1,1,1,0,w^2,w^2,0,1,w,w^2,w^2,w^2,0,w,w,0,w^2,1,w,w,w,
    w^2,w^2,w^2,w^2,w^2,w,1,0,0,w,w,w,w,w,1,w^2,0,0,1,1,1,1,1,w^2,w,0,0,
    1,w,w,1,0,0,1,w^2,w,1,w,w,1,0,0,1,w^2,w,1,w,w,1,0,0,1,w^2,w,
    0,w^2,w,w^2,0,0,w^2,0,w,0,w,1,w,0,0,w,0,1,0,1,w^2,1,0,0,1,0,w^2
]);
Gsrc2:=Matrix(F,2,3,[
    1,1,1,
    1,w^2,w
]);
W1:=Matrix(F,2,27,[
    1,w,w,1,0,0,1,w^2,w,1,w,w,1,0,0,1,w^2,w,1,w,w,1,0,0,1,w^2,w,
    0,w^2,w,w^2,0,0,w^2,0,w,0,w,1,w,0,0,w,0,1,0,1,w^2,1,0,0,1,0,w^2
]);
W2:=Matrix(F,2,3,[
    1,1,1,
    1,w^2,w
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 27 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,9,30,[
    0,0,0,0,1,w,0,w,1,0,0,0,0,1,w,0,w,1,0,0,0,0,1,w,0,w,1,0,0,0,
    1,0,w^2,w,w^2,w^2,w,w^2,1,w,0,1,w^2,1,1,w^2,1,w,w^2,0,w,1,w,w,1,w,w^2,0,0,0,
    0,1,1,w,0,w^2,0,w,1,0,w,w,w^2,0,1,0,w^2,w,0,w^2,w^2,1,0,w,0,1,w^2,0,0,0,
    1,w,w,1,w^2,0,w,1,0,1,w,w,1,w^2,0,w,1,0,1,w,w,1,w^2,0,w,1,0,0,0,0,
    1,w,1,0,w,0,0,w,0,w^2,1,w^2,0,1,0,0,1,0,w,w^2,w,0,w^2,0,0,w^2,0,0,0,0,
    0,1,1,0,w,w^2,1,1,1,0,w^2,w^2,0,1,w,w^2,w^2,w^2,0,w,w,0,w^2,1,w,w,w,0,0,0,
    w^2,w^2,w^2,w^2,w^2,w,1,0,0,w,w,w,w,w,1,w^2,0,0,1,1,1,1,1,w^2,w,0,0,0,0,0,
    1,w,w,1,0,0,1,w^2,w,1,w,w,1,0,0,1,w^2,w,1,w,w,1,0,0,1,w^2,w,1,1,1,
    0,w^2,w,w^2,0,0,w^2,0,w,0,w,1,w,0,0,w,0,1,0,1,w^2,1,0,0,1,0,w^2,1,w^2,w
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=27 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [27+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[230]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 30 and Dimension(Q) eq 9;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[230]:=[30,4,13,16];
Table3DistanceTypes[230]:="exact";

// Table 3, No. 231 | Q50_007
// [[30,5,12;15]]_2, distance exact.
Gsrc1:=Matrix(F,10,24,[
    1,0,w,0,1,w,1,w,1,0,w,0,1,w,1,w,1,0,w,0,1,w,1,w,
    w,1,0,0,0,1,w^2,w^2,w,1,0,0,0,1,w^2,w^2,w,1,0,0,0,1,w^2,w^2,
    0,w^2,w^2,w^2,w^2,1,w^2,1,0,w,w,w,w,w^2,w,w^2,0,1,1,1,1,w,1,w,
    w^2,0,w^2,w,1,0,0,w^2,1,0,1,w^2,w,0,0,1,w,0,w,1,w^2,0,0,w,
    w^2,0,1,w^2,0,0,w,w^2,1,0,w,1,0,0,w^2,1,w,0,w^2,w,0,0,1,w,
    1,w^2,w,w^2,0,w^2,w^2,w,w,1,w^2,1,0,1,1,w^2,w^2,w,1,w,0,w,w,1,
    w^2,0,0,w,0,w^2,w,1,w^2,0,0,w,0,w^2,w,1,w^2,0,0,w,0,w^2,w,1,
    0,w^2,0,0,w^2,1,w,w^2,0,w^2,0,0,w^2,1,w,w^2,0,w^2,0,0,w^2,1,w,w^2,
    w^2,1,0,0,0,1,1,1,w,w^2,0,0,0,w^2,w^2,w^2,1,w,0,0,0,w,w,w,
    1,1,w,0,1,0,0,w^2,w^2,w^2,1,0,w^2,0,0,w,w,w,w^2,0,w,0,0,1
]);
Gsrc2:=Matrix(F,4,6,[
    1,0,1,0,1,0,
    0,1,0,1,0,1,
    1,0,w^2,0,w,0,
    0,1,0,w^2,0,w
]);
W1:=Matrix(F,4,24,[
    w^2,0,0,w,0,w^2,w,1,w^2,0,0,w,0,w^2,w,1,w^2,0,0,w,0,w^2,w,1,
    0,w^2,0,0,w^2,1,w,w^2,0,w^2,0,0,w^2,1,w,w^2,0,w^2,0,0,w^2,1,w,w^2,
    w^2,1,0,0,0,1,1,1,w,w^2,0,0,0,w^2,w^2,w^2,1,w,0,0,0,w,w,w,
    1,1,w,0,1,0,0,w^2,w^2,w^2,1,0,w^2,0,0,w,w,w,w^2,0,w,0,0,1
]);
W2:=Matrix(F,4,6,[
    1,0,1,0,1,0,
    0,1,0,1,0,1,
    1,0,w^2,0,w,0,
    0,1,0,w^2,0,w
]);
lambda:=4;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 24 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,10,30,[
    1,0,w,0,1,w,1,w,1,0,w,0,1,w,1,w,1,0,w,0,1,w,1,w,0,0,0,0,0,0,
    w,1,0,0,0,1,w^2,w^2,w,1,0,0,0,1,w^2,w^2,w,1,0,0,0,1,w^2,w^2,0,0,0,0,0,0,
    0,w^2,w^2,w^2,w^2,1,w^2,1,0,w,w,w,w,w^2,w,w^2,0,1,1,1,1,w,1,w,0,0,0,0,0,0,
    w^2,0,w^2,w,1,0,0,w^2,1,0,1,w^2,w,0,0,1,w,0,w,1,w^2,0,0,w,0,0,0,0,0,0,
    w^2,0,1,w^2,0,0,w,w^2,1,0,w,1,0,0,w^2,1,w,0,w^2,w,0,0,1,w,0,0,0,0,0,0,
    1,w^2,w,w^2,0,w^2,w^2,w,w,1,w^2,1,0,1,1,w^2,w^2,w,1,w,0,w,w,1,0,0,0,0,0,0,
    w^2,0,0,w,0,w^2,w,1,w^2,0,0,w,0,w^2,w,1,w^2,0,0,w,0,w^2,w,1,1,0,1,0,1,0,
    0,w^2,0,0,w^2,1,w,w^2,0,w^2,0,0,w^2,1,w,w^2,0,w^2,0,0,w^2,1,w,w^2,0,1,0,1,0,1,
    w^2,1,0,0,0,1,1,1,w,w^2,0,0,0,w^2,w^2,w^2,1,w,0,0,0,w,w,w,1,0,w^2,0,w,0,
    1,1,w,0,1,0,0,w^2,w^2,w^2,1,0,w^2,0,0,w,w,w,w^2,0,w,0,0,1,0,1,0,w^2,0,w
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=24 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [24+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[231]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 30 and Dimension(Q) eq 10;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[231]:=[30,5,12,15];
Table3DistanceTypes[231]:="exact";

// Table 3, No. 232 | Q50_008
// [[30,7,12;15]]_2, distance exact.
Gsrc1:=Matrix(F,11,27,[
    1,w^2,1,w^2,0,w,w^2,w,w^2,1,w^2,1,w^2,0,w,w^2,w,w^2,1,w^2,1,w^2,0,w,w^2,w,w^2,
    1,w,w,w^2,0,w,w^2,w^2,1,w^2,1,1,w,0,1,w,w,w^2,w,w^2,w^2,1,0,w^2,1,1,w,
    0,1,w,0,0,0,w^2,w^2,w,0,1,w,0,0,0,w^2,w^2,w,0,1,w,0,0,0,w^2,w^2,w,
    w^2,w^2,0,1,0,0,0,1,w,w^2,w^2,0,1,0,0,0,1,w,w^2,w^2,0,1,0,0,0,1,w,
    w,w,1,w,w,0,1,w,0,w,w,1,w,w,0,1,w,0,w,w,1,w,w,0,1,w,0,
    w^2,0,0,1,w^2,0,0,w,w,w,0,0,w^2,w,0,0,1,1,1,0,0,w,1,0,0,w^2,w^2,
    w^2,w^2,0,w,1,w^2,0,w^2,1,w,w,0,1,w^2,w,0,w,w^2,1,1,0,w^2,w,1,0,1,w,
    0,w,w,w,1,w^2,w,1,0,0,w^2,w^2,w^2,w,1,w^2,w,0,0,1,1,1,w^2,w,1,w^2,0,
    1,w^2,0,w,w,0,w^2,w^2,1,w,1,0,w^2,w^2,0,1,1,w,w^2,w,0,1,1,0,w,w,w^2,
    1,w^2,0,w^2,w^2,0,w^2,w^2,1,1,w^2,0,w^2,w^2,0,w^2,w^2,1,1,w^2,0,w^2,w^2,0,w^2,w^2,1,
    w^2,w^2,0,w,1,w,w^2,w^2,0,1,1,0,w^2,w,w^2,1,1,0,w,w,0,1,w^2,1,w,w,0
]);
Gsrc2:=Matrix(F,2,3,[
    1,1,1,
    1,w,w^2
]);
W1:=Matrix(F,2,27,[
    1,w^2,0,w^2,w^2,0,w^2,w^2,1,1,w^2,0,w^2,w^2,0,w^2,w^2,1,1,w^2,0,w^2,w^2,0,w^2,w^2,1,
    w^2,w^2,0,w,1,w,w^2,w^2,0,1,1,0,w^2,w,w^2,1,1,0,w,w,0,1,w^2,1,w,w,0
]);
W2:=Matrix(F,2,3,[
    1,1,1,
    1,w,w^2
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 27 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,11,30,[
    1,w^2,1,w^2,0,w,w^2,w,w^2,1,w^2,1,w^2,0,w,w^2,w,w^2,1,w^2,1,w^2,0,w,w^2,w,w^2,0,0,0,
    1,w,w,w^2,0,w,w^2,w^2,1,w^2,1,1,w,0,1,w,w,w^2,w,w^2,w^2,1,0,w^2,1,1,w,0,0,0,
    0,1,w,0,0,0,w^2,w^2,w,0,1,w,0,0,0,w^2,w^2,w,0,1,w,0,0,0,w^2,w^2,w,0,0,0,
    w^2,w^2,0,1,0,0,0,1,w,w^2,w^2,0,1,0,0,0,1,w,w^2,w^2,0,1,0,0,0,1,w,0,0,0,
    w,w,1,w,w,0,1,w,0,w,w,1,w,w,0,1,w,0,w,w,1,w,w,0,1,w,0,0,0,0,
    w^2,0,0,1,w^2,0,0,w,w,w,0,0,w^2,w,0,0,1,1,1,0,0,w,1,0,0,w^2,w^2,0,0,0,
    w^2,w^2,0,w,1,w^2,0,w^2,1,w,w,0,1,w^2,w,0,w,w^2,1,1,0,w^2,w,1,0,1,w,0,0,0,
    0,w,w,w,1,w^2,w,1,0,0,w^2,w^2,w^2,w,1,w^2,w,0,0,1,1,1,w^2,w,1,w^2,0,0,0,0,
    1,w^2,0,w,w,0,w^2,w^2,1,w,1,0,w^2,w^2,0,1,1,w,w^2,w,0,1,1,0,w,w,w^2,0,0,0,
    1,w^2,0,w^2,w^2,0,w^2,w^2,1,1,w^2,0,w^2,w^2,0,w^2,w^2,1,1,w^2,0,w^2,w^2,0,w^2,w^2,1,1,1,1,
    w^2,w^2,0,w,1,w,w^2,w^2,0,1,1,0,w^2,w,w^2,1,1,0,w,w,0,1,w^2,1,w,w,0,1,w,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=27 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [27+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[232]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 30 and Dimension(Q) eq 11;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[232]:=[30,7,12,15];
Table3DistanceTypes[232]:="exact";

// Table 3, No. 233 | SQ08
// [[33,5,14;20]]_2, distance exact.
Gsrc1:=Matrix(F,9,30,[
    1,0,0,0,0,0,0,0,0,w,w,w^2,1,w^2,w^2,0,w,1,w^2,w^2,0,1,w^2,1,0,w,w^2,w^2,w,w^2,
    0,1,0,0,0,0,0,0,0,0,w^2,1,0,0,1,w^2,w^2,w,1,w,w^2,w,w,w,0,0,1,w,0,w,
    0,0,1,0,0,0,0,0,0,0,w,1,1,w,1,w^2,w,1,w^2,w^2,w^2,w,1,w^2,w,1,w^2,w,1,1,
    0,0,0,1,0,0,0,0,0,1,w^2,1,w^2,w,1,0,1,0,0,0,1,w^2,1,1,1,0,1,1,1,0,
    0,0,0,0,1,0,0,0,0,w,1,w,w,w^2,1,0,1,w,w,w,w,w^2,0,1,w,1,w,0,1,0,
    0,0,0,0,0,1,0,0,0,w^2,1,1,w^2,w,1,w^2,w^2,w,w^2,w^2,w^2,w,1,0,w^2,w^2,0,w^2,1,w,
    0,0,0,0,0,0,1,0,0,1,w,w^2,w,w,w,1,1,1,w,0,1,w,1,1,1,w^2,1,w^2,1,w,
    0,0,0,0,0,0,0,1,0,0,0,1,1,0,1,w^2,0,w,w,0,0,w^2,0,1,w^2,w,w^2,w^2,w^2,w,
    0,0,0,0,0,0,0,0,1,0,w,0,w,w^2,w,w^2,w^2,0,1,w,0,w,0,1,w,w^2,w^2,1,1,w^2
]);
Gsrc2:=Matrix(F,2,3,[
    1,0,w^2,
    0,1,w
]);
W1:=Matrix(F,2,30,[
    1,w,w^2,1,w^2,w,0,w^2,w,w^2,w^2,w^2,1,0,w,1,0,w,0,1,w,0,0,w^2,1,w^2,0,1,1,0,
    w,0,0,w^2,1,w^2,0,1,1,0,1,w,w^2,1,w^2,w,0,w^2,w,w^2,w^2,w^2,1,0,w,1,0,w,0,1
]);
W2:=Matrix(F,2,3,[
    0,w,w^2,
    w^2,0,w
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 30 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,9,33,[
    1,0,0,0,0,0,0,w^2,w^2,w,w^2,0,w^2,1,1,0,0,0,1,w,0,w,w^2,1,w^2,1,w^2,w,w^2,0,0,0,0,
    0,1,0,0,0,0,0,0,0,0,w^2,1,0,0,1,w^2,w^2,w,1,w,w^2,w,w,w,0,0,1,w,0,w,0,0,0,
    0,0,1,0,0,0,0,1,0,0,w,0,0,w,0,0,w,w^2,1,w^2,w^2,1,1,w,1,w^2,0,1,w,w^2,0,0,0,
    0,0,0,1,0,0,0,1,w^2,1,w,0,w^2,0,1,1,w^2,w,1,1,1,1,1,w^2,w^2,0,0,1,1,0,0,0,0,
    0,0,0,0,1,0,0,0,0,w,1,w,w,w^2,1,0,1,w,w,w,w,w^2,0,1,w,1,w,0,1,0,0,0,0,
    0,0,0,0,0,1,0,0,w,w^2,w,1,0,w^2,w,w,w,w,1,0,w^2,1,1,w,0,w,1,1,w^2,w^2,0,0,0,
    0,0,0,0,0,0,1,0,w^2,1,w^2,w^2,w^2,0,w^2,w^2,w^2,1,1,1,1,w^2,1,w,0,1,w^2,0,w,0,0,0,0,
    1,w,w^2,1,w^2,w,0,w^2,w,w^2,w^2,w^2,1,0,w,1,0,w,0,1,w,0,0,w^2,1,w^2,0,1,1,0,0,w,w^2,
    w,0,0,w^2,1,w^2,0,1,1,0,1,w,w^2,1,w^2,w,0,w^2,w,w^2,w^2,w^2,1,0,w,1,0,w,0,1,w^2,0,w
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=30 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [30+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[233]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 9;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[233]:=[33,5,14,20];
Table3DistanceTypes[233]:="exact";

// Table 3, No. 234 | QB_33_6_12_13
// [[33,6,12;13]]_2, distance exact.
Gsrc1:=Matrix(F,11,27,[
    1,0,1,w^2,1,1,w^2,1,1,1,0,1,w^2,1,1,w^2,1,1,1,0,1,w^2,1,1,w^2,1,1,
    0,0,1,1,w,w^2,1,0,w,0,0,w^2,w^2,1,w,w^2,0,1,0,0,w,w,w^2,1,w,0,w^2,
    1,w^2,0,w,w,0,1,0,w^2,w,1,0,w^2,w^2,0,w,0,1,w^2,w,0,1,1,0,w^2,0,w,
    0,w^2,0,w,0,0,1,w^2,w,0,w^2,0,w,0,0,1,w^2,w,0,w^2,0,w,0,0,1,w^2,w,
    w^2,w,1,0,0,w^2,w^2,0,0,w^2,w,1,0,0,w^2,w^2,0,0,w^2,w,1,0,0,w^2,w^2,0,0,
    1,w,0,w,1,0,w^2,w,w^2,w^2,1,0,1,w^2,0,w,1,w,w,w^2,0,w^2,w,0,1,w^2,1,
    w,1,0,0,w^2,w,1,0,0,1,w^2,0,0,w,1,w^2,0,0,w^2,w,0,0,1,w^2,w,0,0,
    1,0,0,1,1,w^2,w,w,w,w,0,0,w,w,1,w^2,w^2,w^2,w^2,0,0,w^2,w^2,w,1,1,1,
    0,0,w^2,w^2,w^2,w^2,w^2,w^2,w,0,0,1,1,1,1,1,1,w^2,0,0,w,w,w,w,w,w,1,
    0,w^2,w^2,w,0,0,w^2,0,1,0,w^2,w^2,w,0,0,w^2,0,1,0,w^2,w^2,w,0,0,w^2,0,1,
    0,w,0,w,0,w^2,0,w,w,0,w,0,w,0,w^2,0,w,w,0,w,0,w,0,w^2,0,w,w
]);
Gsrc2:=Matrix(F,4,6,[
    w,1,1,w^2,w^2,w,
    1,w^2,w,1,w^2,w,
    w,0,w,0,w,0,
    0,1,0,1,0,1
]);
W1:=Matrix(F,2,27,[
    0,w^2,w^2,w,0,0,w^2,0,1,0,w^2,w^2,w,0,0,w^2,0,1,0,w^2,w^2,w,0,0,w^2,0,1,
    0,w,0,w,0,w^2,0,w,w,0,w,0,w,0,w^2,0,w,w,0,w,0,w,0,w^2,0,w,w
]);
W2:=Matrix(F,2,6,[
    w,0,w,0,w,0,
    0,1,0,1,0,1
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 27 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,13,33,[
    1,0,1,w^2,1,1,w^2,1,1,1,0,1,w^2,1,1,w^2,1,1,1,0,1,w^2,1,1,w^2,1,1,0,0,0,0,0,0,
    0,0,1,1,w,w^2,1,0,w,0,0,w^2,w^2,1,w,w^2,0,1,0,0,w,w,w^2,1,w,0,w^2,0,0,0,0,0,0,
    1,w^2,0,w,w,0,1,0,w^2,w,1,0,w^2,w^2,0,w,0,1,w^2,w,0,1,1,0,w^2,0,w,0,0,0,0,0,0,
    0,w^2,0,w,0,0,1,w^2,w,0,w^2,0,w,0,0,1,w^2,w,0,w^2,0,w,0,0,1,w^2,w,0,0,0,0,0,0,
    w^2,w,1,0,0,w^2,w^2,0,0,w^2,w,1,0,0,w^2,w^2,0,0,w^2,w,1,0,0,w^2,w^2,0,0,0,0,0,0,0,0,
    1,w,0,w,1,0,w^2,w,w^2,w^2,1,0,1,w^2,0,w,1,w,w,w^2,0,w^2,w,0,1,w^2,1,0,0,0,0,0,0,
    w,1,0,0,w^2,w,1,0,0,1,w^2,0,0,w,1,w^2,0,0,w^2,w,0,0,1,w^2,w,0,0,0,0,0,0,0,0,
    1,0,0,1,1,w^2,w,w,w,w,0,0,w,w,1,w^2,w^2,w^2,w^2,0,0,w^2,w^2,w,1,1,1,0,0,0,0,0,0,
    0,0,w^2,w^2,w^2,w^2,w^2,w^2,w,0,0,1,1,1,1,1,1,w^2,0,0,w,w,w,w,w,w,1,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w^2,w^2,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,1,w^2,w,
    0,w^2,w^2,w,0,0,w^2,0,1,0,w^2,w^2,w,0,0,w^2,0,1,0,w^2,w^2,w,0,0,w^2,0,1,w,0,w,0,w,0,
    0,w,0,w,0,w^2,0,w,w,0,w,0,w,0,w^2,0,w,w,0,w,0,w,0,w^2,0,w,w,0,1,0,1,0,1
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=27 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [27+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[234]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 13;
assert Dimension(HermitianHull(Q)) eq 7;
Table3Parameters[234]:=[33,6,12,13];
Table3DistanceTypes[234]:="exact";

// Table 3, No. 235 | Q50_010
// [[33,6,13;15]]_2, distance exact.
Gsrc1:=Matrix(F,12,30,[
    1,1,1,0,1,w,w,0,w,w^2,1,1,1,0,1,w,w,0,w,w^2,1,1,1,0,1,w,w,0,w,w^2,
    0,0,0,1,0,w^2,w^2,1,w,w^2,0,0,0,1,0,w^2,w^2,1,w,w^2,0,0,0,1,0,w^2,w^2,1,w,w^2,
    1,1,0,w^2,w,0,1,1,0,0,w^2,w^2,0,w,1,0,w^2,w^2,0,0,w,w,0,1,w^2,0,w,w,0,0,
    1,w,w^2,1,1,w,w^2,1,0,0,w,w^2,1,w,w,w^2,1,w,0,0,w^2,1,w,w^2,w^2,1,w,w^2,0,0,
    1,w,0,0,0,w,w^2,w,w^2,1,1,w,0,0,0,w,w^2,w,w^2,1,1,w,0,0,0,w,w^2,w,w^2,1,
    w^2,w,0,0,w,w,w,w^2,0,w,w^2,w,0,0,w,w,w,w^2,0,w,w^2,w,0,0,w,w,w,w^2,0,w,
    w,w^2,w,0,0,0,w,w^2,w^2,w,1,w,1,0,0,0,1,w,w,1,w^2,1,w^2,0,0,0,w^2,1,1,w^2,
    1,1,w,0,w^2,0,w,0,1,1,w^2,w^2,1,0,w,0,1,0,w^2,w^2,w,w,w^2,0,1,0,w^2,0,w,w,
    w,w^2,w,0,w^2,1,w^2,w,0,0,w^2,1,w^2,0,1,w,1,w^2,0,0,1,w,1,0,w,w^2,w,1,0,0,
    w,w^2,w^2,0,w,1,0,0,w^2,w,w^2,1,1,0,w^2,w,0,0,1,w^2,1,w,w,0,1,w^2,0,0,w,1,
    0,w,w^2,0,0,w^2,1,w^2,1,w,0,1,w,0,0,w,w^2,w,w^2,1,0,w^2,1,0,0,1,w,1,w,w^2,
    w^2,w^2,0,0,w,w^2,0,1,1,1,1,1,0,0,w^2,1,0,w,w,w,w,w,0,0,1,w,0,w^2,w^2,w^2
]);
Gsrc2:=Matrix(F,2,3,[
    1,w^2,w,
    1,w,w^2
]);
W1:=Matrix(F,2,30,[
    0,w,w^2,0,0,w^2,1,w^2,1,w,0,1,w,0,0,w,w^2,w,w^2,1,0,w^2,1,0,0,1,w,1,w,w^2,
    w^2,w^2,0,0,w,w^2,0,1,1,1,1,1,0,0,w^2,1,0,w,w,w,w,w,0,0,1,w,0,w^2,w^2,w^2
]);
W2:=Matrix(F,2,3,[
    1,w^2,w,
    1,w,w^2
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 30 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,12,33,[
    1,1,1,0,1,w,w,0,w,w^2,1,1,1,0,1,w,w,0,w,w^2,1,1,1,0,1,w,w,0,w,w^2,0,0,0,
    0,0,0,1,0,w^2,w^2,1,w,w^2,0,0,0,1,0,w^2,w^2,1,w,w^2,0,0,0,1,0,w^2,w^2,1,w,w^2,0,0,0,
    1,1,0,w^2,w,0,1,1,0,0,w^2,w^2,0,w,1,0,w^2,w^2,0,0,w,w,0,1,w^2,0,w,w,0,0,0,0,0,
    1,w,w^2,1,1,w,w^2,1,0,0,w,w^2,1,w,w,w^2,1,w,0,0,w^2,1,w,w^2,w^2,1,w,w^2,0,0,0,0,0,
    1,w,0,0,0,w,w^2,w,w^2,1,1,w,0,0,0,w,w^2,w,w^2,1,1,w,0,0,0,w,w^2,w,w^2,1,0,0,0,
    w^2,w,0,0,w,w,w,w^2,0,w,w^2,w,0,0,w,w,w,w^2,0,w,w^2,w,0,0,w,w,w,w^2,0,w,0,0,0,
    w,w^2,w,0,0,0,w,w^2,w^2,w,1,w,1,0,0,0,1,w,w,1,w^2,1,w^2,0,0,0,w^2,1,1,w^2,0,0,0,
    1,1,w,0,w^2,0,w,0,1,1,w^2,w^2,1,0,w,0,1,0,w^2,w^2,w,w,w^2,0,1,0,w^2,0,w,w,0,0,0,
    w,w^2,w,0,w^2,1,w^2,w,0,0,w^2,1,w^2,0,1,w,1,w^2,0,0,1,w,1,0,w,w^2,w,1,0,0,0,0,0,
    w,w^2,w^2,0,w,1,0,0,w^2,w,w^2,1,1,0,w^2,w,0,0,1,w^2,1,w,w,0,1,w^2,0,0,w,1,0,0,0,
    0,w,w^2,0,0,w^2,1,w^2,1,w,0,1,w,0,0,w,w^2,w,w^2,1,0,w^2,1,0,0,1,w,1,w,w^2,1,w^2,w,
    w^2,w^2,0,0,w,w^2,0,1,1,1,1,1,0,0,w^2,1,0,w,w,w,w,w,0,0,1,w,0,w^2,w^2,w^2,1,w,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=30 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [30+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[235]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 12;
assert Dimension(HermitianHull(Q)) eq 6;
Table3Parameters[235]:=[33,6,13,15];
Table3DistanceTypes[235]:="exact";

// Table 3, No. 236 | SQ10
// [[33,6,17;23]]_2, distance exact.
Gsrc1:=Matrix(F,8,30,[
    1,0,0,0,0,0,0,w,w^2,1,0,0,0,1,w,0,w,w,w,1,w,1,w,w,0,w^2,w^2,w^2,0,w,
    0,1,0,0,0,0,0,1,0,0,0,w^2,1,w,1,w,0,1,w,w^2,w^2,w^2,w^2,1,w^2,1,1,w^2,w^2,1,
    0,0,1,0,0,0,0,1,0,w,0,w^2,w^2,1,0,w,1,w,w^2,w^2,w^2,0,w,w,1,w,0,0,0,1,
    0,0,0,1,0,0,0,w^2,1,0,0,w^2,w^2,0,1,0,0,w^2,w,w,0,w,w,1,w^2,w,0,0,w,w^2,
    0,0,0,0,1,0,0,w^2,w,w^2,0,w,w^2,w^2,0,w,w^2,w,1,w^2,0,w,w^2,w^2,1,w,w^2,1,w^2,0,
    0,0,0,0,0,1,0,w^2,1,1,0,1,1,1,w,w^2,0,0,1,0,0,w^2,w^2,1,1,1,0,w^2,w,w^2,
    0,0,0,0,0,0,1,0,0,0,0,w,1,w,1,w,0,0,w,w^2,1,w,0,w^2,1,0,w^2,1,w,w,
    0,0,0,0,0,0,0,0,0,0,1,1,1,0,w,w,1,w,w,0,w,1,w,w^2,w,w^2,0,1,w,w^2
]);
Gsrc2:=Matrix(F,2,3,[
    1,0,w^2,
    0,1,w
]);
W1:=Matrix(F,2,30,[
    1,0,1,0,0,1,w,0,w,w,1,0,1,w,0,0,w,w,1,w^2,1,0,1,w^2,0,w^2,w,w^2,w^2,0,
    1,0,1,w^2,0,w^2,w,w^2,w^2,0,1,0,1,0,0,1,w,0,w,w,1,0,1,w,0,0,w,w,1,w^2
]);
W2:=Matrix(F,2,3,[
    0,w,w^2,
    w^2,0,w
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 30 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,8,33,[
    1,0,0,0,0,0,1,w,w^2,1,1,w^2,0,w^2,1,0,w^2,0,w,w,1,w,0,w,w^2,0,0,w^2,0,w^2,0,0,0,
    0,1,0,0,0,0,0,1,0,0,w^2,0,w,w,0,w^2,w^2,0,w^2,w^2,w,0,w,w^2,w,w^2,1,0,w,w^2,0,0,0,
    0,0,1,0,0,0,1,1,0,w,w,w^2,0,w^2,w,w^2,w^2,1,w,0,1,0,1,0,w^2,w^2,w^2,w^2,1,w,0,0,0,
    0,0,0,1,0,0,1,w^2,1,0,0,1,w,w,0,w,0,w^2,0,1,1,0,w,w,w,w,w^2,1,0,1,0,0,0,
    0,0,0,0,1,0,1,w^2,w,w^2,w,w,0,1,w,w^2,1,1,0,0,w,w,0,1,w^2,w^2,0,w,w,w^2,0,0,0,
    0,0,0,0,0,1,0,w^2,1,1,w^2,w,w,1,w^2,w,w^2,1,0,0,1,0,w,w^2,0,w^2,0,0,w^2,1,0,0,0,
    1,0,1,0,0,1,w,0,w,w,1,0,1,w,0,0,w,w,1,w^2,1,0,1,w^2,0,w^2,w,w^2,w^2,0,0,w,w^2,
    1,0,1,w^2,0,w^2,w,w^2,w^2,0,1,0,1,0,0,1,w,0,w,w,1,0,1,w,0,0,w,w,1,w^2,w^2,0,w
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=30 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [30+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[236]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 8;
assert Dimension(HermitianHull(Q)) eq 2;
Table3Parameters[236]:=[33,6,17,23];
Table3DistanceTypes[236]:="exact";

// Table 3, No. 237 | QB_33_7_11_14
// [[33,7,11;14]]_2, distance exact.
Gsrc1:=Matrix(F,11,27,[
    1,1,0,1,1,w,w,w,w,1,1,0,1,1,w,w,w,w,1,1,0,1,1,w,w,w,w,
    1,1,1,0,w,0,0,w,w^2,w^2,w^2,w^2,0,1,0,0,1,w,w,w,w,0,w^2,0,0,w^2,1,
    w,w,1,w^2,0,0,1,1,1,w,w,1,w^2,0,0,1,1,1,w,w,1,w^2,0,0,1,1,1,
    w,0,1,w^2,w,0,0,1,0,w,0,1,w^2,w,0,0,1,0,w,0,1,w^2,w,0,0,1,0,
    w,w^2,1,w,0,0,1,w^2,w^2,w,w^2,1,w,0,0,1,w^2,w^2,w,w^2,1,w,0,0,1,w^2,w^2,
    w,w^2,w,w,w,0,0,1,w^2,w,w^2,w,w,w,0,0,1,w^2,w,w^2,w,w,w,0,0,1,w^2,
    w,w^2,0,0,w,1,1,w,w^2,1,w,0,0,1,w^2,w^2,1,w,w^2,1,0,0,w^2,w,w,w^2,1,
    0,1,0,w^2,1,1,w,w,w,0,w^2,0,w,w^2,w^2,1,1,1,0,w,0,1,w,w,w^2,w^2,w^2,
    w,0,w^2,0,w,w^2,w,w^2,w^2,w^2,0,1,0,w^2,1,w^2,1,1,1,0,w,0,1,w,1,w,w,
    w^2,w,w^2,0,w^2,1,0,w^2,1,1,w^2,1,0,1,w,0,1,w,w,1,w,0,w,w^2,0,w,w^2,
    w,w,w^2,w^2,w^2,w^2,1,w,w,w^2,w^2,1,1,1,1,w,w^2,w^2,1,1,w,w,w,w,w^2,1,1
]);
Gsrc2:=Matrix(F,4,6,[
    1,w^2,1,w^2,1,w^2,
    w,1,1,w^2,w^2,w,
    w,0,w^2,0,1,0,
    0,1,0,w,0,w^2
]);
W1:=Matrix(F,2,27,[
    w^2,w,w^2,0,w^2,1,0,w^2,1,1,w^2,1,0,1,w,0,1,w,w,1,w,0,w,w^2,0,w,w^2,
    w,w,w^2,w^2,w^2,w^2,1,w,w,w^2,w^2,1,1,1,1,w,w^2,w^2,1,1,w,w,w,w,w^2,1,1
]);
W2:=Matrix(F,2,6,[
    w,0,w^2,0,1,0,
    0,1,0,w,0,w^2
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 27 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,13,33,[
    1,1,0,1,1,w,w,w,w,1,1,0,1,1,w,w,w,w,1,1,0,1,1,w,w,w,w,0,0,0,0,0,0,
    1,1,1,0,w,0,0,w,w^2,w^2,w^2,w^2,0,1,0,0,1,w,w,w,w,0,w^2,0,0,w^2,1,0,0,0,0,0,0,
    w,w,1,w^2,0,0,1,1,1,w,w,1,w^2,0,0,1,1,1,w,w,1,w^2,0,0,1,1,1,0,0,0,0,0,0,
    w,0,1,w^2,w,0,0,1,0,w,0,1,w^2,w,0,0,1,0,w,0,1,w^2,w,0,0,1,0,0,0,0,0,0,0,
    w,w^2,1,w,0,0,1,w^2,w^2,w,w^2,1,w,0,0,1,w^2,w^2,w,w^2,1,w,0,0,1,w^2,w^2,0,0,0,0,0,0,
    w,w^2,w,w,w,0,0,1,w^2,w,w^2,w,w,w,0,0,1,w^2,w,w^2,w,w,w,0,0,1,w^2,0,0,0,0,0,0,
    w,w^2,0,0,w,1,1,w,w^2,1,w,0,0,1,w^2,w^2,1,w,w^2,1,0,0,w^2,w,w,w^2,1,0,0,0,0,0,0,
    0,1,0,w^2,1,1,w,w,w,0,w^2,0,w,w^2,w^2,1,1,1,0,w,0,1,w,w,w^2,w^2,w^2,0,0,0,0,0,0,
    w,0,w^2,0,w,w^2,w,w^2,w^2,w^2,0,1,0,w^2,1,w^2,1,1,1,0,w,0,1,w,1,w,w,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w^2,1,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w^2,w^2,w,
    w^2,w,w^2,0,w^2,1,0,w^2,1,1,w^2,1,0,1,w,0,1,w,w,1,w,0,w,w^2,0,w,w^2,w,0,w^2,0,1,0,
    w,w,w^2,w^2,w^2,w^2,1,w,w,w^2,w^2,1,1,1,1,w,w^2,w^2,1,1,w,w,w,w,w^2,1,1,0,1,0,w,0,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=27 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [27+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[237]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 13;
assert Dimension(HermitianHull(Q)) eq 6;
Table3Parameters[237]:=[33,7,11,14];
Table3DistanceTypes[237]:="exact";

// Table 3, No. 238 | QB_33_7_14_18
// [[33,7,14;18]]_2, distance exact.
Gsrc1:=Matrix(F,11,30,[
    1,0,w,0,w,1,1,1,1,1,1,0,w,0,w,1,1,1,1,1,1,0,w,0,w,1,1,1,1,1,
    0,1,0,1,w,w^2,w^2,1,w,w,0,w,0,w,w^2,1,1,w,w^2,w^2,0,w^2,0,w^2,1,w,w,w^2,1,1,
    1,0,0,w,1,w,w,0,w^2,1,1,0,0,w,1,w,w,0,w^2,1,1,0,0,w,1,w,w,0,w^2,1,
    1,w^2,0,w^2,w,1,w^2,w^2,w,w^2,1,w^2,0,w^2,w,1,w^2,w^2,w,w^2,1,w^2,0,w^2,w,1,w^2,w^2,w,w^2,
    w,0,1,w,w,1,w,0,0,w^2,1,0,w^2,1,1,w^2,1,0,0,w,w^2,0,w,w^2,w^2,w,w^2,0,0,1,
    w,1,1,w^2,0,w^2,1,1,1,1,1,w^2,w^2,w,0,w,w^2,w^2,w^2,w^2,w^2,w,w,1,0,1,w,w,w,w,
    1,w^2,0,0,w,w,w,0,w,w^2,w^2,w,0,0,1,1,1,0,1,w,w,1,0,0,w^2,w^2,w^2,0,w^2,1,
    w^2,w^2,w^2,0,w,1,w^2,1,0,0,1,1,1,0,w^2,w,1,w,0,0,w,w,w,0,1,w^2,w,w^2,0,0,
    w,w^2,w^2,0,w^2,w,0,w^2,w,0,w^2,1,1,0,1,w^2,0,1,w^2,0,1,w,w,0,w,1,0,w,1,0,
    0,0,0,w,w,w,w,1,1,1,0,0,0,w,w,w,w,1,1,1,0,0,0,w,w,w,w,1,1,1,
    w,w^2,w,0,0,w^2,1,0,w,w,w^2,1,w^2,0,0,1,w,0,w^2,w^2,1,w,1,0,0,w,w^2,0,1,1
]);
Gsrc2:=Matrix(F,2,3,[
    1,1,1,
    1,w,w^2
]);
W1:=Matrix(F,2,30,[
    0,0,0,w,w,w,w,1,1,1,0,0,0,w,w,w,w,1,1,1,0,0,0,w,w,w,w,1,1,1,
    w,w^2,w,0,0,w^2,1,0,w,w,w^2,1,w^2,0,0,1,w,0,w^2,w^2,1,w,1,0,0,w,w^2,0,1,1
]);
W2:=Matrix(F,2,3,[
    1,1,1,
    1,w,w^2
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 30 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,11,33,[
    1,0,w,0,w,1,1,1,1,1,1,0,w,0,w,1,1,1,1,1,1,0,w,0,w,1,1,1,1,1,0,0,0,
    0,1,0,1,w,w^2,w^2,1,w,w,0,w,0,w,w^2,1,1,w,w^2,w^2,0,w^2,0,w^2,1,w,w,w^2,1,1,0,0,0,
    1,0,0,w,1,w,w,0,w^2,1,1,0,0,w,1,w,w,0,w^2,1,1,0,0,w,1,w,w,0,w^2,1,0,0,0,
    1,w^2,0,w^2,w,1,w^2,w^2,w,w^2,1,w^2,0,w^2,w,1,w^2,w^2,w,w^2,1,w^2,0,w^2,w,1,w^2,w^2,w,w^2,0,0,0,
    w,0,1,w,w,1,w,0,0,w^2,1,0,w^2,1,1,w^2,1,0,0,w,w^2,0,w,w^2,w^2,w,w^2,0,0,1,0,0,0,
    w,1,1,w^2,0,w^2,1,1,1,1,1,w^2,w^2,w,0,w,w^2,w^2,w^2,w^2,w^2,w,w,1,0,1,w,w,w,w,0,0,0,
    1,w^2,0,0,w,w,w,0,w,w^2,w^2,w,0,0,1,1,1,0,1,w,w,1,0,0,w^2,w^2,w^2,0,w^2,1,0,0,0,
    w^2,w^2,w^2,0,w,1,w^2,1,0,0,1,1,1,0,w^2,w,1,w,0,0,w,w,w,0,1,w^2,w,w^2,0,0,0,0,0,
    w,w^2,w^2,0,w^2,w,0,w^2,w,0,w^2,1,1,0,1,w^2,0,1,w^2,0,1,w,w,0,w,1,0,w,1,0,0,0,0,
    0,0,0,w,w,w,w,1,1,1,0,0,0,w,w,w,w,1,1,1,0,0,0,w,w,w,w,1,1,1,1,1,1,
    w,w^2,w,0,0,w^2,1,0,w,w,w^2,1,w^2,0,0,1,w,0,w^2,w^2,1,w,1,0,0,w,w^2,0,1,1,1,w,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=30 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [30+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[238]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 11;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[238]:=[33,7,14,18];
Table3DistanceTypes[238]:="exact";

// Table 3, No. 239 | QB_33_8_11_15
// [[33,8,11;15]]_2, distance exact.
Gsrc1:=Matrix(F,11,27,[
    1,1,w^2,w^2,0,w,1,1,w^2,w,w,1,1,0,w^2,w,w,1,w^2,w^2,w,w,0,1,w^2,w^2,w,
    w^2,w,w,1,0,0,1,1,1,w^2,w,w,1,0,0,1,1,1,w^2,w,w,1,0,0,1,1,1,
    1,w,w,0,0,1,w^2,w,w^2,1,w,w,0,0,1,w^2,w,w^2,1,w,w,0,0,1,w^2,w,w^2,
    w,w^2,w,w,w^2,w,w,0,0,w,w^2,w,w,w^2,w,w,0,0,w,w^2,w,w,w^2,w,w,0,0,
    w,w,w,w^2,w^2,0,0,w,w,w,w,w,w^2,w^2,0,0,w,w,w,w,w,w^2,w^2,0,0,w,w,
    0,w^2,w,0,w,w,w^2,0,0,0,w^2,w,0,w,w,w^2,0,0,0,w^2,w,0,w,w,w^2,0,0,
    w,w^2,0,w,w,w,w,0,w^2,1,w,0,1,1,1,1,0,w,w^2,1,0,w^2,w^2,w^2,w^2,0,1,
    w^2,0,w,w^2,w^2,1,1,0,1,w,0,1,w,w,w^2,w^2,0,w^2,1,0,w^2,1,1,w,w,0,w,
    1,0,w,w^2,1,w,0,w,w,w^2,0,1,w,w^2,1,0,1,1,w,0,w^2,1,w,w^2,0,w^2,w^2,
    1,w^2,0,w,0,w,w,1,w,w,1,0,w^2,0,w^2,w^2,w,w^2,w^2,w,0,1,0,1,1,w^2,1,
    0,w^2,0,w^2,0,0,1,w,w^2,0,1,0,1,0,0,w,w^2,1,0,w,0,w,0,0,w^2,1,w
]);
Gsrc2:=Matrix(F,4,6,[
    1,w^2,1,w^2,1,w^2,
    w,1,1,w^2,w^2,w,
    w,0,w^2,0,1,0,
    0,1,0,w,0,w^2
]);
W1:=Matrix(F,2,27,[
    1,w^2,0,w,0,w,w,1,w,w,1,0,w^2,0,w^2,w^2,w,w^2,w^2,w,0,1,0,1,1,w^2,1,
    0,w^2,0,w^2,0,0,1,w,w^2,0,1,0,1,0,0,w,w^2,1,0,w,0,w,0,0,w^2,1,w
]);
W2:=Matrix(F,2,6,[
    w,0,w^2,0,1,0,
    0,1,0,w,0,w^2
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 27 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,13,33,[
    1,1,w^2,w^2,0,w,1,1,w^2,w,w,1,1,0,w^2,w,w,1,w^2,w^2,w,w,0,1,w^2,w^2,w,0,0,0,0,0,0,
    w^2,w,w,1,0,0,1,1,1,w^2,w,w,1,0,0,1,1,1,w^2,w,w,1,0,0,1,1,1,0,0,0,0,0,0,
    1,w,w,0,0,1,w^2,w,w^2,1,w,w,0,0,1,w^2,w,w^2,1,w,w,0,0,1,w^2,w,w^2,0,0,0,0,0,0,
    w,w^2,w,w,w^2,w,w,0,0,w,w^2,w,w,w^2,w,w,0,0,w,w^2,w,w,w^2,w,w,0,0,0,0,0,0,0,0,
    w,w,w,w^2,w^2,0,0,w,w,w,w,w,w^2,w^2,0,0,w,w,w,w,w,w^2,w^2,0,0,w,w,0,0,0,0,0,0,
    0,w^2,w,0,w,w,w^2,0,0,0,w^2,w,0,w,w,w^2,0,0,0,w^2,w,0,w,w,w^2,0,0,0,0,0,0,0,0,
    w,w^2,0,w,w,w,w,0,w^2,1,w,0,1,1,1,1,0,w,w^2,1,0,w^2,w^2,w^2,w^2,0,1,0,0,0,0,0,0,
    w^2,0,w,w^2,w^2,1,1,0,1,w,0,1,w,w,w^2,w^2,0,w^2,1,0,w^2,1,1,w,w,0,w,0,0,0,0,0,0,
    1,0,w,w^2,1,w,0,w,w,w^2,0,1,w,w^2,1,0,1,1,w,0,w^2,1,w,w^2,0,w^2,w^2,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w^2,1,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w^2,w^2,w,
    1,w^2,0,w,0,w,w,1,w,w,1,0,w^2,0,w^2,w^2,w,w^2,w^2,w,0,1,0,1,1,w^2,1,w,0,w^2,0,1,0,
    0,w^2,0,w^2,0,0,1,w,w^2,0,1,0,1,0,0,w,w^2,1,0,w,0,w,0,0,w^2,1,w,0,1,0,w,0,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=27 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [27+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[239]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 13;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[239]:=[33,8,11,15];
Table3DistanceTypes[239]:="exact";

// Table 3, No. 240 | Q50_012
// [[33,8,14;19]]_2, distance exact.
Gsrc1:=Matrix(F,11,30,[
    1,w^2,w^2,w,0,w,1,w^2,0,w,w^2,w,w,1,0,1,w^2,w,0,1,w,1,1,w^2,0,w^2,w,1,0,w^2,
    1,0,0,1,0,w^2,w^2,w,w^2,w^2,1,0,0,1,0,w^2,w^2,w,w^2,w^2,1,0,0,1,0,w^2,w^2,w,w^2,w^2,
    1,0,0,1,w^2,0,0,0,1,1,1,0,0,1,w^2,0,0,0,1,1,1,0,0,1,w^2,0,0,0,1,1,
    1,w^2,1,w^2,1,w,w^2,0,w^2,w^2,1,w^2,1,w^2,1,w,w^2,0,w^2,w^2,1,w^2,1,w^2,1,w,w^2,0,w^2,w^2,
    1,0,0,1,w^2,w^2,w,w,0,w,w^2,0,0,w^2,w,w,1,1,0,1,w,0,0,w,1,1,w^2,w^2,0,w^2,
    1,w,0,w,0,0,w^2,1,w^2,w^2,w^2,1,0,1,0,0,w,w^2,w,w,w,w^2,0,w^2,0,0,1,w,1,1,
    0,0,1,0,w,0,w^2,w,w,0,0,0,w,0,w^2,0,1,w^2,w^2,0,0,0,w^2,0,1,0,w,1,1,0,
    1,0,0,w,w,0,w,0,w^2,0,w,0,0,w^2,w^2,0,w^2,0,1,0,w^2,0,0,1,1,0,1,0,w,0,
    0,1,w,1,1,w^2,w^2,1,1,w,0,w,w^2,w,w,1,1,w,w,w^2,0,w^2,1,w^2,w^2,w,w,w^2,w^2,1,
    1,w^2,w^2,1,w^2,0,0,w^2,0,1,1,w^2,w^2,1,w^2,0,0,w^2,0,1,1,w^2,w^2,1,w^2,0,0,w^2,0,1,
    1,w^2,0,w,w,w^2,0,1,w^2,0,w,1,0,w^2,w^2,1,0,w,1,0,w^2,w,0,1,1,w,0,w^2,w,0
]);
Gsrc2:=Matrix(F,2,3,[
    1,1,1,
    1,w,w^2
]);
W1:=Matrix(F,2,30,[
    1,w^2,w^2,1,w^2,0,0,w^2,0,1,1,w^2,w^2,1,w^2,0,0,w^2,0,1,1,w^2,w^2,1,w^2,0,0,w^2,0,1,
    1,w^2,0,w,w,w^2,0,1,w^2,0,w,1,0,w^2,w^2,1,0,w,1,0,w^2,w,0,1,1,w,0,w^2,w,0
]);
W2:=Matrix(F,2,3,[
    1,1,1,
    1,w,w^2
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 30 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,11,33,[
    1,w^2,w^2,w,0,w,1,w^2,0,w,w^2,w,w,1,0,1,w^2,w,0,1,w,1,1,w^2,0,w^2,w,1,0,w^2,0,0,0,
    1,0,0,1,0,w^2,w^2,w,w^2,w^2,1,0,0,1,0,w^2,w^2,w,w^2,w^2,1,0,0,1,0,w^2,w^2,w,w^2,w^2,0,0,0,
    1,0,0,1,w^2,0,0,0,1,1,1,0,0,1,w^2,0,0,0,1,1,1,0,0,1,w^2,0,0,0,1,1,0,0,0,
    1,w^2,1,w^2,1,w,w^2,0,w^2,w^2,1,w^2,1,w^2,1,w,w^2,0,w^2,w^2,1,w^2,1,w^2,1,w,w^2,0,w^2,w^2,0,0,0,
    1,0,0,1,w^2,w^2,w,w,0,w,w^2,0,0,w^2,w,w,1,1,0,1,w,0,0,w,1,1,w^2,w^2,0,w^2,0,0,0,
    1,w,0,w,0,0,w^2,1,w^2,w^2,w^2,1,0,1,0,0,w,w^2,w,w,w,w^2,0,w^2,0,0,1,w,1,1,0,0,0,
    0,0,1,0,w,0,w^2,w,w,0,0,0,w,0,w^2,0,1,w^2,w^2,0,0,0,w^2,0,1,0,w,1,1,0,0,0,0,
    1,0,0,w,w,0,w,0,w^2,0,w,0,0,w^2,w^2,0,w^2,0,1,0,w^2,0,0,1,1,0,1,0,w,0,0,0,0,
    0,1,w,1,1,w^2,w^2,1,1,w,0,w,w^2,w,w,1,1,w,w,w^2,0,w^2,1,w^2,w^2,w,w,w^2,w^2,1,0,0,0,
    1,w^2,w^2,1,w^2,0,0,w^2,0,1,1,w^2,w^2,1,w^2,0,0,w^2,0,1,1,w^2,w^2,1,w^2,0,0,w^2,0,1,1,1,1,
    1,w^2,0,w,w,w^2,0,1,w^2,0,w,1,0,w^2,w^2,1,0,w,1,0,w^2,w,0,1,1,w,0,w^2,w,0,1,w,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=30 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [30+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[240]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 11;
assert Dimension(HermitianHull(Q)) eq 3;
Table3Parameters[240]:=[33,8,14,19];
Table3DistanceTypes[240]:="exact";

// Table 3, No. 241 | Q50_013
// [[33,10,11;15]]_2, distance exact.
Gsrc1:=Matrix(F,14,30,[
    1,0,1,0,1,1,w^2,1,1,w^2,1,0,1,0,1,1,w^2,1,1,w^2,1,0,1,0,1,1,w^2,1,1,w^2,
    0,0,1,0,w,w^2,1,0,w,w^2,0,0,w^2,0,1,w,w^2,0,1,w,0,0,w,0,w^2,1,w,0,w^2,1,
    1,w^2,w^2,w,1,0,w,1,w,w,1,w^2,w^2,w,1,0,w,1,w,w,1,w^2,w^2,w,1,0,w,1,w,w,
    1,w,1,w,w,0,w,1,w^2,w,1,w,1,w,w,0,w,1,w^2,w,1,w,1,w,w,0,w,1,w^2,w,
    0,w,w,w,1,0,w^2,0,1,w,0,w,w,w,1,0,w^2,0,1,w,0,w,w,w,1,0,w^2,0,1,w,
    1,1,w,w^2,w,0,1,w,w^2,1,1,1,w,w^2,w,0,1,w,w^2,1,1,1,w,w^2,w,0,1,w,w^2,1,
    w,w^2,0,w,0,w^2,0,1,1,1,1,w,0,1,0,w,0,w^2,w^2,w^2,w^2,1,0,w^2,0,1,0,w,w,w,
    w,1,0,0,w^2,w,1,0,0,0,1,w^2,0,0,w,1,w^2,0,0,0,w^2,w,0,0,1,w^2,w,0,0,0,
    w^2,w,0,w^2,w,w^2,0,w^2,1,0,1,w^2,0,1,w^2,1,0,1,w,0,w,1,0,w,1,w,0,w,w^2,0,
    w^2,w^2,w,w,0,1,w,w^2,w^2,w,1,1,w^2,w^2,0,w,w^2,1,1,w^2,w,w,1,1,0,w^2,1,w,w,1,
    w^2,w^2,w^2,1,w,w^2,0,1,w^2,w,1,1,1,w,w^2,1,0,w,1,w^2,w,w,w,w^2,1,w,0,w^2,w,1,
    w,w,w^2,w,1,w,0,w^2,0,0,w^2,w^2,1,w^2,w,w^2,0,1,0,0,1,1,w,1,w^2,1,0,w,0,0,
    w,w^2,w,w^2,w,0,w,w^2,1,w,w,w^2,w,w^2,w,0,w,w^2,1,w,w,w^2,w,w^2,w,0,w,w^2,1,w,
    w,w^2,0,0,w,0,1,w^2,1,w,1,w,0,0,1,0,w^2,w,w^2,1,w^2,1,0,0,w^2,0,w,1,w,w^2
]);
Gsrc2:=Matrix(F,2,3,[
    1,1,1,
    1,w^2,w
]);
W1:=Matrix(F,2,30,[
    w,w^2,w,w^2,w,0,w,w^2,1,w,w,w^2,w,w^2,w,0,w,w^2,1,w,w,w^2,w,w^2,w,0,w,w^2,1,w,
    w,w^2,0,0,w,0,1,w^2,1,w,1,w,0,0,1,0,w^2,w,w^2,1,w^2,1,0,0,w^2,0,w,1,w,w^2
]);
W2:=Matrix(F,2,3,[
    1,1,1,
    1,w^2,w
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 30 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,14,33,[
    1,0,1,0,1,1,w^2,1,1,w^2,1,0,1,0,1,1,w^2,1,1,w^2,1,0,1,0,1,1,w^2,1,1,w^2,0,0,0,
    0,0,1,0,w,w^2,1,0,w,w^2,0,0,w^2,0,1,w,w^2,0,1,w,0,0,w,0,w^2,1,w,0,w^2,1,0,0,0,
    1,w^2,w^2,w,1,0,w,1,w,w,1,w^2,w^2,w,1,0,w,1,w,w,1,w^2,w^2,w,1,0,w,1,w,w,0,0,0,
    1,w,1,w,w,0,w,1,w^2,w,1,w,1,w,w,0,w,1,w^2,w,1,w,1,w,w,0,w,1,w^2,w,0,0,0,
    0,w,w,w,1,0,w^2,0,1,w,0,w,w,w,1,0,w^2,0,1,w,0,w,w,w,1,0,w^2,0,1,w,0,0,0,
    1,1,w,w^2,w,0,1,w,w^2,1,1,1,w,w^2,w,0,1,w,w^2,1,1,1,w,w^2,w,0,1,w,w^2,1,0,0,0,
    w,w^2,0,w,0,w^2,0,1,1,1,1,w,0,1,0,w,0,w^2,w^2,w^2,w^2,1,0,w^2,0,1,0,w,w,w,0,0,0,
    w,1,0,0,w^2,w,1,0,0,0,1,w^2,0,0,w,1,w^2,0,0,0,w^2,w,0,0,1,w^2,w,0,0,0,0,0,0,
    w^2,w,0,w^2,w,w^2,0,w^2,1,0,1,w^2,0,1,w^2,1,0,1,w,0,w,1,0,w,1,w,0,w,w^2,0,0,0,0,
    w^2,w^2,w,w,0,1,w,w^2,w^2,w,1,1,w^2,w^2,0,w,w^2,1,1,w^2,w,w,1,1,0,w^2,1,w,w,1,0,0,0,
    w^2,w^2,w^2,1,w,w^2,0,1,w^2,w,1,1,1,w,w^2,1,0,w,1,w^2,w,w,w,w^2,1,w,0,w^2,w,1,0,0,0,
    w,w,w^2,w,1,w,0,w^2,0,0,w^2,w^2,1,w^2,w,w^2,0,1,0,0,1,1,w,1,w^2,1,0,w,0,0,0,0,0,
    w,w^2,w,w^2,w,0,w,w^2,1,w,w,w^2,w,w^2,w,0,w,w^2,1,w,w,w^2,w,w^2,w,0,w,w^2,1,w,1,1,1,
    w,w^2,0,0,w,0,1,w^2,1,w,1,w,0,0,1,0,w^2,w,w^2,1,w^2,1,0,0,w^2,0,w,1,w,w^2,1,w^2,w
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=30 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [30+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[241]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 14;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[241]:=[33,10,11,15];
Table3DistanceTypes[241]:="exact";

// Table 3, No. 242 | Q50_014
// [[36,1,15;15]]_2, distance exact.
Gsrc1:=Matrix(F,11,27,[
    0,1,w,0,1,w^2,0,1,w^2,0,1,w,0,1,w^2,0,1,w^2,0,1,w,0,1,w^2,0,1,w^2,
    1,0,1,w,0,1,w^2,w^2,0,w^2,0,w^2,1,0,w^2,w,w,0,w,0,w,w^2,0,w,1,1,0,
    0,1,w^2,w^2,w,1,w,w,w,0,w^2,w,w,1,w^2,1,1,1,0,w,1,1,w^2,w,w^2,w^2,w^2,
    1,w,1,w,w,1,0,w^2,w,w,w^2,w,w^2,w^2,w,0,1,w^2,w^2,1,w^2,1,1,w^2,0,w,1,
    w,0,0,0,0,w^2,w^2,w,w,w,0,0,0,0,w^2,w^2,w,w,w,0,0,0,0,w^2,w^2,w,w,
    1,w^2,0,0,w^2,w^2,w,w^2,1,1,w^2,0,0,w^2,w^2,w,w^2,1,1,w^2,0,0,w^2,w^2,w,w^2,1,
    w,w^2,0,1,1,0,w,1,w,w,w^2,0,1,1,0,w,1,w,w,w^2,0,1,1,0,w,1,w,
    w,0,0,w,1,1,w^2,w,w^2,1,0,0,1,w^2,w^2,w,1,w,w^2,0,0,w^2,w,w,1,w^2,1,
    w,1,1,0,0,1,w,1,1,w^2,w,w,0,0,w,w^2,w,w,1,w^2,w^2,0,0,w^2,1,w^2,w^2,
    w^2,1,1,0,w,0,w^2,0,0,1,w,w,0,w^2,0,1,0,0,w,w^2,w^2,0,1,0,w,0,0,
    w^2,1,w,0,0,w,1,0,0,1,w,w^2,0,0,w^2,w,0,0,w,w^2,1,0,0,1,w^2,0,0
]);
Gsrc2:=Matrix(F,6,9,[
    1,w^2,w^2,1,w^2,w^2,1,w^2,w^2,
    w,w^2,w,w,w^2,w,w,w^2,w,
    w^2,1,w^2,w,w^2,w,1,w,1,
    1,1,w,w,w,w^2,w^2,w^2,1,
    w,w^2,w,w^2,1,w^2,1,w,1,
    1,w^2,w^2,w,1,1,w^2,w,w
]);
W1:=Matrix(F,6,27,[
    1,w^2,0,0,w^2,w^2,w,w^2,1,1,w^2,0,0,w^2,w^2,w,w^2,1,1,w^2,0,0,w^2,w^2,w,w^2,1,
    w,w^2,0,1,1,0,w,1,w,w,w^2,0,1,1,0,w,1,w,w,w^2,0,1,1,0,w,1,w,
    w,0,0,w,1,1,w^2,w,w^2,1,0,0,1,w^2,w^2,w,1,w,w^2,0,0,w^2,w,w,1,w^2,1,
    w,1,1,0,0,1,w,1,1,w^2,w,w,0,0,w,w^2,w,w,1,w^2,w^2,0,0,w^2,1,w^2,w^2,
    w^2,1,1,0,w,0,w^2,0,0,1,w,w,0,w^2,0,1,0,0,w,w^2,w^2,0,1,0,w,0,0,
    w^2,1,w,0,0,w,1,0,0,1,w,w^2,0,0,w^2,w,0,0,w,w^2,1,0,0,1,w^2,0,0
]);
W2:=Matrix(F,6,9,[
    1,w^2,w^2,1,w^2,w^2,1,w^2,w^2,
    w,w^2,w,w,w^2,w,w,w^2,w,
    w^2,1,w^2,w,w^2,w,1,w,1,
    1,1,w,w,w,w^2,w^2,w^2,1,
    w,w^2,w,w^2,1,w^2,1,w,1,
    1,w^2,w^2,w,1,1,w^2,w,w
]);
lambda:=6;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 27 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 9;
GX4:=Matrix(F,11,36,[
    0,1,w,0,1,w^2,0,1,w^2,0,1,w,0,1,w^2,0,1,w^2,0,1,w,0,1,w^2,0,1,w^2,0,0,0,0,0,0,0,0,0,
    1,0,1,w,0,1,w^2,w^2,0,w^2,0,w^2,1,0,w^2,w,w,0,w,0,w,w^2,0,w,1,1,0,0,0,0,0,0,0,0,0,0,
    0,1,w^2,w^2,w,1,w,w,w,0,w^2,w,w,1,w^2,1,1,1,0,w,1,1,w^2,w,w^2,w^2,w^2,0,0,0,0,0,0,0,0,0,
    1,w,1,w,w,1,0,w^2,w,w,w^2,w,w^2,w^2,w,0,1,w^2,w^2,1,w^2,1,1,w^2,0,w,1,0,0,0,0,0,0,0,0,0,
    w,0,0,0,0,w^2,w^2,w,w,w,0,0,0,0,w^2,w^2,w,w,w,0,0,0,0,w^2,w^2,w,w,0,0,0,0,0,0,0,0,0,
    1,w^2,0,0,w^2,w^2,w,w^2,1,1,w^2,0,0,w^2,w^2,w,w^2,1,1,w^2,0,0,w^2,w^2,w,w^2,1,1,w^2,w^2,1,w^2,w^2,1,w^2,w^2,
    w,w^2,0,1,1,0,w,1,w,w,w^2,0,1,1,0,w,1,w,w,w^2,0,1,1,0,w,1,w,w,w^2,w,w,w^2,w,w,w^2,w,
    w,0,0,w,1,1,w^2,w,w^2,1,0,0,1,w^2,w^2,w,1,w,w^2,0,0,w^2,w,w,1,w^2,1,w^2,1,w^2,w,w^2,w,1,w,1,
    w,1,1,0,0,1,w,1,1,w^2,w,w,0,0,w,w^2,w,w,1,w^2,w^2,0,0,w^2,1,w^2,w^2,1,1,w,w,w,w^2,w^2,w^2,1,
    w^2,1,1,0,w,0,w^2,0,0,1,w,w,0,w^2,0,1,0,0,w,w^2,w^2,0,1,0,w,0,0,w,w^2,w,w^2,1,w^2,1,w,1,
    w^2,1,w,0,0,w,1,0,0,1,w,w^2,0,0,w^2,w,0,0,w,w^2,1,0,0,1,w^2,0,0,1,w^2,w^2,w,1,1,w^2,w,w
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=27 div 3;ell2:=9 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [27+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[242]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 36 and Dimension(Q) eq 11;
assert Dimension(HermitianHull(Q)) eq 10;
Table3Parameters[242]:=[36,1,15,15];
Table3DistanceTypes[242]:="exact";

// Table 3, No. 243 | GQ07
// [[36,4,17;22]]_2, distance exact.
Gsrc1:=Matrix(F,9,33,[
    1,0,0,0,0,0,0,0,0,0,w^2,0,0,1,w,1,w,1,w,w^2,w^2,1,w,1,w^2,w^2,0,w,1,1,1,0,0,
    0,1,0,0,0,0,0,0,0,1,w,w,w^2,0,0,w,1,0,0,w^2,w,1,1,0,1,w^2,w^2,0,w^2,w^2,w,0,w,
    0,0,1,0,0,0,0,0,0,w^2,w,0,0,w,w^2,w^2,w,1,1,0,w^2,0,1,w^2,0,w,w,w^2,1,w,0,w,w^2,
    0,0,0,1,0,0,0,0,0,w,1,1,1,w,1,1,w^2,1,w^2,0,1,1,w^2,0,w,w,0,w,0,0,w,w^2,1,
    0,0,0,0,1,0,0,0,0,0,w^2,w^2,1,w,w,w^2,1,0,w,1,w,w^2,1,1,0,w^2,1,0,w^2,0,w^2,0,w,
    0,0,0,0,0,1,0,0,0,w,w,1,w,w^2,1,w^2,w,0,0,0,1,1,w,0,w,w,w,w,w^2,w^2,1,0,w,
    0,0,0,0,0,0,1,0,0,1,w,w^2,1,w,w,0,0,1,w,w^2,w^2,0,1,0,w,0,1,1,1,1,1,w,w^2,
    0,0,0,0,0,0,0,1,0,1,w^2,1,1,0,1,w^2,w,1,1,0,0,0,1,w,1,w^2,w,w,0,w^2,0,0,1,
    0,0,0,0,0,0,0,0,1,1,w^2,0,w^2,1,w^2,w^2,0,w,1,1,w^2,1,0,w,0,0,w^2,w,w^2,1,1,w,w^2
]);
Gsrc2:=Matrix(F,2,3,[
    1,0,w^2,
    0,1,w
]);
W1:=Matrix(F,2,33,[
    1,0,w,w^2,w,w^2,0,0,w^2,w,1,1,w,1,w,w,0,1,w,w,w^2,w^2,1,w^2,w^2,1,w,w,w,w^2,1,0,w,
    1,w^2,w^2,1,w,w,w,w^2,1,0,w,1,0,w,w^2,w,w^2,0,0,w^2,w,1,1,w,1,w,w,0,1,w,w,w^2,w^2
]);
W2:=Matrix(F,2,3,[
    0,w,w^2,
    w^2,0,w
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 33 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,9,36,[
    1,0,0,0,0,0,0,0,1,1,0,0,w^2,0,1,w,w,w^2,w^2,w,0,0,w,w^2,w^2,w^2,w^2,0,w,0,0,w,w^2,0,0,0,
    0,1,0,0,0,0,0,0,w,w^2,w^2,w,w,w,1,w^2,1,w^2,w,1,w^2,w^2,1,w^2,1,w^2,w,w^2,w,1,0,w^2,w^2,0,0,0,
    0,0,1,0,0,0,w,0,1,0,w,1,1,0,w^2,0,w,1,w^2,0,1,1,w^2,1,w^2,w,w^2,w^2,0,1,w^2,w^2,1,0,0,0,
    0,0,0,1,0,0,w^2,0,0,1,0,w^2,w,w^2,0,1,w^2,w,w,w,w^2,1,0,0,w^2,w,w^2,1,w^2,w^2,1,w,w^2,0,0,0,
    0,0,0,0,1,0,w,0,0,w,0,w,w^2,1,1,w^2,1,w,1,0,w^2,w^2,w^2,1,w^2,w^2,w^2,w,1,w,1,w^2,w^2,0,0,0,
    0,0,0,0,0,1,w,0,w,w,0,0,1,w,w^2,w,w,1,1,w^2,1,w^2,0,w^2,1,w,1,w^2,0,w^2,1,0,w,0,0,0,
    0,0,0,0,0,0,0,1,0,1,w^2,1,1,0,1,w^2,w,1,1,0,0,0,1,w,1,w^2,w,w,0,w^2,0,0,1,0,0,0,
    1,0,w,w^2,w,w^2,0,0,w^2,w,1,1,w,1,w,w,0,1,w,w,w^2,w^2,1,w^2,w^2,1,w,w,w,w^2,1,0,w,0,w,w^2,
    1,w^2,w^2,1,w,w,w,w^2,1,0,w,1,0,w,w^2,w,w^2,0,0,w^2,w,1,1,w,1,w,w,0,1,w,w,w^2,w^2,w^2,0,w
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=33 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [33+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[243]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 36 and Dimension(Q) eq 9;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[243]:=[36,4,17,22];
Table3DistanceTypes[243]:="exact";

// Table 3, No. 244 | QB_36_6_13_14
// [[36,6,13;14]]_2, distance exact.
Gsrc1:=Matrix(F,12,30,[
    1,1,1,0,1,w,w,0,w,w^2,1,1,1,0,1,w,w,0,w,w^2,1,1,1,0,1,w,w,0,w,w^2,
    0,0,0,1,0,w^2,w^2,1,w,w^2,0,0,0,1,0,w^2,w^2,1,w,w^2,0,0,0,1,0,w^2,w^2,1,w,w^2,
    1,1,0,w^2,w,0,1,1,0,0,w^2,w^2,0,w,1,0,w^2,w^2,0,0,w,w,0,1,w^2,0,w,w,0,0,
    1,w,w^2,1,1,w,w^2,1,0,0,w,w^2,1,w,w,w^2,1,w,0,0,w^2,1,w,w^2,w^2,1,w,w^2,0,0,
    1,w^2,0,0,w^2,w^2,w^2,1,0,w^2,1,w^2,0,0,w^2,w^2,w^2,1,0,w^2,1,w^2,0,0,w^2,w^2,w^2,1,0,w^2,
    w,w^2,0,0,0,w^2,1,w^2,1,w,w,w^2,0,0,0,w^2,1,w^2,1,w,w,w^2,0,0,0,w^2,1,w^2,1,w,
    w,w^2,w,0,0,0,w,w^2,w^2,w,1,w,1,0,0,0,1,w,w,1,w^2,1,w^2,0,0,0,w^2,1,1,w^2,
    1,1,1,0,w,1,w^2,0,1,0,w,w,w,0,w^2,w,1,0,w,0,w^2,w^2,w^2,0,1,w^2,w,0,w^2,0,
    1,w^2,w,0,1,0,w,w,0,1,w,1,w^2,0,w,0,w^2,w^2,0,w,w^2,w,1,0,w^2,0,1,1,0,w^2,
    w^2,w,0,0,w,0,w,w^2,w^2,1,1,w^2,0,0,w^2,0,w^2,1,1,w,w,1,0,0,1,0,1,w,w,w^2,
    1,1,w,0,w^2,0,w,0,1,1,w^2,w^2,1,0,w,0,1,0,w^2,w^2,w,w,w^2,0,1,0,w^2,0,w,w,
    0,w,w^2,0,0,w^2,1,w^2,1,w,0,1,w,0,0,w,w^2,w,w^2,1,0,w^2,1,0,0,1,w,1,w,w^2
]);
Gsrc2:=Matrix(F,4,6,[
    w^2,w,w^2,w,w^2,w,
    w,1,w^2,w,1,w^2,
    0,1,0,w^2,0,w,
    1,0,w^2,0,w,0
]);
W1:=Matrix(F,2,30,[
    1,1,w,0,w^2,0,w,0,1,1,w^2,w^2,1,0,w,0,1,0,w^2,w^2,w,w,w^2,0,1,0,w^2,0,w,w,
    0,w,w^2,0,0,w^2,1,w^2,1,w,0,1,w,0,0,w,w^2,w,w^2,1,0,w^2,1,0,0,1,w,1,w,w^2
]);
W2:=Matrix(F,2,6,[
    0,1,0,w^2,0,w,
    1,0,w^2,0,w,0
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 30 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,14,36,[
    1,1,1,0,1,w,w,0,w,w^2,1,1,1,0,1,w,w,0,w,w^2,1,1,1,0,1,w,w,0,w,w^2,0,0,0,0,0,0,
    0,0,0,1,0,w^2,w^2,1,w,w^2,0,0,0,1,0,w^2,w^2,1,w,w^2,0,0,0,1,0,w^2,w^2,1,w,w^2,0,0,0,0,0,0,
    1,1,0,w^2,w,0,1,1,0,0,w^2,w^2,0,w,1,0,w^2,w^2,0,0,w,w,0,1,w^2,0,w,w,0,0,0,0,0,0,0,0,
    1,w,w^2,1,1,w,w^2,1,0,0,w,w^2,1,w,w,w^2,1,w,0,0,w^2,1,w,w^2,w^2,1,w,w^2,0,0,0,0,0,0,0,0,
    1,w^2,0,0,w^2,w^2,w^2,1,0,w^2,1,w^2,0,0,w^2,w^2,w^2,1,0,w^2,1,w^2,0,0,w^2,w^2,w^2,1,0,w^2,0,0,0,0,0,0,
    w,w^2,0,0,0,w^2,1,w^2,1,w,w,w^2,0,0,0,w^2,1,w^2,1,w,w,w^2,0,0,0,w^2,1,w^2,1,w,0,0,0,0,0,0,
    w,w^2,w,0,0,0,w,w^2,w^2,w,1,w,1,0,0,0,1,w,w,1,w^2,1,w^2,0,0,0,w^2,1,1,w^2,0,0,0,0,0,0,
    1,1,1,0,w,1,w^2,0,1,0,w,w,w,0,w^2,w,1,0,w,0,w^2,w^2,w^2,0,1,w^2,w,0,w^2,0,0,0,0,0,0,0,
    1,w^2,w,0,1,0,w,w,0,1,w,1,w^2,0,w,0,w^2,w^2,0,w,w^2,w,1,0,w^2,0,1,1,0,w^2,0,0,0,0,0,0,
    w^2,w,0,0,w,0,w,w^2,w^2,1,1,w^2,0,0,w^2,0,w^2,1,1,w,w,1,0,0,1,0,1,w,w,w^2,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,w,w^2,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,w,1,w^2,
    1,1,w,0,w^2,0,w,0,1,1,w^2,w^2,1,0,w,0,1,0,w^2,w^2,w,w,w^2,0,1,0,w^2,0,w,w,0,1,0,w^2,0,w,
    0,w,w^2,0,0,w^2,1,w^2,1,w,0,1,w,0,0,w,w^2,w,w^2,1,0,w^2,1,0,0,1,w,1,w,w^2,1,0,w^2,0,w,0
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=30 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [30+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[244]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 36 and Dimension(Q) eq 14;
assert Dimension(HermitianHull(Q)) eq 8;
Table3Parameters[244]:=[36,6,13,14];
Table3DistanceTypes[244]:="exact";

// Table 3, No. 245 | QD_36_6_17_22
// [[36,6,17;22]]_2, distance exact.
Gsrc1:=Matrix(F,8,30,[
    1,1,1,0,1,0,w,1,1,0,1,1,1,0,1,0,w,1,1,0,1,1,1,0,1,0,w,1,1,0,
    0,w^2,0,w^2,w^2,1,1,w^2,0,w^2,0,w^2,0,w^2,w^2,1,1,w^2,0,w^2,0,w^2,0,w^2,w^2,1,1,w^2,0,w^2,
    w^2,1,w^2,w^2,w,1,1,1,w^2,0,w,w^2,w,w,1,w^2,w^2,w^2,w,0,1,w,1,1,w^2,w,w,w,1,0,
    1,w,w^2,1,w,0,w,w,w,w,w,w^2,1,w,w^2,0,w^2,w^2,w^2,w^2,w^2,1,w,w^2,1,0,1,1,1,1,
    1,1,w^2,0,1,w,0,w^2,0,w^2,w,w,1,0,w,w^2,0,1,0,1,w^2,w^2,w,0,w^2,1,0,w,0,w,
    w,w^2,w,w,0,0,1,1,w,0,w^2,1,w^2,w^2,0,0,w,w,w^2,0,1,w,1,1,0,0,w^2,w^2,1,0,
    w,w^2,1,w^2,w^2,w,w,1,0,1,1,w,w^2,w,w,1,1,w^2,0,w^2,w^2,1,w,1,1,w^2,w^2,w,0,w,
    1,1,w,1,w^2,w,w^2,0,w^2,w^2,w^2,w^2,1,w^2,w,1,w,0,w,w,w,w,w^2,w,1,w^2,1,0,1,1
]);
Gsrc2:=Matrix(F,4,6,[
    w^2,w,w^2,w,w^2,w,
    w,1,w^2,w,1,w^2,
    0,1,0,w^2,0,w,
    1,0,w^2,0,w,0
]);
W1:=Matrix(F,2,30,[
    w,w^2,1,w^2,w^2,w,w,1,0,1,1,w,w^2,w,w,1,1,w^2,0,w^2,w^2,1,w,1,1,w^2,w^2,w,0,w,
    1,1,w,1,w^2,w,w^2,0,w^2,w^2,w^2,w^2,1,w^2,w,1,w,0,w,w,w,w,w^2,w,1,w^2,1,0,1,1
]);
W2:=Matrix(F,2,6,[
    0,1,0,w^2,0,w,
    1,0,w^2,0,w,0
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 30 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,10,36,[
    1,1,1,0,1,0,w,1,1,0,1,1,1,0,1,0,w,1,1,0,1,1,1,0,1,0,w,1,1,0,0,0,0,0,0,0,
    0,w^2,0,w^2,w^2,1,1,w^2,0,w^2,0,w^2,0,w^2,w^2,1,1,w^2,0,w^2,0,w^2,0,w^2,w^2,1,1,w^2,0,w^2,0,0,0,0,0,0,
    w^2,1,w^2,w^2,w,1,1,1,w^2,0,w,w^2,w,w,1,w^2,w^2,w^2,w,0,1,w,1,1,w^2,w,w,w,1,0,0,0,0,0,0,0,
    1,w,w^2,1,w,0,w,w,w,w,w,w^2,1,w,w^2,0,w^2,w^2,w^2,w^2,w^2,1,w,w^2,1,0,1,1,1,1,0,0,0,0,0,0,
    1,1,w^2,0,1,w,0,w^2,0,w^2,w,w,1,0,w,w^2,0,1,0,1,w^2,w^2,w,0,w^2,1,0,w,0,w,0,0,0,0,0,0,
    w,w^2,w,w,0,0,1,1,w,0,w^2,1,w^2,w^2,0,0,w,w,w^2,0,1,w,1,1,0,0,w^2,w^2,1,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,w,w^2,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,w,1,w^2,
    w,w^2,1,w^2,w^2,w,w,1,0,1,1,w,w^2,w,w,1,1,w^2,0,w^2,w^2,1,w,1,1,w^2,w^2,w,0,w,0,1,0,w^2,0,w,
    1,1,w,1,w^2,w,w^2,0,w^2,w^2,w^2,w^2,1,w^2,w,1,w,0,w,w,w,w,w^2,w,1,w^2,1,0,1,1,1,0,w^2,0,w,0
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=30 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [30+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[245]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 36 and Dimension(Q) eq 10;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[245]:=[36,6,17,22];
Table3DistanceTypes[245]:="exact";

// Table 3, No. 246 | Q50_016
// [[36,8,14;20]]_2, distance exact.
Gsrc1:=Matrix(F,12,33,[
    1,0,1,w,w^2,w,w^2,w,1,1,w^2,w,0,w,w^2,1,w^2,1,w^2,w,w,1,w^2,0,w^2,1,w,1,w,1,w^2,w^2,w,
    0,1,w,w^2,w,w^2,w^2,1,1,w^2,w^2,0,w,w^2,1,w^2,1,1,w,w,1,1,0,w^2,1,w,1,w,w,w^2,w^2,w,w,
    w,w^2,1,0,1,1,0,w,w^2,w,w^2,w,w^2,1,0,1,1,0,w,w^2,w,w^2,w,w^2,1,0,1,1,0,w,w^2,w,w^2,
    w^2,w^2,w,w^2,0,0,w,w,w,w^2,w^2,w^2,w^2,w,w^2,0,0,w,w,w,w^2,w^2,w^2,w^2,w,w^2,0,0,w,w,w,w^2,w^2,
    1,1,w,w^2,0,w^2,0,w^2,w^2,w^2,w^2,1,1,w,w^2,0,w^2,0,w^2,w^2,w^2,w^2,1,1,w,w^2,0,w^2,0,w^2,w^2,w^2,w^2,
    w,w,w,1,w^2,w,1,w^2,w^2,w,w,w,w,w,1,w^2,w,1,w^2,w^2,w,w,w,w,w,1,w^2,w,1,w^2,w^2,w,w,
    1,0,1,1,1,1,w^2,0,1,0,0,w^2,0,w^2,w^2,w^2,w^2,w,0,w^2,0,0,w,0,w,w,w,w,1,0,w,0,0,
    0,w,1,w,1,w^2,w^2,1,0,1,1,0,1,w^2,1,w^2,w,w,w^2,0,w^2,w^2,0,w^2,w,w^2,w,1,1,w,0,w,w,
    w^2,1,w^2,w^2,w,1,w^2,w,1,w^2,w,w,w^2,w,w,1,w^2,w,1,w^2,w,1,1,w,1,1,w^2,w,1,w^2,w,1,w^2,
    0,w,0,w,0,1,w^2,w,1,w^2,0,0,w^2,0,w^2,0,w,1,w^2,w,1,0,0,1,0,1,0,w^2,w,1,w^2,w,0,
    1,1,w,w,0,w,w,1,0,w,w^2,w^2,w^2,1,1,0,1,1,w^2,0,1,w,w,w,w^2,w^2,0,w^2,w^2,w,0,w^2,1,
    w,w^2,0,w,0,w^2,w^2,w^2,0,w,0,w^2,1,0,w^2,0,1,1,1,0,w^2,0,1,w,0,1,0,w,w,w,0,1,0
]);
Gsrc2:=Matrix(F,2,3,[
    1,w^2,w,
    1,w,w^2
]);
W1:=Matrix(F,2,33,[
    1,1,w,w,0,w,w,1,0,w,w^2,w^2,w^2,1,1,0,1,1,w^2,0,1,w,w,w,w^2,w^2,0,w^2,w^2,w,0,w^2,1,
    w,w^2,0,w,0,w^2,w^2,w^2,0,w,0,w^2,1,0,w^2,0,1,1,1,0,w^2,0,1,w,0,1,0,w,w,w,0,1,0
]);
W2:=Matrix(F,2,3,[
    1,w^2,w,
    1,w,w^2
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 33 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,12,36,[
    1,0,1,w,w^2,w,w^2,w,1,1,w^2,w,0,w,w^2,1,w^2,1,w^2,w,w,1,w^2,0,w^2,1,w,1,w,1,w^2,w^2,w,0,0,0,
    0,1,w,w^2,w,w^2,w^2,1,1,w^2,w^2,0,w,w^2,1,w^2,1,1,w,w,1,1,0,w^2,1,w,1,w,w,w^2,w^2,w,w,0,0,0,
    w,w^2,1,0,1,1,0,w,w^2,w,w^2,w,w^2,1,0,1,1,0,w,w^2,w,w^2,w,w^2,1,0,1,1,0,w,w^2,w,w^2,0,0,0,
    w^2,w^2,w,w^2,0,0,w,w,w,w^2,w^2,w^2,w^2,w,w^2,0,0,w,w,w,w^2,w^2,w^2,w^2,w,w^2,0,0,w,w,w,w^2,w^2,0,0,0,
    1,1,w,w^2,0,w^2,0,w^2,w^2,w^2,w^2,1,1,w,w^2,0,w^2,0,w^2,w^2,w^2,w^2,1,1,w,w^2,0,w^2,0,w^2,w^2,w^2,w^2,0,0,0,
    w,w,w,1,w^2,w,1,w^2,w^2,w,w,w,w,w,1,w^2,w,1,w^2,w^2,w,w,w,w,w,1,w^2,w,1,w^2,w^2,w,w,0,0,0,
    1,0,1,1,1,1,w^2,0,1,0,0,w^2,0,w^2,w^2,w^2,w^2,w,0,w^2,0,0,w,0,w,w,w,w,1,0,w,0,0,0,0,0,
    0,w,1,w,1,w^2,w^2,1,0,1,1,0,1,w^2,1,w^2,w,w,w^2,0,w^2,w^2,0,w^2,w,w^2,w,1,1,w,0,w,w,0,0,0,
    w^2,1,w^2,w^2,w,1,w^2,w,1,w^2,w,w,w^2,w,w,1,w^2,w,1,w^2,w,1,1,w,1,1,w^2,w,1,w^2,w,1,w^2,0,0,0,
    0,w,0,w,0,1,w^2,w,1,w^2,0,0,w^2,0,w^2,0,w,1,w^2,w,1,0,0,1,0,1,0,w^2,w,1,w^2,w,0,0,0,0,
    1,1,w,w,0,w,w,1,0,w,w^2,w^2,w^2,1,1,0,1,1,w^2,0,1,w,w,w,w^2,w^2,0,w^2,w^2,w,0,w^2,1,1,w^2,w,
    w,w^2,0,w,0,w^2,w^2,w^2,0,w,0,w^2,1,0,w^2,0,1,1,1,0,w^2,0,1,w,0,1,0,w,w,w,0,1,0,1,w,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=33 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [33+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[246]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 36 and Dimension(Q) eq 12;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[246]:=[36,8,14,20];
Table3DistanceTypes[246]:="exact";

// Table 3, No. 247 | QB_36_9_11_13
// [[36,9,11;13]]_2, distance exact.
Gsrc1:=Matrix(F,14,30,[
    1,1,w,1,1,w,1,0,0,1,1,1,w,1,1,w,1,0,0,1,1,1,w,1,1,w,1,0,0,1,
    1,0,w,0,w^2,w^2,w,0,w^2,0,w^2,0,1,0,w,w,1,0,w,0,w,0,w^2,0,1,1,w^2,0,1,0,
    0,1,w,w,w^2,0,w,w,w^2,w^2,0,w^2,1,1,w,0,1,1,w,w,0,w,w^2,w^2,1,0,w^2,w^2,1,1,
    w,w,1,w^2,w^2,0,w,w^2,w^2,1,w,w,1,w^2,w^2,0,w,w^2,w^2,1,w,w,1,w^2,w^2,0,w,w^2,w^2,1,
    0,w,w^2,1,w^2,0,w,1,1,0,0,w,w^2,1,w^2,0,w,1,1,0,0,w,w^2,1,w^2,0,w,1,1,0,
    0,w^2,w^2,w,w,0,1,w^2,w,0,0,w^2,w^2,w,w,0,1,w^2,w,0,0,w^2,w^2,w,w,0,1,w^2,w,0,
    w,0,w,w^2,w^2,0,w^2,w,1,0,w,0,w,w^2,w^2,0,w^2,w,1,0,w,0,w,w^2,w^2,0,w^2,w,1,0,
    w,w,w^2,w^2,w^2,0,w^2,1,1,1,w,w,w^2,w^2,w^2,0,w^2,1,1,1,w,w,w^2,w^2,w^2,0,w^2,1,1,1,
    w^2,0,0,0,1,w,1,w,w^2,w^2,w,0,0,0,w^2,1,w^2,1,w,w,1,0,0,0,w,w^2,w,w^2,1,1,
    1,w,0,0,0,w^2,1,1,w,w^2,w^2,1,0,0,0,w,w^2,w^2,1,w,w,w^2,0,0,0,1,w,w,w^2,1,
    w^2,1,0,w,w,1,w,w^2,w,1,1,w,0,w^2,w^2,w,w^2,1,w^2,w,w,w^2,0,1,1,w^2,1,w,1,w^2,
    1,w,w,1,0,0,w,0,1,1,w,w^2,w^2,w,0,0,w^2,0,w,w,w^2,1,1,w^2,0,0,1,0,w^2,w^2,
    0,1,1,0,1,w^2,w,0,w^2,w,0,w,w,0,w,1,w^2,0,1,w^2,0,w^2,w^2,0,w^2,w,1,0,w,1,
    1,0,w^2,w,0,0,w,w^2,w,w,w,0,1,w^2,0,0,w^2,1,w^2,w^2,w^2,0,w,1,0,0,1,w,1,1
]);
Gsrc2:=Matrix(F,4,6,[
    1,w^2,1,w^2,1,w^2,
    w,1,1,w^2,w^2,w,
    w,0,w^2,0,1,0,
    0,1,0,w,0,w^2
]);
W1:=Matrix(F,2,30,[
    0,1,1,0,1,w^2,w,0,w^2,w,0,w,w,0,w,1,w^2,0,1,w^2,0,w^2,w^2,0,w^2,w,1,0,w,1,
    1,0,w^2,w,0,0,w,w^2,w,w,w,0,1,w^2,0,0,w^2,1,w^2,w^2,w^2,0,w,1,0,0,1,w,1,1
]);
W2:=Matrix(F,2,6,[
    w,0,w^2,0,1,0,
    0,1,0,w,0,w^2
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 30 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,16,36,[
    1,1,w,1,1,w,1,0,0,1,1,1,w,1,1,w,1,0,0,1,1,1,w,1,1,w,1,0,0,1,0,0,0,0,0,0,
    1,0,w,0,w^2,w^2,w,0,w^2,0,w^2,0,1,0,w,w,1,0,w,0,w,0,w^2,0,1,1,w^2,0,1,0,0,0,0,0,0,0,
    0,1,w,w,w^2,0,w,w,w^2,w^2,0,w^2,1,1,w,0,1,1,w,w,0,w,w^2,w^2,1,0,w^2,w^2,1,1,0,0,0,0,0,0,
    w,w,1,w^2,w^2,0,w,w^2,w^2,1,w,w,1,w^2,w^2,0,w,w^2,w^2,1,w,w,1,w^2,w^2,0,w,w^2,w^2,1,0,0,0,0,0,0,
    0,w,w^2,1,w^2,0,w,1,1,0,0,w,w^2,1,w^2,0,w,1,1,0,0,w,w^2,1,w^2,0,w,1,1,0,0,0,0,0,0,0,
    0,w^2,w^2,w,w,0,1,w^2,w,0,0,w^2,w^2,w,w,0,1,w^2,w,0,0,w^2,w^2,w,w,0,1,w^2,w,0,0,0,0,0,0,0,
    w,0,w,w^2,w^2,0,w^2,w,1,0,w,0,w,w^2,w^2,0,w^2,w,1,0,w,0,w,w^2,w^2,0,w^2,w,1,0,0,0,0,0,0,0,
    w,w,w^2,w^2,w^2,0,w^2,1,1,1,w,w,w^2,w^2,w^2,0,w^2,1,1,1,w,w,w^2,w^2,w^2,0,w^2,1,1,1,0,0,0,0,0,0,
    w^2,0,0,0,1,w,1,w,w^2,w^2,w,0,0,0,w^2,1,w^2,1,w,w,1,0,0,0,w,w^2,w,w^2,1,1,0,0,0,0,0,0,
    1,w,0,0,0,w^2,1,1,w,w^2,w^2,1,0,0,0,w,w^2,w^2,1,w,w,w^2,0,0,0,1,w,w,w^2,1,0,0,0,0,0,0,
    w^2,1,0,w,w,1,w,w^2,w,1,1,w,0,w^2,w^2,w,w^2,1,w^2,w,w,w^2,0,1,1,w^2,1,w,1,w^2,0,0,0,0,0,0,
    1,w,w,1,0,0,w,0,1,1,w,w^2,w^2,w,0,0,w^2,0,w,w,w^2,1,1,w^2,0,0,1,0,w^2,w^2,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w^2,1,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w^2,w^2,w,
    0,1,1,0,1,w^2,w,0,w^2,w,0,w,w,0,w,1,w^2,0,1,w^2,0,w^2,w^2,0,w^2,w,1,0,w,1,w,0,w^2,0,1,0,
    1,0,w^2,w,0,0,w,w^2,w,w,w,0,1,w^2,0,0,w^2,1,w^2,w^2,w^2,0,w,1,0,0,1,w,1,1,0,1,0,w,0,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=30 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [30+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[247]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 36 and Dimension(Q) eq 16;
assert Dimension(HermitianHull(Q)) eq 7;
Table3Parameters[247]:=[36,9,11,13];
Table3DistanceTypes[247]:="exact";

// Table 3, No. 248 | QD_36_11_11_15
// [[36,11,11;15]]_2, distance exact.
Gsrc1:=Matrix(F,14,30,[
    1,w^2,0,1,w^2,w^2,w,0,w^2,w,1,w^2,0,1,w^2,w^2,w,0,w^2,w,1,w^2,0,1,w^2,w^2,w,0,w^2,w,
    w,w^2,1,w^2,w,0,1,w^2,w^2,w,w,w^2,1,w^2,w,0,1,w^2,w^2,w,w,w^2,1,w^2,w,0,1,w^2,w^2,w,
    1,0,1,w,w^2,0,w^2,0,0,0,1,0,1,w,w^2,0,w^2,0,0,0,1,0,1,w,w^2,0,w^2,0,0,0,
    w^2,1,w^2,1,w^2,0,1,0,0,w^2,w^2,1,w^2,1,w^2,0,1,0,0,w^2,w^2,1,w^2,1,w^2,0,1,0,0,w^2,
    w^2,w^2,1,w^2,1,0,1,w^2,0,0,w^2,w^2,1,w^2,1,0,1,w^2,0,0,w^2,w^2,1,w^2,1,0,1,w^2,0,0,
    1,1,1,1,w^2,0,1,w^2,0,0,1,1,1,1,w^2,0,1,w^2,0,0,1,1,1,1,w^2,0,1,w^2,0,0,
    0,w^2,0,w,0,0,1,w^2,w,0,0,w,0,1,0,0,w^2,w,1,0,0,1,0,w^2,0,0,w,1,w^2,0,
    0,1,w^2,w,0,0,w,0,w,0,0,w^2,w,1,0,0,1,0,1,0,0,w,1,w^2,0,0,w^2,0,w^2,0,
    1,0,1,0,1,w,1,0,w,1,w^2,0,w^2,0,w^2,1,w^2,0,1,w^2,w,0,w,0,w,w^2,w,0,w^2,w,
    1,w^2,0,1,w^2,w,0,1,0,w^2,w^2,w,0,w^2,w,1,0,w^2,0,w,w,1,0,w,1,w^2,0,w,0,1,
    1,1,0,w^2,w,1,w^2,0,1,0,w,w,0,1,w^2,w,1,0,w,0,w^2,w^2,0,w,1,w^2,w,0,w^2,0,
    w^2,w^2,w,1,w,1,0,w,w,w,1,1,w^2,w,w^2,w,0,w^2,w^2,w^2,w,w,1,w^2,1,w^2,0,1,1,1,
    w,w^2,0,w^2,1,w^2,0,w^2,0,1,w^2,1,0,1,w,1,0,1,0,w,1,w,0,w,w^2,w,0,w,0,w^2,
    w,w^2,w,1,1,w^2,0,w^2,w^2,w^2,w^2,1,w^2,w,w,1,0,1,1,1,1,w,1,w^2,w^2,w,0,w,w,w
]);
Gsrc2:=Matrix(F,4,6,[
    1,w^2,1,w^2,1,w^2,
    w,1,1,w^2,w^2,w,
    w,0,w^2,0,1,0,
    0,1,0,w,0,w^2
]);
W1:=Matrix(F,2,30,[
    w,w^2,0,w^2,1,w^2,0,w^2,0,1,w^2,1,0,1,w,1,0,1,0,w,1,w,0,w,w^2,w,0,w,0,w^2,
    w,w^2,w,1,1,w^2,0,w^2,w^2,w^2,w^2,1,w^2,w,w,1,0,1,1,1,1,w,1,w^2,w^2,w,0,w,w,w
]);
W2:=Matrix(F,2,6,[
    w,0,w^2,0,1,0,
    0,1,0,w,0,w^2
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 30 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,16,36,[
    1,w^2,0,1,w^2,w^2,w,0,w^2,w,1,w^2,0,1,w^2,w^2,w,0,w^2,w,1,w^2,0,1,w^2,w^2,w,0,w^2,w,0,0,0,0,0,0,
    w,w^2,1,w^2,w,0,1,w^2,w^2,w,w,w^2,1,w^2,w,0,1,w^2,w^2,w,w,w^2,1,w^2,w,0,1,w^2,w^2,w,0,0,0,0,0,0,
    1,0,1,w,w^2,0,w^2,0,0,0,1,0,1,w,w^2,0,w^2,0,0,0,1,0,1,w,w^2,0,w^2,0,0,0,0,0,0,0,0,0,
    w^2,1,w^2,1,w^2,0,1,0,0,w^2,w^2,1,w^2,1,w^2,0,1,0,0,w^2,w^2,1,w^2,1,w^2,0,1,0,0,w^2,0,0,0,0,0,0,
    w^2,w^2,1,w^2,1,0,1,w^2,0,0,w^2,w^2,1,w^2,1,0,1,w^2,0,0,w^2,w^2,1,w^2,1,0,1,w^2,0,0,0,0,0,0,0,0,
    1,1,1,1,w^2,0,1,w^2,0,0,1,1,1,1,w^2,0,1,w^2,0,0,1,1,1,1,w^2,0,1,w^2,0,0,0,0,0,0,0,0,
    0,w^2,0,w,0,0,1,w^2,w,0,0,w,0,1,0,0,w^2,w,1,0,0,1,0,w^2,0,0,w,1,w^2,0,0,0,0,0,0,0,
    0,1,w^2,w,0,0,w,0,w,0,0,w^2,w,1,0,0,1,0,1,0,0,w,1,w^2,0,0,w^2,0,w^2,0,0,0,0,0,0,0,
    1,0,1,0,1,w,1,0,w,1,w^2,0,w^2,0,w^2,1,w^2,0,1,w^2,w,0,w,0,w,w^2,w,0,w^2,w,0,0,0,0,0,0,
    1,w^2,0,1,w^2,w,0,1,0,w^2,w^2,w,0,w^2,w,1,0,w^2,0,w,w,1,0,w,1,w^2,0,w,0,1,0,0,0,0,0,0,
    1,1,0,w^2,w,1,w^2,0,1,0,w,w,0,1,w^2,w,1,0,w,0,w^2,w^2,0,w,1,w^2,w,0,w^2,0,0,0,0,0,0,0,
    w^2,w^2,w,1,w,1,0,w,w,w,1,1,w^2,w,w^2,w,0,w^2,w^2,w^2,w,w,1,w^2,1,w^2,0,1,1,1,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w^2,1,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w^2,w^2,w,
    w,w^2,0,w^2,1,w^2,0,w^2,0,1,w^2,1,0,1,w,1,0,1,0,w,1,w,0,w,w^2,w,0,w,0,w^2,w,0,w^2,0,1,0,
    w,w^2,w,1,1,w^2,0,w^2,w^2,w^2,w^2,1,w^2,w,w,1,0,1,1,1,1,w,1,w^2,w^2,w,0,w,w,w,0,1,0,w,0,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=30 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [30+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[248]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 36 and Dimension(Q) eq 16;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[248]:=[36,11,11,15];
Table3DistanceTypes[248]:="exact";

// Table 3, No. 249 | QD_39_1_15_14
// [[39,1,15;14]]_2, distance exact.
Gsrc1:=Matrix(F,9,27,[
    1,1,w^2,0,w^2,w,w,w,w,1,1,w^2,0,w^2,w,w,w,w,1,1,w^2,0,w^2,w,w,w,w,
    1,0,0,1,0,w^2,1,1,w,w^2,0,0,w^2,0,w,w^2,w^2,1,w,0,0,w,0,1,w,w,w^2,
    1,1,0,w,w^2,w^2,1,w^2,w^2,w,w,0,w^2,1,1,w,1,1,w^2,w^2,0,1,w,w,w^2,w,w,
    0,0,1,1,w,w^2,0,w,1,0,0,w,w,w^2,1,0,w^2,w,0,0,w^2,w^2,1,w,0,1,w^2,
    w,w^2,w^2,0,1,1,1,0,w,1,w,w,0,w^2,w^2,w^2,0,1,w^2,1,1,0,w,w,w,0,w^2,
    0,1,w,w,1,0,1,w^2,w,0,1,w,w,1,0,1,w^2,w,0,1,w,w,1,0,1,w^2,w,
    w,1,0,1,w,0,w,w^2,1,w,1,0,1,w,0,w,w^2,1,w,1,0,1,w,0,w,w^2,1,
    w^2,0,w,0,w,1,w^2,w^2,w,w,0,1,0,1,w^2,w,w,1,1,0,w^2,0,w^2,w,1,1,w^2,
    1,0,w,0,w,w^2,w^2,1,w^2,w^2,0,1,0,1,w,w,w^2,w,w,0,w^2,0,w^2,1,1,w,1
]);
Gsrc2:=Matrix(F,8,12,[
    1,w^2,w,w,1,w^2,w,w,1,w^2,w,w,
    1,1,w,w^2,w^2,w^2,1,w,w,w,w^2,1,
    0,w,0,w^2,0,w^2,0,1,0,1,0,w,
    w,1,1,w,w^2,w,w,w^2,1,w^2,w^2,1,
    0,w,w^2,w,0,w,w^2,w,0,w,w^2,w,
    w,0,w,1,w,0,w,1,w,0,w,1,
    w^2,w,0,w^2,w,1,0,w,1,w^2,0,1,
    w^2,0,w^2,w^2,w,0,w,w,1,0,1,1
]);
W1:=Matrix(F,4,27,[
    0,1,w,w,1,0,1,w^2,w,0,1,w,w,1,0,1,w^2,w,0,1,w,w,1,0,1,w^2,w,
    w,1,0,1,w,0,w,w^2,1,w,1,0,1,w,0,w,w^2,1,w,1,0,1,w,0,w,w^2,1,
    w^2,0,w,0,w,1,w^2,w^2,w,w,0,1,0,1,w^2,w,w,1,1,0,w^2,0,w^2,w,1,1,w^2,
    1,0,w,0,w,w^2,w^2,1,w^2,w^2,0,1,0,1,w,w,w^2,w,w,0,w^2,0,w^2,1,1,w,1
]);
W2:=Matrix(F,4,12,[
    0,w,w^2,w,0,w,w^2,w,0,w,w^2,w,
    w,0,w,1,w,0,w,1,w,0,w,1,
    w^2,w,0,w^2,w,1,0,w,1,w^2,0,1,
    w^2,0,w^2,w^2,w,0,w,w,1,0,1,1
]);
lambda:=4;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 27 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 12;
GX4:=Matrix(F,13,39,[
    1,1,w^2,0,w^2,w,w,w,w,1,1,w^2,0,w^2,w,w,w,w,1,1,w^2,0,w^2,w,w,w,w,0,0,0,0,0,0,0,0,0,0,0,0,
    1,0,0,1,0,w^2,1,1,w,w^2,0,0,w^2,0,w,w^2,w^2,1,w,0,0,w,0,1,w,w,w^2,0,0,0,0,0,0,0,0,0,0,0,0,
    1,1,0,w,w^2,w^2,1,w^2,w^2,w,w,0,w^2,1,1,w,1,1,w^2,w^2,0,1,w,w,w^2,w,w,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,1,1,w,w^2,0,w,1,0,0,w,w,w^2,1,0,w^2,w,0,0,w^2,w^2,1,w,0,1,w^2,0,0,0,0,0,0,0,0,0,0,0,0,
    w,w^2,w^2,0,1,1,1,0,w,1,w,w,0,w^2,w^2,w^2,0,1,w^2,1,1,0,w,w,w,0,w^2,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,w,1,w^2,w,w,1,w^2,w,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,w^2,w^2,w^2,1,w,w,w,w^2,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,0,w^2,0,1,0,1,0,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,w^2,w,w,w^2,1,w^2,w^2,1,
    0,1,w,w,1,0,1,w^2,w,0,1,w,w,1,0,1,w^2,w,0,1,w,w,1,0,1,w^2,w,0,w,w^2,w,0,w,w^2,w,0,w,w^2,w,
    w,1,0,1,w,0,w,w^2,1,w,1,0,1,w,0,w,w^2,1,w,1,0,1,w,0,w,w^2,1,w,0,w,1,w,0,w,1,w,0,w,1,
    w^2,0,w,0,w,1,w^2,w^2,w,w,0,1,0,1,w^2,w,w,1,1,0,w^2,0,w^2,w,1,1,w^2,w^2,w,0,w^2,w,1,0,w,1,w^2,0,1,
    1,0,w,0,w,w^2,w^2,1,w^2,w^2,0,1,0,1,w,w,w^2,w,w,0,w^2,0,w^2,1,1,w,1,w^2,0,w^2,w^2,w,0,w,w,1,0,1,1
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=27 div 3;ell2:=12 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [27+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[249]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 39 and Dimension(Q) eq 13;
assert Dimension(HermitianHull(Q)) eq 12;
Table3Parameters[249]:=[39,1,15,14];
Table3DistanceTypes[249]:="exact";

// Table 3, No. 250 | QD_39_3_15_14
// [[39,3,15;14]]_2, distance exact.
Gsrc1:=Matrix(F,7,21,[
    w^2,w^2,w^2,w^2,1,1,1,w^2,w^2,w^2,w^2,1,1,1,w^2,w^2,w^2,w^2,1,1,1,
    w,1,w^2,0,w^2,0,w^2,1,w^2,w,0,w,0,w,w^2,w,1,0,1,0,1,
    0,0,w,w^2,1,w,w^2,0,0,1,w,w^2,1,w,0,0,w^2,1,w,w^2,1,
    w,0,w,w,w,0,1,w,0,w,w,w,0,1,w,0,w,w,w,0,1,
    1,w^2,w,w^2,w,w,1,1,w^2,w,w^2,w,w,1,1,w^2,w,w^2,w,w,1,
    w^2,w^2,w^2,1,w^2,0,0,1,1,1,w,1,0,0,w,w,w,w^2,w,0,0,
    1,1,w^2,w^2,1,w,w,w,w,1,1,w,w^2,w^2,w^2,w^2,w,w,w^2,1,1
]);
Gsrc2:=Matrix(F,11,18,[
    w,0,w^2,0,w,w^2,w,0,w^2,0,w,w^2,w,0,w^2,0,w,w^2,
    w,w^2,1,1,w,1,w,w^2,1,1,w,1,w,w^2,1,1,w,1,
    w^2,0,w,0,w^2,1,w,0,1,0,w,w^2,1,0,w^2,0,1,w,
    0,w^2,0,w^2,w^2,1,0,w,0,w,w,w^2,0,1,0,1,1,w,
    1,0,w,w,0,w^2,w^2,0,1,1,0,w,w,0,w^2,w^2,0,1,
    w^2,0,1,1,0,w^2,1,0,w,w,0,1,w,0,w^2,w^2,0,w,
    1,1,w^2,w^2,w,1,w,w,1,1,w^2,w,w^2,w^2,w,w,1,w^2,
    1,0,w,w,w^2,1,1,0,w,w,w^2,1,1,0,w,w,w^2,1,
    0,0,w^2,w,w,0,0,0,w^2,w,w,0,0,0,w^2,w,w,0,
    w^2,w^2,w,w^2,w^2,0,1,1,w^2,1,1,0,w,w,1,w,w,0,
    0,w,w^2,w,1,w^2,0,w^2,1,w^2,w,1,0,1,w,1,w^2,w
]);
W1:=Matrix(F,4,21,[
    w,0,w,w,w,0,1,w,0,w,w,w,0,1,w,0,w,w,w,0,1,
    1,w^2,w,w^2,w,w,1,1,w^2,w,w^2,w,w,1,1,w^2,w,w^2,w,w,1,
    w^2,w^2,w^2,1,w^2,0,0,1,1,1,w,1,0,0,w,w,w,w^2,w,0,0,
    1,1,w^2,w^2,1,w,w,w,w,1,1,w,w^2,w^2,w^2,w^2,w,w,w^2,1,1
]);
W2:=Matrix(F,4,18,[
    1,0,w,w,w^2,1,1,0,w,w,w^2,1,1,0,w,w,w^2,1,
    0,0,w^2,w,w,0,0,0,w^2,w,w,0,0,0,w^2,w,w,0,
    w^2,w^2,w,w^2,w^2,0,1,1,w^2,1,1,0,w,w,1,w,w,0,
    0,w,w^2,w,1,w^2,0,w^2,1,w^2,w,1,0,1,w,1,w^2,w
]);
lambda:=4;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 21 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 18;
GX4:=Matrix(F,14,39,[
    w^2,w^2,w^2,w^2,1,1,1,w^2,w^2,w^2,w^2,1,1,1,w^2,w^2,w^2,w^2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    w,1,w^2,0,w^2,0,w^2,1,w^2,w,0,w,0,w,w^2,w,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,w,w^2,1,w,w^2,0,0,1,w,w^2,1,w,0,0,w^2,1,w,w^2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,0,w,w^2,w,0,w^2,0,w,w^2,w,0,w^2,0,w,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,1,w,1,w,w^2,1,1,w,1,w,w^2,1,1,w,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,w^2,1,w,0,1,0,w,w^2,1,0,w^2,0,1,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,w^2,1,0,w,0,w,w,w^2,0,1,0,1,1,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,w,0,w^2,w^2,0,1,1,0,w,w,0,w^2,w^2,0,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,1,0,w^2,1,0,w,w,0,1,w,0,w^2,w^2,0,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w^2,w^2,w,1,w,w,1,1,w^2,w,w^2,w^2,w,w,1,w^2,
    w,0,w,w,w,0,1,w,0,w,w,w,0,1,w,0,w,w,w,0,1,1,0,w,w,w^2,1,1,0,w,w,w^2,1,1,0,w,w,w^2,1,
    1,w^2,w,w^2,w,w,1,1,w^2,w,w^2,w,w,1,1,w^2,w,w^2,w,w,1,0,0,w^2,w,w,0,0,0,w^2,w,w,0,0,0,w^2,w,w,0,
    w^2,w^2,w^2,1,w^2,0,0,1,1,1,w,1,0,0,w,w,w,w^2,w,0,0,w^2,w^2,w,w^2,w^2,0,1,1,w^2,1,1,0,w,w,1,w,w,0,
    1,1,w^2,w^2,1,w,w,w,w,1,1,w,w^2,w^2,w^2,w^2,w,w,w^2,1,1,0,w,w^2,w,1,w^2,0,w^2,1,w^2,w,1,0,1,w,1,w^2,w
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=21 div 3;ell2:=18 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [21+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[250]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 39 and Dimension(Q) eq 14;
assert Dimension(HermitianHull(Q)) eq 11;
Table3Parameters[250]:=[39,3,15,14];
Table3DistanceTypes[250]:="exact";

// Table 3, No. 251 | Q50_017
// [[39,4,17;21]]_2, distance exact.
Gsrc1:=Matrix(F,11,33,[
    1,0,w,0,w^2,w^2,w,0,0,1,0,1,0,w,0,w^2,w^2,w,0,0,1,0,1,0,w,0,w^2,w^2,w,0,0,1,0,
    0,0,0,1,1,1,1,w^2,w^2,w^2,w^2,0,0,0,1,1,1,1,w^2,w^2,w^2,w^2,0,0,0,1,1,1,1,w^2,w^2,w^2,w^2,
    1,w^2,0,0,w^2,1,1,w^2,w,1,w,1,w^2,0,0,w^2,1,1,w^2,w,1,w,1,w^2,0,0,w^2,1,1,w^2,w,1,w,
    w,0,0,1,1,0,w^2,w,w^2,0,w^2,1,0,0,w^2,w^2,0,w,1,w,0,w,w^2,0,0,w,w,0,1,w^2,1,0,1,
    0,w^2,1,1,0,w^2,w^2,1,w^2,1,w^2,0,1,w,w,0,1,1,w,1,w,1,0,w,w^2,w^2,0,w,w,w^2,w,w^2,w,
    w,w,0,w,w^2,0,1,0,w^2,0,1,w^2,w^2,0,w^2,1,0,w,0,1,0,w,1,1,0,1,w,0,w^2,0,w,0,w^2,
    w,0,0,0,1,1,1,0,w^2,1,1,w,0,0,0,1,1,1,0,w^2,1,1,w,0,0,0,1,1,1,0,w^2,1,1,
    0,w^2,0,1,1,w,w,w^2,1,1,w,0,w,0,w^2,w^2,1,1,w,w^2,w^2,1,0,1,0,w,w,w^2,w^2,1,w,w,w^2,
    0,0,1,w^2,0,w,w,w,0,w,w^2,0,0,w^2,w,0,1,1,1,0,1,w,0,0,w,1,0,w^2,w^2,w^2,0,w^2,1,
    w,1,w,1,0,0,w,1,1,w^2,1,w^2,w,w^2,w,0,0,w^2,w,w,1,w,1,w^2,1,w^2,0,0,1,w^2,w^2,w,w^2,
    w,1,1,1,1,w^2,w^2,1,0,w^2,0,w^2,w,w,w,w,1,1,w,0,1,0,1,w^2,w^2,w^2,w^2,w,w,w^2,0,w,0
]);
Gsrc2:=Matrix(F,5,6,[
    1,0,1,0,1,0,
    1,0,w^2,0,w,0,
    0,1,0,w^2,0,w,
    1,0,w,0,w^2,0,
    0,1,0,w,0,w^2
]);
W1:=Matrix(F,5,33,[
    w,0,0,0,1,1,1,0,w^2,1,1,w,0,0,0,1,1,1,0,w^2,1,1,w,0,0,0,1,1,1,0,w^2,1,1,
    0,w^2,0,1,1,w,w,w^2,1,1,w,0,w,0,w^2,w^2,1,1,w,w^2,w^2,1,0,1,0,w,w,w^2,w^2,1,w,w,w^2,
    0,0,1,w^2,0,w,w,w,0,w,w^2,0,0,w^2,w,0,1,1,1,0,1,w,0,0,w,1,0,w^2,w^2,w^2,0,w^2,1,
    w,1,w,1,0,0,w,1,1,w^2,1,w^2,w,w^2,w,0,0,w^2,w,w,1,w,1,w^2,1,w^2,0,0,1,w^2,w^2,w,w^2,
    w,1,1,1,1,w^2,w^2,1,0,w^2,0,w^2,w,w,w,w,1,1,w,0,1,0,1,w^2,w^2,w^2,w^2,w,w,w^2,0,w,0
]);
W2:=Matrix(F,5,6,[
    1,0,1,0,1,0,
    1,0,w^2,0,w,0,
    0,1,0,w^2,0,w,
    1,0,w,0,w^2,0,
    0,1,0,w,0,w^2
]);
lambda:=5;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 33 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,11,39,[
    1,0,w,0,w^2,w^2,w,0,0,1,0,1,0,w,0,w^2,w^2,w,0,0,1,0,1,0,w,0,w^2,w^2,w,0,0,1,0,0,0,0,0,0,0,
    0,0,0,1,1,1,1,w^2,w^2,w^2,w^2,0,0,0,1,1,1,1,w^2,w^2,w^2,w^2,0,0,0,1,1,1,1,w^2,w^2,w^2,w^2,0,0,0,0,0,0,
    1,w^2,0,0,w^2,1,1,w^2,w,1,w,1,w^2,0,0,w^2,1,1,w^2,w,1,w,1,w^2,0,0,w^2,1,1,w^2,w,1,w,0,0,0,0,0,0,
    w,0,0,1,1,0,w^2,w,w^2,0,w^2,1,0,0,w^2,w^2,0,w,1,w,0,w,w^2,0,0,w,w,0,1,w^2,1,0,1,0,0,0,0,0,0,
    0,w^2,1,1,0,w^2,w^2,1,w^2,1,w^2,0,1,w,w,0,1,1,w,1,w,1,0,w,w^2,w^2,0,w,w,w^2,w,w^2,w,0,0,0,0,0,0,
    w,w,0,w,w^2,0,1,0,w^2,0,1,w^2,w^2,0,w^2,1,0,w,0,1,0,w,1,1,0,1,w,0,w^2,0,w,0,w^2,0,0,0,0,0,0,
    w,0,0,0,1,1,1,0,w^2,1,1,w,0,0,0,1,1,1,0,w^2,1,1,w,0,0,0,1,1,1,0,w^2,1,1,1,0,1,0,1,0,
    0,w^2,0,1,1,w,w,w^2,1,1,w,0,w,0,w^2,w^2,1,1,w,w^2,w^2,1,0,1,0,w,w,w^2,w^2,1,w,w,w^2,1,0,w^2,0,w,0,
    0,0,1,w^2,0,w,w,w,0,w,w^2,0,0,w^2,w,0,1,1,1,0,1,w,0,0,w,1,0,w^2,w^2,w^2,0,w^2,1,0,1,0,w^2,0,w,
    w,1,w,1,0,0,w,1,1,w^2,1,w^2,w,w^2,w,0,0,w^2,w,w,1,w,1,w^2,1,w^2,0,0,1,w^2,w^2,w,w^2,1,0,w,0,w^2,0,
    w,1,1,1,1,w^2,w^2,1,0,w^2,0,w^2,w,w,w,w,1,1,w,0,1,0,1,w^2,w^2,w^2,w^2,w,w,w^2,0,w,0,0,1,0,w,0,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=33 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [33+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[251]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 39 and Dimension(Q) eq 11;
assert Dimension(HermitianHull(Q)) eq 7;
Table3Parameters[251]:=[39,4,17,21];
Table3DistanceTypes[251]:="exact";

// Table 3, No. 252 | QD_39_4_18_23
// [[39,4,18;23]]_2, distance exact.
Gsrc1:=Matrix(F,8,33,[
    1,1,1,0,1,w,0,w,1,1,0,1,1,1,0,1,w,0,w,1,1,0,1,1,1,0,1,w,0,w,1,1,0,
    1,w^2,w,w,w,1,1,w^2,0,w^2,w,w^2,w,1,1,1,w^2,w^2,w,0,w,1,w,1,w^2,w^2,w^2,w,w,1,0,1,w^2,
    1,w,w^2,1,w,w^2,0,w,w,w,w,w,w^2,1,w,w^2,1,0,w^2,w^2,w^2,w^2,w^2,1,w,w^2,1,w,0,1,1,1,1,
    w,0,w,w,0,w^2,w^2,0,0,w,w,w,0,w,w,0,w^2,w^2,0,0,w,w,w,0,w,w,0,w^2,w^2,0,0,w,w,
    w^2,1,0,w,0,1,0,0,w^2,1,1,w,w^2,0,1,0,w^2,0,0,w,w^2,w^2,1,w,0,w^2,0,w,0,0,1,w,w,
    0,1,0,w,1,1,w^2,w^2,w,w^2,w,0,w,0,w^2,w,w,1,1,w^2,1,w^2,0,w^2,0,1,w^2,w^2,w,w,1,w,1,
    w^2,1,0,w^2,w^2,1,0,0,0,w,w^2,1,w,0,1,1,w,0,0,0,w^2,1,w,w^2,0,w,w,w^2,0,0,0,1,w,
    1,w^2,0,1,w^2,w^2,w,0,1,w,1,w^2,w,0,w^2,w,w,1,0,w^2,1,w^2,w,1,0,w,1,1,w^2,0,w,w^2,w
]);
Gsrc2:=Matrix(F,3,6,[
    w^2,1,w^2,1,w^2,1,
    w^2,1,1,w,w,w^2,
    1,0,w^2,0,w,0
]);
W1:=Matrix(F,1,33,[
    1,w^2,0,1,w^2,w^2,w,0,1,w,1,w^2,w,0,w^2,w,w,1,0,w^2,1,w^2,w,1,0,w,1,1,w^2,0,w,w^2,w
]);
W2:=Matrix(F,1,6,[
    1,0,w^2,0,w,0
]);
lambda:=1;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 33 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,10,39,[
    1,1,1,0,1,w,0,w,1,1,0,1,1,1,0,1,w,0,w,1,1,0,1,1,1,0,1,w,0,w,1,1,0,0,0,0,0,0,0,
    1,w^2,w,w,w,1,1,w^2,0,w^2,w,w^2,w,1,1,1,w^2,w^2,w,0,w,1,w,1,w^2,w^2,w^2,w,w,1,0,1,w^2,0,0,0,0,0,0,
    1,w,w^2,1,w,w^2,0,w,w,w,w,w,w^2,1,w,w^2,1,0,w^2,w^2,w^2,w^2,w^2,1,w,w^2,1,w,0,1,1,1,1,0,0,0,0,0,0,
    w,0,w,w,0,w^2,w^2,0,0,w,w,w,0,w,w,0,w^2,w^2,0,0,w,w,w,0,w,w,0,w^2,w^2,0,0,w,w,0,0,0,0,0,0,
    w^2,1,0,w,0,1,0,0,w^2,1,1,w,w^2,0,1,0,w^2,0,0,w,w^2,w^2,1,w,0,w^2,0,w,0,0,1,w,w,0,0,0,0,0,0,
    0,1,0,w,1,1,w^2,w^2,w,w^2,w,0,w,0,w^2,w,w,1,1,w^2,1,w^2,0,w^2,0,1,w^2,w^2,w,w,1,w,1,0,0,0,0,0,0,
    w^2,1,0,w^2,w^2,1,0,0,0,w,w^2,1,w,0,1,1,w,0,0,0,w^2,1,w,w^2,0,w,w,w^2,0,0,0,1,w,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,1,w^2,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,w,w,w^2,
    1,w^2,0,1,w^2,w^2,w,0,1,w,1,w^2,w,0,w^2,w,w,1,0,w^2,1,w^2,w,1,0,w,1,1,w^2,0,w,w^2,w,1,0,w^2,0,w,0
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=33 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [33+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[252]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 39 and Dimension(Q) eq 10;
assert Dimension(HermitianHull(Q)) eq 6;
Table3Parameters[252]:=[39,4,18,23];
Table3DistanceTypes[252]:="exact";

// Table 3, No. 253 | Q50_018
// [[39,5,17;22]]_2, distance exact.
Gsrc1:=Matrix(F,11,36,[
    1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,
    1,0,0,1,w,w^2,w,w^2,w,1,1,w^2,w,0,0,w,w^2,1,w^2,1,w^2,w,w,1,w^2,0,0,w^2,1,w,1,w,1,w^2,w^2,w,
    0,1,0,w^2,w^2,0,w,0,w^2,1,w,w^2,0,w,0,1,1,0,w^2,0,1,w,w^2,1,0,w^2,0,w,w,0,1,0,w,w^2,1,w,
    0,0,1,w,w^2,w,w^2,w^2,1,1,w^2,w^2,0,0,w,w^2,1,w^2,1,1,w,w,1,1,0,0,w^2,1,w,1,w,w,w^2,w^2,w,w,
    w,0,1,0,1,w^2,0,1,w^2,0,0,w^2,w,0,1,0,1,w^2,0,1,w^2,0,0,w^2,w,0,1,0,1,w^2,0,1,w^2,0,0,w^2,
    1,1,w^2,0,1,w^2,1,w,1,w,w^2,w^2,w^2,w^2,w,0,w^2,w,w^2,1,w^2,1,w,w,w,w,1,0,w,1,w,w^2,w,w^2,1,1,
    0,1,w^2,0,w,1,0,0,w^2,0,w^2,1,0,w^2,w,0,1,w^2,0,0,w,0,w,w^2,0,w,1,0,w^2,w,0,0,1,0,1,w,
    0,w^2,w,w,0,0,1,1,w^2,0,w^2,0,0,w,1,1,0,0,w^2,w^2,w,0,w,0,0,1,w^2,w^2,0,0,w,w,1,0,1,0,
    1,0,0,0,w^2,w,w,0,w,0,w,1,w,0,0,0,1,w^2,w^2,0,w^2,0,w^2,w,w^2,0,0,0,w,1,1,0,1,0,1,w^2,
    w,1,w^2,0,w^2,w^2,w,w,w^2,w,w^2,w,w,1,w^2,0,w^2,w^2,w,w,w^2,w,w^2,w,w,1,w^2,0,w^2,w^2,w,w,w^2,w,w^2,w,
    1,w^2,w^2,w,1,1,w^2,1,1,1,1,0,w^2,w,w,1,w^2,w^2,w,w^2,w^2,w^2,w^2,0,w,1,1,w^2,w,w,1,w,w,w,w,0
]);
Gsrc2:=Matrix(F,2,3,[
    1,1,1,
    1,w^2,w
]);
W1:=Matrix(F,2,36,[
    w,1,w^2,0,w^2,w^2,w,w,w^2,w,w^2,w,w,1,w^2,0,w^2,w^2,w,w,w^2,w,w^2,w,w,1,w^2,0,w^2,w^2,w,w,w^2,w,w^2,w,
    1,w^2,w^2,w,1,1,w^2,1,1,1,1,0,w^2,w,w,1,w^2,w^2,w,w^2,w^2,w^2,w^2,0,w,1,1,w^2,w,w,1,w,w,w,w,0
]);
W2:=Matrix(F,2,3,[
    1,1,1,
    1,w^2,w
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 36 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,11,39,[
    1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,
    1,0,0,1,w,w^2,w,w^2,w,1,1,w^2,w,0,0,w,w^2,1,w^2,1,w^2,w,w,1,w^2,0,0,w^2,1,w,1,w,1,w^2,w^2,w,0,0,0,
    0,1,0,w^2,w^2,0,w,0,w^2,1,w,w^2,0,w,0,1,1,0,w^2,0,1,w,w^2,1,0,w^2,0,w,w,0,1,0,w,w^2,1,w,0,0,0,
    0,0,1,w,w^2,w,w^2,w^2,1,1,w^2,w^2,0,0,w,w^2,1,w^2,1,1,w,w,1,1,0,0,w^2,1,w,1,w,w,w^2,w^2,w,w,0,0,0,
    w,0,1,0,1,w^2,0,1,w^2,0,0,w^2,w,0,1,0,1,w^2,0,1,w^2,0,0,w^2,w,0,1,0,1,w^2,0,1,w^2,0,0,w^2,0,0,0,
    1,1,w^2,0,1,w^2,1,w,1,w,w^2,w^2,w^2,w^2,w,0,w^2,w,w^2,1,w^2,1,w,w,w,w,1,0,w,1,w,w^2,w,w^2,1,1,0,0,0,
    0,1,w^2,0,w,1,0,0,w^2,0,w^2,1,0,w^2,w,0,1,w^2,0,0,w,0,w,w^2,0,w,1,0,w^2,w,0,0,1,0,1,w,0,0,0,
    0,w^2,w,w,0,0,1,1,w^2,0,w^2,0,0,w,1,1,0,0,w^2,w^2,w,0,w,0,0,1,w^2,w^2,0,0,w,w,1,0,1,0,0,0,0,
    1,0,0,0,w^2,w,w,0,w,0,w,1,w,0,0,0,1,w^2,w^2,0,w^2,0,w^2,w,w^2,0,0,0,w,1,1,0,1,0,1,w^2,0,0,0,
    w,1,w^2,0,w^2,w^2,w,w,w^2,w,w^2,w,w,1,w^2,0,w^2,w^2,w,w,w^2,w,w^2,w,w,1,w^2,0,w^2,w^2,w,w,w^2,w,w^2,w,1,1,1,
    1,w^2,w^2,w,1,1,w^2,1,1,1,1,0,w^2,w,w,1,w^2,w^2,w,w^2,w^2,w^2,w^2,0,w,1,1,w^2,w,w,1,w,w,w,w,0,1,w^2,w
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=36 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [36+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[253]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 39 and Dimension(Q) eq 11;
assert Dimension(HermitianHull(Q)) eq 6;
Table3Parameters[253]:=[39,5,17,22];
Table3DistanceTypes[253]:="exact";

// Table 3, No. 254 | QB_39_7_14_18
// [[39,7,14;18]]_2, distance exact.
Gsrc1:=Matrix(F,12,33,[
    1,0,w^2,1,1,w^2,0,w,w,w^2,0,w^2,0,w,w^2,w^2,w,0,1,1,w,0,w,0,1,w,w,1,0,w^2,w^2,1,0,
    0,1,w,0,w,1,0,0,1,0,w^2,0,w^2,1,0,1,w^2,0,0,w^2,0,w,0,w,w^2,0,w^2,w,0,0,w,0,1,
    1,1,1,w^2,w,1,0,1,w^2,1,w,w,w,w,1,w^2,w,0,w,1,w,w^2,w^2,w^2,w^2,w,1,w^2,0,w^2,w,w^2,1,
    0,w,w^2,0,w,0,w,w^2,0,1,w,0,w,w^2,0,w,0,w,w^2,0,1,w,0,w,w^2,0,w,0,w,w^2,0,1,w,
    1,0,0,w^2,0,w^2,w^2,w,w^2,1,0,1,0,0,w^2,0,w^2,w^2,w,w^2,1,0,1,0,0,w^2,0,w^2,w^2,w,w^2,1,0,
    w,w^2,w,w^2,0,0,w,w,w,w,w,w,w^2,w,w^2,0,0,w,w,w,w,w,w,w^2,w,w^2,0,0,w,w,w,w,w,
    w^2,1,1,w^2,w,1,w^2,0,w^2,0,w^2,w^2,1,1,w^2,w,1,w^2,0,w^2,0,w^2,w^2,1,1,w^2,w,1,w^2,0,w^2,0,w^2,
    w,w,0,0,0,w^2,w^2,w,1,w^2,0,1,1,0,0,0,w,w,1,w^2,w,0,w^2,w^2,0,0,0,1,1,w^2,w,1,0,
    1,w^2,0,0,w,w^2,0,1,1,1,0,w^2,w,0,0,1,w,0,w^2,w^2,w^2,0,w,1,0,0,w^2,1,0,w,w,w,0,
    1,w,w^2,0,w,w^2,w^2,w^2,w,w,0,w,w^2,1,0,w^2,1,1,1,w^2,w^2,0,w^2,1,w,0,1,w,w,w,1,1,0,
    1,0,w,0,0,0,1,1,1,w,w^2,w,0,w^2,0,0,0,w,w,w,w^2,1,w^2,0,1,0,0,0,w^2,w^2,w^2,1,w,
    w,1,w^2,0,1,w,w,w^2,w^2,0,1,w^2,w,1,0,w,w^2,w^2,1,1,0,w,1,w^2,w,0,w^2,1,1,w,w,0,w^2
]);
Gsrc2:=Matrix(F,4,6,[
    1,w^2,1,w^2,1,w^2,
    w,1,1,w^2,w^2,w,
    w,0,w^2,0,1,0,
    0,1,0,w,0,w^2
]);
W1:=Matrix(F,2,33,[
    1,0,w,0,0,0,1,1,1,w,w^2,w,0,w^2,0,0,0,w,w,w,w^2,1,w^2,0,1,0,0,0,w^2,w^2,w^2,1,w,
    w,1,w^2,0,1,w,w,w^2,w^2,0,1,w^2,w,1,0,w,w^2,w^2,1,1,0,w,1,w^2,w,0,w^2,1,1,w,w,0,w^2
]);
W2:=Matrix(F,2,6,[
    w,0,w^2,0,1,0,
    0,1,0,w,0,w^2
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 33 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,14,39,[
    1,0,w^2,1,1,w^2,0,w,w,w^2,0,w^2,0,w,w^2,w^2,w,0,1,1,w,0,w,0,1,w,w,1,0,w^2,w^2,1,0,0,0,0,0,0,0,
    0,1,w,0,w,1,0,0,1,0,w^2,0,w^2,1,0,1,w^2,0,0,w^2,0,w,0,w,w^2,0,w^2,w,0,0,w,0,1,0,0,0,0,0,0,
    1,1,1,w^2,w,1,0,1,w^2,1,w,w,w,w,1,w^2,w,0,w,1,w,w^2,w^2,w^2,w^2,w,1,w^2,0,w^2,w,w^2,1,0,0,0,0,0,0,
    0,w,w^2,0,w,0,w,w^2,0,1,w,0,w,w^2,0,w,0,w,w^2,0,1,w,0,w,w^2,0,w,0,w,w^2,0,1,w,0,0,0,0,0,0,
    1,0,0,w^2,0,w^2,w^2,w,w^2,1,0,1,0,0,w^2,0,w^2,w^2,w,w^2,1,0,1,0,0,w^2,0,w^2,w^2,w,w^2,1,0,0,0,0,0,0,0,
    w,w^2,w,w^2,0,0,w,w,w,w,w,w,w^2,w,w^2,0,0,w,w,w,w,w,w,w^2,w,w^2,0,0,w,w,w,w,w,0,0,0,0,0,0,
    w^2,1,1,w^2,w,1,w^2,0,w^2,0,w^2,w^2,1,1,w^2,w,1,w^2,0,w^2,0,w^2,w^2,1,1,w^2,w,1,w^2,0,w^2,0,w^2,0,0,0,0,0,0,
    w,w,0,0,0,w^2,w^2,w,1,w^2,0,1,1,0,0,0,w,w,1,w^2,w,0,w^2,w^2,0,0,0,1,1,w^2,w,1,0,0,0,0,0,0,0,
    1,w^2,0,0,w,w^2,0,1,1,1,0,w^2,w,0,0,1,w,0,w^2,w^2,w^2,0,w,1,0,0,w^2,1,0,w,w,w,0,0,0,0,0,0,0,
    1,w,w^2,0,w,w^2,w^2,w^2,w,w,0,w,w^2,1,0,w^2,1,1,1,w^2,w^2,0,w^2,1,w,0,1,w,w,w,1,1,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w^2,1,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w^2,w^2,w,
    1,0,w,0,0,0,1,1,1,w,w^2,w,0,w^2,0,0,0,w,w,w,w^2,1,w^2,0,1,0,0,0,w^2,w^2,w^2,1,w,w,0,w^2,0,1,0,
    w,1,w^2,0,1,w,w,w^2,w^2,0,1,w^2,w,1,0,w,w^2,w^2,1,1,0,w,1,w^2,w,0,w^2,1,1,w,w,0,w^2,0,1,0,w,0,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=33 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [33+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[254]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 39 and Dimension(Q) eq 14;
assert Dimension(HermitianHull(Q)) eq 7;
Table3Parameters[254]:=[39,7,14,18];
Table3DistanceTypes[254]:="exact";

// Table 3, No. 255 | QB_39_7_14_20
// [[39,7,14;20]]_2, distance exact.
Gsrc1:=Matrix(F,12,30,[
    1,1,1,1,w,w,w,w,0,0,1,1,1,1,w,w,w,w,0,0,1,1,1,1,w,w,w,w,0,0,
    1,w,w,0,w^2,1,1,1,w,w^2,1,w,w,0,w^2,1,1,1,w,w^2,1,w,w,0,w^2,1,1,1,w,w^2,
    1,0,w^2,0,w^2,w,1,w^2,w^2,0,1,0,w^2,0,w^2,w,1,w^2,w^2,0,1,0,w^2,0,w^2,w,1,w^2,w^2,0,
    w,1,0,0,w^2,0,w,0,w^2,0,w,1,0,0,w^2,0,w,0,w^2,0,w,1,0,0,w^2,0,w,0,w^2,0,
    1,w,w,1,1,1,w^2,1,0,1,w^2,1,1,w^2,w^2,w^2,w,w^2,0,w^2,w,w^2,w^2,w,w,w,1,w,0,w,
    w,w,w,1,w,w^2,0,w^2,1,1,1,1,1,w^2,1,w,0,w,w^2,w^2,w^2,w^2,w^2,w,w^2,1,0,1,w,w,
    w^2,w,0,1,w^2,1,w,1,0,0,1,w^2,0,w,1,w,w^2,w,0,0,w,1,0,w^2,w,w^2,1,w^2,0,0,
    0,1,0,0,1,0,w,0,1,w^2,0,w,0,0,w,0,w^2,0,w,1,0,w^2,0,0,w^2,0,1,0,w^2,w,
    0,1,1,1,w,w,w^2,w^2,1,w^2,0,w^2,w^2,w^2,1,1,w,w,w^2,w,0,w,w,w,w^2,w^2,1,1,w,1,
    0,1,w,1,w^2,1,0,1,1,0,0,w^2,1,w^2,w,w^2,0,w^2,w^2,0,0,w,w^2,w,1,w,0,w,w,0,
    w^2,w^2,w,w^2,0,w^2,w,w,w^2,w^2,1,1,w^2,1,0,1,w^2,w^2,1,1,w,w,1,w,0,w,1,1,w,w,
    1,1,w^2,w,w^2,1,0,w^2,1,w,w,w,1,w^2,1,w,0,1,w,w^2,w^2,w^2,w,1,w,w^2,0,w,w^2,1
]);
Gsrc2:=Matrix(F,5,9,[
    w^2,0,1,w^2,0,1,w^2,0,1,
    w,w,1,1,1,w^2,w^2,w^2,w,
    w^2,w,w^2,w,1,w,1,w^2,1,
    1,w,1,w,w^2,w,w^2,1,w^2,
    w^2,w^2,1,1,1,w,w,w,w^2
]);
W1:=Matrix(F,4,30,[
    0,1,1,1,w,w,w^2,w^2,1,w^2,0,w^2,w^2,w^2,1,1,w,w,w^2,w,0,w,w,w,w^2,w^2,1,1,w,1,
    0,1,w,1,w^2,1,0,1,1,0,0,w^2,1,w^2,w,w^2,0,w^2,w^2,0,0,w,w^2,w,1,w,0,w,w,0,
    w^2,w^2,w,w^2,0,w^2,w,w,w^2,w^2,1,1,w^2,1,0,1,w^2,w^2,1,1,w,w,1,w,0,w,1,1,w,w,
    1,1,w^2,w,w^2,1,0,w^2,1,w,w,w,1,w^2,1,w,0,1,w,w^2,w^2,w^2,w,1,w,w^2,0,w,w^2,1
]);
W2:=Matrix(F,4,9,[
    w,w,1,1,1,w^2,w^2,w^2,w,
    w^2,w,w^2,w,1,w,1,w^2,1,
    1,w,1,w,w^2,w,w^2,1,w^2,
    w^2,w^2,1,1,1,w,w,w,w^2
]);
lambda:=4;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 30 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 9;
GX4:=Matrix(F,13,39,[
    1,1,1,1,w,w,w,w,0,0,1,1,1,1,w,w,w,w,0,0,1,1,1,1,w,w,w,w,0,0,0,0,0,0,0,0,0,0,0,
    1,w,w,0,w^2,1,1,1,w,w^2,1,w,w,0,w^2,1,1,1,w,w^2,1,w,w,0,w^2,1,1,1,w,w^2,0,0,0,0,0,0,0,0,0,
    1,0,w^2,0,w^2,w,1,w^2,w^2,0,1,0,w^2,0,w^2,w,1,w^2,w^2,0,1,0,w^2,0,w^2,w,1,w^2,w^2,0,0,0,0,0,0,0,0,0,0,
    w,1,0,0,w^2,0,w,0,w^2,0,w,1,0,0,w^2,0,w,0,w^2,0,w,1,0,0,w^2,0,w,0,w^2,0,0,0,0,0,0,0,0,0,0,
    1,w,w,1,1,1,w^2,1,0,1,w^2,1,1,w^2,w^2,w^2,w,w^2,0,w^2,w,w^2,w^2,w,w,w,1,w,0,w,0,0,0,0,0,0,0,0,0,
    w,w,w,1,w,w^2,0,w^2,1,1,1,1,1,w^2,1,w,0,w,w^2,w^2,w^2,w^2,w^2,w,w^2,1,0,1,w,w,0,0,0,0,0,0,0,0,0,
    w^2,w,0,1,w^2,1,w,1,0,0,1,w^2,0,w,1,w,w^2,w,0,0,w,1,0,w^2,w,w^2,1,w^2,0,0,0,0,0,0,0,0,0,0,0,
    0,1,0,0,1,0,w,0,1,w^2,0,w,0,0,w,0,w^2,0,w,1,0,w^2,0,0,w^2,0,1,0,w^2,w,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,w^2,0,1,w^2,0,1,
    0,1,1,1,w,w,w^2,w^2,1,w^2,0,w^2,w^2,w^2,1,1,w,w,w^2,w,0,w,w,w,w^2,w^2,1,1,w,1,w,w,1,1,1,w^2,w^2,w^2,w,
    0,1,w,1,w^2,1,0,1,1,0,0,w^2,1,w^2,w,w^2,0,w^2,w^2,0,0,w,w^2,w,1,w,0,w,w,0,w^2,w,w^2,w,1,w,1,w^2,1,
    w^2,w^2,w,w^2,0,w^2,w,w,w^2,w^2,1,1,w^2,1,0,1,w^2,w^2,1,1,w,w,1,w,0,w,1,1,w,w,1,w,1,w,w^2,w,w^2,1,w^2,
    1,1,w^2,w,w^2,1,0,w^2,1,w,w,w,1,w^2,1,w,0,1,w,w^2,w^2,w^2,w,1,w,w^2,0,w,w^2,1,w^2,w^2,1,1,1,w,w,w,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=30 div 3;ell2:=9 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [30+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[255]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 39 and Dimension(Q) eq 13;
assert Dimension(HermitianHull(Q)) eq 6;
Table3Parameters[255]:=[39,7,14,20];
Table3DistanceTypes[255]:="exact";

// Table 3, No. 256 | NQ01
// [[39,7,16;22]]_2, distance exact.
Gsrc1:=Matrix(F,12,36,[
    1,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,0,w,1,1,1,w^2,0,w^2,1,0,1,1,w^2,w,w,w,1,w,w,w,w,
    0,1,0,0,0,0,0,0,0,0,0,w^2,0,0,0,1,w,1,w,1,w,w^2,w^2,1,0,w,1,w^2,w^2,0,w,1,1,1,0,0,
    0,0,1,0,0,0,0,0,0,0,0,w,0,w,w^2,w^2,0,1,1,0,w^2,1,1,1,w,w^2,w,1,1,1,1,0,w,w,1,1,
    0,0,0,1,0,0,0,0,0,0,0,w,0,0,0,0,w^2,1,w,1,w^2,1,1,0,1,0,w,0,w^2,w^2,0,w^2,1,0,1,1,
    0,0,0,0,1,0,0,0,0,0,0,1,0,1,1,w^2,1,0,w^2,1,w,w^2,0,1,w^2,0,w^2,w,1,w^2,0,1,w,w,1,0,
    0,0,0,0,0,1,0,0,0,0,0,w^2,0,w^2,1,w,w,w^2,1,0,w,1,w,w^2,0,1,1,0,w^2,1,0,w^2,0,w^2,0,w,
    0,0,0,0,0,0,1,0,0,0,0,w,0,1,w,w,1,w,w,0,1,w^2,0,1,w^2,1,w^2,w,1,1,0,w,1,1,w,w^2,
    0,0,0,0,0,0,0,1,0,0,0,w,0,w^2,1,1,w,w^2,0,1,1,1,0,0,w,w^2,w,w,w,w^2,0,w,0,1,w^2,0,
    0,0,0,0,0,0,0,0,1,0,0,w^2,0,1,1,w^2,1,0,w,1,w,w,w^2,0,w,w^2,0,1,1,0,w^2,w^2,w,0,1,w,
    0,0,0,0,0,0,0,0,0,1,0,w^2,0,0,w^2,w,w^2,0,0,w,w,w^2,0,1,w,w,0,0,w,1,w^2,0,0,1,w^2,0,
    0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,0,w^2,0,0,w^2,w,w^2,0,w,w,w,0,w,w,1,w^2,1,0,1,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,1,w,w^2,1,0,1,w^2,w,w,0,w,w,w,w^2,1,0,0,w^2,0,w,w^2
]);
Gsrc2:=Matrix(F,1,3,[
    1,1,1
]);
W1:=Matrix(F,1,36,[
    1,w,0,w,0,w^2,w,0,1,0,0,1,1,w,0,w,0,w^2,w,0,1,0,0,1,1,w,0,w,0,w^2,w,0,1,0,0,1
]);
W2:=Matrix(F,1,3,[
    1,1,1
]);
lambda:=1;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 36 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,12,39,[
    1,0,0,0,0,0,0,0,0,0,w^2,1,0,1,w^2,w,w,w^2,1,1,1,1,1,1,1,0,0,w^2,w^2,w^2,1,w^2,1,w,1,0,0,0,0,
    0,1,0,0,0,0,0,0,0,0,0,w^2,0,0,0,1,w,1,w,1,w,w^2,w^2,1,0,w,1,w^2,w^2,0,w,1,1,1,0,0,0,0,0,
    0,0,1,0,0,0,0,0,0,0,w^2,w,0,w,w^2,1,0,w^2,1,0,1,0,w^2,1,w^2,w,w^2,1,0,0,w,w,1,w,w,w^2,0,0,0,
    0,0,0,1,0,0,0,0,0,0,1,w,0,0,0,w^2,w^2,w,w,1,0,w^2,w,0,w^2,w,0,0,1,1,1,0,0,0,0,w,0,0,0,
    0,0,0,0,1,0,0,0,0,0,0,1,0,1,1,w^2,1,0,w^2,1,w,w^2,0,1,w^2,0,w^2,w,1,w^2,0,1,w,w,1,0,0,0,0,
    0,0,0,0,0,1,0,0,0,0,w,w^2,0,w^2,1,w^2,w,w,1,0,w^2,w,w^2,w^2,w^2,w,w,0,0,w,w,w,w,w^2,w,w^2,0,0,0,
    0,0,0,0,0,0,1,0,0,0,0,w,0,1,w,w,1,w,w,0,1,w^2,0,1,w^2,1,w^2,w,1,1,0,w,1,1,w,w^2,0,0,0,
    0,0,0,0,0,0,0,1,0,0,w^2,w,0,w^2,1,w^2,w,1,0,1,w^2,0,w,0,w^2,w,w^2,w,w^2,w,w^2,0,w^2,1,0,w,0,0,0,
    0,0,0,0,0,0,0,0,1,0,1,w^2,0,1,1,0,1,w^2,w,1,1,0,0,0,0,1,w,1,w^2,w,w,0,w^2,0,0,1,0,0,0,
    0,0,0,0,0,0,0,0,0,1,w,w^2,0,0,w^2,w^2,w^2,1,0,w,w^2,0,1,1,1,1,w^2,0,1,w,1,1,w,1,1,1,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,1,w,w^2,1,0,1,w^2,w,w,0,w,w,w,w^2,1,0,0,w^2,0,w,w^2,0,0,0,
    1,w,0,w,0,w^2,w,0,1,0,0,1,1,w,0,w,0,w^2,w,0,1,0,0,1,1,w,0,w,0,w^2,w,0,1,0,0,1,1,1,1
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=36 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [36+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[256]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 39 and Dimension(Q) eq 12;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[256]:=[39,7,16,22];
Table3DistanceTypes[256]:="exact";

// Table 3, No. 257 | QB_39_8_14_19
// [[39,8,14;19]]_2, distance exact.
Gsrc1:=Matrix(F,12,33,[
    1,1,0,w,w^2,w,0,w,0,1,w,1,1,0,w,w^2,w,0,w,0,1,w,1,1,0,w,w^2,w,0,w,0,1,w,
    0,0,1,w^2,1,0,w,0,0,1,w,0,0,1,w^2,1,0,w,0,0,1,w,0,0,1,w^2,1,0,w,0,0,1,w,
    1,w,0,0,1,0,1,1,0,w^2,w,1,w,0,0,1,0,1,1,0,w^2,w,1,w,0,0,1,0,1,1,0,w^2,w,
    w,1,0,0,w^2,0,w,0,1,w^2,w,w,1,0,0,w^2,0,w,0,1,w^2,w,w,1,0,0,w^2,0,w,0,1,w^2,w,
    1,w^2,0,w^2,1,1,0,w^2,w^2,1,w^2,w^2,w,0,w,w^2,w^2,0,w,w,w^2,w,w,1,0,1,w,w,0,1,1,w,1,
    w^2,w^2,w,0,w^2,w^2,w^2,0,w^2,w,w^2,w,w,1,0,w,w,w,0,w,1,w,1,1,w^2,0,1,1,1,0,1,w^2,1,
    0,0,0,w^2,w^2,1,w^2,w^2,w,0,w^2,0,0,0,w,w,w^2,w,w,1,0,w,0,0,0,1,1,w,1,1,w^2,0,1,
    w^2,1,0,w,0,0,w,1,w,0,w,w,w^2,0,1,0,0,1,w^2,1,0,1,1,w,0,w^2,0,0,w^2,w,w^2,0,w^2,
    w,w,w^2,0,w,0,w^2,w,0,0,1,w^2,w^2,1,0,w^2,0,1,w^2,0,0,w,1,1,w,0,1,0,w,1,0,0,w^2,
    0,0,1,w,w,1,w,w,w^2,1,1,0,0,w,w^2,w^2,w,w^2,w^2,1,w,w,0,0,w^2,1,1,w^2,1,1,w,w^2,w^2,
    1,0,w,1,1,0,1,1,w^2,1,w,w,0,w^2,w,w,0,w,w,1,w,w^2,w^2,0,1,w^2,w^2,0,w^2,w^2,w,w^2,1,
    w^2,0,w,1,1,w^2,1,w,1,0,1,1,0,w^2,w,w,1,w,w^2,w,0,w,w,0,1,w^2,w^2,w,w^2,1,w^2,0,w^2
]);
Gsrc2:=Matrix(F,4,6,[
    1,w^2,1,w^2,1,w^2,
    w,1,1,w^2,w^2,w,
    w,0,w^2,0,1,0,
    0,1,0,w,0,w^2
]);
W1:=Matrix(F,2,33,[
    1,0,w,1,1,0,1,1,w^2,1,w,w,0,w^2,w,w,0,w,w,1,w,w^2,w^2,0,1,w^2,w^2,0,w^2,w^2,w,w^2,1,
    w^2,0,w,1,1,w^2,1,w,1,0,1,1,0,w^2,w,w,1,w,w^2,w,0,w,w,0,1,w^2,w^2,w,w^2,1,w^2,0,w^2
]);
W2:=Matrix(F,2,6,[
    w,0,w^2,0,1,0,
    0,1,0,w,0,w^2
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 33 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,14,39,[
    1,1,0,w,w^2,w,0,w,0,1,w,1,1,0,w,w^2,w,0,w,0,1,w,1,1,0,w,w^2,w,0,w,0,1,w,0,0,0,0,0,0,
    0,0,1,w^2,1,0,w,0,0,1,w,0,0,1,w^2,1,0,w,0,0,1,w,0,0,1,w^2,1,0,w,0,0,1,w,0,0,0,0,0,0,
    1,w,0,0,1,0,1,1,0,w^2,w,1,w,0,0,1,0,1,1,0,w^2,w,1,w,0,0,1,0,1,1,0,w^2,w,0,0,0,0,0,0,
    w,1,0,0,w^2,0,w,0,1,w^2,w,w,1,0,0,w^2,0,w,0,1,w^2,w,w,1,0,0,w^2,0,w,0,1,w^2,w,0,0,0,0,0,0,
    1,w^2,0,w^2,1,1,0,w^2,w^2,1,w^2,w^2,w,0,w,w^2,w^2,0,w,w,w^2,w,w,1,0,1,w,w,0,1,1,w,1,0,0,0,0,0,0,
    w^2,w^2,w,0,w^2,w^2,w^2,0,w^2,w,w^2,w,w,1,0,w,w,w,0,w,1,w,1,1,w^2,0,1,1,1,0,1,w^2,1,0,0,0,0,0,0,
    0,0,0,w^2,w^2,1,w^2,w^2,w,0,w^2,0,0,0,w,w,w^2,w,w,1,0,w,0,0,0,1,1,w,1,1,w^2,0,1,0,0,0,0,0,0,
    w^2,1,0,w,0,0,w,1,w,0,w,w,w^2,0,1,0,0,1,w^2,1,0,1,1,w,0,w^2,0,0,w^2,w,w^2,0,w^2,0,0,0,0,0,0,
    w,w,w^2,0,w,0,w^2,w,0,0,1,w^2,w^2,1,0,w^2,0,1,w^2,0,0,w,1,1,w,0,1,0,w,1,0,0,w^2,0,0,0,0,0,0,
    0,0,1,w,w,1,w,w,w^2,1,1,0,0,w,w^2,w^2,w,w^2,w^2,1,w,w,0,0,w^2,1,1,w^2,1,1,w,w^2,w^2,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w^2,1,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w^2,w^2,w,
    1,0,w,1,1,0,1,1,w^2,1,w,w,0,w^2,w,w,0,w,w,1,w,w^2,w^2,0,1,w^2,w^2,0,w^2,w^2,w,w^2,1,w,0,w^2,0,1,0,
    w^2,0,w,1,1,w^2,1,w,1,0,1,1,0,w^2,w,w,1,w,w^2,w,0,w,w,0,1,w^2,w^2,w,w^2,1,w^2,0,w^2,0,1,0,w,0,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=33 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [33+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[257]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 39 and Dimension(Q) eq 14;
assert Dimension(HermitianHull(Q)) eq 6;
Table3Parameters[257]:=[39,8,14,19];
Table3DistanceTypes[257]:="exact";

// Table 3, No. 258 | QB_39_8_14_21
// [[39,8,14;21]]_2, distance exact.
Gsrc1:=Matrix(F,12,33,[
    1,1,0,w,w^2,w,0,w,0,1,w,1,1,0,w,w^2,w,0,w,0,1,w,1,1,0,w,w^2,w,0,w,0,1,w,
    0,0,1,w^2,1,0,w,0,0,1,w,0,0,1,w^2,1,0,w,0,0,1,w,0,0,1,w^2,1,0,w,0,0,1,w,
    1,w,0,0,1,0,1,1,0,w^2,w,1,w,0,0,1,0,1,1,0,w^2,w,1,w,0,0,1,0,1,1,0,w^2,w,
    w,1,0,0,w^2,0,w,0,1,w^2,w,w,1,0,0,w^2,0,w,0,1,w^2,w,w,1,0,0,w^2,0,w,0,1,w^2,w,
    1,w^2,0,w^2,1,1,0,w^2,w^2,1,w^2,w^2,w,0,w,w^2,w^2,0,w,w,w^2,w,w,1,0,1,w,w,0,1,1,w,1,
    w^2,w^2,w,0,w^2,w^2,w^2,0,w^2,w,w^2,w,w,1,0,w,w,w,0,w,1,w,1,1,w^2,0,1,1,1,0,1,w^2,1,
    0,0,0,w^2,w^2,1,w^2,w^2,w,0,w^2,0,0,0,w,w,w^2,w,w,1,0,w,0,0,0,1,1,w,1,1,w^2,0,1,
    w^2,1,0,w,0,0,w,1,w,0,w,w,w^2,0,1,0,0,1,w^2,1,0,1,1,w,0,w^2,0,0,w^2,w,w^2,0,w^2,
    w,w,w^2,0,w,0,w^2,w,0,0,1,w^2,w^2,1,0,w^2,0,1,w^2,0,0,w,1,1,w,0,1,0,w,1,0,0,w^2,
    0,0,1,w,w,1,w,w,w^2,1,1,0,0,w,w^2,w^2,w,w^2,w^2,1,w,w,0,0,w^2,1,1,w^2,1,1,w,w^2,w^2,
    1,0,w,1,1,0,1,1,w^2,1,w,w,0,w^2,w,w,0,w,w,1,w,w^2,w^2,0,1,w^2,w^2,0,w^2,w^2,w,w^2,1,
    w^2,0,w,1,1,w^2,1,w,1,0,1,1,0,w^2,w,w,1,w,w^2,w,0,w,w,0,1,w^2,w^2,w,w^2,1,w^2,0,w^2
]);
Gsrc2:=Matrix(F,3,6,[
    w^2,1,w,w^2,1,w,
    0,w^2,0,1,0,w,
    1,0,w,0,w^2,0
]);
W1:=Matrix(F,2,33,[
    1,0,w,1,1,0,1,1,w^2,1,w,w,0,w^2,w,w,0,w,w,1,w,w^2,w^2,0,1,w^2,w^2,0,w^2,w^2,w,w^2,1,
    w^2,0,w,1,1,w^2,1,w,1,0,1,1,0,w^2,w,w,1,w,w^2,w,0,w,w,0,1,w^2,w^2,w,w^2,1,w^2,0,w^2
]);
W2:=Matrix(F,2,6,[
    0,w^2,0,1,0,w,
    1,0,w,0,w^2,0
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 33 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,13,39,[
    1,1,0,w,w^2,w,0,w,0,1,w,1,1,0,w,w^2,w,0,w,0,1,w,1,1,0,w,w^2,w,0,w,0,1,w,0,0,0,0,0,0,
    0,0,1,w^2,1,0,w,0,0,1,w,0,0,1,w^2,1,0,w,0,0,1,w,0,0,1,w^2,1,0,w,0,0,1,w,0,0,0,0,0,0,
    1,w,0,0,1,0,1,1,0,w^2,w,1,w,0,0,1,0,1,1,0,w^2,w,1,w,0,0,1,0,1,1,0,w^2,w,0,0,0,0,0,0,
    w,1,0,0,w^2,0,w,0,1,w^2,w,w,1,0,0,w^2,0,w,0,1,w^2,w,w,1,0,0,w^2,0,w,0,1,w^2,w,0,0,0,0,0,0,
    1,w^2,0,w^2,1,1,0,w^2,w^2,1,w^2,w^2,w,0,w,w^2,w^2,0,w,w,w^2,w,w,1,0,1,w,w,0,1,1,w,1,0,0,0,0,0,0,
    w^2,w^2,w,0,w^2,w^2,w^2,0,w^2,w,w^2,w,w,1,0,w,w,w,0,w,1,w,1,1,w^2,0,1,1,1,0,1,w^2,1,0,0,0,0,0,0,
    0,0,0,w^2,w^2,1,w^2,w^2,w,0,w^2,0,0,0,w,w,w^2,w,w,1,0,w,0,0,0,1,1,w,1,1,w^2,0,1,0,0,0,0,0,0,
    w^2,1,0,w,0,0,w,1,w,0,w,w,w^2,0,1,0,0,1,w^2,1,0,1,1,w,0,w^2,0,0,w^2,w,w^2,0,w^2,0,0,0,0,0,0,
    w,w,w^2,0,w,0,w^2,w,0,0,1,w^2,w^2,1,0,w^2,0,1,w^2,0,0,w,1,1,w,0,1,0,w,1,0,0,w^2,0,0,0,0,0,0,
    0,0,1,w,w,1,w,w,w^2,1,1,0,0,w,w^2,w^2,w,w^2,w^2,1,w,w,0,0,w^2,1,1,w^2,1,1,w,w^2,w^2,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,w^2,1,w,
    1,0,w,1,1,0,1,1,w^2,1,w,w,0,w^2,w,w,0,w,w,1,w,w^2,w^2,0,1,w^2,w^2,0,w^2,w^2,w,w^2,1,0,w^2,0,1,0,w,
    w^2,0,w,1,1,w^2,1,w,1,0,1,1,0,w^2,w,w,1,w,w^2,w,0,w,w,0,1,w^2,w^2,w,w^2,1,w^2,0,w^2,1,0,w,0,w^2,0
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=33 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [33+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[258]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 39 and Dimension(Q) eq 13;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[258]:=[39,8,14,21];
Table3DistanceTypes[258]:="exact";

// Table 3, No. 259 | QB_39_9_14_20
// [[39,9,14;20]]_2, distance exact.
Gsrc1:=Matrix(F,12,33,[
    1,1,0,w,w^2,w,0,w,0,1,w,1,1,0,w,w^2,w,0,w,0,1,w,1,1,0,w,w^2,w,0,w,0,1,w,
    0,0,1,w^2,1,0,w,0,0,1,w,0,0,1,w^2,1,0,w,0,0,1,w,0,0,1,w^2,1,0,w,0,0,1,w,
    w^2,1,0,0,w^2,0,w^2,w^2,0,w,1,w^2,1,0,0,w^2,0,w^2,w^2,0,w,1,w^2,1,0,0,w^2,0,w^2,w^2,0,w,1,
    w^2,w,0,0,1,0,w^2,0,w,1,w^2,w^2,w,0,0,1,0,w^2,0,w,1,w^2,w^2,w,0,0,1,0,w^2,0,w,1,w^2,
    0,1,0,1,0,w^2,w,0,w^2,1,1,0,w^2,0,w^2,0,w,1,0,w,w^2,w^2,0,w,0,w,0,1,w^2,0,1,w,w,
    1,1,0,w,w,1,0,0,0,w^2,w,w^2,w^2,0,1,1,w^2,0,0,0,w,1,w,w,0,w^2,w^2,w,0,0,0,1,w^2,
    w,w,1,0,w,w,w,0,w,1,w,1,1,w^2,0,1,1,1,0,1,w^2,1,w^2,w^2,w,0,w^2,w^2,w^2,0,w^2,w,w^2,
    w^2,0,0,1,w,0,w,w^2,0,1,1,w,0,0,w^2,1,0,1,w,0,w^2,w^2,1,0,0,w,w^2,0,w^2,1,0,w,w,
    w^2,1,w^2,1,0,w,w^2,0,0,0,w,1,w,1,w,0,w^2,1,0,0,0,w^2,w,w^2,w,w^2,0,1,w,0,0,0,1,
    1,0,w^2,0,0,1,0,w^2,1,0,0,w,0,1,0,0,w,0,1,w,0,0,w^2,0,w,0,0,w^2,0,w,w^2,0,0,
    1,w^2,1,1,w,w^2,0,0,0,1,0,w,1,w,w,w^2,1,0,0,0,w,0,w^2,w,w^2,w^2,1,w,0,0,0,w^2,0,
    0,1,w^2,w^2,w,w^2,1,1,0,w,1,0,w,1,1,w^2,1,w,w,0,w^2,w,0,w^2,w,w,1,w,w^2,w^2,0,1,w^2
]);
Gsrc2:=Matrix(F,3,6,[
    w,1,w,1,w,1,
    1,1,w^2,w^2,w,w,
    0,w^2,0,1,0,w
]);
W1:=Matrix(F,1,33,[
    0,1,w^2,w^2,w,w^2,1,1,0,w,1,0,w,1,1,w^2,1,w,w,0,w^2,w,0,w^2,w,w,1,w,w^2,w^2,0,1,w^2
]);
W2:=Matrix(F,1,6,[
    0,w^2,0,1,0,w
]);
lambda:=1;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 33 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,14,39,[
    1,1,0,w,w^2,w,0,w,0,1,w,1,1,0,w,w^2,w,0,w,0,1,w,1,1,0,w,w^2,w,0,w,0,1,w,0,0,0,0,0,0,
    0,0,1,w^2,1,0,w,0,0,1,w,0,0,1,w^2,1,0,w,0,0,1,w,0,0,1,w^2,1,0,w,0,0,1,w,0,0,0,0,0,0,
    w^2,1,0,0,w^2,0,w^2,w^2,0,w,1,w^2,1,0,0,w^2,0,w^2,w^2,0,w,1,w^2,1,0,0,w^2,0,w^2,w^2,0,w,1,0,0,0,0,0,0,
    w^2,w,0,0,1,0,w^2,0,w,1,w^2,w^2,w,0,0,1,0,w^2,0,w,1,w^2,w^2,w,0,0,1,0,w^2,0,w,1,w^2,0,0,0,0,0,0,
    0,1,0,1,0,w^2,w,0,w^2,1,1,0,w^2,0,w^2,0,w,1,0,w,w^2,w^2,0,w,0,w,0,1,w^2,0,1,w,w,0,0,0,0,0,0,
    1,1,0,w,w,1,0,0,0,w^2,w,w^2,w^2,0,1,1,w^2,0,0,0,w,1,w,w,0,w^2,w^2,w,0,0,0,1,w^2,0,0,0,0,0,0,
    w,w,1,0,w,w,w,0,w,1,w,1,1,w^2,0,1,1,1,0,1,w^2,1,w^2,w^2,w,0,w^2,w^2,w^2,0,w^2,w,w^2,0,0,0,0,0,0,
    w^2,0,0,1,w,0,w,w^2,0,1,1,w,0,0,w^2,1,0,1,w,0,w^2,w^2,1,0,0,w,w^2,0,w^2,1,0,w,w,0,0,0,0,0,0,
    w^2,1,w^2,1,0,w,w^2,0,0,0,w,1,w,1,w,0,w^2,1,0,0,0,w^2,w,w^2,w,w^2,0,1,w,0,0,0,1,0,0,0,0,0,0,
    1,0,w^2,0,0,1,0,w^2,1,0,0,w,0,1,0,0,w,0,1,w,0,0,w^2,0,w,0,0,w^2,0,w,w^2,0,0,0,0,0,0,0,0,
    1,w^2,1,1,w,w^2,0,0,0,1,0,w,1,w,w,w^2,1,0,0,0,w,0,w^2,w,w^2,w^2,1,w,0,0,0,w^2,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,w,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w^2,w^2,w,w,
    0,1,w^2,w^2,w,w^2,1,1,0,w,1,0,w,1,1,w^2,1,w,w,0,w^2,w,0,w^2,w,w,1,w,w^2,w^2,0,1,w^2,0,w^2,0,1,0,w
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=33 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [33+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[259]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 39 and Dimension(Q) eq 14;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[259]:=[39,9,14,20];
Table3DistanceTypes[259]:="exact";

// Table 3, No. 260 | QB_39_9_15_22
// [[39,9,15;22]]_2, distance exact.
Gsrc1:=Matrix(F,11,33,[
    w,1,w,1,0,1,w,w^2,1,1,0,w,1,w,1,0,1,w,w^2,1,1,0,w,1,w,1,0,1,w,w^2,1,1,0,
    0,w,w,0,w,w,w^2,w,w^2,w^2,1,0,w,w,0,w,w,w^2,w,w^2,w^2,1,0,w,w,0,w,w,w^2,w,w^2,w^2,1,
    w^2,w^2,w^2,w^2,0,w,0,w,w^2,w,w,w^2,w^2,w^2,w^2,0,w,0,w,w^2,w,w,w^2,w^2,w^2,w^2,0,w,0,w,w^2,w,w,
    1,0,0,1,w^2,0,0,0,w,0,1,1,0,0,1,w^2,0,0,0,w,0,1,1,0,0,1,w^2,0,0,0,w,0,1,
    w^2,w^2,w,w^2,w,w^2,1,0,w^2,0,w,w,w,1,w,1,w,w^2,0,w,0,1,1,1,w^2,1,w^2,1,w,0,1,0,w^2,
    0,1,0,w,w,w,w^2,w^2,1,w,w^2,0,w^2,0,1,1,1,w,w,w^2,1,w,0,w,0,w^2,w^2,w^2,1,1,w,w^2,1,
    w,1,0,0,w^2,w^2,w^2,0,w^2,1,0,1,w^2,0,0,w,w,w,0,w,w^2,0,w^2,w,0,0,1,1,1,0,1,w,0,
    0,0,w,1,1,w,w,0,0,w^2,w,0,0,w^2,w,w,w^2,w^2,0,0,1,w^2,0,0,1,w^2,w^2,1,1,0,0,w,1,
    1,w^2,0,w^2,0,1,1,1,w^2,1,w,w,1,0,1,0,w,w,w,1,w,w^2,w^2,w,0,w,0,w^2,w^2,w^2,w,w^2,1,
    w^2,0,w,0,0,w,0,1,1,w^2,w,1,0,w^2,0,0,w^2,0,w,w,1,w^2,w,0,1,0,0,1,0,w^2,w^2,w,1,
    w,0,w,1,w^2,w^2,w^2,0,w^2,w^2,w^2,w^2,0,w^2,w,1,1,1,0,1,1,1,1,0,1,w^2,w,w,w,0,w,w,w
]);
Gsrc2:=Matrix(F,4,6,[
    1,w^2,1,w^2,1,w^2,
    w,1,1,w^2,w^2,w,
    w,0,w^2,0,1,0,
    0,1,0,w,0,w^2
]);
W1:=Matrix(F,2,33,[
    w^2,0,w,0,0,w,0,1,1,w^2,w,1,0,w^2,0,0,w^2,0,w,w,1,w^2,w,0,1,0,0,1,0,w^2,w^2,w,1,
    w,0,w,1,w^2,w^2,w^2,0,w^2,w^2,w^2,w^2,0,w^2,w,1,1,1,0,1,1,1,1,0,1,w^2,w,w,w,0,w,w,w
]);
W2:=Matrix(F,2,6,[
    w,0,w^2,0,1,0,
    0,1,0,w,0,w^2
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 33 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,13,39,[
    w,1,w,1,0,1,w,w^2,1,1,0,w,1,w,1,0,1,w,w^2,1,1,0,w,1,w,1,0,1,w,w^2,1,1,0,0,0,0,0,0,0,
    0,w,w,0,w,w,w^2,w,w^2,w^2,1,0,w,w,0,w,w,w^2,w,w^2,w^2,1,0,w,w,0,w,w,w^2,w,w^2,w^2,1,0,0,0,0,0,0,
    w^2,w^2,w^2,w^2,0,w,0,w,w^2,w,w,w^2,w^2,w^2,w^2,0,w,0,w,w^2,w,w,w^2,w^2,w^2,w^2,0,w,0,w,w^2,w,w,0,0,0,0,0,0,
    1,0,0,1,w^2,0,0,0,w,0,1,1,0,0,1,w^2,0,0,0,w,0,1,1,0,0,1,w^2,0,0,0,w,0,1,0,0,0,0,0,0,
    w^2,w^2,w,w^2,w,w^2,1,0,w^2,0,w,w,w,1,w,1,w,w^2,0,w,0,1,1,1,w^2,1,w^2,1,w,0,1,0,w^2,0,0,0,0,0,0,
    0,1,0,w,w,w,w^2,w^2,1,w,w^2,0,w^2,0,1,1,1,w,w,w^2,1,w,0,w,0,w^2,w^2,w^2,1,1,w,w^2,1,0,0,0,0,0,0,
    w,1,0,0,w^2,w^2,w^2,0,w^2,1,0,1,w^2,0,0,w,w,w,0,w,w^2,0,w^2,w,0,0,1,1,1,0,1,w,0,0,0,0,0,0,0,
    0,0,w,1,1,w,w,0,0,w^2,w,0,0,w^2,w,w,w^2,w^2,0,0,1,w^2,0,0,1,w^2,w^2,1,1,0,0,w,1,0,0,0,0,0,0,
    1,w^2,0,w^2,0,1,1,1,w^2,1,w,w,1,0,1,0,w,w,w,1,w,w^2,w^2,w,0,w,0,w^2,w^2,w^2,w,w^2,1,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w^2,1,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w^2,w^2,w,
    w^2,0,w,0,0,w,0,1,1,w^2,w,1,0,w^2,0,0,w^2,0,w,w,1,w^2,w,0,1,0,0,1,0,w^2,w^2,w,1,w,0,w^2,0,1,0,
    w,0,w,1,w^2,w^2,w^2,0,w^2,w^2,w^2,w^2,0,w^2,w,1,1,1,0,1,1,1,1,0,1,w^2,w,w,w,0,w,w,w,0,1,0,w,0,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=33 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [33+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[260]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 39 and Dimension(Q) eq 13;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[260]:=[39,9,15,22];
Table3DistanceTypes[260]:="exact";

// Table 3, No. 261 | QB_39_10_14_21
// [[39,10,14;21]]_2, distance exact.
Gsrc1:=Matrix(F,12,33,[
    0,w^2,w,w^2,0,1,0,0,w^2,w,1,0,w^2,w,w^2,0,1,0,0,w^2,w,1,0,w^2,w,w^2,0,1,0,0,w^2,w,1,
    0,0,1,w,1,w^2,w^2,w^2,0,0,w^2,0,0,1,w,1,w^2,w^2,w^2,0,0,w^2,0,0,1,w,1,w^2,w^2,w^2,0,0,w^2,
    w^2,w,1,0,0,0,1,1,w,0,w^2,w^2,w,1,0,0,0,1,1,w,0,w^2,w^2,w,1,0,0,0,1,1,w,0,w^2,
    0,w,1,1,0,w^2,1,w^2,w^2,0,0,0,w,1,1,0,w^2,1,w^2,w^2,0,0,0,w,1,1,0,w^2,1,w^2,w^2,0,0,
    w^2,1,w^2,w,w,1,w,1,1,1,1,w,w^2,w,1,1,w^2,1,w^2,w^2,w^2,w^2,1,w,1,w^2,w^2,w,w^2,w,w,w,w,
    1,w^2,1,w^2,0,w,w,w,0,0,0,w^2,w,w^2,w,0,1,1,1,0,0,0,w,1,w,1,0,w^2,w^2,w^2,0,0,0,
    0,1,w^2,0,1,1,1,w,1,w^2,1,0,w^2,w,0,w^2,w^2,w^2,1,w^2,w,w^2,0,w,1,0,w,w,w,w^2,w,1,w,
    w,0,w^2,w^2,w,0,0,0,1,w^2,w^2,1,0,w,w,1,0,0,0,w^2,w,w,w^2,0,1,1,w^2,0,0,0,w,1,1,
    w^2,0,w^2,1,1,0,1,0,0,w,w,1,0,1,w,w,0,w,0,0,w^2,w^2,w,0,w,w^2,w^2,0,w^2,0,0,1,1,
    w,w,0,w^2,1,1,0,1,0,0,w,w^2,w^2,0,1,w,w,0,w,0,0,w^2,1,1,0,w,w^2,w^2,0,w^2,0,0,1,
    w^2,w^2,w^2,1,w,0,0,0,w^2,1,0,1,1,1,w,w^2,0,0,0,1,w,0,w,w,w,w^2,1,0,0,0,w,w^2,0,
    0,w^2,w^2,w,w^2,1,1,0,w,w^2,1,0,1,1,w^2,1,w,w,0,w^2,1,w,0,w,w,1,w,w^2,w^2,0,1,w,w^2
]);
Gsrc2:=Matrix(F,4,6,[
    1,w^2,1,w^2,1,w^2,
    w,1,1,w^2,w^2,w,
    w,0,w^2,0,1,0,
    0,1,0,w,0,w^2
]);
W1:=Matrix(F,2,33,[
    w^2,w^2,w^2,1,w,0,0,0,w^2,1,0,1,1,1,w,w^2,0,0,0,1,w,0,w,w,w,w^2,1,0,0,0,w,w^2,0,
    0,w^2,w^2,w,w^2,1,1,0,w,w^2,1,0,1,1,w^2,1,w,w,0,w^2,1,w,0,w,w,1,w,w^2,w^2,0,1,w,w^2
]);
W2:=Matrix(F,2,6,[
    w,0,w^2,0,1,0,
    0,1,0,w,0,w^2
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 33 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,14,39,[
    0,w^2,w,w^2,0,1,0,0,w^2,w,1,0,w^2,w,w^2,0,1,0,0,w^2,w,1,0,w^2,w,w^2,0,1,0,0,w^2,w,1,0,0,0,0,0,0,
    0,0,1,w,1,w^2,w^2,w^2,0,0,w^2,0,0,1,w,1,w^2,w^2,w^2,0,0,w^2,0,0,1,w,1,w^2,w^2,w^2,0,0,w^2,0,0,0,0,0,0,
    w^2,w,1,0,0,0,1,1,w,0,w^2,w^2,w,1,0,0,0,1,1,w,0,w^2,w^2,w,1,0,0,0,1,1,w,0,w^2,0,0,0,0,0,0,
    0,w,1,1,0,w^2,1,w^2,w^2,0,0,0,w,1,1,0,w^2,1,w^2,w^2,0,0,0,w,1,1,0,w^2,1,w^2,w^2,0,0,0,0,0,0,0,0,
    w^2,1,w^2,w,w,1,w,1,1,1,1,w,w^2,w,1,1,w^2,1,w^2,w^2,w^2,w^2,1,w,1,w^2,w^2,w,w^2,w,w,w,w,0,0,0,0,0,0,
    1,w^2,1,w^2,0,w,w,w,0,0,0,w^2,w,w^2,w,0,1,1,1,0,0,0,w,1,w,1,0,w^2,w^2,w^2,0,0,0,0,0,0,0,0,0,
    0,1,w^2,0,1,1,1,w,1,w^2,1,0,w^2,w,0,w^2,w^2,w^2,1,w^2,w,w^2,0,w,1,0,w,w,w,w^2,w,1,w,0,0,0,0,0,0,
    w,0,w^2,w^2,w,0,0,0,1,w^2,w^2,1,0,w,w,1,0,0,0,w^2,w,w,w^2,0,1,1,w^2,0,0,0,w,1,1,0,0,0,0,0,0,
    w^2,0,w^2,1,1,0,1,0,0,w,w,1,0,1,w,w,0,w,0,0,w^2,w^2,w,0,w,w^2,w^2,0,w^2,0,0,1,1,0,0,0,0,0,0,
    w,w,0,w^2,1,1,0,1,0,0,w,w^2,w^2,0,1,w,w,0,w,0,0,w^2,1,1,0,w,w^2,w^2,0,w^2,0,0,1,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w^2,1,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w^2,w^2,w,
    w^2,w^2,w^2,1,w,0,0,0,w^2,1,0,1,1,1,w,w^2,0,0,0,1,w,0,w,w,w,w^2,1,0,0,0,w,w^2,0,w,0,w^2,0,1,0,
    0,w^2,w^2,w,w^2,1,1,0,w,w^2,1,0,1,1,w^2,1,w,w,0,w^2,1,w,0,w,w,1,w,w^2,w^2,0,1,w,w^2,0,1,0,w,0,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=33 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [33+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[261]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 39 and Dimension(Q) eq 14;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[261]:=[39,10,14,21];
Table3DistanceTypes[261]:="exact";

// Table 3, No. 262 | QB_42_5_17_21
// [[42,5,17;21]]_2, distance exact.
Gsrc1:=Matrix(F,12,36,[
    1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,
    1,0,0,1,w,w^2,w,w^2,w,1,1,w^2,w,0,0,w,w^2,1,w^2,1,w^2,w,w,1,w^2,0,0,w^2,1,w,1,w,1,w^2,w^2,w,
    0,1,0,w^2,w^2,0,w,0,w^2,1,w,w^2,0,w,0,1,1,0,w^2,0,1,w,w^2,1,0,w^2,0,w,w,0,1,0,w,w^2,1,w,
    0,0,1,w,w^2,w,w^2,w^2,1,1,w^2,w^2,0,0,w,w^2,1,w^2,1,1,w,w,1,1,0,0,w^2,1,w,1,w,w,w^2,w^2,w,w,
    1,w^2,w^2,0,1,1,0,1,0,w,1,w^2,1,w^2,w^2,0,1,1,0,1,0,w,1,w^2,1,w^2,w^2,0,1,1,0,1,0,w,1,w^2,
    0,w^2,w,0,w^2,w,w,w,1,w^2,0,w,0,w^2,w,0,w^2,w,w,w,1,w^2,0,w,0,w^2,w,0,w^2,w,w,w,1,w^2,0,w,
    0,1,1,0,0,w,1,w^2,1,0,1,0,0,1,1,0,0,w,1,w^2,1,0,1,0,0,1,1,0,0,w,1,w^2,1,0,1,0,
    1,w,1,1,w^2,w,w,1,0,w,w,w,w^2,1,w^2,w^2,w,1,1,w^2,0,1,1,1,w,w^2,w,w,1,w^2,w^2,w,0,w^2,w^2,w^2,
    w^2,w^2,1,w^2,0,1,w^2,w,1,w^2,1,w,w,w,w^2,w,0,w^2,w,1,w^2,w,w^2,1,1,1,w,1,0,w,1,w^2,w,1,w,w^2,
    w,w^2,w^2,w,w^2,0,0,0,0,0,1,1,1,w,w,1,w,0,0,0,0,0,w^2,w^2,w^2,1,1,w^2,1,0,0,0,0,0,w,w,
    w^2,w,w^2,w,w^2,1,w^2,w^2,1,0,w^2,w^2,w,1,w,1,w,w^2,w,w,w^2,0,w,w,1,w^2,1,w^2,1,w,1,1,w,0,1,1,
    1,0,0,0,w^2,w,w,0,w,0,w,1,w,0,0,0,1,w^2,w^2,0,w^2,0,w^2,w,w^2,0,0,0,w,1,1,0,1,0,1,w^2
]);
Gsrc2:=Matrix(F,4,6,[
    w^2,1,w^2,1,w^2,1,
    w^2,0,w,0,1,0,
    0,1,0,w^2,0,w,
    w^2,0,1,0,w,0
]);
W1:=Matrix(F,3,36,[
    w,w^2,w^2,w,w^2,0,0,0,0,0,1,1,1,w,w,1,w,0,0,0,0,0,w^2,w^2,w^2,1,1,w^2,1,0,0,0,0,0,w,w,
    w^2,w,w^2,w,w^2,1,w^2,w^2,1,0,w^2,w^2,w,1,w,1,w,w^2,w,w,w^2,0,w,w,1,w^2,1,w^2,1,w,1,1,w,0,1,1,
    1,0,0,0,w^2,w,w,0,w,0,w,1,w,0,0,0,1,w^2,w^2,0,w^2,0,w^2,w,w^2,0,0,0,w,1,1,0,1,0,1,w^2
]);
W2:=Matrix(F,3,6,[
    w^2,0,w,0,1,0,
    0,1,0,w^2,0,w,
    w^2,0,1,0,w,0
]);
lambda:=3;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 36 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,13,42,[
    1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
    1,0,0,1,w,w^2,w,w^2,w,1,1,w^2,w,0,0,w,w^2,1,w^2,1,w^2,w,w,1,w^2,0,0,w^2,1,w,1,w,1,w^2,w^2,w,0,0,0,0,0,0,
    0,1,0,w^2,w^2,0,w,0,w^2,1,w,w^2,0,w,0,1,1,0,w^2,0,1,w,w^2,1,0,w^2,0,w,w,0,1,0,w,w^2,1,w,0,0,0,0,0,0,
    0,0,1,w,w^2,w,w^2,w^2,1,1,w^2,w^2,0,0,w,w^2,1,w^2,1,1,w,w,1,1,0,0,w^2,1,w,1,w,w,w^2,w^2,w,w,0,0,0,0,0,0,
    1,w^2,w^2,0,1,1,0,1,0,w,1,w^2,1,w^2,w^2,0,1,1,0,1,0,w,1,w^2,1,w^2,w^2,0,1,1,0,1,0,w,1,w^2,0,0,0,0,0,0,
    0,w^2,w,0,w^2,w,w,w,1,w^2,0,w,0,w^2,w,0,w^2,w,w,w,1,w^2,0,w,0,w^2,w,0,w^2,w,w,w,1,w^2,0,w,0,0,0,0,0,0,
    0,1,1,0,0,w,1,w^2,1,0,1,0,0,1,1,0,0,w,1,w^2,1,0,1,0,0,1,1,0,0,w,1,w^2,1,0,1,0,0,0,0,0,0,0,
    1,w,1,1,w^2,w,w,1,0,w,w,w,w^2,1,w^2,w^2,w,1,1,w^2,0,1,1,1,w,w^2,w,w,1,w^2,w^2,w,0,w^2,w^2,w^2,0,0,0,0,0,0,
    w^2,w^2,1,w^2,0,1,w^2,w,1,w^2,1,w,w,w,w^2,w,0,w^2,w,1,w^2,w,w^2,1,1,1,w,1,0,w,1,w^2,w,1,w,w^2,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,1,w^2,1,
    w,w^2,w^2,w,w^2,0,0,0,0,0,1,1,1,w,w,1,w,0,0,0,0,0,w^2,w^2,w^2,1,1,w^2,1,0,0,0,0,0,w,w,w^2,0,w,0,1,0,
    w^2,w,w^2,w,w^2,1,w^2,w^2,1,0,w^2,w^2,w,1,w,1,w,w^2,w,w,w^2,0,w,w,1,w^2,1,w^2,1,w,1,1,w,0,1,1,0,1,0,w^2,0,w,
    1,0,0,0,w^2,w,w,0,w,0,w,1,w,0,0,0,1,w^2,w^2,0,w^2,0,w^2,w,w^2,0,0,0,w,1,1,0,1,0,1,w^2,w^2,0,1,0,w,0
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=36 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [36+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[262]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 42 and Dimension(Q) eq 13;
assert Dimension(HermitianHull(Q)) eq 8;
Table3Parameters[262]:=[42,5,17,21];
Table3DistanceTypes[262]:="exact";

// Table 3, No. 263 | QB_42_6_17_22
// [[42,6,17;22]]_2, distance exact.
Gsrc1:=Matrix(F,8,30,[
    1,1,0,1,1,0,w,1,0,1,1,1,0,1,1,0,w,1,0,1,1,1,0,1,1,0,w,1,0,1,
    w,0,w,w,0,w^2,w^2,0,w,w,w,0,w,w,0,w^2,w^2,0,w,w,w,0,w,w,0,w^2,w^2,0,w,w,
    1,w,w^2,w,w,1,1,w^2,0,w^2,w^2,1,w,1,1,w^2,w^2,w,0,w,w,w^2,1,w^2,w^2,w,w,1,0,1,
    w^2,w^2,w,w^2,w,0,w^2,w^2,w^2,1,1,1,w^2,1,w^2,0,1,1,1,w,w,w,1,w,1,0,w,w,w,w^2,
    w,w,1,0,w,0,w^2,1,0,1,w^2,w^2,w,0,w^2,0,1,w,0,w,1,1,w^2,0,1,0,w,w^2,0,w^2,
    w^2,1,0,w^2,w^2,1,0,0,w,w^2,1,w,0,1,1,w,0,0,w^2,1,w,w^2,0,w,w,w^2,0,0,1,w,
    w,w^2,w,w,w,1,1,0,w^2,w,1,w,1,1,1,w^2,w^2,0,w,1,w^2,1,w^2,w^2,w^2,w,w,0,1,w^2,
    1,w^2,1,w^2,1,w,w^2,w^2,w^2,0,w^2,w,w^2,w,w^2,1,w,w,w,0,w,1,w,1,w,w^2,1,1,1,0
]);
Gsrc2:=Matrix(F,7,12,[
    w^2,w,w,w^2,w^2,w,w,w^2,w^2,w,w,w^2,
    w^2,w,w^2,1,w^2,w,w^2,1,w^2,w,w^2,1,
    w^2,w,w,w^2,w,1,1,w,1,w^2,w^2,1,
    0,w,w^2,0,0,w^2,1,0,0,1,w,0,
    1,0,0,w^2,w,0,0,1,w^2,0,0,w,
    1,0,w,w,w^2,0,1,1,w,0,w^2,w^2,
    w^2,1,0,1,w,w^2,0,w^2,1,w,0,w
]);
W1:=Matrix(F,2,30,[
    w,w^2,w,w,w,1,1,0,w^2,w,1,w,1,1,1,w^2,w^2,0,w,1,w^2,1,w^2,w^2,w^2,w,w,0,1,w^2,
    1,w^2,1,w^2,1,w,w^2,w^2,w^2,0,w^2,w,w^2,w,w^2,1,w,w,w,0,w,1,w,1,w,w^2,1,1,1,0
]);
W2:=Matrix(F,2,12,[
    1,0,w,w,w^2,0,1,1,w,0,w^2,w^2,
    w^2,1,0,1,w,w^2,0,w^2,1,w,0,w
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 30 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 12;
GX4:=Matrix(F,13,42,[
    1,1,0,1,1,0,w,1,0,1,1,1,0,1,1,0,w,1,0,1,1,1,0,1,1,0,w,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,
    w,0,w,w,0,w^2,w^2,0,w,w,w,0,w,w,0,w^2,w^2,0,w,w,w,0,w,w,0,w^2,w^2,0,w,w,0,0,0,0,0,0,0,0,0,0,0,0,
    1,w,w^2,w,w,1,1,w^2,0,w^2,w^2,1,w,1,1,w^2,w^2,w,0,w,w,w^2,1,w^2,w^2,w,w,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,
    w^2,w^2,w,w^2,w,0,w^2,w^2,w^2,1,1,1,w^2,1,w^2,0,1,1,1,w,w,w,1,w,1,0,w,w,w,w^2,0,0,0,0,0,0,0,0,0,0,0,0,
    w,w,1,0,w,0,w^2,1,0,1,w^2,w^2,w,0,w^2,0,1,w,0,w,1,1,w^2,0,1,0,w,w^2,0,w^2,0,0,0,0,0,0,0,0,0,0,0,0,
    w^2,1,0,w^2,w^2,1,0,0,w,w^2,1,w,0,1,1,w,0,0,w^2,1,w,w^2,0,w,w,w^2,0,0,1,w,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w,w^2,w^2,w,w,w^2,w^2,w,w,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,1,w^2,w,w^2,1,w^2,w,w^2,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w,w^2,w,1,1,w,1,w^2,w^2,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,0,0,w^2,1,0,0,1,w,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,w,0,0,1,w^2,0,0,w,
    w,w^2,w,w,w,1,1,0,w^2,w,1,w,1,1,1,w^2,w^2,0,w,1,w^2,1,w^2,w^2,w^2,w,w,0,1,w^2,1,0,w,w,w^2,0,1,1,w,0,w^2,w^2,
    1,w^2,1,w^2,1,w,w^2,w^2,w^2,0,w^2,w,w^2,w,w^2,1,w,w,w,0,w,1,w,1,w,w^2,1,1,1,0,w^2,1,0,1,w,w^2,0,w^2,1,w,0,w
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=30 div 3;ell2:=12 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [30+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[263]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 42 and Dimension(Q) eq 13;
assert Dimension(HermitianHull(Q)) eq 7;
Table3Parameters[263]:=[42,6,17,22];
Table3DistanceTypes[263]:="exact";

// Table 3, No. 264 | QP_42_7_14_17
// [[42,7,14;17]]_2, distance exact.
Gsrc1:=Matrix(F,8,12,[
    1,0,0,w^2,1,0,0,w^2,1,0,0,w^2,
    0,1,w,0,0,1,w,0,0,1,w,0,
    1,w,w^2,w,w^2,1,w,1,w,w^2,1,w^2,
    1,w^2,w^2,w,w,1,1,w^2,w^2,w,w,1,
    w,1,0,w,1,w^2,0,1,w^2,w,0,w^2,
    w^2,w^2,0,w,w,w,0,1,1,1,0,w^2,
    w,w,0,w,w^2,w^2,0,w^2,1,1,0,1,
    w,w^2,0,1,w^2,1,0,w,1,w,0,w^2
]);
Gsrc2:=Matrix(F,12,30,[
    0,0,0,1,0,w^2,1,0,w^2,0,0,0,0,w,0,1,w,0,1,0,0,0,0,w^2,0,w,w^2,0,w,0,
    1,0,1,1,0,1,w,0,w^2,1,1,0,1,1,0,1,w,0,w^2,1,1,0,1,1,0,1,w,0,w^2,1,
    w^2,0,0,1,w^2,1,0,1,w^2,w,w^2,0,0,1,w^2,1,0,1,w^2,w,w^2,0,0,1,w^2,1,0,1,w^2,w,
    w,w,w^2,w^2,0,1,w^2,w^2,w,w,w,w,w^2,w^2,0,1,w^2,w^2,w,w,w,w,w^2,w^2,0,1,w^2,w^2,w,w,
    1,1,0,w^2,w^2,1,0,0,1,1,1,1,0,w^2,w^2,1,0,0,1,1,1,1,0,w^2,w^2,1,0,0,1,1,
    1,w,w,1,1,w^2,w^2,w,0,1,w^2,1,1,w^2,w^2,w,w,1,0,w^2,w,w^2,w^2,w,w,1,1,w^2,0,w,
    w,w,w^2,w^2,w,w^2,w^2,1,0,w^2,1,1,w,w,1,w,w,w^2,0,w,w^2,w^2,1,1,w^2,1,1,w,0,1,
    1,w,w^2,0,0,0,w,1,1,w,w,w^2,1,0,0,0,w^2,w,w,w^2,w^2,1,w,0,0,0,1,w^2,w^2,1,
    w^2,w^2,w,w^2,w,w,w^2,1,w^2,0,w,w,1,w,1,1,w,w^2,w,0,1,1,w^2,1,w^2,w^2,1,w,1,0,
    w,w^2,1,w^2,w^2,w,1,w^2,1,0,1,w,w^2,w,w,1,w^2,w,w^2,0,w^2,1,w,1,1,w^2,w,1,w,0,
    1,1,0,0,w^2,0,w^2,1,w,1,w,w,0,0,1,0,1,w,w^2,w,w^2,w^2,0,0,w,0,w,w^2,1,w^2,
    w^2,w,1,w,w^2,0,w^2,w,w^2,1,1,w^2,w,w^2,1,0,1,w^2,1,w,w,1,w^2,1,w,0,w,1,w,w^2
]);
W1:=Matrix(F,4,12,[
    w,1,0,w,1,w^2,0,1,w^2,w,0,w^2,
    w^2,w^2,0,w,w,w,0,1,1,1,0,w^2,
    w,w,0,w,w^2,w^2,0,w^2,1,1,0,1,
    w,w^2,0,1,w^2,1,0,w,1,w,0,w^2
]);
W2:=Matrix(F,4,30,[
    w^2,w^2,w,w^2,w,w,w^2,1,w^2,0,w,w,1,w,1,1,w,w^2,w,0,1,1,w^2,1,w^2,w^2,1,w,1,0,
    w,w^2,1,w^2,w^2,w,1,w^2,1,0,1,w,w^2,w,w,1,w^2,w,w^2,0,w^2,1,w,1,1,w^2,w,1,w,0,
    1,1,0,0,w^2,0,w^2,1,w,1,w,w,0,0,1,0,1,w,w^2,w,w^2,w^2,0,0,w,0,w,w^2,1,w^2,
    w^2,w,1,w,w^2,0,w^2,w,w^2,1,1,w^2,w,w^2,1,0,1,w^2,1,w,w,1,w^2,1,w,0,w,1,w,w^2
]);
lambda:=4;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 12 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 30;
GX4:=Matrix(F,16,42,[
    1,0,0,w^2,1,0,0,w^2,1,0,0,w^2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,1,w,0,0,1,w,0,0,1,w,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    1,w,w^2,w,w^2,1,w,1,w,w^2,1,w^2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    1,w^2,w^2,w,w,1,1,w^2,w^2,w,w,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,1,0,w^2,0,0,0,0,w,0,1,w,0,1,0,0,0,0,w^2,0,w,w^2,0,w,0,
    0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,0,1,w,0,w^2,1,1,0,1,1,0,1,w,0,w^2,1,1,0,1,1,0,1,w,0,w^2,1,
    0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,1,w^2,1,0,1,w^2,w,w^2,0,0,1,w^2,1,0,1,w^2,w,w^2,0,0,1,w^2,1,0,1,w^2,w,
    0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,w^2,0,1,w^2,w^2,w,w,w,w,w^2,w^2,0,1,w^2,w^2,w,w,w,w,w^2,w^2,0,1,w^2,w^2,w,w,
    0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,w^2,w^2,1,0,0,1,1,1,1,0,w^2,w^2,1,0,0,1,1,1,1,0,w^2,w^2,1,0,0,1,1,
    0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,1,1,w^2,w^2,w,0,1,w^2,1,1,w^2,w^2,w,w,1,0,w^2,w,w^2,w^2,w,w,1,1,w^2,0,w,
    0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,w^2,w,w^2,w^2,1,0,w^2,1,1,w,w,1,w,w,w^2,0,w,w^2,w^2,1,1,w^2,1,1,w,0,1,
    0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,0,0,w,1,1,w,w,w^2,1,0,0,0,w^2,w,w,w^2,w^2,1,w,0,0,0,1,w^2,w^2,1,
    w,1,0,w,1,w^2,0,1,w^2,w,0,w^2,w^2,w^2,w,w^2,w,w,w^2,1,w^2,0,w,w,1,w,1,1,w,w^2,w,0,1,1,w^2,1,w^2,w^2,1,w,1,0,
    w^2,w^2,0,w,w,w,0,1,1,1,0,w^2,w,w^2,1,w^2,w^2,w,1,w^2,1,0,1,w,w^2,w,w,1,w^2,w,w^2,0,w^2,1,w,1,1,w^2,w,1,w,0,
    w,w,0,w,w^2,w^2,0,w^2,1,1,0,1,1,1,0,0,w^2,0,w^2,1,w,1,w,w,0,0,1,0,1,w,w^2,w,w^2,w^2,0,0,w,0,w,w^2,1,w^2,
    w,w^2,0,1,w^2,1,0,w,1,w,0,w^2,w^2,w,1,w,w^2,0,w^2,w,w^2,1,1,w^2,w,w^2,1,0,1,w^2,1,w,w,1,w^2,1,w,0,w,1,w,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=12 div 3;ell2:=30 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [12+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[264]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 42 and Dimension(Q) eq 16;
assert Dimension(HermitianHull(Q)) eq 9;
Table3Parameters[264]:=[42,7,14,17];
Table3DistanceTypes[264]:="exact";

// Table 3, No. 265 | QB_42_7_14_19
// [[42,7,14;19]]_2, distance exact.
Gsrc1:=Matrix(F,12,30,[
    1,1,1,1,w,w,w,w,0,0,1,1,1,1,w,w,w,w,0,0,1,1,1,1,w,w,w,w,0,0,
    1,w,w,0,w^2,1,1,1,w,w^2,1,w,w,0,w^2,1,1,1,w,w^2,1,w,w,0,w^2,1,1,1,w,w^2,
    1,0,w^2,0,w^2,w,1,w^2,w^2,0,1,0,w^2,0,w^2,w,1,w^2,w^2,0,1,0,w^2,0,w^2,w,1,w^2,w^2,0,
    w,1,0,0,w^2,0,w,0,w^2,0,w,1,0,0,w^2,0,w,0,w^2,0,w,1,0,0,w^2,0,w,0,w^2,0,
    1,w,w,1,1,1,w^2,1,0,1,w^2,1,1,w^2,w^2,w^2,w,w^2,0,w^2,w,w^2,w^2,w,w,w,1,w,0,w,
    w,w,w,1,w,w^2,0,w^2,1,1,1,1,1,w^2,1,w,0,w,w^2,w^2,w^2,w^2,w^2,w,w^2,1,0,1,w,w,
    w^2,w,0,1,w^2,1,w,1,0,0,1,w^2,0,w,1,w,w^2,w,0,0,w,1,0,w^2,w,w^2,1,w^2,0,0,
    0,1,0,0,1,0,w,0,1,w^2,0,w,0,0,w,0,w^2,0,w,1,0,w^2,0,0,w^2,0,1,0,w^2,w,
    0,1,1,1,w,w,w^2,w^2,1,w^2,0,w^2,w^2,w^2,1,1,w,w,w^2,w,0,w,w,w,w^2,w^2,1,1,w,1,
    0,1,w,1,w^2,1,0,1,1,0,0,w^2,1,w^2,w,w^2,0,w^2,w^2,0,0,w,w^2,w,1,w,0,w,w,0,
    w^2,w^2,w,w^2,0,w^2,w,w,w^2,w^2,1,1,w^2,1,0,1,w^2,w^2,1,1,w,w,1,w,0,w,1,1,w,w,
    1,1,w^2,w,w^2,1,0,w^2,1,w,w,w,1,w^2,1,w,0,1,w,w^2,w^2,w^2,w,1,w,w^2,0,w,w^2,1
]);
Gsrc2:=Matrix(F,7,12,[
    w^2,w,1,w,w^2,w,1,w,w^2,w,1,w,
    w,1,w,w^2,1,w^2,1,w,w^2,w,w^2,1,
    1,w,1,w^2,w,w^2,w,1,w^2,1,w^2,w,
    0,w^2,w^2,w^2,0,w,w,w,0,1,1,1,
    w^2,0,w,w,w,0,1,1,1,0,w^2,w^2,
    w,1,1,0,w^2,w,w,0,1,w^2,w^2,0,
    w^2,w^2,1,0,1,1,w,0,w,w,w^2,0
]);
W1:=Matrix(F,4,30,[
    0,1,1,1,w,w,w^2,w^2,1,w^2,0,w^2,w^2,w^2,1,1,w,w,w^2,w,0,w,w,w,w^2,w^2,1,1,w,1,
    0,1,w,1,w^2,1,0,1,1,0,0,w^2,1,w^2,w,w^2,0,w^2,w^2,0,0,w,w^2,w,1,w,0,w,w,0,
    w^2,w^2,w,w^2,0,w^2,w,w,w^2,w^2,1,1,w^2,1,0,1,w^2,w^2,1,1,w,w,1,w,0,w,1,1,w,w,
    1,1,w^2,w,w^2,1,0,w^2,1,w,w,w,1,w^2,1,w,0,1,w,w^2,w^2,w^2,w,1,w,w^2,0,w,w^2,1
]);
W2:=Matrix(F,4,12,[
    0,w^2,w^2,w^2,0,w,w,w,0,1,1,1,
    w^2,0,w,w,w,0,1,1,1,0,w^2,w^2,
    w,1,1,0,w^2,w,w,0,1,w^2,w^2,0,
    w^2,w^2,1,0,1,1,w,0,w,w,w^2,0
]);
lambda:=4;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 30 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 12;
GX4:=Matrix(F,15,42,[
    1,1,1,1,w,w,w,w,0,0,1,1,1,1,w,w,w,w,0,0,1,1,1,1,w,w,w,w,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    1,w,w,0,w^2,1,1,1,w,w^2,1,w,w,0,w^2,1,1,1,w,w^2,1,w,w,0,w^2,1,1,1,w,w^2,0,0,0,0,0,0,0,0,0,0,0,0,
    1,0,w^2,0,w^2,w,1,w^2,w^2,0,1,0,w^2,0,w^2,w,1,w^2,w^2,0,1,0,w^2,0,w^2,w,1,w^2,w^2,0,0,0,0,0,0,0,0,0,0,0,0,0,
    w,1,0,0,w^2,0,w,0,w^2,0,w,1,0,0,w^2,0,w,0,w^2,0,w,1,0,0,w^2,0,w,0,w^2,0,0,0,0,0,0,0,0,0,0,0,0,0,
    1,w,w,1,1,1,w^2,1,0,1,w^2,1,1,w^2,w^2,w^2,w,w^2,0,w^2,w,w^2,w^2,w,w,w,1,w,0,w,0,0,0,0,0,0,0,0,0,0,0,0,
    w,w,w,1,w,w^2,0,w^2,1,1,1,1,1,w^2,1,w,0,w,w^2,w^2,w^2,w^2,w^2,w,w^2,1,0,1,w,w,0,0,0,0,0,0,0,0,0,0,0,0,
    w^2,w,0,1,w^2,1,w,1,0,0,1,w^2,0,w,1,w,w^2,w,0,0,w,1,0,w^2,w,w^2,1,w^2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,1,0,0,1,0,w,0,1,w^2,0,w,0,0,w,0,w^2,0,w,1,0,w^2,0,0,w^2,0,1,0,w^2,w,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,1,w,w^2,w,1,w,w^2,w,1,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,w^2,1,w^2,1,w,w^2,w,w^2,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w^2,w,w^2,w,1,w^2,1,w^2,w,
    0,1,1,1,w,w,w^2,w^2,1,w^2,0,w^2,w^2,w^2,1,1,w,w,w^2,w,0,w,w,w,w^2,w^2,1,1,w,1,0,w^2,w^2,w^2,0,w,w,w,0,1,1,1,
    0,1,w,1,w^2,1,0,1,1,0,0,w^2,1,w^2,w,w^2,0,w^2,w^2,0,0,w,w^2,w,1,w,0,w,w,0,w^2,0,w,w,w,0,1,1,1,0,w^2,w^2,
    w^2,w^2,w,w^2,0,w^2,w,w,w^2,w^2,1,1,w^2,1,0,1,w^2,w^2,1,1,w,w,1,w,0,w,1,1,w,w,w,1,1,0,w^2,w,w,0,1,w^2,w^2,0,
    1,1,w^2,w,w^2,1,0,w^2,1,w,w,w,1,w^2,1,w,0,1,w,w^2,w^2,w^2,w,1,w,w^2,0,w,w^2,1,w^2,w^2,1,0,1,1,w,0,w,w,w^2,0
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=30 div 3;ell2:=12 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [30+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[265]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 42 and Dimension(Q) eq 15;
assert Dimension(HermitianHull(Q)) eq 8;
Table3Parameters[265]:=[42,7,14,19];
Table3DistanceTypes[265]:="exact";

// Table 3, No. 266 | SQ12
// [[42,8,15;20]]_2, distance exact.
Gsrc1:=Matrix(F,15,39,[
    1,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,0,0,1,1,w,w^2,w,w,w,w,w,0,1,1,w^2,w^2,w,1,0,w^2,w^2,w^2,0,
    0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,0,w^2,w,w^2,w,0,0,w,w,w^2,w,1,1,w,w^2,0,0,0,0,w,1,1,
    0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,w^2,1,0,0,w,1,w^2,1,w,w^2,0,w^2,w,1,w^2,1,1,0,1,
    0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,w,w^2,1,0,w,w^2,1,1,w,w,w^2,w,0,1,w^2,w^2,w,w,w^2,0,0,
    0,0,0,0,1,0,0,0,0,0,0,0,0,w,0,0,w^2,0,1,w,w,w,0,1,1,w^2,1,0,1,0,w,0,0,1,0,1,w,1,w^2,
    0,0,0,0,0,1,0,0,0,0,0,0,0,w,0,0,w,0,w,w^2,w,w,0,0,w,w,0,w^2,0,w^2,0,w^2,0,w,0,1,w,0,w^2,
    0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,0,0,w,0,1,1,1,w^2,w^2,1,w^2,w^2,1,1,w^2,w,0,0,w^2,w^2,1,w,0,0,w,
    0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,w^2,0,w^2,w^2,w^2,1,w,w^2,w^2,1,w^2,w,0,0,w^2,0,1,0,1,w,0,1,w^2,
    0,0,0,0,0,0,0,0,1,0,0,0,0,w,0,1,0,0,0,1,w,1,0,0,w,0,w,1,0,w^2,w,0,w^2,w^2,w^2,0,w^2,0,0,
    0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w,0,0,w,1,w,1,w^2,w,0,w,1,1,w,0,0,w,0,1,0,0,1,w,
    0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,w^2,0,0,1,1,0,1,w,w^2,w,w^2,w,w^2,0,w,1,w,1,0,w^2,w^2,0,1,1,
    0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,w^2,0,0,w,1,w^2,0,w^2,0,w^2,w^2,0,w,w^2,0,w,w,w,0,1,w,w,w,
    0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,0,0,0,0,w^2,0,w,1,0,w,w,0,1,w^2,w^2,1,w,w,0,w^2,0,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,0,1,w,1,0,0,0,0,0,1,1,w^2,1,w^2,w,w^2,1,0,0,0,0,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,1,1,w,w^2,w^2,1,1,w,w,0,w^2,w,w,w^2,1,w,0,0,0
]);
Gsrc2:=Matrix(F,2,3,[
    1,0,1,
    0,1,1
]);
W1:=Matrix(F,2,39,[
    w,w^2,w,w,w^2,w,1,w^2,w^2,1,0,0,1,1,0,w,w^2,1,w,w^2,w,w^2,1,0,w^2,w,w^2,w^2,0,1,w,0,w,1,0,0,0,w^2,w^2,
    w^2,w^2,0,1,w,0,w,1,0,0,0,w^2,w^2,w,w^2,w,w,w^2,w,1,w^2,w^2,1,0,0,1,1,0,w,w^2,1,w,w^2,w,w^2,1,0,w^2,w
]);
W2:=Matrix(F,2,3,[
    0,1,1,
    1,0,1
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 39 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,15,42,[
    1,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,0,w,0,1,w^2,w,w,w,w,1,w^2,w^2,w,1,w,0,w,0,w^2,w^2,w^2,w^2,0,0,0,
    0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,1,1,0,0,w^2,1,w^2,0,0,0,1,0,0,w,0,0,w,w^2,w,1,0,0,0,0,
    0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,w,w^2,0,w^2,w^2,1,w^2,w^2,0,w^2,w,w,w,w,w,1,1,w,1,0,0,0,0,0,
    0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,1,w^2,1,w,0,0,w,w,1,w,0,w^2,1,0,w^2,w^2,w,0,w^2,w^2,0,1,w^2,0,1,0,0,0,
    0,0,0,0,1,0,0,0,0,0,0,0,0,w,0,0,w^2,w,w,w^2,0,0,w^2,0,0,1,w^2,w^2,w,0,w^2,w^2,w^2,0,w,w,w,1,w^2,0,0,0,
    0,0,0,0,0,1,0,0,0,0,0,0,0,w,w^2,w,1,0,1,w,1,w,0,0,w,w,w^2,0,w,0,w,w,w,1,0,1,w,0,0,0,0,0,
    0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,w,1,0,0,w^2,w,w^2,w^2,w^2,1,w^2,w^2,w^2,w^2,w,0,1,w^2,w,1,1,w,0,0,0,0,0,0,
    0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,w^2,w,0,w,1,w^2,1,w,w,w^2,1,1,w^2,0,w,w^2,w,1,w^2,1,0,1,w^2,0,0,0,
    0,0,0,0,0,0,0,0,1,0,0,0,0,w,w^2,w^2,w^2,0,w^2,0,1,1,0,0,w,0,1,w,w,0,0,1,1,0,w^2,0,w^2,0,w^2,0,0,0,
    0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,1,1,1,1,0,w^2,w^2,w^2,0,1,1,0,0,1,1,1,w^2,w,0,0,w,0,1,1,0,0,0,
    0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,w^2,1,w^2,w,1,1,1,w^2,1,w,w^2,1,w^2,w^2,1,1,w,0,0,w,1,0,0,1,w,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w^2,0,w,0,w,0,1,w^2,w,1,1,w,0,w^2,0,w^2,0,w^2,0,w,w,w,w,1,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,1,w,w,0,0,1,1,w^2,w^2,0,w,w^2,w,1,w,0,1,0,0,0,w^2,w^2,0,0,0,0,0,
    w,w^2,w,w,w^2,w,1,w^2,w^2,1,0,0,1,1,0,w,w^2,1,w,w^2,w,w^2,1,0,w^2,w,w^2,w^2,0,1,w,0,w,1,0,0,0,w^2,w^2,0,1,1,
    w^2,w^2,0,1,w,0,w,1,0,0,0,w^2,w^2,w,w^2,w,w,w^2,w,1,w^2,w^2,1,0,0,1,1,0,w,w^2,1,w,w^2,w,w^2,1,0,w^2,w,1,0,1
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=39 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [39+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[266]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 42 and Dimension(Q) eq 15;
assert Dimension(HermitianHull(Q)) eq 7;
Table3Parameters[266]:=[42,8,15,20];
Table3DistanceTypes[266]:="exact";

// Table 3, No. 267 | QD_45_1_17_16
// [[45,1,17;16]]_2, distance exact.
Gsrc1:=Matrix(F,9,27,[
    0,0,0,0,1,w^2,w^2,1,0,0,0,0,0,1,w^2,w^2,1,0,0,0,0,0,1,w^2,w^2,1,0,
    1,0,1,1,w^2,0,w^2,0,w,w,0,w,w,1,0,1,0,w^2,w^2,0,w^2,w^2,w,0,w,0,1,
    0,1,w^2,w,w^2,w^2,w,w^2,1,0,w,1,w^2,1,1,w^2,1,w,0,w^2,w,1,w,w,1,w,w^2,
    w,1,1,w,0,0,w,w^2,1,w,1,1,w,0,0,w,w^2,1,w,1,1,w,0,0,w,w^2,1,
    w,1,1,w,1,0,w^2,0,w,w,1,1,w,1,0,w^2,0,w,w,1,1,w,1,0,w^2,0,w,
    w,1,w,1,w^2,1,1,w^2,w,1,w^2,1,w^2,w,w^2,w^2,w,1,w^2,w,w^2,w,1,w,w,1,w^2,
    w,w,w^2,w,1,w^2,w,0,0,1,1,w,1,w^2,w,1,0,0,w^2,w^2,1,w^2,w,1,w^2,0,0,
    1,w,w,w^2,w^2,w,1,w,w^2,w^2,1,1,w,w,1,w^2,1,w,w,w^2,w^2,1,1,w^2,w,w^2,1,
    w,1,w,w,w,1,0,0,w,1,w^2,1,1,1,w^2,0,0,1,w^2,w,w^2,w^2,w^2,w,0,0,w^2
]);
Gsrc2:=Matrix(F,11,18,[
    1,w^2,w,w,w^2,w^2,1,w^2,w,w,w^2,w^2,1,w^2,w,w,w^2,w^2,
    w^2,w,w,w^2,w^2,1,w^2,w,w,w^2,w^2,1,w^2,w,w,w^2,w^2,1,
    w,w^2,w,w,w,w,1,w,1,1,1,1,w^2,1,w^2,w^2,w^2,w^2,
    w,w^2,0,w,0,1,w^2,1,0,w^2,0,w,1,w,0,1,0,w^2,
    w,w^2,1,1,1,w^2,w^2,1,w,w,w,1,1,w,w^2,w^2,w^2,w,
    1,w^2,w^2,1,w,1,w,1,1,w,w^2,w,w^2,w,w,w^2,1,w^2,
    w,w,w^2,0,w^2,1,w,w,w^2,0,w^2,1,w,w,w^2,0,w^2,1,
    0,w^2,0,1,w^2,0,0,w,0,w^2,w,0,0,1,0,w,1,0,
    1,1,1,w,0,1,w^2,w^2,w^2,1,0,w^2,w,w,w,w^2,0,w,
    w,w,0,1,1,w^2,1,1,0,w^2,w^2,w,w^2,w^2,0,w,w,1,
    w^2,0,w,0,0,1,w,0,1,0,0,w^2,1,0,w^2,0,0,w
]);
W1:=Matrix(F,5,27,[
    w,1,1,w,1,0,w^2,0,w,w,1,1,w,1,0,w^2,0,w,w,1,1,w,1,0,w^2,0,w,
    w,1,w,1,w^2,1,1,w^2,w,1,w^2,1,w^2,w,w^2,w^2,w,1,w^2,w,w^2,w,1,w,w,1,w^2,
    w,w,w^2,w,1,w^2,w,0,0,1,1,w,1,w^2,w,1,0,0,w^2,w^2,1,w^2,w,1,w^2,0,0,
    1,w,w,w^2,w^2,w,1,w,w^2,w^2,1,1,w,w,1,w^2,1,w,w,w^2,w^2,1,1,w^2,w,w^2,1,
    w,1,w,w,w,1,0,0,w,1,w^2,1,1,1,w^2,0,0,1,w^2,w,w^2,w^2,w^2,w,0,0,w^2
]);
W2:=Matrix(F,5,18,[
    w,w,w^2,0,w^2,1,w,w,w^2,0,w^2,1,w,w,w^2,0,w^2,1,
    0,w^2,0,1,w^2,0,0,w,0,w^2,w,0,0,1,0,w,1,0,
    1,1,1,w,0,1,w^2,w^2,w^2,1,0,w^2,w,w,w,w^2,0,w,
    w,w,0,1,1,w^2,1,1,0,w^2,w^2,w,w^2,w^2,0,w,w,1,
    w^2,0,w,0,0,1,w,0,1,0,0,w^2,1,0,w^2,0,0,w
]);
lambda:=5;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 27 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 18;
GX4:=Matrix(F,15,45,[
    0,0,0,0,1,w^2,w^2,1,0,0,0,0,0,1,w^2,w^2,1,0,0,0,0,0,1,w^2,w^2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    1,0,1,1,w^2,0,w^2,0,w,w,0,w,w,1,0,1,0,w^2,w^2,0,w^2,w^2,w,0,w,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,1,w^2,w,w^2,w^2,w,w^2,1,0,w,1,w^2,1,1,w^2,1,w,0,w^2,w,1,w,w,1,w,w^2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    w,1,1,w,0,0,w,w^2,1,w,1,1,w,0,0,w,w^2,1,w,1,1,w,0,0,w,w^2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,w,w^2,w^2,1,w^2,w,w,w^2,w^2,1,w^2,w,w,w^2,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w,w^2,w^2,1,w^2,w,w,w^2,w^2,1,w^2,w,w,w^2,w^2,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w,w,w,w,1,w,1,1,1,1,w^2,1,w^2,w^2,w^2,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,0,w,0,1,w^2,1,0,w^2,0,w,1,w,0,1,0,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,1,1,w^2,w^2,1,w,w,w,1,1,w,w^2,w^2,w^2,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,1,w,1,w,1,1,w,w^2,w,w^2,w,w,w^2,1,w^2,
    w,1,1,w,1,0,w^2,0,w,w,1,1,w,1,0,w^2,0,w,w,1,1,w,1,0,w^2,0,w,w,w,w^2,0,w^2,1,w,w,w^2,0,w^2,1,w,w,w^2,0,w^2,1,
    w,1,w,1,w^2,1,1,w^2,w,1,w^2,1,w^2,w,w^2,w^2,w,1,w^2,w,w^2,w,1,w,w,1,w^2,0,w^2,0,1,w^2,0,0,w,0,w^2,w,0,0,1,0,w,1,0,
    w,w,w^2,w,1,w^2,w,0,0,1,1,w,1,w^2,w,1,0,0,w^2,w^2,1,w^2,w,1,w^2,0,0,1,1,1,w,0,1,w^2,w^2,w^2,1,0,w^2,w,w,w,w^2,0,w,
    1,w,w,w^2,w^2,w,1,w,w^2,w^2,1,1,w,w,1,w^2,1,w,w,w^2,w^2,1,1,w^2,w,w^2,1,w,w,0,1,1,w^2,1,1,0,w^2,w^2,w,w^2,w^2,0,w,w,1,
    w,1,w,w,w,1,0,0,w,1,w^2,1,1,1,w^2,0,0,1,w^2,w,w^2,w^2,w^2,w,0,0,w^2,w^2,0,w,0,0,1,w,0,1,0,0,w^2,1,0,w^2,0,0,w
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=27 div 3;ell2:=18 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [27+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[267]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 45 and Dimension(Q) eq 15;
assert Dimension(HermitianHull(Q)) eq 14;
Table3Parameters[267]:=[45,1,17,16];
Table3DistanceTypes[267]:="exact";

// Table 3, No. 268 | Q50_020
// [[45,6,18;23]]_2, distance exact.
Gsrc1:=Matrix(F,14,42,[
    1,0,1,w^2,0,0,w,w,w^2,w^2,1,0,1,w,w^2,0,w^2,w,0,0,1,1,w,w,w^2,0,w^2,1,w,0,w,1,0,0,w^2,w^2,1,1,w,0,w,w^2,
    0,1,w^2,w^2,0,0,w^2,1,w,1,w,0,0,0,0,w^2,w,w,0,0,w,w^2,1,w^2,1,0,0,0,0,w,1,1,0,0,1,w,w^2,w,w^2,0,0,0,
    0,0,0,0,1,0,w^2,w,w^2,1,0,w^2,w,w^2,0,0,0,0,w^2,0,w,1,w,w^2,0,w,1,w,0,0,0,0,w,0,1,w^2,1,w,0,1,w^2,1,
    0,0,0,0,0,1,w^2,1,1,0,1,w^2,1,1,0,0,0,0,0,w^2,w,w^2,w^2,0,w^2,w,w^2,w^2,0,0,0,0,0,w,1,w,w,0,w,1,w,w,
    1,1,0,0,0,1,w^2,0,w^2,0,w,1,1,0,w,w,0,0,0,w,1,0,1,0,w^2,w,w,0,w^2,w^2,0,0,0,w^2,w,0,w,0,1,w^2,w^2,0,
    0,0,0,0,1,w^2,w,1,w^2,1,w^2,w,1,w^2,0,0,0,0,w,1,w^2,w,1,w,1,w^2,w,1,0,0,0,0,w^2,w,1,w^2,w,w^2,w,1,w^2,w,
    w^2,1,1,w,w,w^2,1,0,0,w^2,w^2,w,w,0,w^2,1,1,w,w,w^2,1,0,0,w^2,w^2,w,w,0,w^2,1,1,w,w,w^2,1,0,0,w^2,w^2,w,w,0,
    w^2,w,w^2,0,w,w,w^2,0,w^2,w^2,w,w,w^2,0,w^2,w,w^2,0,w,w,w^2,0,w^2,w^2,w,w,w^2,0,w^2,w,w^2,0,w,w,w^2,0,w^2,w^2,w,w,w^2,0,
    0,w^2,0,1,w^2,w^2,1,w^2,w,1,0,1,1,1,0,w^2,0,1,w^2,w^2,1,w^2,w,1,0,1,1,1,0,w^2,0,1,w^2,w^2,1,w^2,w,1,0,1,1,1,
    w^2,0,0,w^2,0,0,w,0,w^2,1,w,1,1,1,w,0,0,w,0,0,1,0,w,w^2,1,w^2,w^2,w^2,1,0,0,1,0,0,w^2,0,1,w,w^2,w,w,w,
    0,0,0,w^2,0,w,1,0,1,w^2,w^2,w^2,w^2,w^2,0,0,0,1,0,w^2,w,0,w,1,1,1,1,1,0,0,0,w,0,1,w^2,0,w^2,w,w,w,w,w,
    1,0,0,w^2,0,w^2,0,w,1,w,w^2,w,0,w,w,0,0,1,0,1,0,w^2,w,w^2,1,w^2,0,w^2,w^2,0,0,w,0,w,0,1,w^2,1,w,1,0,1,
    w^2,0,w,w^2,w^2,0,w^2,1,1,w,0,w,w^2,w^2,w^2,0,w,w^2,w^2,0,w^2,1,1,w,0,w,w^2,w^2,w^2,0,w,w^2,w^2,0,w^2,1,1,w,0,w,w^2,w^2,
    w^2,0,w^2,w^2,0,w,w,w^2,0,w,1,w^2,w,w^2,1,0,1,1,0,w^2,w^2,1,0,w^2,w,1,w^2,1,w,0,w,w,0,1,1,w,0,1,w^2,w,1,w
]);
Gsrc2:=Matrix(F,2,3,[
    1,1,1,
    1,w,w^2
]);
W1:=Matrix(F,2,42,[
    w^2,0,w,w^2,w^2,0,w^2,1,1,w,0,w,w^2,w^2,w^2,0,w,w^2,w^2,0,w^2,1,1,w,0,w,w^2,w^2,w^2,0,w,w^2,w^2,0,w^2,1,1,w,0,w,w^2,w^2,
    w^2,0,w^2,w^2,0,w,w,w^2,0,w,1,w^2,w,w^2,1,0,1,1,0,w^2,w^2,1,0,w^2,w,1,w^2,1,w,0,w,w,0,1,1,w,0,1,w^2,w,1,w
]);
W2:=Matrix(F,2,3,[
    1,1,1,
    1,w,w^2
]);
lambda:=2;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 42 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,14,45,[
    1,0,1,w^2,0,0,w,w,w^2,w^2,1,0,1,w,w^2,0,w^2,w,0,0,1,1,w,w,w^2,0,w^2,1,w,0,w,1,0,0,w^2,w^2,1,1,w,0,w,w^2,0,0,0,
    0,1,w^2,w^2,0,0,w^2,1,w,1,w,0,0,0,0,w^2,w,w,0,0,w,w^2,1,w^2,1,0,0,0,0,w,1,1,0,0,1,w,w^2,w,w^2,0,0,0,0,0,0,
    0,0,0,0,1,0,w^2,w,w^2,1,0,w^2,w,w^2,0,0,0,0,w^2,0,w,1,w,w^2,0,w,1,w,0,0,0,0,w,0,1,w^2,1,w,0,1,w^2,1,0,0,0,
    0,0,0,0,0,1,w^2,1,1,0,1,w^2,1,1,0,0,0,0,0,w^2,w,w^2,w^2,0,w^2,w,w^2,w^2,0,0,0,0,0,w,1,w,w,0,w,1,w,w,0,0,0,
    1,1,0,0,0,1,w^2,0,w^2,0,w,1,1,0,w,w,0,0,0,w,1,0,1,0,w^2,w,w,0,w^2,w^2,0,0,0,w^2,w,0,w,0,1,w^2,w^2,0,0,0,0,
    0,0,0,0,1,w^2,w,1,w^2,1,w^2,w,1,w^2,0,0,0,0,w,1,w^2,w,1,w,1,w^2,w,1,0,0,0,0,w^2,w,1,w^2,w,w^2,w,1,w^2,w,0,0,0,
    w^2,1,1,w,w,w^2,1,0,0,w^2,w^2,w,w,0,w^2,1,1,w,w,w^2,1,0,0,w^2,w^2,w,w,0,w^2,1,1,w,w,w^2,1,0,0,w^2,w^2,w,w,0,0,0,0,
    w^2,w,w^2,0,w,w,w^2,0,w^2,w^2,w,w,w^2,0,w^2,w,w^2,0,w,w,w^2,0,w^2,w^2,w,w,w^2,0,w^2,w,w^2,0,w,w,w^2,0,w^2,w^2,w,w,w^2,0,0,0,0,
    0,w^2,0,1,w^2,w^2,1,w^2,w,1,0,1,1,1,0,w^2,0,1,w^2,w^2,1,w^2,w,1,0,1,1,1,0,w^2,0,1,w^2,w^2,1,w^2,w,1,0,1,1,1,0,0,0,
    w^2,0,0,w^2,0,0,w,0,w^2,1,w,1,1,1,w,0,0,w,0,0,1,0,w,w^2,1,w^2,w^2,w^2,1,0,0,1,0,0,w^2,0,1,w,w^2,w,w,w,0,0,0,
    0,0,0,w^2,0,w,1,0,1,w^2,w^2,w^2,w^2,w^2,0,0,0,1,0,w^2,w,0,w,1,1,1,1,1,0,0,0,w,0,1,w^2,0,w^2,w,w,w,w,w,0,0,0,
    1,0,0,w^2,0,w^2,0,w,1,w,w^2,w,0,w,w,0,0,1,0,1,0,w^2,w,w^2,1,w^2,0,w^2,w^2,0,0,w,0,w,0,1,w^2,1,w,1,0,1,0,0,0,
    w^2,0,w,w^2,w^2,0,w^2,1,1,w,0,w,w^2,w^2,w^2,0,w,w^2,w^2,0,w^2,1,1,w,0,w,w^2,w^2,w^2,0,w,w^2,w^2,0,w^2,1,1,w,0,w,w^2,w^2,1,1,1,
    w^2,0,w^2,w^2,0,w,w,w^2,0,w,1,w^2,w,w^2,1,0,1,1,0,w^2,w^2,1,0,w^2,w,1,w^2,1,w,0,w,w,0,1,1,w,0,1,w^2,w,1,w,1,w,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=42 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [42+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[268]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 45 and Dimension(Q) eq 14;
assert Dimension(HermitianHull(Q)) eq 8;
Table3Parameters[268]:=[45,6,18,23];
Table3DistanceTypes[268]:="exact";

// Table 3, No. 269 | QB_45_9_15_20
// [[45,9,15;20]]_2, distance exact.
Gsrc1:=Matrix(F,16,39,[
    1,1,w,1,1,w^2,w,0,0,1,w,0,1,1,1,w,1,1,w^2,w,0,0,1,w,0,1,1,1,w,1,1,w^2,w,0,0,1,w,0,1,
    1,0,1,0,w^2,1,1,1,0,w,1,1,1,w,0,w,0,1,w,w,w,0,w^2,w,w,w,w^2,0,w^2,0,w,w^2,w^2,w^2,0,1,w^2,w^2,w^2,
    0,1,0,w^2,1,w,1,0,w,1,1,1,w,0,w,0,1,w,w^2,w,0,w^2,w,w,w,w^2,0,w^2,0,w,w^2,1,w^2,0,1,w^2,w^2,w^2,1,
    w^2,1,w,w,w,0,1,1,w^2,w,w^2,w,0,w^2,1,w,w,w,0,1,1,w^2,w,w^2,w,0,w^2,1,w,w,w,0,1,1,w^2,w,w^2,w,0,
    w,w^2,w^2,0,w^2,0,0,1,w^2,0,w,1,1,w,w^2,w^2,0,w^2,0,0,1,w^2,0,w,1,1,w,w^2,w^2,0,w^2,0,0,1,w^2,0,w,1,1,
    w,w^2,w,w,0,0,w,0,0,w^2,1,w^2,w^2,w,w^2,w,w,0,0,w,0,0,w^2,1,w^2,w^2,w,w^2,w,w,0,0,w,0,0,w^2,1,w^2,w^2,
    w,w^2,0,0,1,0,w^2,0,w^2,w^2,w,w,1,1,w,0,0,w^2,0,w,0,w,w,1,1,w^2,w^2,1,0,0,w,0,1,0,1,1,w^2,w^2,w,
    1,1,w^2,w^2,w,1,w,1,0,0,w,1,w,w^2,w^2,w,w,1,w^2,1,w^2,0,0,1,w^2,1,w,w,1,1,w^2,w,w^2,w,0,0,w^2,w,w^2,
    w^2,0,1,0,w,1,w^2,0,w,1,w^2,0,w,w,0,w^2,0,1,w^2,w,0,1,w^2,w,0,1,1,0,w,0,w^2,w,1,0,w^2,w,1,0,w^2,
    w^2,1,w^2,1,1,w^2,1,w,w,1,w^2,w^2,w,w,w^2,w,w^2,w^2,w,w^2,1,1,w^2,w,w,1,1,w,1,w,w,1,w,w^2,w^2,w,1,1,w^2,
    0,w,1,w^2,w^2,0,1,w,w^2,0,w,w^2,0,0,1,w^2,w,w,0,w^2,1,w,0,1,w,0,0,w^2,w,1,1,0,w,w^2,1,0,w^2,1,0,
    1,0,0,w,0,1,1,w,w,0,w^2,w,w,w,0,0,w^2,0,w,w,w^2,w^2,0,1,w^2,w^2,w^2,0,0,1,0,w^2,w^2,1,1,0,w,1,1,
    1,1,1,0,0,0,w^2,w,0,1,w^2,1,w,1,1,1,0,0,0,w^2,w,0,1,w^2,1,w,1,1,1,0,0,0,w^2,w,0,1,w^2,1,w,
    1,1,w,w,w,0,1,0,w^2,1,w,w^2,w,1,1,w,w,w,0,1,0,w^2,1,w,w^2,w,1,1,w,w,w,0,1,0,w^2,1,w,w^2,w,
    1,w,w^2,w,w^2,1,w^2,w^2,1,w,1,0,0,w^2,1,w,1,w,w^2,w,w,w^2,1,w^2,0,0,w,w^2,1,w^2,1,w,1,1,w,w^2,w,0,0,
    0,0,1,w,w^2,0,w^2,w^2,w,w^2,w,0,1,0,0,w^2,1,w,0,w,w,1,w,1,0,w^2,0,0,w,w^2,1,0,1,1,w^2,1,w^2,0,w
]);
Gsrc2:=Matrix(F,5,6,[
    w^2,w^2,1,1,w,w,
    w,0,w,0,w,0,
    0,1,0,1,0,1,
    w,0,1,0,w^2,0,
    0,w^2,0,w,0,1
]);
W1:=Matrix(F,4,39,[
    1,1,1,0,0,0,w^2,w,0,1,w^2,1,w,1,1,1,0,0,0,w^2,w,0,1,w^2,1,w,1,1,1,0,0,0,w^2,w,0,1,w^2,1,w,
    1,1,w,w,w,0,1,0,w^2,1,w,w^2,w,1,1,w,w,w,0,1,0,w^2,1,w,w^2,w,1,1,w,w,w,0,1,0,w^2,1,w,w^2,w,
    1,w,w^2,w,w^2,1,w^2,w^2,1,w,1,0,0,w^2,1,w,1,w,w^2,w,w,w^2,1,w^2,0,0,w,w^2,1,w^2,1,w,1,1,w,w^2,w,0,0,
    0,0,1,w,w^2,0,w^2,w^2,w,w^2,w,0,1,0,0,w^2,1,w,0,w,w,1,w,1,0,w^2,0,0,w,w^2,1,0,1,1,w^2,1,w^2,0,w
]);
W2:=Matrix(F,4,6,[
    w,0,w,0,w,0,
    0,1,0,1,0,1,
    w,0,1,0,w^2,0,
    0,w^2,0,w,0,1
]);
lambda:=4;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 39 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 6;
GX4:=Matrix(F,17,45,[
    1,1,w,1,1,w^2,w,0,0,1,w,0,1,1,1,w,1,1,w^2,w,0,0,1,w,0,1,1,1,w,1,1,w^2,w,0,0,1,w,0,1,0,0,0,0,0,0,
    1,0,1,0,w^2,1,1,1,0,w,1,1,1,w,0,w,0,1,w,w,w,0,w^2,w,w,w,w^2,0,w^2,0,w,w^2,w^2,w^2,0,1,w^2,w^2,w^2,0,0,0,0,0,0,
    0,1,0,w^2,1,w,1,0,w,1,1,1,w,0,w,0,1,w,w^2,w,0,w^2,w,w,w,w^2,0,w^2,0,w,w^2,1,w^2,0,1,w^2,w^2,w^2,1,0,0,0,0,0,0,
    w^2,1,w,w,w,0,1,1,w^2,w,w^2,w,0,w^2,1,w,w,w,0,1,1,w^2,w,w^2,w,0,w^2,1,w,w,w,0,1,1,w^2,w,w^2,w,0,0,0,0,0,0,0,
    w,w^2,w^2,0,w^2,0,0,1,w^2,0,w,1,1,w,w^2,w^2,0,w^2,0,0,1,w^2,0,w,1,1,w,w^2,w^2,0,w^2,0,0,1,w^2,0,w,1,1,0,0,0,0,0,0,
    w,w^2,w,w,0,0,w,0,0,w^2,1,w^2,w^2,w,w^2,w,w,0,0,w,0,0,w^2,1,w^2,w^2,w,w^2,w,w,0,0,w,0,0,w^2,1,w^2,w^2,0,0,0,0,0,0,
    w,w^2,0,0,1,0,w^2,0,w^2,w^2,w,w,1,1,w,0,0,w^2,0,w,0,w,w,1,1,w^2,w^2,1,0,0,w,0,1,0,1,1,w^2,w^2,w,0,0,0,0,0,0,
    1,1,w^2,w^2,w,1,w,1,0,0,w,1,w,w^2,w^2,w,w,1,w^2,1,w^2,0,0,1,w^2,1,w,w,1,1,w^2,w,w^2,w,0,0,w^2,w,w^2,0,0,0,0,0,0,
    w^2,0,1,0,w,1,w^2,0,w,1,w^2,0,w,w,0,w^2,0,1,w^2,w,0,1,w^2,w,0,1,1,0,w,0,w^2,w,1,0,w^2,w,1,0,w^2,0,0,0,0,0,0,
    w^2,1,w^2,1,1,w^2,1,w,w,1,w^2,w^2,w,w,w^2,w,w^2,w^2,w,w^2,1,1,w^2,w,w,1,1,w,1,w,w,1,w,w^2,w^2,w,1,1,w^2,0,0,0,0,0,0,
    0,w,1,w^2,w^2,0,1,w,w^2,0,w,w^2,0,0,1,w^2,w,w,0,w^2,1,w,0,1,w,0,0,w^2,w,1,1,0,w,w^2,1,0,w^2,1,0,0,0,0,0,0,0,
    1,0,0,w,0,1,1,w,w,0,w^2,w,w,w,0,0,w^2,0,w,w,w^2,w^2,0,1,w^2,w^2,w^2,0,0,1,0,w^2,w^2,1,1,0,w,1,1,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,1,w,w,
    1,1,1,0,0,0,w^2,w,0,1,w^2,1,w,1,1,1,0,0,0,w^2,w,0,1,w^2,1,w,1,1,1,0,0,0,w^2,w,0,1,w^2,1,w,w,0,w,0,w,0,
    1,1,w,w,w,0,1,0,w^2,1,w,w^2,w,1,1,w,w,w,0,1,0,w^2,1,w,w^2,w,1,1,w,w,w,0,1,0,w^2,1,w,w^2,w,0,1,0,1,0,1,
    1,w,w^2,w,w^2,1,w^2,w^2,1,w,1,0,0,w^2,1,w,1,w,w^2,w,w,w^2,1,w^2,0,0,w,w^2,1,w^2,1,w,1,1,w,w^2,w,0,0,w,0,1,0,w^2,0,
    0,0,1,w,w^2,0,w^2,w^2,w,w^2,w,0,1,0,0,w^2,1,w,0,w,w,1,w,1,0,w^2,0,0,w,w^2,1,0,1,1,w^2,1,w^2,0,w,0,w^2,0,w,0,1
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=39 div 3;ell2:=6 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [39+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[269]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 45 and Dimension(Q) eq 17;
assert Dimension(HermitianHull(Q)) eq 8;
Table3Parameters[269]:=[45,9,15,20];
Table3DistanceTypes[269]:="exact";

// Table 3, No. 270 | QB_48_10_14_18
// [[48,10,14;18]]_2, distance exact.
Gsrc1:=Matrix(F,16,36,[
    1,1,1,1,1,0,w,1,0,w^2,w,w,w^2,w^2,w^2,w^2,w^2,0,1,w^2,0,w,1,1,w,w,w,w,w,0,w^2,w,0,1,w^2,w^2,
    1,0,w^2,1,w,1,0,w,1,1,1,w,w,0,1,w,w^2,w,0,w^2,w,w,w,w^2,w^2,0,w,w^2,1,w^2,0,1,w^2,w^2,w^2,1,
    0,w^2,0,1,w,w^2,w^2,0,w,0,w,0,0,w^2,0,1,w,w^2,w^2,0,w,0,w,0,0,w^2,0,1,w,w^2,w^2,0,w,0,w,0,
    0,1,0,w,0,w^2,1,1,1,w,0,0,0,1,0,w,0,w^2,1,1,1,w,0,0,0,1,0,w,0,w^2,1,1,1,w,0,0,
    w^2,1,0,w^2,w,w,1,1,1,w,w^2,w,w^2,1,0,w^2,w,w,1,1,1,w,w^2,w,w^2,1,0,w^2,w,w,1,1,1,w,w^2,w,
    w,w,1,w^2,0,w,0,1,1,1,0,w^2,w,w,1,w^2,0,w,0,1,1,1,0,w^2,w,w,1,w^2,0,w,0,1,1,1,0,w^2,
    w^2,w^2,w^2,0,w^2,1,0,1,1,1,1,0,w,w,w,0,w,w^2,0,w^2,w^2,w^2,w^2,0,1,1,1,0,1,w,0,w,w,w,w,0,
    w^2,1,w,w,w,w^2,0,1,1,w^2,w^2,w^2,w,w^2,1,1,1,w,0,w^2,w^2,w,w,w,1,w,w^2,w^2,w^2,1,0,w,w,1,1,1,
    0,w^2,0,w,w,w,0,w,0,w,0,w^2,0,w,0,1,1,1,0,1,0,1,0,w,0,1,0,w^2,w^2,w^2,0,w^2,0,w^2,0,1,
    w^2,w,w,w^2,w^2,w,0,1,w^2,w^2,w^2,w,w,1,1,w,w,1,0,w^2,w,w,w,1,1,w^2,w^2,1,1,w^2,0,w,1,1,1,w^2,
    1,w,0,0,w,1,1,1,w,w,0,w^2,w,w^2,0,0,w^2,w,w,w,w^2,w^2,0,1,w^2,1,0,0,1,w^2,w^2,w^2,1,1,0,w,
    0,w^2,0,w,w^2,w^2,w^2,0,1,w^2,w^2,w^2,0,1,0,w^2,1,1,1,0,w,1,1,1,0,w,0,1,w,w,w,0,w^2,w,w,w,
    w^2,w^2,1,w^2,w,0,0,w,0,1,1,w,w^2,w^2,1,w^2,w,0,0,w,0,1,1,w,w^2,w^2,1,w^2,w,0,0,w,0,1,1,w,
    w^2,w,w^2,w,1,1,0,w,0,1,0,w,w^2,w,w^2,w,1,1,0,w,0,1,0,w,w^2,w,w^2,w,1,1,0,w,0,1,0,w,
    0,w,1,0,w,w,0,w,w,w,w,w,0,1,w^2,0,1,1,0,1,1,1,1,1,0,w^2,w,0,w^2,w^2,0,w^2,w^2,w^2,w^2,w^2,
    w^2,1,1,w,w^2,0,0,1,1,w^2,w^2,0,w,w^2,w^2,1,w,0,0,w^2,w^2,w,w,0,1,w,w,w^2,1,0,0,w,w,1,1,0
]);
Gsrc2:=Matrix(F,8,12,[
    1,w^2,w,w,1,w^2,w,w,1,w^2,w,w,
    1,1,w,w^2,w^2,w^2,1,w,w,w,w^2,1,
    0,w,0,w^2,0,w^2,0,1,0,1,0,w,
    w,1,1,w,w^2,w,w,w^2,1,w^2,w^2,1,
    0,w,w^2,w,0,w,w^2,w,0,w,w^2,w,
    w,0,w,1,w,0,w,1,w,0,w,1,
    w^2,w,0,w^2,w,1,0,w,1,w^2,0,1,
    w^2,0,w^2,w^2,w,0,w,w,1,0,1,1
]);
W1:=Matrix(F,4,36,[
    w^2,w^2,1,w^2,w,0,0,w,0,1,1,w,w^2,w^2,1,w^2,w,0,0,w,0,1,1,w,w^2,w^2,1,w^2,w,0,0,w,0,1,1,w,
    w^2,w,w^2,w,1,1,0,w,0,1,0,w,w^2,w,w^2,w,1,1,0,w,0,1,0,w,w^2,w,w^2,w,1,1,0,w,0,1,0,w,
    0,w,1,0,w,w,0,w,w,w,w,w,0,1,w^2,0,1,1,0,1,1,1,1,1,0,w^2,w,0,w^2,w^2,0,w^2,w^2,w^2,w^2,w^2,
    w^2,1,1,w,w^2,0,0,1,1,w^2,w^2,0,w,w^2,w^2,1,w,0,0,w^2,w^2,w,w,0,1,w,w,w^2,1,0,0,w,w,1,1,0
]);
W2:=Matrix(F,4,12,[
    0,w,w^2,w,0,w,w^2,w,0,w,w^2,w,
    w,0,w,1,w,0,w,1,w,0,w,1,
    w^2,w,0,w^2,w,1,0,w,1,w^2,0,1,
    w^2,0,w^2,w^2,w,0,w,w,1,0,1,1
]);
lambda:=4;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 36 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 12;
GX4:=Matrix(F,20,48,[
    1,1,1,1,1,0,w,1,0,w^2,w,w,w^2,w^2,w^2,w^2,w^2,0,1,w^2,0,w,1,1,w,w,w,w,w,0,w^2,w,0,1,w^2,w^2,0,0,0,0,0,0,0,0,0,0,0,0,
    1,0,w^2,1,w,1,0,w,1,1,1,w,w,0,1,w,w^2,w,0,w^2,w,w,w,w^2,w^2,0,w,w^2,1,w^2,0,1,w^2,w^2,w^2,1,0,0,0,0,0,0,0,0,0,0,0,0,
    0,w^2,0,1,w,w^2,w^2,0,w,0,w,0,0,w^2,0,1,w,w^2,w^2,0,w,0,w,0,0,w^2,0,1,w,w^2,w^2,0,w,0,w,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,1,0,w,0,w^2,1,1,1,w,0,0,0,1,0,w,0,w^2,1,1,1,w,0,0,0,1,0,w,0,w^2,1,1,1,w,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    w^2,1,0,w^2,w,w,1,1,1,w,w^2,w,w^2,1,0,w^2,w,w,1,1,1,w,w^2,w,w^2,1,0,w^2,w,w,1,1,1,w,w^2,w,0,0,0,0,0,0,0,0,0,0,0,0,
    w,w,1,w^2,0,w,0,1,1,1,0,w^2,w,w,1,w^2,0,w,0,1,1,1,0,w^2,w,w,1,w^2,0,w,0,1,1,1,0,w^2,0,0,0,0,0,0,0,0,0,0,0,0,
    w^2,w^2,w^2,0,w^2,1,0,1,1,1,1,0,w,w,w,0,w,w^2,0,w^2,w^2,w^2,w^2,0,1,1,1,0,1,w,0,w,w,w,w,0,0,0,0,0,0,0,0,0,0,0,0,0,
    w^2,1,w,w,w,w^2,0,1,1,w^2,w^2,w^2,w,w^2,1,1,1,w,0,w^2,w^2,w,w,w,1,w,w^2,w^2,w^2,1,0,w,w,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
    0,w^2,0,w,w,w,0,w,0,w,0,w^2,0,w,0,1,1,1,0,1,0,1,0,w,0,1,0,w^2,w^2,w^2,0,w^2,0,w^2,0,1,0,0,0,0,0,0,0,0,0,0,0,0,
    w^2,w,w,w^2,w^2,w,0,1,w^2,w^2,w^2,w,w,1,1,w,w,1,0,w^2,w,w,w,1,1,w^2,w^2,1,1,w^2,0,w,1,1,1,w^2,0,0,0,0,0,0,0,0,0,0,0,0,
    1,w,0,0,w,1,1,1,w,w,0,w^2,w,w^2,0,0,w^2,w,w,w,w^2,w^2,0,1,w^2,1,0,0,1,w^2,w^2,w^2,1,1,0,w,0,0,0,0,0,0,0,0,0,0,0,0,
    0,w^2,0,w,w^2,w^2,w^2,0,1,w^2,w^2,w^2,0,1,0,w^2,1,1,1,0,w,1,1,1,0,w,0,1,w,w,w,0,w^2,w,w,w,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,w,1,w^2,w,w,1,w^2,w,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,w^2,w^2,w^2,1,w,w,w,w^2,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,0,w^2,0,1,0,1,0,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,w^2,w,w,w^2,1,w^2,w^2,1,
    w^2,w^2,1,w^2,w,0,0,w,0,1,1,w,w^2,w^2,1,w^2,w,0,0,w,0,1,1,w,w^2,w^2,1,w^2,w,0,0,w,0,1,1,w,0,w,w^2,w,0,w,w^2,w,0,w,w^2,w,
    w^2,w,w^2,w,1,1,0,w,0,1,0,w,w^2,w,w^2,w,1,1,0,w,0,1,0,w,w^2,w,w^2,w,1,1,0,w,0,1,0,w,w,0,w,1,w,0,w,1,w,0,w,1,
    0,w,1,0,w,w,0,w,w,w,w,w,0,1,w^2,0,1,1,0,1,1,1,1,1,0,w^2,w,0,w^2,w^2,0,w^2,w^2,w^2,w^2,w^2,w^2,w,0,w^2,w,1,0,w,1,w^2,0,1,
    w^2,1,1,w,w^2,0,0,1,1,w^2,w^2,0,w,w^2,w^2,1,w,0,0,w^2,w^2,w,w,0,1,w,w,w^2,1,0,0,w,w,1,1,0,w^2,0,w^2,w^2,w,0,w,w,1,0,1,1
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=36 div 3;ell2:=12 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [36+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[270]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 48 and Dimension(Q) eq 20;
assert Dimension(HermitianHull(Q)) eq 10;
Table3Parameters[270]:=[48,10,14,18];
Table3DistanceTypes[270]:="exact";

// Table 3, No. 271 | QB_48_10_16_22
// [[48,10,16;22]]_2, distance exact.
Gsrc1:=Matrix(F,15,39,[
    1,0,0,0,w^2,w^2,0,1,1,w^2,w,1,0,w,0,0,0,1,1,0,w,w,1,w^2,w,0,w^2,0,0,0,w,w,0,w^2,w^2,w,1,w^2,0,
    0,1,0,0,1,w^2,w^2,w,w^2,0,w^2,0,1,0,w,0,0,w,1,1,w^2,1,0,1,0,w,0,w^2,0,0,w^2,w,w,1,w,0,w,0,w^2,
    w,w,1,w^2,w,0,1,w^2,w,0,w^2,1,w,w,w,1,w^2,w,0,1,w^2,w,0,w^2,1,w,w,w,1,w^2,w,0,1,w^2,w,0,w^2,1,w,
    w,w,w,1,w^2,0,0,1,w^2,w,1,w^2,1,w,w,w,1,w^2,0,0,1,w^2,w,1,w^2,1,w,w,w,1,w^2,0,0,1,w^2,w,1,w^2,1,
    1,0,w,w,1,w,w^2,0,1,0,1,w^2,0,1,0,w,w,1,w,w^2,0,1,0,1,w^2,0,1,0,w,w,1,w,w^2,0,1,0,1,w^2,0,
    0,1,1,0,w^2,0,w,0,w^2,w^2,1,w^2,w,0,1,1,0,w^2,0,w,0,w^2,w^2,1,w^2,w,0,1,1,0,w^2,0,w,0,w^2,w^2,1,w^2,w,
    0,w,0,1,w,1,1,0,1,w^2,1,w^2,0,0,1,0,w^2,1,w^2,w^2,0,w^2,w,w^2,w,0,0,w^2,0,w,w^2,w,w,0,w,1,w,1,0,
    w^2,w,w^2,0,0,w^2,1,1,0,w,w,1,0,w,1,w,0,0,w,w^2,w^2,0,1,1,w^2,0,1,w^2,1,0,0,1,w,w,0,w^2,w^2,w,0,
    1,0,w,w,w,0,w^2,0,0,1,1,w,w,w^2,0,1,1,1,0,w,0,0,w^2,w^2,1,1,w,0,w^2,w^2,w^2,0,1,0,0,w,w,w^2,w^2,
    0,w,1,w,w^2,1,0,1,w^2,1,w,w,w^2,0,1,w^2,1,w,w^2,0,w^2,w,w^2,1,1,w,0,w^2,w,w^2,1,w,0,w,1,w,w^2,w^2,1,
    w,0,w,1,0,0,w,1,0,w^2,w,w^2,w^2,w^2,0,w^2,w,0,0,w^2,w,0,1,w^2,1,1,1,0,1,w^2,0,0,1,w^2,0,w,1,w,w,
    w,0,0,w,0,1,w^2,1,0,w,0,w,0,w^2,0,0,w^2,0,w,1,w,0,w^2,0,w^2,0,1,0,0,1,0,w^2,w,w^2,0,1,0,1,0,
    w^2,w,0,w,0,0,1,1,1,w^2,0,w^2,1,w^2,w,0,w,0,0,1,1,1,w^2,0,w^2,1,w^2,w,0,w,0,0,1,1,1,w^2,0,w^2,1,
    w^2,w,w,1,1,w,1,0,1,1,w^2,0,w^2,w,1,1,w^2,w^2,1,w^2,0,w^2,w^2,w,0,w,1,w^2,w^2,w,w,w^2,w,0,w,w,1,0,1,
    w^2,0,1,0,0,0,w^2,w^2,w,w^2,0,w^2,0,1,0,w,0,0,0,1,1,w^2,1,0,1,0,w,0,w^2,0,0,0,w,w,1,w,0,w,0
]);
Gsrc2:=Matrix(F,6,9,[
    w^2,1,0,w^2,1,0,w^2,1,0,
    w,0,1,1,0,w^2,w^2,0,w,
    0,w^2,1,0,1,w,0,w,w^2,
    1,w,w,1,w,w,1,w,w,
    1,w^2,w^2,w^2,w,w,w,1,1,
    w,w^2,1,w^2,1,w,1,w,w^2
]);
W1:=Matrix(F,3,39,[
    w^2,w,0,w,0,0,1,1,1,w^2,0,w^2,1,w^2,w,0,w,0,0,1,1,1,w^2,0,w^2,1,w^2,w,0,w,0,0,1,1,1,w^2,0,w^2,1,
    w^2,w,w,1,1,w,1,0,1,1,w^2,0,w^2,w,1,1,w^2,w^2,1,w^2,0,w^2,w^2,w,0,w,1,w^2,w^2,w,w,w^2,w,0,w,w,1,0,1,
    w^2,0,1,0,0,0,w^2,w^2,w,w^2,0,w^2,0,1,0,w,0,0,0,1,1,w^2,1,0,1,0,w,0,w^2,0,0,0,w,w,1,w,0,w,0
]);
W2:=Matrix(F,3,9,[
    1,w,w,1,w,w,1,w,w,
    1,w^2,w^2,w^2,w,w,w,1,1,
    w,w^2,1,w^2,1,w,1,w,w^2
]);
lambda:=3;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 39 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 9;
GX4:=Matrix(F,18,48,[
    1,0,0,0,w^2,w^2,0,1,1,w^2,w,1,0,w,0,0,0,1,1,0,w,w,1,w^2,w,0,w^2,0,0,0,w,w,0,w^2,w^2,w,1,w^2,0,0,0,0,0,0,0,0,0,0,
    0,1,0,0,1,w^2,w^2,w,w^2,0,w^2,0,1,0,w,0,0,w,1,1,w^2,1,0,1,0,w,0,w^2,0,0,w^2,w,w,1,w,0,w,0,w^2,0,0,0,0,0,0,0,0,0,
    w,w,1,w^2,w,0,1,w^2,w,0,w^2,1,w,w,w,1,w^2,w,0,1,w^2,w,0,w^2,1,w,w,w,1,w^2,w,0,1,w^2,w,0,w^2,1,w,0,0,0,0,0,0,0,0,0,
    w,w,w,1,w^2,0,0,1,w^2,w,1,w^2,1,w,w,w,1,w^2,0,0,1,w^2,w,1,w^2,1,w,w,w,1,w^2,0,0,1,w^2,w,1,w^2,1,0,0,0,0,0,0,0,0,0,
    1,0,w,w,1,w,w^2,0,1,0,1,w^2,0,1,0,w,w,1,w,w^2,0,1,0,1,w^2,0,1,0,w,w,1,w,w^2,0,1,0,1,w^2,0,0,0,0,0,0,0,0,0,0,
    0,1,1,0,w^2,0,w,0,w^2,w^2,1,w^2,w,0,1,1,0,w^2,0,w,0,w^2,w^2,1,w^2,w,0,1,1,0,w^2,0,w,0,w^2,w^2,1,w^2,w,0,0,0,0,0,0,0,0,0,
    0,w,0,1,w,1,1,0,1,w^2,1,w^2,0,0,1,0,w^2,1,w^2,w^2,0,w^2,w,w^2,w,0,0,w^2,0,w,w^2,w,w,0,w,1,w,1,0,0,0,0,0,0,0,0,0,0,
    w^2,w,w^2,0,0,w^2,1,1,0,w,w,1,0,w,1,w,0,0,w,w^2,w^2,0,1,1,w^2,0,1,w^2,1,0,0,1,w,w,0,w^2,w^2,w,0,0,0,0,0,0,0,0,0,0,
    1,0,w,w,w,0,w^2,0,0,1,1,w,w,w^2,0,1,1,1,0,w,0,0,w^2,w^2,1,1,w,0,w^2,w^2,w^2,0,1,0,0,w,w,w^2,w^2,0,0,0,0,0,0,0,0,0,
    0,w,1,w,w^2,1,0,1,w^2,1,w,w,w^2,0,1,w^2,1,w,w^2,0,w^2,w,w^2,1,1,w,0,w^2,w,w^2,1,w,0,w,1,w,w^2,w^2,1,0,0,0,0,0,0,0,0,0,
    w,0,w,1,0,0,w,1,0,w^2,w,w^2,w^2,w^2,0,w^2,w,0,0,w^2,w,0,1,w^2,1,1,1,0,1,w^2,0,0,1,w^2,0,w,1,w,w,0,0,0,0,0,0,0,0,0,
    w,0,0,w,0,1,w^2,1,0,w,0,w,0,w^2,0,0,w^2,0,w,1,w,0,w^2,0,w^2,0,1,0,0,1,0,w^2,w,w^2,0,1,0,1,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,1,0,w^2,1,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,1,1,0,w^2,w^2,0,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,0,1,w,0,w,w^2,
    w^2,w,0,w,0,0,1,1,1,w^2,0,w^2,1,w^2,w,0,w,0,0,1,1,1,w^2,0,w^2,1,w^2,w,0,w,0,0,1,1,1,w^2,0,w^2,1,1,w,w,1,w,w,1,w,w,
    w^2,w,w,1,1,w,1,0,1,1,w^2,0,w^2,w,1,1,w^2,w^2,1,w^2,0,w^2,w^2,w,0,w,1,w^2,w^2,w,w,w^2,w,0,w,w,1,0,1,1,w^2,w^2,w^2,w,w,w,1,1,
    w^2,0,1,0,0,0,w^2,w^2,w,w^2,0,w^2,0,1,0,w,0,0,0,1,1,w^2,1,0,1,0,w,0,w^2,0,0,0,w,w,1,w,0,w,0,w,w^2,1,w^2,1,w,1,w,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=39 div 3;ell2:=9 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [39+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[271]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 48 and Dimension(Q) eq 18;
assert Dimension(HermitianHull(Q)) eq 8;
Table3Parameters[271]:=[48,10,16,22];
Table3DistanceTypes[271]:="exact";

// Table 3, No. 272 | QB_48_11_14_19
// [[48,11,14;19]]_2, distance exact.
Gsrc1:=Matrix(F,16,36,[
    1,w^2,1,w,0,0,w,1,1,1,w,w,w,1,w,w^2,0,0,w^2,w,w,w,w^2,w^2,w^2,w,w^2,1,0,0,1,w^2,w^2,w^2,1,1,
    w,w^2,1,w^2,0,w,0,w^2,1,1,1,0,w,w^2,1,w^2,0,w,0,w^2,1,1,1,0,w,w^2,1,w^2,0,w,0,w^2,1,1,1,0,
    1,1,w,w^2,w^2,w,w^2,w^2,0,0,w,0,1,1,w,w^2,w^2,w,w^2,w^2,0,0,w,0,1,1,w,w^2,w^2,w,w^2,w^2,0,0,w,0,
    0,w,w^2,1,1,1,1,0,0,w^2,w,1,0,w,w^2,1,1,1,1,0,0,w^2,w,1,0,w,w^2,1,1,1,1,0,0,w^2,w,1,
    w^2,0,w,w^2,w,1,1,w^2,w,1,0,0,w^2,0,w,w^2,w,1,1,w^2,w,1,0,0,w^2,0,w,w^2,w,1,1,w^2,w,1,0,0,
    w^2,1,w,w,w^2,w^2,w^2,1,w^2,w^2,w,0,w,w^2,1,1,w,w,w,w^2,w,w,1,0,1,w,w^2,w^2,1,1,1,w,1,1,w^2,0,
    1,0,w,w^2,w^2,0,w,w,1,w,0,1,w^2,0,1,w,w,0,1,1,w^2,1,0,w^2,w,0,w^2,1,1,0,w^2,w^2,w,w^2,0,w,
    1,w,w,w,w,w,1,w^2,1,w,0,1,w^2,1,1,1,1,1,w^2,w,w^2,1,0,w^2,w,w^2,w^2,w^2,w^2,w^2,w,1,w,w^2,0,w,
    1,w,0,0,0,w,w,w^2,w,1,w^2,w^2,w^2,1,0,0,0,1,1,w,1,w^2,w,w,w,w^2,0,0,0,w^2,w^2,1,w^2,w,1,1,
    w^2,w,0,w^2,w^2,w,0,0,w^2,0,w^2,0,w,1,0,w,w,1,0,0,w,0,w,0,1,w^2,0,1,1,w^2,0,0,1,0,1,0,
    w^2,w,0,0,w,1,1,1,w,w,0,w^2,1,w^2,0,0,w^2,w,w,w,w^2,w^2,0,1,w,1,0,0,1,w^2,w^2,w^2,1,1,0,w,
    0,w^2,0,w,w^2,w^2,w^2,0,1,w^2,w^2,w^2,0,1,0,w^2,1,1,1,0,w,1,1,1,0,w,0,1,w,w,w,0,w^2,w,w,w,
    w^2,0,w,w^2,1,w^2,1,w,0,w^2,w^2,0,w^2,0,w,w^2,1,w^2,1,w,0,w^2,w^2,0,w^2,0,w,w^2,1,w^2,1,w,0,w^2,w^2,0,
    0,w^2,w,w,0,0,1,w,w,1,0,0,0,w^2,w,w,0,0,1,w,w,1,0,0,0,w^2,w,w,0,0,1,w,w,1,0,0,
    0,1,w,1,1,w^2,w,w,0,w,w^2,0,0,w^2,1,w^2,w^2,w,1,1,0,1,w,0,0,w,w^2,w,w,1,w^2,w^2,0,w^2,1,0,
    w^2,w^2,0,1,w^2,w,0,1,w^2,w,0,1,w,w,0,w^2,w,1,0,w^2,w,1,0,w^2,1,1,0,w,1,w^2,0,w,1,w^2,0,w
]);
Gsrc2:=Matrix(F,8,12,[
    1,w^2,w,w,1,w^2,w,w,1,w^2,w,w,
    1,1,w,w^2,w^2,w^2,1,w,w,w,w^2,1,
    0,w,0,w^2,0,w^2,0,1,0,1,0,w,
    w,1,1,w,w^2,w,w,w^2,1,w^2,w^2,1,
    0,w,w^2,w,0,w,w^2,w,0,w,w^2,w,
    w,0,w,1,w,0,w,1,w,0,w,1,
    w^2,w,0,w^2,w,1,0,w,1,w^2,0,1,
    w^2,0,w^2,w^2,w,0,w,w,1,0,1,1
]);
W1:=Matrix(F,4,36,[
    w^2,0,w,w^2,1,w^2,1,w,0,w^2,w^2,0,w^2,0,w,w^2,1,w^2,1,w,0,w^2,w^2,0,w^2,0,w,w^2,1,w^2,1,w,0,w^2,w^2,0,
    0,w^2,w,w,0,0,1,w,w,1,0,0,0,w^2,w,w,0,0,1,w,w,1,0,0,0,w^2,w,w,0,0,1,w,w,1,0,0,
    0,1,w,1,1,w^2,w,w,0,w,w^2,0,0,w^2,1,w^2,w^2,w,1,1,0,1,w,0,0,w,w^2,w,w,1,w^2,w^2,0,w^2,1,0,
    w^2,w^2,0,1,w^2,w,0,1,w^2,w,0,1,w,w,0,w^2,w,1,0,w^2,w,1,0,w^2,1,1,0,w,1,w^2,0,w,1,w^2,0,w
]);
W2:=Matrix(F,4,12,[
    0,w,w^2,w,0,w,w^2,w,0,w,w^2,w,
    w,0,w,1,w,0,w,1,w,0,w,1,
    w^2,w,0,w^2,w,1,0,w,1,w^2,0,1,
    w^2,0,w^2,w^2,w,0,w,w,1,0,1,1
]);
lambda:=4;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 36 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 12;
GX4:=Matrix(F,20,48,[
    1,w^2,1,w,0,0,w,1,1,1,w,w,w,1,w,w^2,0,0,w^2,w,w,w,w^2,w^2,w^2,w,w^2,1,0,0,1,w^2,w^2,w^2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
    w,w^2,1,w^2,0,w,0,w^2,1,1,1,0,w,w^2,1,w^2,0,w,0,w^2,1,1,1,0,w,w^2,1,w^2,0,w,0,w^2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
    1,1,w,w^2,w^2,w,w^2,w^2,0,0,w,0,1,1,w,w^2,w^2,w,w^2,w^2,0,0,w,0,1,1,w,w^2,w^2,w,w^2,w^2,0,0,w,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,w,w^2,1,1,1,1,0,0,w^2,w,1,0,w,w^2,1,1,1,1,0,0,w^2,w,1,0,w,w^2,1,1,1,1,0,0,w^2,w,1,0,0,0,0,0,0,0,0,0,0,0,0,
    w^2,0,w,w^2,w,1,1,w^2,w,1,0,0,w^2,0,w,w^2,w,1,1,w^2,w,1,0,0,w^2,0,w,w^2,w,1,1,w^2,w,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    w^2,1,w,w,w^2,w^2,w^2,1,w^2,w^2,w,0,w,w^2,1,1,w,w,w,w^2,w,w,1,0,1,w,w^2,w^2,1,1,1,w,1,1,w^2,0,0,0,0,0,0,0,0,0,0,0,0,0,
    1,0,w,w^2,w^2,0,w,w,1,w,0,1,w^2,0,1,w,w,0,1,1,w^2,1,0,w^2,w,0,w^2,1,1,0,w^2,w^2,w,w^2,0,w,0,0,0,0,0,0,0,0,0,0,0,0,
    1,w,w,w,w,w,1,w^2,1,w,0,1,w^2,1,1,1,1,1,w^2,w,w^2,1,0,w^2,w,w^2,w^2,w^2,w^2,w^2,w,1,w,w^2,0,w,0,0,0,0,0,0,0,0,0,0,0,0,
    1,w,0,0,0,w,w,w^2,w,1,w^2,w^2,w^2,1,0,0,0,1,1,w,1,w^2,w,w,w,w^2,0,0,0,w^2,w^2,1,w^2,w,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
    w^2,w,0,w^2,w^2,w,0,0,w^2,0,w^2,0,w,1,0,w,w,1,0,0,w,0,w,0,1,w^2,0,1,1,w^2,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
    w^2,w,0,0,w,1,1,1,w,w,0,w^2,1,w^2,0,0,w^2,w,w,w,w^2,w^2,0,1,w,1,0,0,1,w^2,w^2,w^2,1,1,0,w,0,0,0,0,0,0,0,0,0,0,0,0,
    0,w^2,0,w,w^2,w^2,w^2,0,1,w^2,w^2,w^2,0,1,0,w^2,1,1,1,0,w,1,1,1,0,w,0,1,w,w,w,0,w^2,w,w,w,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,w,1,w^2,w,w,1,w^2,w,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,w^2,w^2,w^2,1,w,w,w,w^2,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,0,w^2,0,1,0,1,0,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,w^2,w,w,w^2,1,w^2,w^2,1,
    w^2,0,w,w^2,1,w^2,1,w,0,w^2,w^2,0,w^2,0,w,w^2,1,w^2,1,w,0,w^2,w^2,0,w^2,0,w,w^2,1,w^2,1,w,0,w^2,w^2,0,0,w,w^2,w,0,w,w^2,w,0,w,w^2,w,
    0,w^2,w,w,0,0,1,w,w,1,0,0,0,w^2,w,w,0,0,1,w,w,1,0,0,0,w^2,w,w,0,0,1,w,w,1,0,0,w,0,w,1,w,0,w,1,w,0,w,1,
    0,1,w,1,1,w^2,w,w,0,w,w^2,0,0,w^2,1,w^2,w^2,w,1,1,0,1,w,0,0,w,w^2,w,w,1,w^2,w^2,0,w^2,1,0,w^2,w,0,w^2,w,1,0,w,1,w^2,0,1,
    w^2,w^2,0,1,w^2,w,0,1,w^2,w,0,1,w,w,0,w^2,w,1,0,w^2,w,1,0,w^2,1,1,0,w,1,w^2,0,w,1,w^2,0,w,w^2,0,w^2,w^2,w,0,w,w,1,0,1,1
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=36 div 3;ell2:=12 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [36+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[272]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 48 and Dimension(Q) eq 20;
assert Dimension(HermitianHull(Q)) eq 9;
Table3Parameters[272]:=[48,11,14,19];
Table3DistanceTypes[272]:="exact";

// Table 3, No. 273 | NQ02
// [[51,11,18;26]]_2, distance exact.
Gsrc1:=Matrix(F,18,48,[
    1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w^2,w,0,w,w^2,w,0,0,w,0,w^2,1,w,w^2,0,w,1,0,1,1,w,0,w,0,1,w,1,
    0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,1,w^2,w^2,1,w,w^2,1,w^2,w^2,0,1,1,1,w^2,1,1,w,1,w,0,w,1,w^2,w^2,w^2,1,w^2,
    0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,0,1,w,0,1,w^2,w^2,w,0,1,w^2,1,w,0,0,w,1,w,0,0,1,0,0,1,w^2,
    0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,w,1,0,0,0,1,w,w^2,w,w,0,1,w,1,0,w,w,0,1,0,w^2,w,1,w,0,w^2,0,
    0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,0,1,w,w^2,w,1,w,1,w,1,1,w^2,1,1,w,w^2,w,1,1,w,w^2,0,1,w^2,w,w,
    0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,1,w,w,w^2,0,w,w^2,0,w,w,w,0,0,w^2,w,w,1,w^2,w,w^2,1,w^2,w^2,w,w^2,w,w^2,
    0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,0,w^2,1,1,0,w,0,1,0,w^2,w,0,w,0,w,w^2,w^2,1,w^2,1,w^2,w^2,w^2,0,1,1,0,
    0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,w^2,1,w^2,1,w,0,0,0,1,w,1,0,0,w^2,0,w^2,w,1,0,w^2,w,w^2,w^2,0,w,
    0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,w,1,w^2,w^2,w,w^2,w^2,1,w,w,0,w,w,w,w^2,1,0,w^2,w,1,w^2,1,1,w,w,0,
    0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,1,1,w,w,w^2,w,1,0,w,1,0,w,w^2,0,1,w^2,1,w^2,1,w,1,w,w^2,1,
    0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,0,w^2,1,0,w^2,w,0,w,1,1,w^2,0,1,1,1,1,w,0,1,0,1,1,1,0,1,w^2,0,1,0,
    0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,1,0,w^2,0,w,1,w,w,1,w^2,w^2,w^2,w,w^2,w,1,0,1,1,1,0,w^2,1,w,1,w,w,0,
    0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w,w,w,w^2,w,1,w^2,w,w,w^2,w^2,0,1,0,0,w,w^2,1,1,0,w,w,w^2,w^2,w,0,0,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,w,w,0,w^2,1,w,0,0,1,0,1,w,w,w^2,0,1,1,0,0,1,w^2,1,1,0,0,0,w^2,1,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,1,0,1,w^2,1,0,1,0,1,1,1,0,w,w,w,1,0,w^2,0,w,1,0,1,1,0,w^2,w,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,w^2,w,1,0,w^2,w,1,0,0,1,0,w,w^2,1,w,0,1,w^2,0,w^2,w^2,1,0,1,0,w^2,1,w^2,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,w,0,w^2,w^2,w,1,w^2,0,w^2,1,w^2,w,1,w,w^2,w^2,w,w^2,0,0,0,0,1,w,0,w,w^2,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,1,w^2,w^2,1,1,w^2,w,w,1,1,w,0,w^2,w,1,0,w,0,w^2,1,1,w,1,w^2,0,w^2,1,w^2
]);
Gsrc2:=Matrix(F,1,3,[
    1,1,1
]);
W1:=Matrix(F,1,48,[
    1,0,0,0,0,0,0,w^2,w,0,1,0,0,1,w,1,1,0,0,0,0,0,0,w^2,w,0,1,0,0,1,w,1,1,0,0,0,0,0,0,w^2,w,0,1,0,0,1,w,1
]);
W2:=Matrix(F,1,3,[
    1,1,1
]);
lambda:=1;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 48 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 3;
GX4:=Matrix(F,18,51,[
    1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,0,w,1,0,w^2,1,1,w^2,1,w^2,1,1,w^2,w^2,w^2,0,0,w^2,1,w,w,w,w^2,w^2,0,0,w^2,1,w^2,0,0,0,
    0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,w,0,w,0,1,1,w^2,w,w,w,1,w,w^2,w,1,w^2,w,w,w^2,1,0,0,0,w^2,0,0,0,0,0,0,
    0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,w,1,0,1,0,1,w,w^2,w,w,0,0,w,1,0,w,w,0,1,0,w^2,w,1,w,0,w^2,0,0,0,0,0,
    0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,1,w,w^2,0,w,w,1,w,1,1,0,1,0,0,1,w^2,0,1,w,1,w^2,w,0,0,0,w,1,1,1,0,0,0,
    0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,w,0,w^2,0,w^2,0,0,w^2,w^2,0,0,1,w,1,0,1,0,w^2,1,0,0,0,w,w^2,1,0,w^2,1,0,0,0,
    0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,1,0,w^2,0,1,1,1,0,w,0,1,w,1,w^2,1,w,1,1,w,0,1,w,1,w,w,w,0,w,0,0,0,
    0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,0,w^2,1,1,0,w,0,1,0,w^2,w,0,w,0,w,w^2,w^2,1,w^2,1,w^2,w^2,w^2,0,1,1,0,0,0,0,
    0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,w^2,1,w^2,1,w,0,0,0,1,w,1,0,0,w^2,0,w^2,w,1,0,w^2,w,w^2,w^2,0,w,0,0,0,
    0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,0,0,1,0,w,0,0,1,w,0,0,w,w^2,0,w^2,w,1,1,w^2,w,w^2,w^2,w,w,1,1,w^2,w^2,0,0,0,
    0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,w^2,w^2,1,0,1,w^2,0,w,0,0,w,w^2,w^2,0,1,w^2,1,w,1,0,w,w,0,1,0,1,1,1,w,w,0,0,0,
    0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,0,1,0,w^2,w,0,1,w,w^2,0,w,0,1,1,w^2,0,w,w,1,1,w,w,w,0,w^2,w^2,w^2,w,w,w,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,w^2,1,0,w^2,0,1,w^2,w,0,0,0,w,1,w^2,1,1,w^2,1,w,1,w,0,1,1,0,1,1,1,w^2,w^2,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,0,1,0,0,0,1,w^2,w,w^2,1,0,w,0,w^2,1,w^2,w,w,1,w^2,w^2,1,w^2,0,1,w,w,w^2,1,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,0,1,0,1,w,w^2,0,1,w^2,w,w,w^2,1,w,w,w^2,w^2,1,w^2,0,0,1,w^2,w,w,1,0,w,w^2,1,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,1,1,w^2,1,0,1,w^2,1,w,w^2,w^2,w^2,w,0,w^2,1,0,1,w^2,w^2,1,0,w^2,w^2,w^2,0,0,w,0,w^2,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,1,w,1,w^2,w,0,1,w^2,1,1,w,w^2,w^2,w^2,w^2,w^2,w^2,1,w,0,1,0,w,1,w,w,w^2,w^2,0,w,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,0,0,1,w,1,0,0,0,w^2,1,w^2,0,w,0,1,1,w^2,1,w^2,1,w,w,w^2,w^2,w^2,0,w^2,1,w^2,0,0,0,
    1,0,0,0,0,0,0,w^2,w,0,1,0,0,1,w,1,1,0,0,0,0,0,0,w^2,w,0,1,0,0,1,w,1,1,0,0,0,0,0,0,w^2,w,0,1,0,0,1,w,1,1,1,1
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=48 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [48+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[273]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 51 and Dimension(Q) eq 18;
assert Dimension(HermitianHull(Q)) eq 7;
Table3Parameters[273]:=[51,11,18,26];
Table3DistanceTypes[273]:="exact";

// Table 3, No. 274 | QD_54_10_16_22
// [[54,10,16;22]]_2, distance exact.
Gsrc1:=Matrix(F,15,39,[
    1,0,w^2,w^2,w^2,w,w^2,1,0,w,w,0,1,w,0,1,1,1,w^2,1,w,0,w^2,w^2,0,w,w^2,0,w,w,w,1,w,w^2,0,1,1,0,w^2,
    0,1,1,1,w,1,w,w^2,w^2,w^2,w^2,0,0,0,w,w,w,w^2,w,w^2,1,1,1,1,0,0,0,w^2,w^2,w^2,1,w^2,1,w,w,w,w,0,0,
    1,w,w^2,w^2,0,w^2,0,w^2,0,0,1,1,w,1,w,w^2,w^2,0,w^2,0,w^2,0,0,1,1,w,1,w,w^2,w^2,0,w^2,0,w^2,0,0,1,1,w,
    1,w^2,1,w,w^2,1,1,w,0,1,w,1,0,1,w^2,1,w,w^2,1,1,w,0,1,w,1,0,1,w^2,1,w,w^2,1,1,w,0,1,w,1,0,
    1,1,1,w^2,w,w,w,1,0,0,w,1,1,1,1,1,w^2,w,w,w,1,0,0,w,1,1,1,1,1,w^2,w,w,w,1,0,0,w,1,1,
    w^2,w^2,w^2,w^2,w,w,w,w,w,w,w,w,w,w^2,w^2,w^2,w^2,w,w,w,w,w,w,w,w,w,w^2,w^2,w^2,w^2,w,w,w,w,w,w,w,w,w,
    0,1,1,0,0,w^2,w,1,1,1,1,0,w^2,0,w^2,w^2,0,0,w,1,w^2,w^2,w^2,w^2,0,w,0,w,w,0,0,1,w^2,w,w,w,w,0,1,
    w^2,1,w,1,1,0,1,0,1,0,1,w^2,0,w,w^2,1,w^2,w^2,0,w^2,0,w^2,0,w^2,w,0,1,w,w^2,w,w,0,w,0,w,0,w,1,0,
    w^2,w^2,w,1,w^2,1,1,w^2,1,w,0,w^2,0,w,w,1,w^2,w,w^2,w^2,w,w^2,1,0,w,0,1,1,w^2,w,1,w,w,1,w,w^2,0,1,0,
    1,w^2,0,0,1,w^2,1,w^2,1,w^2,1,w^2,w^2,w^2,w,0,0,w^2,w,w^2,w,w^2,w,w^2,w,w,w,1,0,0,w,1,w,1,w,1,w,1,1,
    w^2,w,w^2,0,0,w^2,0,w,0,1,w,0,0,1,w^2,1,0,0,1,0,w^2,0,w,w^2,0,0,w,1,w,0,0,w,0,1,0,w^2,1,0,0,
    w,w^2,w^2,0,0,0,1,w,0,w^2,w^2,w^2,w^2,w^2,1,1,0,0,0,w,w^2,0,1,1,1,1,1,w,w,0,0,0,w^2,1,0,w,w,w,w,
    0,w,w^2,1,1,0,1,w^2,w^2,0,0,w,w,0,w,w^2,1,1,0,1,w^2,w^2,0,0,w,w,0,w,w^2,1,1,0,1,w^2,w^2,0,0,w,w,
    0,w,0,1,w^2,w,w^2,1,0,w^2,1,1,0,0,1,0,w^2,w,1,w,w^2,0,w,w^2,w^2,0,0,w^2,0,w,1,w^2,1,w,0,1,w,w,0,
    1,0,w,0,0,1,w,0,1,w,w,w^2,w,w,0,w^2,0,0,w,w^2,0,w,w^2,w^2,1,w^2,w^2,0,1,0,0,w^2,1,0,w^2,1,1,w,1
]);
Gsrc2:=Matrix(F,9,15,[
    w,w,w,1,0,w,w,w,1,0,w,w,w,1,0,
    0,w,1,w,1,0,w,1,w,1,0,w,1,w,1,
    1,1,1,w^2,0,w^2,w^2,w^2,w,0,w,w,w,1,0,
    w^2,0,w,w^2,w,w,0,1,w,1,1,0,w^2,1,w^2,
    1,0,1,w,w,w,0,w,w^2,w^2,w^2,0,w^2,1,1,
    w^2,1,0,w,w^2,1,w,0,w^2,1,w,w^2,0,1,w,
    w,1,w,w^2,w^2,w,1,w,w^2,w^2,w,1,w,w^2,w^2,
    w,0,0,1,w,1,0,0,w^2,1,w^2,0,0,w,w^2,
    w,1,0,w^2,0,w^2,w,0,1,0,1,w^2,0,w,0
]);
W1:=Matrix(F,3,39,[
    0,w,w^2,1,1,0,1,w^2,w^2,0,0,w,w,0,w,w^2,1,1,0,1,w^2,w^2,0,0,w,w,0,w,w^2,1,1,0,1,w^2,w^2,0,0,w,w,
    0,w,0,1,w^2,w,w^2,1,0,w^2,1,1,0,0,1,0,w^2,w,1,w,w^2,0,w,w^2,w^2,0,0,w^2,0,w,1,w^2,1,w,0,1,w,w,0,
    1,0,w,0,0,1,w,0,1,w,w,w^2,w,w,0,w^2,0,0,w,w^2,0,w,w^2,w^2,1,w^2,w^2,0,1,0,0,w^2,1,0,w^2,1,1,w,1
]);
W2:=Matrix(F,3,15,[
    w,1,w,w^2,w^2,w,1,w,w^2,w^2,w,1,w,w^2,w^2,
    w,0,0,1,w,1,0,0,w^2,1,w^2,0,0,w,w^2,
    w,1,0,w^2,0,w^2,w,0,1,0,1,w^2,0,w,0
]);
lambda:=3;
assert 0 lt Nrows(Gsrc1) and Nrows(Gsrc1) lt 39 and 0 lt Nrows(Gsrc2) and Nrows(Gsrc2) lt 15;
GX4:=Matrix(F,21,54,[
    1,0,w^2,w^2,w^2,w,w^2,1,0,w,w,0,1,w,0,1,1,1,w^2,1,w,0,w^2,w^2,0,w,w^2,0,w,w,w,1,w,w^2,0,1,1,0,w^2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,1,1,1,w,1,w,w^2,w^2,w^2,w^2,0,0,0,w,w,w,w^2,w,w^2,1,1,1,1,0,0,0,w^2,w^2,w^2,1,w^2,1,w,w,w,w,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    1,w,w^2,w^2,0,w^2,0,w^2,0,0,1,1,w,1,w,w^2,w^2,0,w^2,0,w^2,0,0,1,1,w,1,w,w^2,w^2,0,w^2,0,w^2,0,0,1,1,w,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    1,w^2,1,w,w^2,1,1,w,0,1,w,1,0,1,w^2,1,w,w^2,1,1,w,0,1,w,1,0,1,w^2,1,w,w^2,1,1,w,0,1,w,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    1,1,1,w^2,w,w,w,1,0,0,w,1,1,1,1,1,w^2,w,w,w,1,0,0,w,1,1,1,1,1,w^2,w,w,w,1,0,0,w,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    w^2,w^2,w^2,w^2,w,w,w,w,w,w,w,w,w,w^2,w^2,w^2,w^2,w,w,w,w,w,w,w,w,w,w^2,w^2,w^2,w^2,w,w,w,w,w,w,w,w,w,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,1,1,0,0,w^2,w,1,1,1,1,0,w^2,0,w^2,w^2,0,0,w,1,w^2,w^2,w^2,w^2,0,w,0,w,w,0,0,1,w^2,w,w,w,w,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    w^2,1,w,1,1,0,1,0,1,0,1,w^2,0,w,w^2,1,w^2,w^2,0,w^2,0,w^2,0,w^2,w,0,1,w,w^2,w,w,0,w,0,w,0,w,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    w^2,w^2,w,1,w^2,1,1,w^2,1,w,0,w^2,0,w,w,1,w^2,w,w^2,w^2,w,w^2,1,0,w,0,1,1,w^2,w,1,w,w,1,w,w^2,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    1,w^2,0,0,1,w^2,1,w^2,1,w^2,1,w^2,w^2,w^2,w,0,0,w^2,w,w^2,w,w^2,w,w^2,w,w,w,1,0,0,w,1,w,1,w,1,w,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    w^2,w,w^2,0,0,w^2,0,w,0,1,w,0,0,1,w^2,1,0,0,1,0,w^2,0,w,w^2,0,0,w,1,w,0,0,w,0,1,0,w^2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    w,w^2,w^2,0,0,0,1,w,0,w^2,w^2,w^2,w^2,w^2,1,1,0,0,0,w,w^2,0,1,1,1,1,1,w,w,0,0,0,w^2,1,0,w,w,w,w,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w,1,0,w,w,w,1,0,w,w,w,1,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,0,w,1,w,1,0,w,1,w,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,0,w^2,w^2,w^2,w,0,w,w,w,1,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w^2,w,w,0,1,w,1,1,0,w^2,1,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,w,w,0,w,w^2,w^2,w^2,0,w^2,1,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w,w^2,1,w,0,w^2,1,w,w^2,0,1,w,
    0,w,w^2,1,1,0,1,w^2,w^2,0,0,w,w,0,w,w^2,1,1,0,1,w^2,w^2,0,0,w,w,0,w,w^2,1,1,0,1,w^2,w^2,0,0,w,w,w,1,w,w^2,w^2,w,1,w,w^2,w^2,w,1,w,w^2,w^2,
    0,w,0,1,w^2,w,w^2,1,0,w^2,1,1,0,0,1,0,w^2,w,1,w,w^2,0,w,w^2,w^2,0,0,w^2,0,w,1,w^2,1,w,0,1,w,w,0,w,0,0,1,w,1,0,0,w^2,1,w^2,0,0,w,w^2,
    1,0,w,0,0,1,w,0,1,w,w,w^2,w,w,0,w^2,0,0,w,w^2,0,w,w^2,w^2,1,w^2,w^2,0,1,0,0,w^2,1,0,w^2,1,1,w,1,w,1,0,w^2,0,w^2,w,0,1,0,1,w^2,0,w,0
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
U1:=BasisMatrix(Nullspace(Gsrc1*HDag(W1)))*Gsrc1;
U2:=BasisMatrix(Nullspace(Gsrc2*HDag(W2)))*Gsrc2;
ReconstructedGX4:=VerticalJoin(VerticalJoin(HorizontalJoin(U1,ZeroMatrix(F,Nrows(U1),Ncols(Gsrc2))),HorizontalJoin(ZeroMatrix(F,Nrows(U2),Ncols(Gsrc1)),U2)),HorizontalJoin(W1,W2));
assert RowSpace(ReconstructedGX4) eq RowSpace(GX4);
ell1:=39 div 3;ell2:=15 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [39+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[274]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 54 and Dimension(Q) eq 21;
assert Dimension(HermitianHull(Q)) eq 11;
Table3Parameters[274]:=[54,10,16,22];
Table3DistanceTypes[274]:="exact";

assert #Keys(Table3Generators) eq 52;
print "TABLE3_VERIFIED 52";
