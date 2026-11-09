// Table 3: direct QC-X4 constructions.
// 23 records, manuscript Nos. 178-200.
// CSV matrices and Magma matrices have exactly the same row order.
// Table3Generators[No] = <Gsrc1,Gsrc2,W1,W2,lambda,GX4>.

F<w>:=GF(4);
function HDag(X)
    return Transpose(Matrix(BaseRing(X),Nrows(X),Ncols(X),[z^2:z in Eltseq(X)]));
end function;
Table3Generators:=AssociativeArray();
Table3Parameters:=AssociativeArray();
Table3DistanceTypes:=AssociativeArray();

// Table 3, No. 178 | SX01
// [[12,5,4;1]]_2, distance exact.
Gsrc1:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
Gsrc2:=Matrix(F,8,9,[
    1,0,0,0,0,0,0,0,w^2,
    0,1,0,0,0,0,0,0,1,
    0,0,1,0,0,0,0,0,1,
    0,0,0,1,0,0,0,0,w^2,
    0,0,0,0,1,0,0,0,1,
    0,0,0,0,0,1,0,0,1,
    0,0,0,0,0,0,1,0,w^2,
    0,0,0,0,0,0,0,1,1
]);
W1:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W2:=Matrix(F,3,9,[
    1,1,0,1,1,0,w^2,w^2,1,
    w^2,w^2,1,1,1,0,1,1,0,
    1,1,0,w^2,w^2,1,1,1,0
]);
lambda:=3;
GX4:=Matrix(F,8,12,[
    0,0,0,1,0,0,0,0,w^2,0,w,w,
    0,0,0,0,1,0,0,0,w^2,1,w^2,w,
    0,0,0,0,0,1,0,0,1,w,w^2,w,
    0,0,0,0,0,0,1,0,w^2,1,0,w^2,
    0,0,0,0,0,0,0,1,w^2,0,1,w^2,
    1,0,0,1,1,0,1,1,0,w^2,w^2,1,
    0,1,0,w^2,w^2,1,1,1,0,1,1,0,
    0,0,1,1,1,0,w^2,w^2,1,1,1,0
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
ell1:=3 div 3;ell2:=9 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [3+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[178]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 12 and Dimension(Q) eq 8;
assert Dimension(HermitianHull(Q)) eq 3;
Table3Parameters[178]:=[12,5,4,1];
Table3DistanceTypes[178]:="exact";

// Table 3, No. 179 | SX02
// [[15,3,6;2]]_2, distance exact.
Gsrc1:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
Gsrc2:=Matrix(F,8,12,[
    1,0,0,0,0,0,0,0,w,w^2,1,w^2,
    0,1,0,0,0,0,0,0,0,w^2,w^2,w^2,
    0,0,1,0,0,0,0,0,w,1,w^2,w^2,
    0,0,0,1,0,0,0,0,0,1,w,w^2,
    0,0,0,0,1,0,0,0,1,1,w,w,
    0,0,0,0,0,1,0,0,1,w,1,w,
    0,0,0,0,0,0,1,0,w,w,w,w,
    0,0,0,0,0,0,0,1,w^2,w,w^2,0
]);
W1:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W2:=Matrix(F,3,12,[
    1,w^2,1,w^2,1,1,0,0,0,0,w,0,
    0,0,w,0,1,w^2,1,w^2,1,1,0,0,
    1,1,0,0,0,0,w,0,1,w^2,1,w^2
]);
lambda:=3;
GX4:=Matrix(F,8,15,[
    0,0,0,1,0,w,0,0,0,0,w,0,w,1,w,
    0,0,0,0,1,w^2,0,0,0,0,1,w,w,w,1,
    0,0,0,0,0,0,1,0,0,0,w,1,w,w^2,w^2,
    0,0,0,0,0,0,0,1,0,w,1,1,0,w,1,
    0,0,0,0,0,0,0,0,1,w^2,w^2,w,w,w,w^2,
    1,0,0,1,w^2,1,w^2,1,1,0,0,0,0,w,0,
    0,1,0,0,0,w,0,1,w^2,1,w^2,1,1,0,0,
    0,0,1,1,1,0,0,0,0,w,0,1,w^2,1,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
ell1:=3 div 3;ell2:=12 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [3+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[179]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 15 and Dimension(Q) eq 8;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[179]:=[15,3,6,2];
Table3DistanceTypes[179]:="exact";

// Table 3, No. 180 | SX03
// [[15,5,5;2]]_2, distance exact.
Gsrc1:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
Gsrc2:=Matrix(F,9,12,[
    1,0,0,0,0,0,0,0,1,0,1,w,
    0,1,0,0,0,0,0,0,w^2,0,0,w^2,
    0,0,1,0,0,0,0,0,w,0,w,w,
    0,0,0,1,0,0,0,0,w^2,0,w,w^2,
    0,0,0,0,1,0,0,0,w,0,0,1,
    0,0,0,0,0,1,0,0,1,0,w,w^2,
    0,0,0,0,0,0,1,0,0,0,w,1,
    0,0,0,0,0,0,0,1,w,0,1,0,
    0,0,0,0,0,0,0,0,0,1,w^2,w^2
]);
W1:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W2:=Matrix(F,3,12,[
    w,w^2,w^2,0,1,w,w,0,1,1,0,1,
    1,1,0,1,w,w^2,w^2,0,1,w,w,0,
    1,w,w,0,1,1,0,1,w,w^2,w^2,0
]);
lambda:=3;
GX4:=Matrix(F,9,15,[
    0,0,0,1,0,0,0,0,0,w,0,1,w,w^2,1,
    0,0,0,0,1,0,0,0,0,w,w,0,1,w,w,
    0,0,0,0,0,1,0,0,0,1,w,1,w,w^2,w,
    0,0,0,0,0,0,1,0,0,w,1,1,w^2,w,w^2,
    0,0,0,0,0,0,0,1,0,0,w^2,w^2,w,w,0,
    0,0,0,0,0,0,0,0,1,w^2,w^2,0,w^2,w,w,
    1,0,0,w,w^2,w^2,0,1,w,w,0,1,1,0,1,
    0,1,0,1,1,0,1,w,w^2,w^2,0,1,w,w,0,
    0,0,1,1,w,w,0,1,1,0,1,w,w^2,w^2,0
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
ell1:=3 div 3;ell2:=12 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [3+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[180]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 15 and Dimension(Q) eq 9;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[180]:=[15,5,5,2];
Table3DistanceTypes[180]:="exact";

// Table 3, No. 181 | SX04
// [[18,3,6;1]]_2, distance exact.
Gsrc1:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
Gsrc2:=Matrix(F,10,15,[
    1,0,0,0,0,0,0,0,0,0,w^2,w,w^2,w^2,w,
    0,1,0,0,0,0,0,0,0,0,w^2,0,w^2,1,w^2,
    0,0,1,0,0,0,0,0,0,0,w,w^2,0,w,0,
    0,0,0,1,0,0,0,0,0,0,w^2,0,w,w^2,0,
    0,0,0,0,1,0,0,0,0,0,1,w^2,w^2,0,1,
    0,0,0,0,0,1,0,0,0,0,w,w,w^2,w^2,w,
    0,0,0,0,0,0,1,0,0,0,w^2,1,w,0,w,
    0,0,0,0,0,0,0,1,0,0,w,w^2,0,w^2,1,
    0,0,0,0,0,0,0,0,1,0,w^2,0,w^2,w^2,1,
    0,0,0,0,0,0,0,0,0,1,1,w^2,w,1,1
]);
W1:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W2:=Matrix(F,3,15,[
    1,0,w,1,1,w,0,0,w,w,w,w,1,1,0,
    w,w,1,1,0,1,0,w,1,1,w,0,0,w,w,
    w,0,0,w,w,w,w,1,1,0,1,0,w,1,1
]);
lambda:=3;
GX4:=Matrix(F,10,18,[
    0,0,0,1,0,0,0,0,0,0,w,w^2,1,w^2,0,w^2,1,w,
    0,0,0,0,1,0,0,0,0,0,0,w,w,0,1,1,w,w^2,
    0,0,0,0,0,1,0,0,0,0,w^2,w,0,w,1,1,1,1,
    0,0,0,0,0,0,1,0,0,0,w^2,w^2,1,1,1,w,w,1,
    0,0,0,0,0,0,0,1,0,0,w,w,1,w,1,0,1,0,
    0,0,0,0,0,0,0,0,1,0,w^2,w^2,0,1,0,1,w^2,w,
    0,0,0,0,0,0,0,0,0,1,w^2,0,w^2,1,1,w^2,1,w,
    1,0,0,1,0,w,1,1,w,0,0,w,w,w,w,1,1,0,
    0,1,0,w,w,1,1,0,1,0,w,1,1,w,0,0,w,w,
    0,0,1,w,0,0,w,w,w,w,1,1,0,1,0,w,1,1
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
ell1:=3 div 3;ell2:=15 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [3+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[181]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 18 and Dimension(Q) eq 10;
assert Dimension(HermitianHull(Q)) eq 7;
Table3Parameters[181]:=[18,3,6,1];
Table3DistanceTypes[181]:="exact";

// Table 3, No. 182 | GQ01
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
ell1:=15 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [15+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[182]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 18 and Dimension(Q) eq 6;
assert Dimension(HermitianHull(Q)) eq 2;
Table3Parameters[182]:=[18,4,9,10];
Table3DistanceTypes[182]:="exact";

// Table 3, No. 183 | SX07
// [[18,7,6;5]]_2, distance exact.
Gsrc1:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
Gsrc2:=Matrix(F,10,15,[
    1,0,0,0,0,0,0,0,0,0,0,1,1,w,w,
    0,1,0,0,0,0,0,0,0,w,0,w^2,0,0,w^2,
    0,0,1,0,0,0,0,0,0,1,0,w^2,w,0,w,
    0,0,0,1,0,0,0,0,0,w^2,0,0,0,w^2,1,
    0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,
    0,0,0,0,0,1,0,0,0,0,0,0,w,1,1,
    0,0,0,0,0,0,1,0,0,w,0,w,0,0,w^2,
    0,0,0,0,0,0,0,1,0,1,0,w^2,w^2,0,w,
    0,0,0,0,0,0,0,0,1,w^2,0,0,0,w,1,
    0,0,0,0,0,0,0,0,0,0,1,1,w^2,w^2,w^2
]);
W1:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W2:=Matrix(F,3,15,[
    0,w,w^2,w,0,w,1,w,w,0,1,1,0,w^2,1,
    1,1,0,w^2,1,0,w,w^2,w,0,w,1,w,w,0,
    w,1,w,w,0,1,1,0,w^2,1,0,w,w^2,w,0
]);
lambda:=3;
GX4:=Matrix(F,10,18,[
    0,0,0,1,0,0,0,0,0,0,w,0,w,w,w,1,w^2,0,
    0,0,0,0,1,0,0,0,0,0,w^2,w^2,w^2,w^2,w,0,w^2,w^2,
    0,0,0,0,0,1,0,0,0,0,w,1,0,w^2,1,1,0,w,
    0,0,0,0,0,0,1,0,0,0,1,w^2,0,1,w,0,1,w^2,
    0,0,0,0,0,0,0,1,0,0,w^2,1,1,w^2,1,0,0,w^2,
    0,0,0,0,0,0,0,0,1,0,w^2,w,w,w,0,1,w^2,w^2,
    0,0,0,0,0,0,0,0,0,1,1,0,w^2,1,0,0,w^2,w,
    1,0,0,0,w,w^2,w,0,w,1,w,w,0,1,1,0,w^2,1,
    0,1,0,1,1,0,w^2,1,0,w,w^2,w,0,w,1,w,w,0,
    0,0,1,w,1,w,w,0,1,1,0,w^2,1,0,w,w^2,w,0
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
ell1:=3 div 3;ell2:=15 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [3+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[183]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 18 and Dimension(Q) eq 10;
assert Dimension(HermitianHull(Q)) eq 3;
Table3Parameters[183]:=[18,7,6,5];
Table3DistanceTypes[183]:="exact";

// Table 3, No. 184 | GQ02
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
ell1:=18 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [18+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[184]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 21 and Dimension(Q) eq 8;
assert Dimension(HermitianHull(Q)) eq 3;
Table3Parameters[184]:=[21,5,9,10];
Table3DistanceTypes[184]:="exact";

// Table 3, No. 185 | SX08
// [[21,9,5;2]]_2, distance exact.
Gsrc1:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
Gsrc2:=Matrix(F,14,18,[
    1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,
    0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,
    0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,w,
    0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,
    0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,w^2,0,w,
    0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,1,w,
    0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,0,1,w^2,
    0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,0,0,
    0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,0,w,
    0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,w,1,1,
    0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,1,w,w,
    0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,1,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,w,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,w^2,1
]);
W1:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W2:=Matrix(F,3,18,[
    1,w^2,w^2,1,w^2,0,0,0,0,w^2,0,w,w^2,w^2,0,w^2,1,0,
    w^2,w^2,0,w^2,1,0,1,w^2,w^2,1,w^2,0,0,0,0,w^2,0,w,
    0,0,0,w^2,0,w,w^2,w^2,0,w^2,1,0,1,w^2,w^2,1,w^2,0
]);
lambda:=3;
GX4:=Matrix(F,14,21,[
    0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,0,w,1,w,0,
    0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,w^2,w^2,w,0,w^2,w^2,
    0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,w^2,0,0,w,w^2,1,
    0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,1,w^2,0,1,w,0,
    0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,1,1,w^2,w,0,
    0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,0,w^2,w^2,w,w,
    0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,1,1,0,w,w,w^2,
    0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,1,1,1,0,w,w^2,
    0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,w^2,w,1,0,1,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,1,1,1,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,0,w,w^2,
    1,0,0,1,w^2,w^2,1,w^2,0,0,0,0,w^2,0,w,w^2,w^2,0,w^2,1,0,
    0,1,0,w^2,w^2,0,w^2,1,0,1,w^2,w^2,1,w^2,0,0,0,0,w^2,0,w,
    0,0,1,0,0,0,w^2,0,w,w^2,w^2,0,w^2,1,0,1,w^2,w^2,1,w^2,0
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
ell1:=3 div 3;ell2:=18 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [3+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[185]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 21 and Dimension(Q) eq 14;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[185]:=[21,9,5,2];
Table3DistanceTypes[185]:="exact";

// Table 3, No. 186 | SQ01
// [[24,4,10;10]]_2, distance exact.
Gsrc1:=Matrix(F,9,21,[
    1,0,0,0,0,0,0,0,0,1,1,w,1,1,w,w^2,1,w,0,0,w,
    0,1,0,0,0,0,0,0,0,0,w^2,w,1,0,w,w,1,1,w,1,0,
    0,0,1,0,0,0,0,0,0,w,w^2,1,w,w,1,0,0,0,1,0,1,
    0,0,0,1,0,0,0,0,0,1,0,0,1,w,1,1,0,1,w,1,w^2,
    0,0,0,0,1,0,0,0,0,w^2,w^2,w^2,w^2,0,0,w^2,0,w^2,1,1,1,
    0,0,0,0,0,1,0,0,0,w^2,w^2,w,1,0,0,1,w^2,w,w,1,w,
    0,0,0,0,0,0,1,0,0,w^2,w,1,w,1,w,0,w^2,w,0,w^2,1,
    0,0,0,0,0,0,0,1,0,w^2,0,1,w,1,w,w,1,0,1,1,0,
    0,0,0,0,0,0,0,0,1,w^2,w,w,w^2,w,0,w^2,w^2,0,w,1,1
]);
Gsrc2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W1:=Matrix(F,3,21,[
    0,1,0,w^2,0,0,w^2,w,1,w^2,0,1,w^2,w,w^2,1,w,w^2,w^2,w^2,0,
    w^2,1,w,w^2,w^2,w^2,0,0,1,0,w^2,0,0,w^2,w,1,w^2,0,1,w^2,w,
    w,1,w^2,0,1,w^2,w,w^2,1,w,w^2,w^2,w^2,0,0,1,0,w^2,0,0,w^2
]);
W2:=Matrix(F,3,3,[
    w,1,w,
    w,w,1,
    1,w,w
]);
lambda:=3;
GX4:=Matrix(F,9,24,[
    1,0,0,0,0,0,1,w,1,0,1,w^2,w^2,0,w^2,w^2,w^2,0,0,0,w,0,0,0,
    0,1,0,0,0,0,w,1,w,w^2,w^2,w,1,0,w^2,1,0,w,0,w^2,0,0,0,0,
    0,0,1,0,0,0,0,1,w^2,w^2,w,1,w,w,w^2,0,w^2,0,1,w,w,0,0,0,
    0,0,0,1,0,0,w,w,w,0,0,w^2,0,1,1,w^2,w,w,w^2,0,w^2,0,0,0,
    0,0,0,0,1,0,0,0,w^2,1,w,w,1,1,0,1,w,w^2,0,w,w,0,0,0,
    0,0,0,0,0,1,w^2,1,1,1,0,w,1,0,w^2,0,w^2,w^2,1,w^2,0,0,0,0,
    0,1,0,w^2,0,0,w^2,w,1,w^2,0,1,w^2,w,w^2,1,w,w^2,w^2,w^2,0,w,1,w,
    w^2,1,w,w^2,w^2,w^2,0,0,1,0,w^2,0,0,w^2,w,1,w^2,0,1,w^2,w,w,w,1,
    w,1,w^2,0,1,w^2,w,w^2,1,w,w^2,w^2,w^2,0,0,1,0,w^2,0,0,w^2,1,w,w
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
ell1:=21 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [21+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[186]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 24 and Dimension(Q) eq 9;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[186]:=[24,4,10,10];
Table3DistanceTypes[186]:="exact";

// Table 3, No. 187 | SQ02
// [[24,5,9;9]]_2, distance exact.
Gsrc1:=Matrix(F,10,21,[
    1,0,0,0,0,0,0,0,0,w^2,0,0,1,w,0,w^2,w^2,w,w,1,w,
    0,1,0,0,0,0,0,0,0,1,0,w^2,w,0,1,0,w,w^2,w,1,w,
    0,0,1,0,0,0,0,0,0,w^2,0,w^2,w^2,w^2,0,w^2,0,1,w^2,0,0,
    0,0,0,1,0,0,0,0,0,w^2,0,1,w,w^2,1,w,0,1,w^2,w^2,w,
    0,0,0,0,1,0,0,0,0,w,0,1,1,1,w^2,w^2,w^2,1,w,1,0,
    0,0,0,0,0,1,0,0,0,w^2,0,w,0,w,w^2,w^2,0,w^2,w^2,0,w^2,
    0,0,0,0,0,0,1,0,0,w^2,0,w^2,w,0,w^2,w,w^2,1,w,w,1,
    0,0,0,0,0,0,0,1,0,1,0,w^2,1,w^2,w,0,w,0,1,w,1,
    0,0,0,0,0,0,0,0,1,1,0,w^2,0,1,0,w,w,0,1,0,w,
    0,0,0,0,0,0,0,0,0,0,1,w^2,0,w^2,w,w,0,1,w^2,w,0
]);
Gsrc2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W1:=Matrix(F,3,21,[
    w^2,0,w,1,w^2,0,1,w,w^2,w^2,1,0,w^2,1,1,w,1,1,w,0,1,
    1,w,1,1,w,0,1,w^2,0,w,1,w^2,0,1,w,w^2,w^2,1,0,w^2,1,
    w,w^2,w^2,1,0,w^2,1,1,w,1,1,w,0,1,w^2,0,w,1,w^2,0,1
]);
W2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
lambda:=3;
GX4:=Matrix(F,10,24,[
    1,0,0,1,0,0,0,0,w,w,w,1,w^2,w,w,1,0,1,w,1,w^2,0,0,0,
    0,1,0,w^2,0,0,0,0,w^2,0,w,w^2,w^2,0,1,w^2,w^2,w,w,0,w,0,0,0,
    0,0,1,w,0,0,0,0,w,0,1,w^2,0,w^2,0,1,w^2,w,w^2,w^2,0,0,0,0,
    0,0,0,0,1,0,0,0,1,w^2,w,w^2,1,1,0,w,1,w^2,w,w,w,0,0,0,
    0,0,0,0,0,1,0,0,w,1,w^2,1,0,w,w,1,w^2,0,w^2,1,0,0,0,0,
    0,0,0,0,0,0,1,0,1,w,0,0,w,1,w^2,0,1,1,w^2,w,w^2,0,0,0,
    0,0,0,0,0,0,0,1,w^2,w,0,1,1,0,w,1,w^2,0,w,w,0,0,0,0,
    w^2,0,w,1,w^2,0,1,w,w^2,w^2,1,0,w^2,1,1,w,1,1,w,0,1,1,0,0,
    1,w,1,1,w,0,1,w^2,0,w,1,w^2,0,1,w,w^2,w^2,1,0,w^2,1,0,1,0,
    w,w^2,w^2,1,0,w^2,1,1,w,1,1,w,0,1,w^2,0,w,1,w^2,0,1,0,0,1
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
ell1:=21 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [21+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[187]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 24 and Dimension(Q) eq 10;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[187]:=[24,5,9,9];
Table3DistanceTypes[187]:="exact";

// Table 3, No. 188 | SQ03
// [[24,6,9;10]]_2, distance exact.
Gsrc1:=Matrix(F,10,21,[
    1,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,0,0,w^2,w^2,w^2,w^2,w^2,
    0,1,0,0,0,0,0,0,0,0,w,w^2,w,1,0,w^2,w^2,0,1,1,w,
    0,0,1,0,0,0,0,0,0,0,w^2,0,w,1,w^2,w,w,w^2,w,w,w^2,
    0,0,0,1,0,0,0,0,0,0,w,1,1,0,w,1,1,w^2,w^2,0,w^2,
    0,0,0,0,1,0,0,0,0,0,0,1,w,0,1,1,0,w,w^2,w,1,
    0,0,0,0,0,1,0,0,0,0,w,1,w,0,1,0,w,1,w^2,1,w^2,
    0,0,0,0,0,0,1,0,0,0,w,1,1,w,w,w,1,1,1,w^2,w,
    0,0,0,0,0,0,0,1,0,0,w^2,0,1,w,w,0,0,1,0,w,w^2,
    0,0,0,0,0,0,0,0,1,0,w,0,w,w^2,1,1,w^2,1,w^2,w,w^2,
    0,0,0,0,0,0,0,0,0,1,1,1,w,w^2,1,w,w^2,0,w,w,1
]);
Gsrc2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W1:=Matrix(F,3,21,[
    1,1,w^2,w^2,0,w,0,w^2,1,w^2,1,1,0,1,w,1,0,w^2,w,w^2,w,
    w,1,0,w^2,w,w^2,w,1,1,w^2,w^2,0,w,0,w^2,1,w^2,1,1,0,1,
    w^2,1,w^2,1,1,0,1,w,1,0,w^2,w,w^2,w,1,1,w^2,w^2,0,w,0
]);
W2:=Matrix(F,3,3,[
    w^2,w^2,1,
    1,w^2,w^2,
    w^2,1,w^2
]);
lambda:=3;
GX4:=Matrix(F,10,24,[
    1,0,0,0,0,0,0,1,w,w,w,w,w,1,w,1,w^2,0,1,1,w^2,0,0,0,
    0,1,0,0,0,0,0,1,1,0,w^2,w^2,1,0,w^2,w,0,0,w,1,w,0,0,0,
    0,0,1,0,0,0,0,0,w^2,w^2,1,w^2,w,1,w^2,0,w,0,1,w,w,0,0,0,
    0,0,0,1,0,0,0,1,0,1,0,0,w,1,1,w^2,w,w,1,0,1,0,0,0,
    0,0,0,0,1,0,0,w,1,w^2,0,w,w^2,w,0,1,1,1,1,w,0,0,0,0,
    0,0,0,0,0,1,0,1,w,w^2,1,w,1,1,w,w^2,1,w,w^2,1,w,0,0,0,
    0,0,0,0,0,0,1,w,1,w,w^2,w^2,w,w^2,w,0,w^2,w,1,1,w,0,0,0,
    1,1,w^2,w^2,0,w,0,w^2,1,w^2,1,1,0,1,w,1,0,w^2,w,w^2,w,w^2,w^2,1,
    w,1,0,w^2,w,w^2,w,1,1,w^2,w^2,0,w,0,w^2,1,w^2,1,1,0,1,1,w^2,w^2,
    w^2,1,w^2,1,1,0,1,w,1,0,w^2,w,w^2,w,1,1,w^2,w^2,0,w,0,w^2,1,w^2
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
ell1:=21 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [21+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[188]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 24 and Dimension(Q) eq 10;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[188]:=[24,6,9,10];
Table3DistanceTypes[188]:="exact";

// Table 3, No. 189 | SQ04
// [[27,6,9;9]]_2, distance exact.
Gsrc1:=Matrix(F,12,24,[
    1,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w,w^2,w,1,0,w,1,w,0,
    0,1,0,0,0,0,0,0,0,0,0,w,0,1,0,w,w^2,w^2,0,0,w^2,w,w,w^2,
    0,0,1,0,0,0,0,0,0,0,0,w^2,0,w^2,1,w^2,w,1,1,w,0,w^2,1,1,
    0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,w,w,w^2,w^2,w,w,0,0,0,
    0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,w,w^2,w,0,w,1,w^2,w^2,w,
    0,0,0,0,0,1,0,0,0,0,0,w,0,1,1,w^2,0,w,w^2,1,w^2,w,1,1,
    0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,0,0,1,w,w^2,w,w,w^2,0,
    0,0,0,0,0,0,0,1,0,0,0,w,0,0,w^2,w^2,0,w,w^2,1,w^2,w^2,w,w,
    0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,1,0,w,w,1,w,1,1,0,
    0,0,0,0,0,0,0,0,0,1,0,1,0,w^2,w^2,w,w,w,w^2,w^2,0,w^2,0,w,
    0,0,0,0,0,0,0,0,0,0,1,1,0,w,1,0,w^2,w,1,w^2,0,0,w^2,0,
    0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,0,w^2,w,0,w,0,w^2,w,1
]);
Gsrc2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W1:=Matrix(F,3,24,[
    w^2,w^2,w,w^2,1,1,w,0,1,w,w^2,w,0,0,w,w^2,0,1,w^2,w,1,1,w,0,
    0,1,w^2,w,1,1,w,0,w^2,w^2,w,w^2,1,1,w,0,1,w,w^2,w,0,0,w,w^2,
    1,w,w^2,w,0,0,w,w^2,0,1,w^2,w,1,1,w,0,w^2,w^2,w,w^2,1,1,w,0
]);
W2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
lambda:=3;
GX4:=Matrix(F,12,27,[
    1,0,0,0,0,0,0,0,0,w,0,w,w,1,1,1,1,w,0,w,w,1,1,1,0,0,0,
    0,1,0,0,0,0,0,0,0,1,0,w^2,0,w,w^2,0,1,1,w^2,w^2,w^2,1,w,1,0,0,0,
    0,0,1,0,0,0,0,0,0,0,w^2,0,0,w,w,w^2,0,0,w,0,0,w^2,w^2,1,0,0,0,
    0,0,0,1,0,0,0,0,0,0,w,w^2,1,w,0,w,0,w,1,1,w,w^2,w^2,1,0,0,0,
    0,0,0,0,1,0,0,0,0,1,w^2,w,w^2,0,0,0,1,0,0,w,1,w,0,w^2,0,0,0,
    0,0,0,0,0,1,0,0,0,w,w^2,w^2,1,0,1,0,w,w,1,0,w^2,0,1,w^2,0,0,0,
    0,0,0,0,0,0,1,0,0,w,0,w^2,1,0,w,w^2,0,0,w^2,0,w,0,1,w,0,0,0,
    0,0,0,0,0,0,0,1,0,0,w,0,0,w^2,1,w^2,1,1,1,0,w^2,w^2,w^2,w,0,0,0,
    0,0,0,0,0,0,0,0,1,w,w^2,1,1,w,w,w,w,w,0,0,w,w^2,1,w,0,0,0,
    w^2,w^2,w,w^2,1,1,w,0,1,w,w^2,w,0,0,w,w^2,0,1,w^2,w,1,1,w,0,1,0,0,
    0,1,w^2,w,1,1,w,0,w^2,w^2,w,w^2,1,1,w,0,1,w,w^2,w,0,0,w,w^2,0,1,0,
    1,w,w^2,w,0,0,w,w^2,0,1,w^2,w,1,1,w,0,w^2,w^2,w,w^2,1,1,w,0,0,0,1
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
ell1:=24 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [24+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[189]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 27 and Dimension(Q) eq 12;
assert Dimension(HermitianHull(Q)) eq 6;
Table3Parameters[189]:=[27,6,9,9];
Table3DistanceTypes[189]:="exact";

// Table 3, No. 190 | SQ08
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
ell1:=30 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [30+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[190]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 9;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[190]:=[33,5,14,20];
Table3DistanceTypes[190]:="exact";

// Table 3, No. 191 | SQ10
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
ell1:=30 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [30+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[191]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 8;
assert Dimension(HermitianHull(Q)) eq 2;
Table3Parameters[191]:=[33,6,17,23];
Table3DistanceTypes[191]:="exact";

// Table 3, No. 192 | GQ03
// [[33,7,11;12]]_2, distance exact.
Gsrc1:=Matrix(F,14,30,[
    1,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,1,w,w,w,w^2,1,w^2,w,w^2,w,w,w,w^2,0,
    0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,w,0,w^2,0,w^2,1,0,w^2,0,w^2,1,w,w^2,w,w^2,w^2,
    0,0,1,0,0,0,0,0,0,0,0,0,0,1,w^2,0,0,w^2,w,w,1,w^2,1,w,1,w,w,0,1,w^2,
    0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,0,0,1,1,0,w,w^2,w^2,w,w,w,w^2,w^2,0,1,0,
    0,0,0,0,1,0,0,0,0,0,0,0,0,1,w^2,0,w^2,w^2,w,w^2,w^2,0,0,0,w^2,0,w,w,0,1,
    0,0,0,0,0,1,0,0,0,0,0,0,0,w,1,0,1,0,w,w,w^2,0,0,1,w^2,w^2,1,w^2,0,w^2,
    0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,1,0,w,w^2,0,w^2,0,w^2,w^2,0,w^2,1,0,w,w,w,
    0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,w^2,1,w^2,1,1,w,0,0,1,w^2,0,w,w,w,
    0,0,0,0,0,0,0,0,1,0,0,0,0,w,w^2,0,0,1,w,0,w,w^2,1,w^2,1,w^2,0,1,1,0,
    0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,w^2,0,w^2,0,1,0,w,1,w^2,0,0,w,w^2,w^2,0,0,
    0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,0,0,w^2,1,0,0,w^2,0,1,w^2,w^2,0,w,1,1,
    0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,0,w,w^2,0,w,w,0,w,0,1,w^2,1,1,w^2,1,
    0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,0,1,0,w,1,w,0,w^2,1,w^2,1,1,w^2,w,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,0,0,w^2,1,1,w,1,w,w^2,w^2,w,0
]);
Gsrc2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W1:=Matrix(F,3,30,[
    w,0,w,w,w,w^2,1,w^2,w,0,0,1,1,0,w,w^2,w,1,1,0,w^2,w,w^2,1,0,w,w^2,w^2,0,w^2,
    w^2,w,w^2,1,0,w,w^2,w^2,0,w^2,w,0,w,w,w,w^2,1,w^2,w,0,0,1,1,0,w,w^2,w,1,1,0,
    0,1,1,0,w,w^2,w,1,1,0,w^2,w,w^2,1,0,w,w^2,w^2,0,w^2,w,0,w,w,w,w^2,1,w^2,w,0
]);
W2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
lambda:=3;
GX4:=Matrix(F,14,33,[
    1,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,w,0,1,0,w^2,0,w^2,w,w^2,w,w^2,0,w,0,0,0,0,
    0,1,0,0,0,0,0,0,0,0,0,w^2,0,0,0,1,w^2,0,w^2,0,w,w,0,1,w^2,w,w^2,w,w^2,0,0,0,0,
    0,0,1,0,0,0,0,0,0,0,0,1,w,0,1,w^2,w^2,1,1,w,w,0,1,1,w,w,w^2,w,0,w,0,0,0,
    0,0,0,1,0,0,0,0,0,0,0,w^2,w^2,0,0,0,w^2,w^2,1,0,w^2,w^2,1,1,w^2,w,w^2,1,w,w^2,0,0,0,
    0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,1,w^2,1,0,w,w,1,w,w^2,1,w^2,0,w,0,1,0,0,0,
    0,0,0,0,0,1,0,0,0,0,0,0,0,w,1,w^2,w,1,w,w,1,w^2,w^2,0,0,w,w^2,1,1,w^2,0,0,0,
    0,0,0,0,0,0,1,0,0,0,0,w,w,1,1,w,1,1,w^2,w,1,1,w^2,1,w,1,1,0,w^2,0,0,0,0,
    0,0,0,0,0,0,0,1,0,0,0,w,1,w^2,w,1,0,w,1,w^2,w^2,w^2,1,w^2,1,1,0,0,w^2,0,0,0,0,
    0,0,0,0,0,0,0,0,1,0,0,w,0,0,w,w,1,w^2,w,w^2,0,1,0,0,1,1,w^2,w,w^2,w,0,0,0,
    0,0,0,0,0,0,0,0,0,1,0,0,1,w^2,0,w^2,1,1,w^2,1,w,w,w^2,0,0,w,0,w,w^2,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,1,0,w^2,0,0,1,w,1,0,w^2,w,w,w^2,0,0,w,0,w^2,w,1,0,0,0,
    w,0,w,w,w,w^2,1,w^2,w,0,0,1,1,0,w,w^2,w,1,1,0,w^2,w,w^2,1,0,w,w^2,w^2,0,w^2,1,0,0,
    w^2,w,w^2,1,0,w,w^2,w^2,0,w^2,w,0,w,w,w,w^2,1,w^2,w,0,0,1,1,0,w,w^2,w,1,1,0,0,1,0,
    0,1,1,0,w,w^2,w,1,1,0,w^2,w,w^2,1,0,w,w^2,w^2,0,w^2,w,0,w,w,w,w^2,1,w^2,w,0,0,0,1
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
ell1:=30 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [30+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[192]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 14;
assert Dimension(HermitianHull(Q)) eq 7;
Table3Parameters[192]:=[33,7,11,12];
Table3DistanceTypes[192]:="exact";

// Table 3, No. 193 | GQ04
// [[33,10,11;15]]_2, distance exact.
Gsrc1:=Matrix(F,14,30,[
    1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,w,w,1,1,w,0,w^2,1,1,1,0,1,w,w^2,
    0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w,1,1,w^2,1,w^2,w,w,0,1,0,w,1,1,
    0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,0,w,0,w,0,1,w^2,1,w^2,0,1,
    0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,1,0,1,1,1,0,w^2,1,w,w,1,w,w^2,0,
    0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,w,w,w^2,w^2,0,w,w,w^2,0,1,0,1,0,w,
    0,0,0,0,0,1,0,0,0,0,0,0,0,w,0,1,w,w^2,w^2,w^2,0,0,1,1,w^2,1,w^2,w^2,1,w,
    0,0,0,0,0,0,1,0,0,0,0,0,0,w,0,w^2,w^2,0,0,0,0,w,w,w^2,0,1,1,w,0,0,
    0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,0,w^2,w,w^2,1,w,w^2,0,0,w^2,0,1,w^2,1,
    0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,1,0,w,w,w,0,w^2,1,w,w,w,1,w^2,1,1,
    0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,w,0,1,0,0,0,1,w,0,1,w^2,w,w,1,w,
    0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,1,w,1,0,w^2,w,w,0,w^2,0,w,0,w^2,w,1,
    0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,w^2,0,w^2,1,w,w^2,w^2,w,0,w^2,w,w^2,1,w,
    0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,0,w^2,0,w^2,1,w^2,0,1,0,w^2,1,w^2,w^2,0,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,0,1,w,w^2,1,w^2,1,w,w,w^2,0,w^2,w^2
]);
Gsrc2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W1:=Matrix(F,3,30,[
    0,1,w,w,0,0,1,w^2,1,1,1,w,w^2,1,0,1,w,1,w,w^2,0,1,1,1,0,1,w^2,0,w,w,
    0,1,1,1,0,1,w^2,0,w,w,0,1,w,w,0,0,1,w^2,1,1,1,w,w^2,1,0,1,w,1,w,w^2,
    1,w,w^2,1,0,1,w,1,w,w^2,0,1,1,1,0,1,w^2,0,w,w,0,1,w,w,0,0,1,w^2,1,1
]);
W2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
lambda:=3;
GX4:=Matrix(F,14,33,[
    1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w,1,0,w,w,0,1,0,1,w,1,1,w^2,0,0,w,0,0,0,
    0,1,0,0,0,0,0,0,0,0,0,1,0,w,0,w,1,1,w,w,w^2,0,1,0,0,w,w,1,0,w^2,0,0,0,
    0,0,1,0,0,0,0,0,0,0,0,1,w,w^2,0,0,w,0,1,w^2,1,w^2,w^2,w,0,w,w,1,1,1,0,0,0,
    0,0,0,1,0,0,0,0,0,0,0,w^2,w^2,w^2,0,0,1,0,1,1,w,w,w,0,0,w^2,w,w,0,w,0,0,0,
    0,0,0,0,1,0,0,0,0,0,0,w^2,w,0,0,w^2,1,w,0,w,0,0,w,w,1,1,0,w,w^2,1,0,0,0,
    0,0,0,0,0,1,0,0,0,0,0,0,0,w,0,1,w,w^2,w^2,w^2,0,0,1,1,w^2,1,w^2,w^2,1,w,0,0,0,
    0,0,0,0,0,0,1,0,0,0,0,0,0,w,w^2,w,w,0,w^2,1,w,1,0,0,1,0,w^2,w,w,w,0,0,0,
    0,0,0,0,0,0,0,1,0,0,0,0,w,w^2,w,0,w,w^2,1,w,1,0,0,w,w,w,0,0,w,w,0,0,0,
    0,0,0,0,0,0,0,0,1,0,0,1,w^2,1,w,w,w,w,1,w^2,1,w,0,w,w^2,1,0,w,1,1,0,0,0,
    0,0,0,0,0,0,0,0,0,1,0,w^2,1,0,w^2,w^2,0,1,w,w^2,0,0,w^2,w,w^2,1,w,w^2,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,1,1,w,1,1,w^2,w,1,w^2,w,w,0,w,0,w^2,1,0,1,0,w,0,0,0,
    0,1,w,w,0,0,1,w^2,1,1,1,w,w^2,1,0,1,w,1,w,w^2,0,1,1,1,0,1,w^2,0,w,w,1,0,0,
    0,1,1,1,0,1,w^2,0,w,w,0,1,w,w,0,0,1,w^2,1,1,1,w,w^2,1,0,1,w,1,w,w^2,0,1,0,
    1,w,w^2,1,0,1,w,1,w,w^2,0,1,1,1,0,1,w^2,0,w,w,0,1,w,w,0,0,1,w^2,1,1,0,0,1
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
ell1:=30 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [30+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[193]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 14;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[193]:=[33,10,11,15];
Table3DistanceTypes[193]:="exact";

// Table 3, No. 194 | GQ07
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
ell1:=33 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [33+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[194]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 36 and Dimension(Q) eq 9;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[194]:=[36,4,17,22];
Table3DistanceTypes[194]:="exact";

// Table 3, No. 195 | GQ08
// [[36,11,11;13]]_2, distance exact.
Gsrc1:=Matrix(F,17,33,[
    1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,1,w^2,0,1,w,w^2,0,w^2,1,w^2,0,w^2,w^2,w^2,
    0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,w,0,0,1,1,w,w,0,0,1,w,1,w^2,1,
    0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,0,1,1,0,0,w,w^2,0,w^2,w,0,0,w,1,
    0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,w^2,0,w^2,0,w^2,w,w^2,w^2,w^2,0,1,1,0,
    0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,w,1,w,0,1,w^2,0,w,w^2,1,w,
    0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,0,w^2,1,1,w^2,w^2,w^2,1,1,1,0,w^2,0,w,
    0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,1,0,1,0,1,1,1,w^2,0,1,w,1,0,w,
    0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,w,1,w^2,w,1,1,w,1,w^2,w,w,1,1,w,0,
    0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,w,w,w^2,w^2,1,w^2,w^2,1,w^2,w,w,w^2,w,1,
    0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,0,0,0,0,w^2,1,w,1,0,1,w,1,w^2,w^2,1,1,
    0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,0,w^2,w,w,1,w^2,w^2,w,1,w^2,1,1,w,0,0,w,
    0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,0,0,w^2,1,0,0,w^2,0,0,1,w^2,w^2,0,w,1,1,
    0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,w,0,1,0,0,w^2,w^2,1,1,w^2,w,w^2,0,w^2,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,1,0,0,w^2,0,0,1,1,1,1,w^2,1,w,w^2,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,0,1,0,w,1,w,0,0,w^2,1,w^2,1,1,w^2,w,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,1,w,w,w^2,w^2,w^2,1,w,1,w,1,0,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,0,0,w^2,1,0,1,w,1,w,w^2,w^2,w,0
]);
Gsrc2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W1:=Matrix(F,3,33,[
    0,1,0,w,w^2,w^2,w,w,0,w^2,w,0,0,0,w,w^2,w^2,1,1,w^2,w^2,w^2,w^2,w^2,w^2,w^2,0,1,0,w^2,0,w^2,0,
    w^2,w^2,w^2,w^2,0,1,0,w^2,0,w^2,0,0,1,0,w,w^2,w^2,w,w,0,w^2,w,0,0,0,w,w^2,w^2,1,1,w^2,w^2,w^2,
    0,0,0,w,w^2,w^2,1,1,w^2,w^2,w^2,w^2,w^2,w^2,w^2,0,1,0,w^2,0,w^2,0,0,1,0,w,w^2,w^2,w,w,0,w^2,w
]);
W2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
lambda:=3;
GX4:=Matrix(F,17,36,[
    1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,w^2,1,w,w,w,w^2,0,1,1,1,1,w^2,w^2,0,0,0,0,0,
    0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,w^2,1,1,w^2,w,w,0,1,w,w^2,w^2,0,0,w,1,w,0,0,0,
    0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w,w,0,w^2,0,0,1,w^2,0,w,w,0,w^2,w^2,w,0,0,0,
    0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,w^2,0,1,w^2,w,w,w,0,0,w^2,0,1,1,0,1,0,0,0,
    0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,1,w,1,w,1,1,0,1,w,0,w,0,0,1,0,0,0,
    0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,w^2,w,w,0,1,0,w^2,1,w^2,0,w,0,w^2,w,1,w^2,0,1,0,0,0,
    0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,0,1,w,1,w^2,w,w,w,w,w,w,0,0,0,0,1,0,0,0,
    0,0,0,0,0,0,0,1,0,0,0,0,0,w,0,0,w^2,1,1,w^2,w^2,w^2,w,0,0,w,w^2,1,1,0,1,1,w,0,0,0,
    0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,0,w,w^2,0,0,w^2,0,w,0,0,1,1,0,w^2,w,w,0,0,w^2,0,0,0,
    0,0,0,0,0,0,0,0,0,1,0,0,0,w,0,0,1,0,w,0,0,w,1,w,w^2,w,w^2,0,0,1,0,0,w^2,0,0,0,
    0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,w^2,1,w,w^2,w^2,w^2,w,1,1,w^2,0,w,w,w^2,w,w,1,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,w^2,0,1,w^2,1,w^2,0,w^2,1,1,0,w,0,1,0,w,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,w,0,1,0,0,w^2,w^2,1,1,w^2,w,w^2,0,w^2,w,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w^2,w^2,w,1,w^2,w,0,1,w,1,w,0,w,1,0,0,0,0,
    0,1,0,w,w^2,w^2,w,w,0,w^2,w,0,0,0,w,w^2,w^2,1,1,w^2,w^2,w^2,w^2,w^2,w^2,w^2,0,1,0,w^2,0,w^2,0,1,0,0,
    w^2,w^2,w^2,w^2,0,1,0,w^2,0,w^2,0,0,1,0,w,w^2,w^2,w,w,0,w^2,w,0,0,0,w,w^2,w^2,1,1,w^2,w^2,w^2,0,1,0,
    0,0,0,w,w^2,w^2,1,1,w^2,w^2,w^2,w^2,w^2,w^2,w^2,0,1,0,w^2,0,w^2,0,0,1,0,w,w^2,w^2,w,w,0,w^2,w,0,0,1
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
ell1:=33 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [33+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[195]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 36 and Dimension(Q) eq 17;
assert Dimension(HermitianHull(Q)) eq 6;
Table3Parameters[195]:=[36,11,11,13];
Table3DistanceTypes[195]:="exact";

// Table 3, No. 196 | GQ09
// [[39,6,18;23]]_2, distance exact.
Gsrc1:=Matrix(F,11,36,[
    1,0,0,0,0,0,0,0,0,0,0,w^2,w,0,w^2,w^2,1,1,1,1,w^2,1,0,w^2,0,w,1,0,0,w,w^2,w,w,1,w,1,
    0,1,0,0,0,0,0,0,0,0,0,1,w^2,0,w,1,w^2,0,1,w^2,w,0,1,w^2,1,w^2,1,w,w,0,0,0,w^2,w^2,1,w,
    0,0,1,0,0,0,0,0,0,0,0,w,w^2,w,1,0,w^2,0,1,1,w,w,0,0,w^2,1,w^2,0,0,w^2,0,w,w^2,w^2,w^2,0,
    0,0,0,1,0,0,0,0,0,0,0,w^2,w^2,w,0,1,0,1,w,w,w,0,w,w^2,w^2,w,w^2,w^2,0,1,w,0,w,w^2,1,1,
    0,0,0,0,1,0,0,0,0,0,0,w,w,w^2,1,0,0,1,1,w,0,1,0,w,w,w^2,1,0,w^2,w^2,w^2,0,1,0,1,1,
    0,0,0,0,0,1,0,0,0,0,0,w,0,1,w^2,w^2,w^2,w^2,w^2,0,w^2,1,1,0,1,0,w,w,0,w,0,0,0,0,w,w^2,
    0,0,0,0,0,0,1,0,0,0,0,0,w^2,w,0,w^2,0,w^2,0,w,0,w,1,0,0,w^2,1,0,1,0,1,1,w,1,w,1,
    0,0,0,0,0,0,0,1,0,0,0,0,w,w^2,w^2,w,w^2,w,0,w^2,1,0,w,w^2,0,1,w^2,w,w^2,w^2,0,w,w^2,w^2,w,1,
    0,0,0,0,0,0,0,0,1,0,0,w,0,w^2,0,w,w^2,w^2,w,1,1,1,0,0,1,w,1,w^2,w,1,w^2,w^2,w,1,w,w,
    0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,w,1,w,w,0,w,w,w^2,1,w^2,1,1,0,0,0,w^2,0,w^2,1,w^2,0,1,
    0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,0,0,w^2,w,w^2,0,1,0,w^2,0,1,1,w^2,w^2,w,w^2,w,w^2,w,0,w,1
]);
Gsrc2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W1:=Matrix(F,3,36,[
    0,w,w,1,1,w,w,0,w,1,w,1,w,w^2,w^2,1,w^2,0,0,0,1,w,0,w^2,1,w^2,w^2,w^2,w,0,1,w,1,0,w^2,0,
    1,w^2,w^2,w^2,w,0,1,w,1,0,w^2,0,0,w,w,1,1,w,w,0,w,1,w,1,w,w^2,w^2,1,w^2,0,0,0,1,w,0,w^2,
    w,w^2,w^2,1,w^2,0,0,0,1,w,0,w^2,1,w^2,w^2,w^2,w,0,1,w,1,0,w^2,0,0,w,w,1,1,w,w,0,w,1,w,1
]);
W2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
lambda:=3;
GX4:=Matrix(F,11,39,[
    1,0,0,0,0,0,0,0,1,0,0,1,w,w^2,w^2,1,w,w,w^2,0,w,0,0,w^2,1,0,0,w^2,w,w^2,0,1,0,0,0,w^2,0,0,0,
    0,1,0,0,0,0,0,0,w,w,w,w^2,1,w,1,0,0,1,w^2,w,1,w^2,w,w,w^2,0,w,w,w,w,w,1,1,0,1,1,0,0,0,
    0,0,1,0,0,0,0,0,0,1,w,w^2,1,w^2,w^2,1,0,1,0,w^2,w,1,0,w^2,0,w,w,1,w^2,1,w^2,0,1,0,0,w^2,0,0,0,
    0,0,0,1,0,0,0,0,w^2,0,0,w,w^2,0,0,0,w,w^2,w^2,1,1,w^2,w,w^2,0,w^2,0,1,1,w,0,w,w^2,0,0,0,0,0,0,
    0,0,0,0,1,0,0,0,1,w^2,w,1,0,0,0,1,w^2,0,w,w,w,w,w,0,w,0,1,w,w,1,w^2,0,w^2,w^2,0,w,0,0,0,
    0,0,0,0,0,1,0,0,w^2,0,w^2,1,w^2,0,w^2,w,w^2,0,0,w^2,w^2,w,w^2,0,1,w,w^2,w,0,w^2,w^2,0,0,w^2,w,1,0,0,0,
    0,0,0,0,0,0,1,0,w,1,w^2,1,0,w^2,w,1,1,1,1,w,w^2,w^2,w,w^2,0,w,1,w^2,w^2,w^2,1,1,1,0,0,0,0,0,0,
    0,0,0,0,0,0,0,1,w^2,1,1,w,w^2,w^2,1,w,0,0,w,w,1,0,0,0,w^2,0,w^2,w^2,0,0,0,0,1,w^2,1,0,0,0,0,
    0,w,w,1,1,w,w,0,w,1,w,1,w,w^2,w^2,1,w^2,0,0,0,1,w,0,w^2,1,w^2,w^2,w^2,w,0,1,w,1,0,w^2,0,1,0,0,
    1,w^2,w^2,w^2,w,0,1,w,1,0,w^2,0,0,w,w,1,1,w,w,0,w,1,w,1,w,w^2,w^2,1,w^2,0,0,0,1,w,0,w^2,0,1,0,
    w,w^2,w^2,1,w^2,0,0,0,1,w,0,w^2,1,w^2,w^2,w^2,w,0,1,w,1,0,w^2,0,0,w,w,1,1,w,w,0,w,1,w,1,0,0,1
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
ell1:=36 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [36+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[196]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 39 and Dimension(Q) eq 11;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[196]:=[39,6,18,23];
Table3DistanceTypes[196]:="exact";

// Table 3, No. 197 | NQ01
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
ell1:=36 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [36+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[197]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 39 and Dimension(Q) eq 12;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[197]:=[39,7,16,22];
Table3DistanceTypes[197]:="exact";

// Table 3, No. 198 | SQ11
// [[42,7,14;19]]_2, distance exact.
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
Gsrc2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W1:=Matrix(F,3,39,[
    0,0,1,0,w,w,1,1,w,1,w,w^2,w,w^2,1,w^2,0,0,0,1,1,w,w^2,w^2,w^2,w,1,w^2,0,1,w^2,w^2,1,1,1,w^2,0,1,1,
    1,w^2,0,1,w^2,w^2,1,1,1,w^2,0,1,1,0,0,1,0,w,w,1,1,w,1,w,w^2,w,w^2,1,w^2,0,0,0,1,1,w,w^2,w^2,w^2,w,
    w^2,1,w^2,0,0,0,1,1,w,w^2,w^2,w^2,w,1,w^2,0,1,w^2,w^2,1,1,1,w^2,0,1,1,0,0,1,0,w,w,1,1,w,1,w,w^2,w
]);
W2:=Matrix(F,3,3,[
    w,1,w,
    w,w,1,
    1,w,w
]);
lambda:=3;
GX4:=Matrix(F,15,42,[
    1,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,0,1,1,0,w^2,0,w^2,0,w,w^2,w^2,w^2,w,1,0,w^2,1,0,w,w,1,w,w^2,w,0,0,0,
    0,1,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,0,w,w^2,w,w,w^2,w^2,w^2,w,0,0,0,0,w^2,w,w,0,0,0,w^2,1,1,1,0,0,0,
    0,0,1,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w,0,0,w,0,w^2,w^2,w,w^2,0,w^2,w^2,1,0,w,w,1,w^2,w,w,0,1,0,0,0,
    0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,w,w^2,1,0,w,w^2,1,1,w,w,w^2,w,0,1,w^2,w^2,w,w,w^2,0,0,0,0,0,
    0,0,0,0,1,0,0,0,0,0,0,0,w,w,0,1,1,w^2,0,0,1,0,1,0,1,0,1,w,0,w,1,0,w^2,0,0,0,w^2,1,w,0,0,0,
    0,0,0,0,0,1,0,0,0,0,0,0,0,w,0,0,w,1,0,0,w^2,w^2,w,w^2,1,w^2,1,1,w,w^2,w^2,1,w,1,1,w^2,w,0,w^2,0,0,0,
    0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,1,1,0,w^2,1,1,w^2,w,w,w,w,0,w,0,1,0,w^2,1,w,1,w^2,w^2,w,0,1,0,0,0,
    0,0,0,0,0,0,0,1,0,0,0,0,1,1,1,1,w^2,w^2,w^2,w^2,1,1,w^2,w^2,0,w,w^2,0,w,0,1,0,w,1,0,w^2,w^2,1,1,0,0,0,
    0,0,0,0,0,0,0,0,1,0,0,0,w^2,w,w,w,1,0,w,w,0,w^2,0,1,1,0,1,w,1,w,1,1,1,0,w,0,1,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,w,0,w^2,1,0,w,w,1,w^2,1,w,1,0,0,w,w^2,0,w^2,w,0,1,w,w,1,w,0,0,0,
    0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w^2,w,w,1,0,w^2,w,w^2,0,w,0,w,w,0,0,0,w^2,w,0,w,0,1,w^2,1,1,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,0,1,1,1,0,w^2,1,w,w,w,w,w^2,w^2,w,1,w,w,w^2,0,w^2,w^2,1,w,w,0,0,0,
    0,0,1,0,w,w,1,1,w,1,w,w^2,w,w^2,1,w^2,0,0,0,1,1,w,w^2,w^2,w^2,w,1,w^2,0,1,w^2,w^2,1,1,1,w^2,0,1,1,w,1,w,
    1,w^2,0,1,w^2,w^2,1,1,1,w^2,0,1,1,0,0,1,0,w,w,1,1,w,1,w,w^2,w,w^2,1,w^2,0,0,0,1,1,w,w^2,w^2,w^2,w,w,w,1,
    w^2,1,w^2,0,0,0,1,1,w,w^2,w^2,w^2,w,1,w^2,0,1,w^2,w^2,1,1,1,w^2,0,1,1,0,0,1,0,w,w,1,1,w,1,w,w^2,w,1,w,w
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
ell1:=39 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [39+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[198]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 42 and Dimension(Q) eq 15;
assert Dimension(HermitianHull(Q)) eq 8;
Table3Parameters[198]:=[42,7,14,19];
Table3DistanceTypes[198]:="exact";

// Table 3, No. 199 | SQ12
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
ell1:=39 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [39+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[199]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 42 and Dimension(Q) eq 15;
assert Dimension(HermitianHull(Q)) eq 7;
Table3Parameters[199]:=[42,8,15,20];
Table3DistanceTypes[199]:="exact";

// Table 3, No. 200 | NQ02
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
ell1:=48 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [48+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[200]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 51 and Dimension(Q) eq 18;
assert Dimension(HermitianHull(Q)) eq 7;
Table3Parameters[200]:=[51,11,18,26];
Table3DistanceTypes[200]:="exact";

assert #Keys(Table3Generators) eq 23;
print "TABLE3_VERIFIED 23";
