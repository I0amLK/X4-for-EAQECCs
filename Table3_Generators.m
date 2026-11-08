// Table 3: direct QC-X4 constructions.
// 32 records, manuscript Nos. 195-226.
// CSV matrices and Magma matrices have exactly the same row order.
// Table3Generators[No] = <Gsrc1,Gsrc2,W1,W2,lambda,GX4>.

F<w>:=GF(4);
function HDag(X)
    return Transpose(Matrix(BaseRing(X),Nrows(X),Ncols(X),[z^2:z in Eltseq(X)]));
end function;
Table3Generators:=AssociativeArray();
Table3Parameters:=AssociativeArray();
Table3DistanceTypes:=AssociativeArray();

// Table 3, No. 195 | SX01
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
Table3Generators[195]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 12 and Dimension(Q) eq 8;
assert Dimension(HermitianHull(Q)) eq 3;
Table3Parameters[195]:=[12,5,4,1];
Table3DistanceTypes[195]:="exact";

// Table 3, No. 196 | SX02
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
Table3Generators[196]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 15 and Dimension(Q) eq 8;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[196]:=[15,3,6,2];
Table3DistanceTypes[196]:="exact";

// Table 3, No. 197 | SX03
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
Table3Generators[197]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 15 and Dimension(Q) eq 9;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[197]:=[15,5,5,2];
Table3DistanceTypes[197]:="exact";

// Table 3, No. 198 | SX04
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
Table3Generators[198]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 18 and Dimension(Q) eq 10;
assert Dimension(HermitianHull(Q)) eq 7;
Table3Parameters[198]:=[18,3,6,1];
Table3DistanceTypes[198]:="exact";

// Table 3, No. 199 | SX05
// [[18,4,7;6]]_2, distance exact.
Gsrc1:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
Gsrc2:=Matrix(F,8,15,[
    1,0,0,0,0,0,0,0,w^2,0,w^2,w^2,1,w,0,
    0,1,0,0,0,0,0,0,w,0,w,0,0,w,w,
    0,0,1,0,0,0,0,0,1,w^2,w^2,w^2,w,w,1,
    0,0,0,1,0,0,0,0,1,w^2,0,w^2,w,w,0,
    0,0,0,0,1,0,0,0,1,1,1,0,w,w^2,w,
    0,0,0,0,0,1,0,0,0,w,0,0,w,w,0,
    0,0,0,0,0,0,1,0,1,w^2,w^2,0,w,w^2,w^2,
    0,0,0,0,0,0,0,1,w,1,w^2,w,1,w,w
]);
W1:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W2:=Matrix(F,3,15,[
    0,w^2,w^2,w,0,w,1,1,w^2,w,w^2,1,w,1,w^2,
    w^2,1,w,1,w^2,0,w^2,w^2,w,0,w,1,1,w^2,w,
    w,1,1,w^2,w,w^2,1,w,1,w^2,0,w^2,w^2,w,0
]);
lambda:=3;
GX4:=Matrix(F,8,18,[
    0,0,0,1,0,0,0,0,1,1,w,1,w^2,1,0,w^2,0,0,
    0,0,0,0,1,0,0,0,w^2,0,0,w,1,w,0,1,w^2,w,
    0,0,0,0,0,1,0,0,0,w,w^2,w,1,0,w,w,w,1,
    0,0,0,0,0,0,1,0,1,w^2,w^2,w^2,0,0,w,w,w^2,w^2,
    0,0,0,0,0,0,0,1,w^2,w,1,1,0,w^2,w,1,1,1,
    1,0,0,0,w^2,w^2,w,0,w,1,1,w^2,w,w^2,1,w,1,w^2,
    0,1,0,w^2,1,w,1,w^2,0,w^2,w^2,w,0,w,1,1,w^2,w,
    0,0,1,w,1,1,w^2,w,w^2,1,w,1,w^2,0,w^2,w^2,w,0
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
Table3Generators[199]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 18 and Dimension(Q) eq 8;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[199]:=[18,4,7,6];
Table3DistanceTypes[199]:="exact";

// Table 3, No. 200 | GQ01
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
Table3Generators[200]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 18 and Dimension(Q) eq 6;
assert Dimension(HermitianHull(Q)) eq 2;
Table3Parameters[200]:=[18,4,9,10];
Table3DistanceTypes[200]:="exact";

// Table 3, No. 201 | SX07
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
Table3Generators[201]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 18 and Dimension(Q) eq 10;
assert Dimension(HermitianHull(Q)) eq 3;
Table3Parameters[201]:=[18,7,6,5];
Table3DistanceTypes[201]:="exact";

// Table 3, No. 202 | GQ02
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
Table3Generators[202]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 21 and Dimension(Q) eq 8;
assert Dimension(HermitianHull(Q)) eq 3;
Table3Parameters[202]:=[21,5,9,10];
Table3DistanceTypes[202]:="exact";

// Table 3, No. 203 | SX08
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
Table3Generators[203]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 21 and Dimension(Q) eq 14;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[203]:=[21,9,5,2];
Table3DistanceTypes[203]:="exact";

// Table 3, No. 204 | SQ01
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
Table3Generators[204]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 24 and Dimension(Q) eq 9;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[204]:=[24,4,10,10];
Table3DistanceTypes[204]:="exact";

// Table 3, No. 205 | SQ02
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
Table3Generators[205]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 24 and Dimension(Q) eq 10;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[205]:=[24,5,9,9];
Table3DistanceTypes[205]:="exact";

// Table 3, No. 206 | SQ03
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
Table3Generators[206]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 24 and Dimension(Q) eq 10;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[206]:=[24,6,9,10];
Table3DistanceTypes[206]:="exact";

// Table 3, No. 207 | SQ04
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
Table3Generators[207]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 27 and Dimension(Q) eq 12;
assert Dimension(HermitianHull(Q)) eq 6;
Table3Parameters[207]:=[27,6,9,9];
Table3DistanceTypes[207]:="exact";

// Table 3, No. 208 | SQ05
// [[27,8,9;13]]_2, distance exact.
Gsrc1:=Matrix(F,11,24,[
    1,0,0,0,0,0,0,0,0,0,w^2,0,w,1,w,w^2,0,0,1,1,0,1,0,w,
    0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,1,w^2,1,w,1,w,1,
    0,0,1,0,0,0,0,0,0,0,w,0,0,0,w,w^2,1,w^2,w^2,1,w,w,w^2,w^2,
    0,0,0,1,0,0,0,0,0,0,w^2,0,0,w,w^2,1,0,1,w,1,w,w^2,w,w^2,
    0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w^2,w,1,1,w,w,w,w^2,w^2,
    0,0,0,0,0,1,0,0,0,0,w^2,0,0,1,w^2,0,w^2,w,w^2,w^2,1,1,0,0,
    0,0,0,0,0,0,1,0,0,0,1,0,1,0,w^2,0,w,0,w^2,1,w,1,w^2,w,
    0,0,0,0,0,0,0,1,0,0,w,0,1,w^2,w,w,1,w,0,w,w^2,w^2,0,1,
    0,0,0,0,0,0,0,0,1,0,1,0,w,w,1,1,0,w^2,1,0,w,0,w^2,1,
    0,0,0,0,0,0,0,0,0,1,w^2,0,w^2,0,w,w^2,0,0,w^2,w,w^2,0,w,1,
    0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,0,0,w,w^2,w,0,w,w^2,w,w^2
]);
Gsrc2:=Matrix(F,2,3,[
    1,0,w^2,
    0,1,w
]);
W1:=Matrix(F,2,24,[
    w^2,1,1,w,1,w,w^2,0,w^2,w^2,w^2,w^2,w,w^2,w,1,w^2,w,w,0,0,0,1,w,
    w^2,w,w,0,0,0,1,w,w^2,1,1,w,1,w,w^2,0,w^2,w^2,w^2,w^2,w,w^2,w,1
]);
W2:=Matrix(F,2,3,[
    0,w,w^2,
    w^2,0,w
]);
lambda:=2;
GX4:=Matrix(F,11,27,[
    1,0,0,0,0,0,0,0,0,w,w,0,w^2,1,1,w,0,0,0,w,1,1,w^2,0,0,0,0,
    0,1,0,0,0,0,0,0,0,w,0,1,w,w^2,w^2,1,w^2,w,0,w,1,w,w^2,0,0,0,0,
    0,0,1,0,0,0,0,0,0,w,w^2,1,w,w,1,w,w^2,0,0,w,1,1,w,w,0,0,0,
    0,0,0,1,0,0,0,0,0,1,0,0,w^2,w,1,w,0,1,1,w^2,1,w^2,0,w,0,0,0,
    0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w^2,w,1,1,w,w,w,w^2,w^2,0,0,0,
    0,0,0,0,0,1,0,0,0,1,0,0,w^2,1,1,w^2,w^2,w,0,1,w,1,w,1,0,0,0,
    0,0,0,0,0,0,1,0,0,1,w,w^2,0,1,1,w^2,w^2,w,1,w^2,0,w^2,0,1,0,0,0,
    0,0,0,0,0,0,0,1,0,0,w,w^2,w^2,w,w,w,0,0,1,w,w,1,1,w^2,0,0,0,
    0,0,0,0,0,0,0,0,1,0,1,w,w^2,1,1,1,w^2,w,w,0,1,1,0,0,0,0,0,
    w^2,1,1,w,1,w,w^2,0,w^2,w^2,w^2,w^2,w,w^2,w,1,w^2,w,w,0,0,0,1,w,0,w,w^2,
    w^2,w,w,0,0,0,1,w,w^2,1,1,w,1,w,w^2,0,w^2,w^2,w^2,w^2,w,w^2,w,1,w^2,0,w
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
Table3Generators[208]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 27 and Dimension(Q) eq 11;
assert Dimension(HermitianHull(Q)) eq 3;
Table3Parameters[208]:=[27,8,9,13];
Table3DistanceTypes[208]:="exact";

// Table 3, No. 209 | RQ02
// [[27,8,9;15]]_2, distance exact.
Gsrc1:=Matrix(F,10,24,[
    1,0,0,0,0,0,0,0,0,0,0,w^2,0,1,w^2,w,1,1,w,w^2,w^2,w^2,1,0,
    0,1,0,0,0,0,0,0,0,0,w,1,1,0,w,w^2,0,1,w^2,w^2,w,w,w^2,w^2,
    0,0,1,0,0,0,0,0,0,0,1,1,0,1,w,w,w^2,w^2,w^2,1,w,1,w,w^2,
    0,0,0,1,0,0,0,0,0,0,1,w,w^2,w^2,w^2,1,w^2,w,w,1,w,w^2,w,w^2,
    0,0,0,0,1,0,0,0,0,0,w,1,w,0,1,w,1,w^2,1,1,0,w^2,1,1,
    0,0,0,0,0,1,0,0,0,0,1,w^2,w^2,w^2,0,w^2,w,1,0,w^2,w,w^2,0,w,
    0,0,0,0,0,0,1,0,0,0,1,w,w,w^2,1,0,w,0,w,w^2,1,1,w^2,w,
    0,0,0,0,0,0,0,1,0,0,w^2,w^2,1,w,w,1,w,0,1,1,0,w^2,1,w^2,
    0,0,0,0,0,0,0,0,1,0,0,w,w,0,w,w,w,1,0,0,w^2,1,w^2,w,
    0,0,0,0,0,0,0,0,0,1,w,w^2,w^2,w^2,1,0,1,1,w,0,w^2,w,w,w
]);
Gsrc2:=Matrix(F,1,3,[
    1,1,1
]);
W1:=Matrix(F,1,24,[
    1,0,0,1,w,w^2,1,0,1,0,0,1,w,w^2,1,0,1,0,0,1,w,w^2,1,0
]);
W2:=Matrix(F,1,3,[
    1,1,1
]);
lambda:=1;
GX4:=Matrix(F,10,27,[
    1,0,0,0,0,0,0,0,0,1,w,0,w^2,w,w,w,0,0,0,w^2,0,1,w^2,w,0,0,0,
    0,1,0,0,0,0,0,0,0,w^2,w^2,w^2,w^2,w,1,w^2,w^2,w,w,w^2,0,w^2,w,w,0,0,0,
    0,0,1,0,0,0,0,0,0,w^2,0,w^2,w,w^2,1,w,0,0,w,1,0,0,w^2,w,0,0,0,
    0,0,0,1,0,0,0,0,0,1,w^2,1,0,0,w,1,w,w^2,0,1,1,1,0,1,0,0,0,
    0,0,0,0,1,0,0,0,0,w^2,w^2,w^2,0,w,w,w,w,0,0,1,w,w,0,0,0,0,0,
    0,0,0,0,0,1,0,0,0,1,w^2,0,0,0,1,w^2,w^2,0,w,w^2,1,1,w,0,0,0,0,
    0,0,0,0,0,0,1,0,0,w,w,w^2,w^2,w,w^2,0,0,w,1,w^2,0,w,0,1,0,0,0,
    0,0,0,0,0,0,0,1,0,w^2,w,1,w^2,0,1,1,1,w^2,0,1,w,w,0,w,0,0,0,
    0,0,0,0,0,0,0,0,1,w,w^2,w^2,w^2,1,0,w,0,w^2,w^2,0,w,w,0,1,0,0,0,
    1,0,0,1,w,w^2,1,0,1,0,0,1,w,w^2,1,0,1,0,0,1,w,w^2,1,0,1,1,1
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
Table3Generators[209]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 27 and Dimension(Q) eq 10;
assert Dimension(HermitianHull(Q)) eq 2;
Table3Parameters[209]:=[27,8,9,15];
Table3DistanceTypes[209]:="exact";

// Table 3, No. 210 | SQ06
// [[27,9,9;14]]_2, distance exact.
Gsrc1:=Matrix(F,11,24,[
    1,0,0,0,0,0,0,0,0,0,w^2,0,w,1,w,w^2,0,0,1,1,0,1,0,w,
    0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,1,w^2,1,w,1,w,1,
    0,0,1,0,0,0,0,0,0,0,w,0,0,0,w,w^2,1,w^2,w^2,1,w,w,w^2,w^2,
    0,0,0,1,0,0,0,0,0,0,w^2,0,0,w,w^2,1,0,1,w,1,w,w^2,w,w^2,
    0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w^2,w,1,1,w,w,w,w^2,w^2,
    0,0,0,0,0,1,0,0,0,0,w^2,0,0,1,w^2,0,w^2,w,w^2,w^2,1,1,0,0,
    0,0,0,0,0,0,1,0,0,0,1,0,1,0,w^2,0,w,0,w^2,1,w,1,w^2,w,
    0,0,0,0,0,0,0,1,0,0,w,0,1,w^2,w,w,1,w,0,w,w^2,w^2,0,1,
    0,0,0,0,0,0,0,0,1,0,1,0,w,w,1,1,0,w^2,1,0,w,0,w^2,1,
    0,0,0,0,0,0,0,0,0,1,w^2,0,w^2,0,w,w^2,0,0,w^2,w,w^2,0,w,1,
    0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,0,0,w,w^2,w,0,w,w^2,w,w^2
]);
Gsrc2:=Matrix(F,1,3,[
    1,w,w^2
]);
W1:=Matrix(F,1,24,[
    1,w,w,0,w^2,w^2,w,w^2,w,w^2,w^2,0,1,1,w^2,1,w^2,1,1,0,w,w,1,w
]);
W2:=Matrix(F,1,3,[
    1,w,w^2
]);
lambda:=1;
GX4:=Matrix(F,11,27,[
    1,0,0,0,0,0,0,0,0,0,w^2,0,w,1,w,w^2,0,0,1,1,0,1,0,w,0,0,0,
    0,1,0,0,0,0,0,0,w^2,0,w,0,1,0,w^2,w^2,1,w^2,0,1,w^2,1,0,w,0,0,0,
    0,0,1,0,0,0,0,0,w^2,0,1,0,1,1,1,0,1,1,0,1,w^2,w,1,0,0,0,0,
    0,0,0,1,0,0,0,0,w^2,0,0,0,1,w^2,0,w,0,w^2,1,1,w^2,w^2,0,0,0,0,0,
    0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w^2,w,1,1,w,w,w,w^2,w^2,0,0,0,
    0,0,0,0,0,1,0,0,w^2,0,0,0,1,0,0,w^2,w^2,0,0,w^2,0,1,w,w^2,0,0,0,
    0,0,0,0,0,0,1,0,1,0,0,0,w^2,w,w,1,w,w^2,w,1,0,1,0,w^2,0,0,0,
    0,0,0,0,0,0,0,1,1,0,w^2,0,w^2,1,w^2,w^2,1,1,1,w,1,w^2,w^2,0,0,0,0,
    0,0,0,0,0,0,0,0,0,1,w^2,0,w^2,0,w,w^2,0,0,w^2,w,w^2,0,w,1,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,0,0,w,w^2,w,0,w,w^2,w,w^2,0,0,0,
    1,w,w,0,w^2,w^2,w,w^2,w,w^2,w^2,0,1,1,w^2,1,w^2,1,1,0,w,w,1,w,1,w,w^2
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
Table3Generators[210]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 27 and Dimension(Q) eq 11;
assert Dimension(HermitianHull(Q)) eq 2;
Table3Parameters[210]:=[27,9,9,14];
Table3DistanceTypes[210]:="exact";

// Table 3, No. 211 | SQ07
// [[30,8,9;14]]_2, distance exact.
Gsrc1:=Matrix(F,12,27,[
    1,0,0,0,0,0,0,0,0,0,0,w,w,0,w^2,1,1,w,w,1,w^2,1,w,1,1,w^2,0,
    0,1,0,0,0,0,0,0,0,0,0,w^2,1,0,1,0,w^2,w,1,w,w^2,w,w^2,w,w,0,w^2,
    0,0,1,0,0,0,0,0,0,0,0,1,w,0,1,1,0,w^2,1,w^2,0,1,0,w^2,w^2,w,1,
    0,0,0,1,0,0,0,0,0,0,0,0,1,0,1,0,0,w,w,w^2,w^2,w,w,1,0,0,0,
    0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,1,w,w^2,w,0,w,1,1,w^2,w^2,w,
    0,0,0,0,0,1,0,0,0,0,0,w,w,0,1,w^2,w,0,1,w^2,w,1,0,0,0,1,0,
    0,0,0,0,0,0,1,0,0,0,0,1,w^2,0,w,w^2,0,w^2,w^2,0,w,w,w^2,1,w,w,1,
    0,0,0,0,0,0,0,1,0,0,0,w,w^2,0,w,w^2,w^2,0,1,w,0,w,w,1,w,w,0,
    0,0,0,0,0,0,0,0,1,0,0,0,w,0,0,0,w^2,w^2,0,w,w^2,1,w^2,1,w^2,w,w,
    0,0,0,0,0,0,0,0,0,1,0,1,1,0,w,1,w^2,1,w^2,0,w^2,w,w,0,1,w,0,
    0,0,0,0,0,0,0,0,0,0,1,1,0,0,w,1,w,w,1,0,w,0,0,1,w^2,w^2,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w,0,w^2,w,0,w,0,0,w^2,w,1
]);
Gsrc2:=Matrix(F,1,3,[
    1,1,1
]);
W1:=Matrix(F,1,27,[
    w,0,w,w^2,w,w^2,w^2,w,0,w,0,w,w^2,w,w^2,w^2,w,0,w,0,w,w^2,w,w^2,w^2,w,0
]);
W2:=Matrix(F,1,3,[
    1,1,1
]);
lambda:=1;
GX4:=Matrix(F,12,30,[
    1,0,0,0,0,0,0,0,0,0,0,w,w,w,0,w^2,w,w,w^2,w,w^2,w,w,1,0,0,w,0,0,0,
    0,1,0,0,0,0,0,0,0,0,0,w^2,1,0,1,0,w^2,w,1,w,w^2,w,w^2,w,w,0,w^2,0,0,0,
    0,0,1,0,0,0,0,0,0,0,0,1,w,w,w,w^2,w^2,w^2,0,0,0,w,0,w^2,w,1,w^2,0,0,0,
    0,0,0,1,0,0,0,0,0,0,0,0,1,w^2,0,w^2,1,w,0,w,w^2,w^2,w,1,w,1,w^2,0,0,0,
    0,0,0,0,1,0,0,0,0,0,0,0,0,w,w,w^2,w,w,w,1,0,1,1,1,w,0,0,0,0,0,
    0,0,0,0,0,1,0,0,0,0,0,w,w,w^2,0,0,w^2,0,w^2,w,w,0,0,0,w,0,w^2,0,0,0,
    0,0,0,0,0,0,1,0,0,0,0,1,w^2,0,w,w^2,0,w^2,w^2,0,w,w,w^2,1,w,w,1,0,0,0,
    0,0,0,0,0,0,0,1,0,0,0,w,w^2,1,0,w,1,0,w,0,0,0,w,1,1,0,1,0,0,0,
    0,0,0,0,0,0,0,0,1,0,0,0,w,w^2,1,w^2,w,w^2,w,w^2,w^2,0,w^2,1,1,w^2,1,0,0,0,
    0,0,0,0,0,0,0,0,0,1,0,1,1,0,w,1,w^2,1,w^2,0,w^2,w,w,0,1,w,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,1,1,0,0,w,1,w,w,1,0,w,0,0,1,w^2,w^2,w,0,0,0,
    w,0,w,w^2,w,w^2,w^2,w,0,w,0,w,w^2,w,w^2,w^2,w,0,w,0,w,w^2,w,w^2,w^2,w,0,1,1,1
]);
assert Rank(Gsrc1) eq Nrows(Gsrc1) and Rank(Gsrc2) eq Nrows(Gsrc2);
assert W1*HDag(W1) eq W2*HDag(W2);
Q:=LinearCode(GX4);
ell1:=27 div 3;ell2:=3 div 3;perm:=[];
for tt in [0..2] do
 perm:=perm cat [tt*ell1+j:j in [1..ell1]] cat [27+tt*ell2+j:j in [1..ell2]];
end for;
GQC:=Submatrix(GX4,[1..Nrows(GX4)],perm);ell:=ell1+ell2;N:=Ncols(GQC);
assert forall{v:v in Rows(GQC)|Vector(F,[v[(j-ell-1) mod N+1]:j in [1..N]]) in RowSpace(GQC)};
Table3Generators[211]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 30 and Dimension(Q) eq 12;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[211]:=[30,8,9,14];
Table3DistanceTypes[211]:="exact";

// Table 3, No. 212 | SQ08
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
Table3Generators[212]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 9;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[212]:=[33,5,14,20];
Table3DistanceTypes[212]:="exact";

// Table 3, No. 213 | SQ09
// [[33,6,14;21]]_2, distance exact.
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
Gsrc2:=Matrix(F,1,3,[
    1,w^2,w
]);
W1:=Matrix(F,1,30,[
    1,w^2,1,w^2,w^2,w,0,w^2,1,1,w^2,w,w^2,w,w,1,0,w,w^2,w^2,w,1,w,1,1,w^2,0,1,w,w
]);
W2:=Matrix(F,1,3,[
    1,w^2,w
]);
lambda:=1;
GX4:=Matrix(F,9,33,[
    1,0,0,0,0,0,0,w^2,0,w,w,0,w,w^2,0,w,w,0,w,w^2,0,w^2,w^2,w,w,w^2,1,1,0,w,0,0,0,
    0,1,0,0,0,0,0,0,0,0,w^2,1,0,0,1,w^2,w^2,w,1,w,w^2,w,w,w,0,0,1,w,0,w,0,0,0,
    0,0,1,0,0,0,0,1,0,0,w,0,0,w,0,0,w,w^2,1,w^2,w^2,1,1,w,1,w^2,0,1,w,w^2,0,0,0,
    0,0,0,1,0,0,0,1,0,1,w^2,0,w,w,0,w^2,1,w,w,0,1,0,1,0,w,w,w,w,w,w,0,0,0,
    0,0,0,0,1,0,0,0,0,w,1,w,w,w^2,1,0,1,w,w,w,w,w^2,0,1,w,1,w,0,1,0,0,0,0,
    0,0,0,0,0,1,0,0,0,w^2,1,1,w^2,w,1,w^2,w^2,w,w^2,w^2,w^2,w,1,0,w^2,w^2,0,w^2,1,w,0,0,0,
    0,0,0,0,0,0,1,0,0,1,w,w^2,w,w,w,1,1,1,w,0,1,w,1,1,1,w^2,1,w^2,1,w,0,0,0,
    0,0,0,0,0,0,0,0,1,0,w,0,w,w^2,w,w^2,w^2,0,1,w,0,w,0,1,w,w^2,w^2,1,1,w^2,0,0,0,
    1,w^2,1,w^2,w^2,w,0,w^2,1,1,w^2,w,w^2,w,w,1,0,w,w^2,w^2,w,1,w,1,1,w^2,0,1,w,w,1,w^2,w
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
Table3Generators[213]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 9;
assert Dimension(HermitianHull(Q)) eq 3;
Table3Parameters[213]:=[33,6,14,21];
Table3DistanceTypes[213]:="exact";

// Table 3, No. 214 | SQ10
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
Table3Generators[214]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 8;
assert Dimension(HermitianHull(Q)) eq 2;
Table3Parameters[214]:=[33,6,17,23];
Table3DistanceTypes[214]:="exact";

// Table 3, No. 215 | GQ03
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
Table3Generators[215]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 14;
assert Dimension(HermitianHull(Q)) eq 7;
Table3Parameters[215]:=[33,7,11,12];
Table3DistanceTypes[215]:="exact";

// Table 3, No. 216 | RQ01
// [[33,8,10;13]]_2, distance exact.
Gsrc1:=Matrix(F,14,30,[
    1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,1,0,0,w^2,w,0,w^2,w,w,w^2,0,0,1,
    0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,0,1,1,0,w,w^2,0,w^2,w,0,0,w,1,
    0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,w,w^2,0,1,w^2,w^2,1,w,1,w^2,w,w^2,0,
    0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w,w^2,w^2,w,w,w^2,0,0,1,0,1,0,w,
    0,0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,w,1,w^2,w^2,1,1,w^2,1,w,w^2,w,1,w,w^2,w,
    0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,1,1,0,1,1,1,1,w^2,0,1,w,1,0,w,
    0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,w,0,w,w^2,w,w^2,w,w^2,0,0,1,0,0,1,0,
    0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,w,0,w,w^2,0,w^2,w,w^2,w,0,1,0,0,1,
    0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w,w,w^2,0,w^2,0,1,w,w,0,w,w,w,w,1,
    0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,1,w,0,w,1,w,w,0,1,0,w^2,1,w^2,w,w,
    0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,w,0,1,0,w^2,w^2,1,1,w^2,w,w^2,0,w^2,w,
    0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,1,0,0,w^2,0,1,1,1,1,w^2,1,w,w^2,1,
    0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,w,1,w,1,w^2,0,0,0,0,0,w^2,1,w^2,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,w,1,w,0,w^2,0,0,1,0,0,w^2,1,w^2
]);
Gsrc2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W1:=Matrix(F,3,30,[
    0,1,w,0,w^2,w^2,1,w^2,w,0,w,w,1,0,w^2,w,w,0,0,0,w^2,w^2,w^2,0,0,w,w^2,0,0,1,
    w^2,w^2,w^2,0,0,w,w^2,0,0,1,0,1,w,0,w^2,w^2,1,w^2,w,0,w,w,1,0,w^2,w,w,0,0,0,
    w,w,1,0,w^2,w,w,0,0,0,w^2,w^2,w^2,0,0,w,w^2,0,0,1,0,1,w,0,w^2,w^2,1,w^2,w,0
]);
W2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
lambda:=3;
GX4:=Matrix(F,14,33,[
    1,0,0,0,0,0,0,0,0,0,0,w^2,0,0,1,w,w,1,0,w,w^2,1,w^2,0,1,0,0,1,w,w,0,0,0,
    0,1,0,0,0,0,0,0,0,0,0,1,w,w,w^2,0,w,1,0,w^2,1,w,w,1,0,1,0,1,w,1,0,0,0,
    0,0,1,0,0,0,0,0,0,0,0,1,w^2,w,0,w,0,w,0,w^2,w^2,w^2,w,0,1,w,0,w,0,0,0,0,0,
    0,0,0,1,0,0,0,0,0,0,0,w^2,1,1,0,w^2,0,1,0,w,1,w,0,w^2,w,w^2,0,w,0,w,0,0,0,
    0,0,0,0,1,0,0,0,0,0,0,0,w,0,w,w^2,w,1,0,w^2,0,w^2,1,w,w^2,w,0,0,w,w,0,0,0,
    0,0,0,0,0,1,0,0,0,0,0,0,w,1,0,w,1,1,w,1,0,w,1,w^2,1,1,w^2,0,0,1,0,0,0,
    0,0,0,0,0,0,1,0,0,0,0,w,w^2,w^2,1,w,1,0,1,1,1,w,1,w,1,0,0,w,1,0,0,0,0,
    0,0,0,0,0,0,0,1,0,0,0,w,0,0,w,1,0,0,w,w,0,1,0,1,0,1,w^2,w^2,1,w^2,0,0,0,
    0,0,0,0,0,0,0,0,1,0,0,w,0,w^2,1,0,w,w,w^2,w^2,0,1,0,0,1,w^2,0,w^2,0,1,0,0,0,
    0,0,0,0,0,0,0,0,0,1,0,0,1,1,0,1,w^2,w^2,1,w,1,1,0,1,1,w^2,w,1,0,1,0,0,0,
    0,0,0,0,0,0,0,0,0,0,1,1,0,0,w,0,w^2,0,1,w^2,w^2,w,0,0,w,1,w,w,0,w^2,0,0,0,
    0,1,w,0,w^2,w^2,1,w^2,w,0,w,w,1,0,w^2,w,w,0,0,0,w^2,w^2,w^2,0,0,w,w^2,0,0,1,1,0,0,
    w^2,w^2,w^2,0,0,w,w^2,0,0,1,0,1,w,0,w^2,w^2,1,w^2,w,0,w,w,1,0,w^2,w,w,0,0,0,0,1,0,
    w,w,1,0,w^2,w,w,0,0,0,w^2,w^2,w^2,0,0,w,w^2,0,0,1,0,1,w,0,w^2,w^2,1,w^2,w,0,0,0,1
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
Table3Generators[216]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 14;
assert Dimension(HermitianHull(Q)) eq 6;
Table3Parameters[216]:=[33,8,10,13];
Table3DistanceTypes[216]:="exact";

// Table 3, No. 217 | GQ04
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
Table3Generators[217]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 33 and Dimension(Q) eq 14;
assert Dimension(HermitianHull(Q)) eq 4;
Table3Parameters[217]:=[33,10,11,15];
Table3DistanceTypes[217]:="exact";

// Table 3, No. 218 | GQ05
// [[36,3,17;21]]_2, distance exact.
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
Gsrc2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W1:=Matrix(F,3,33,[
    1,0,w,1,1,0,0,w^2,w,w,1,1,w,0,w,1,w,w,0,0,0,1,1,w^2,w,w^2,w,w^2,1,w,w,w^2,0,
    1,w^2,w,w^2,w,w^2,1,w,w,w^2,0,1,0,w,1,1,0,0,w^2,w,w,1,1,w,0,w,1,w,w,0,0,0,1,
    1,w,0,w,1,w,w,0,0,0,1,1,w^2,w,w^2,w,w^2,1,w,w,w^2,0,1,0,w,1,1,0,0,w^2,w,w,1
]);
W2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
lambda:=3;
GX4:=Matrix(F,9,36,[
    1,0,0,0,0,0,0,1,1,0,w^2,1,w,0,0,1,0,w,w,w,0,0,w^2,1,w,0,1,w,w,w^2,0,w,w,0,0,0,
    0,1,0,0,0,0,w,w,w,w^2,1,1,w,1,0,w,w,w^2,w^2,0,w,w^2,1,0,0,w,w^2,w,0,w,w,0,0,0,0,0,
    0,0,1,0,0,0,1,1,1,w,0,w,w^2,1,w^2,w^2,0,w^2,w^2,w,w^2,1,1,w^2,w^2,1,w,w,w^2,1,0,w,w,0,0,0,
    0,0,0,1,0,0,0,w,0,0,0,w^2,w^2,w,w^2,0,0,w^2,1,0,1,1,1,w^2,0,w^2,w^2,1,0,1,w,w^2,w^2,0,0,0,
    0,0,0,0,1,0,1,0,0,1,1,0,0,0,0,w^2,1,1,0,w,1,w^2,0,1,w,w^2,0,1,w,1,w,w,1,0,0,0,
    0,0,0,0,0,1,w,0,w,w,0,0,1,w,w^2,w,w,1,1,w^2,1,w^2,0,w^2,1,w,1,w^2,0,w^2,1,0,w,0,0,0,
    1,0,w,1,1,0,0,w^2,w,w,1,1,w,0,w,1,w,w,0,0,0,1,1,w^2,w,w^2,w,w^2,1,w,w,w^2,0,1,0,0,
    1,w^2,w,w^2,w,w^2,1,w,w,w^2,0,1,0,w,1,1,0,0,w^2,w,w,1,1,w,0,w,1,w,w,0,0,0,1,0,1,0,
    1,w,0,w,1,w,w,0,0,0,1,1,w^2,w,w^2,w,w^2,1,w,w,w^2,0,1,0,w,1,1,0,0,w^2,w,w,1,0,0,1
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
Table3Generators[218]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 36 and Dimension(Q) eq 9;
assert Dimension(HermitianHull(Q)) eq 6;
Table3Parameters[218]:=[36,3,17,21];
Table3DistanceTypes[218]:="exact";

// Table 3, No. 219 | GQ06
// [[36,3,18;23]]_2, distance exact.
Gsrc1:=Matrix(F,8,33,[
    1,0,0,0,0,0,0,0,w,w^2,w^2,w,1,w^2,w,w,w^2,0,w,1,1,w,w,w^2,0,w^2,w^2,1,w^2,0,w,0,w^2,
    0,1,0,0,0,0,0,0,0,w^2,0,1,1,0,1,1,w^2,1,1,w,w,0,w,1,w,1,1,1,0,w,w^2,w,w^2,
    0,0,1,0,0,0,0,0,0,w^2,1,1,0,1,w,0,0,w,1,0,0,w^2,1,1,1,1,w^2,w^2,w,w^2,w^2,0,w,
    0,0,0,1,0,0,0,0,0,w,w^2,1,1,0,1,w,0,w,w,1,1,w,1,0,1,0,w,0,1,w,0,w,w^2,
    0,0,0,0,1,0,0,0,1,0,w,w,1,w,1,1,w^2,w,1,w,0,w^2,1,w,w,0,1,0,w^2,1,w^2,w,w,
    0,0,0,0,0,1,0,0,w^2,w^2,w,w^2,1,0,w^2,w^2,w,w^2,w,0,0,w,w^2,w^2,w,0,0,0,1,0,w^2,w^2,1,
    0,0,0,0,0,0,1,0,w,w,1,0,0,0,1,w,1,0,0,1,1,w,1,w,w^2,0,w^2,w^2,w,w,w,1,1,
    0,0,0,0,0,0,0,1,1,0,w,0,w,w^2,1,1,w,w^2,w^2,w,1,w^2,w^2,1,w^2,w,w,w^2,0,w^2,w,w,w^2
]);
Gsrc2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
W1:=Matrix(F,3,33,[
    0,0,w,1,0,w,w,1,w^2,1,w,w,1,1,0,1,w^2,w^2,0,1,w,0,w^2,1,w,0,0,w^2,w^2,w^2,1,w^2,w^2,
    w^2,1,w,0,0,w^2,w^2,w^2,1,w^2,w^2,0,0,w,1,0,w,w,1,w^2,1,w,w,1,1,0,1,w^2,w^2,0,1,w,0,
    w,1,1,0,1,w^2,w^2,0,1,w,0,w^2,1,w,0,0,w^2,w^2,w^2,1,w^2,w^2,0,0,w,1,0,w,w,1,w^2,1,w
]);
W2:=Matrix(F,3,3,[
    1,0,0,
    0,1,0,
    0,0,1
]);
lambda:=3;
GX4:=Matrix(F,8,36,[
    1,0,0,0,0,w^2,0,w^2,w^2,1,w^2,0,w^2,1,w^2,w^2,w^2,0,1,0,w,1,w,w,w^2,w,w,w^2,0,w,1,w^2,w,0,0,0,
    0,1,0,0,0,w^2,w,w^2,w,w,w,w^2,w^2,w,w,w^2,1,1,w,1,w^2,0,0,w^2,0,0,1,w,0,w^2,w^2,w^2,0,0,0,0,
    0,0,1,0,0,w,w,1,w^2,1,w,0,0,w,0,w^2,w^2,0,1,0,w^2,0,1,w,0,w^2,0,1,w^2,w^2,w^2,1,1,0,0,0,
    0,0,0,1,0,1,0,w,1,1,w,w,w^2,1,0,w^2,1,0,1,w,w^2,1,w^2,1,w,w^2,1,1,0,w^2,0,w,w^2,0,0,0,
    0,0,0,0,1,0,1,1,w,w,1,w,w^2,1,1,w,0,1,w,1,0,w,w^2,1,w,w,0,0,1,0,w^2,1,0,0,0,0,
    0,0,w,1,0,w,w,1,w^2,1,w,w,1,1,0,1,w^2,w^2,0,1,w,0,w^2,1,w,0,0,w^2,w^2,w^2,1,w^2,w^2,1,0,0,
    w^2,1,w,0,0,w^2,w^2,w^2,1,w^2,w^2,0,0,w,1,0,w,w,1,w^2,1,w,w,1,1,0,1,w^2,w^2,0,1,w,0,0,1,0,
    w,1,1,0,1,w^2,w^2,0,1,w,0,w^2,1,w,0,0,w^2,w^2,w^2,1,w^2,w^2,0,0,w,1,0,w,w,1,w^2,1,w,0,0,1
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
Table3Generators[219]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 36 and Dimension(Q) eq 8;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[219]:=[36,3,18,23];
Table3DistanceTypes[219]:="exact";

// Table 3, No. 220 | GQ07
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
Table3Generators[220]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 36 and Dimension(Q) eq 9;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[220]:=[36,4,17,22];
Table3DistanceTypes[220]:="exact";

// Table 3, No. 221 | GQ08
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
Table3Generators[221]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 36 and Dimension(Q) eq 17;
assert Dimension(HermitianHull(Q)) eq 6;
Table3Parameters[221]:=[36,11,11,13];
Table3DistanceTypes[221]:="exact";

// Table 3, No. 222 | GQ09
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
Table3Generators[222]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 39 and Dimension(Q) eq 11;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[222]:=[39,6,18,23];
Table3DistanceTypes[222]:="exact";

// Table 3, No. 223 | NQ01
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
Table3Generators[223]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 39 and Dimension(Q) eq 12;
assert Dimension(HermitianHull(Q)) eq 5;
Table3Parameters[223]:=[39,7,16,22];
Table3DistanceTypes[223]:="exact";

// Table 3, No. 224 | SQ11
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
Table3Generators[224]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 42 and Dimension(Q) eq 15;
assert Dimension(HermitianHull(Q)) eq 8;
Table3Parameters[224]:=[42,7,14,19];
Table3DistanceTypes[224]:="exact";

// Table 3, No. 225 | SQ12
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
Table3Generators[225]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 42 and Dimension(Q) eq 15;
assert Dimension(HermitianHull(Q)) eq 7;
Table3Parameters[225]:=[42,8,15,20];
Table3DistanceTypes[225]:="exact";

// Table 3, No. 226 | NQ02
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
Table3Generators[226]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;
assert Length(Q) eq 51 and Dimension(Q) eq 18;
assert Dimension(HermitianHull(Q)) eq 7;
Table3Parameters[226]:=[51,11,18,26];
Table3DistanceTypes[226]:="exact";

assert #Keys(Table3Generators) eq 32;
print "TABLE3_VERIFIED 32";
