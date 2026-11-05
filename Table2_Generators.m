// Supplementary Magma data for Table 2 (QC-X4): No. 117–148.
// Corresponding compact CSV: Table2_Matrix_Index.csv.
// All 32 instances use m=3 and GF(4).
// The output generator is shown, without row reduction, as:
//              [ A1  0  ]
//       GX4 =  [ 0   A2 ]
//              [ W1  W2 ]
// Table2Generators[No] = <G_src1,G_src2,W1,W2,lambda,G_X4>.

F<w>:=GF(4);
function HDag(X)
    return Transpose(Matrix(F,Nrows(X),Ncols(X),[z^2:z in Eltseq(X)]));
end function;
Table2Generators:=AssociativeArray();

// Table 2, No. 117
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
A1:=ZeroMatrix(F,0,3);
A2:=Matrix(F,5,9,[
    1,0,0,0,0,w^2,0,w,w,
    0,1,0,0,0,w^2,1,w^2,w,
    0,0,1,0,0,1,w,w^2,w,
    0,0,0,1,0,w^2,1,0,w^2,
    0,0,0,0,1,w^2,0,1,w^2
]);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,0,9)),
        HorizontalJoin(ZeroMatrix(F,5,3),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 3 and Rank(Gsrc2) eq 8;
assert Rank(GX4) eq 8;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[117]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 118
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
A1:=ZeroMatrix(F,0,3);
A2:=Matrix(F,5,12,[
    1,0,w,0,0,0,0,w,0,w,1,w,
    0,1,w^2,0,0,0,0,1,w,w,w,1,
    0,0,0,1,0,0,0,w,1,w,w^2,w^2,
    0,0,0,0,1,0,w,1,1,0,w,1,
    0,0,0,0,0,1,w^2,w^2,w,w,w,w^2
]);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,0,12)),
        HorizontalJoin(ZeroMatrix(F,5,3),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 3 and Rank(Gsrc2) eq 8;
assert Rank(GX4) eq 8;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[118]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 119
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
A1:=ZeroMatrix(F,0,3);
A2:=Matrix(F,6,12,[
    1,0,0,0,0,0,w,0,1,w,w^2,1,
    0,1,0,0,0,0,w,w,0,1,w,w,
    0,0,1,0,0,0,1,w,1,w,w^2,w,
    0,0,0,1,0,0,w,1,1,w^2,w,w^2,
    0,0,0,0,1,0,0,w^2,w^2,w,w,0,
    0,0,0,0,0,1,w^2,w^2,0,w^2,w,w
]);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,0,12)),
        HorizontalJoin(ZeroMatrix(F,6,3),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 3 and Rank(Gsrc2) eq 9;
assert Rank(GX4) eq 9;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[119]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 120
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
A1:=ZeroMatrix(F,0,3);
A2:=Matrix(F,7,15,[
    1,0,0,0,0,0,0,w,w^2,1,w^2,0,w^2,1,w,
    0,1,0,0,0,0,0,0,w,w,0,1,1,w,w^2,
    0,0,1,0,0,0,0,w^2,w,0,w,1,1,1,1,
    0,0,0,1,0,0,0,w^2,w^2,1,1,1,w,w,1,
    0,0,0,0,1,0,0,w,w,1,w,1,0,1,0,
    0,0,0,0,0,1,0,w^2,w^2,0,1,0,1,w^2,w,
    0,0,0,0,0,0,1,w^2,0,w^2,1,1,w^2,1,w
]);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,0,15)),
        HorizontalJoin(ZeroMatrix(F,7,3),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 3 and Rank(Gsrc2) eq 10;
assert Rank(GX4) eq 10;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[120]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 121
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
A1:=ZeroMatrix(F,0,3);
A2:=Matrix(F,5,15,[
    1,0,0,0,0,1,1,w,1,w^2,1,0,w^2,0,0,
    0,1,0,0,0,w^2,0,0,w,1,w,0,1,w^2,w,
    0,0,1,0,0,0,w,w^2,w,1,0,w,w,w,1,
    0,0,0,1,0,1,w^2,w^2,w^2,0,0,w,w,w^2,w^2,
    0,0,0,0,1,w^2,w,1,1,0,w^2,w,1,1,1
]);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,0,15)),
        HorizontalJoin(ZeroMatrix(F,5,3),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 3 and Rank(Gsrc2) eq 8;
assert Rank(GX4) eq 8;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[121]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 122
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
A1:=Matrix(F,4,15,[
    1,0,0,0,0,w,1,1,1,0,w,1,w,1,w,
    0,1,0,0,w,w^2,1,1,w^2,w,1,0,0,w^2,w^2,
    0,0,1,0,w^2,1,w,w^2,w,w^2,1,w,w,w,0,
    0,0,0,1,1,w^2,0,w,w,w^2,w,0,1,w^2,0
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,4,3)),
        HorizontalJoin(ZeroMatrix(F,0,15),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 6 and Rank(Gsrc2) eq 2;
assert Rank(GX4) eq 6;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 2;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[122]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 123
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
A1:=ZeroMatrix(F,0,3);
A2:=Matrix(F,7,15,[
    1,0,0,0,0,0,0,w,0,w,w,w,1,w^2,0,
    0,1,0,0,0,0,0,w^2,w^2,w^2,w^2,w,0,w^2,w^2,
    0,0,1,0,0,0,0,w,1,0,w^2,1,1,0,w,
    0,0,0,1,0,0,0,1,w^2,0,1,w,0,1,w^2,
    0,0,0,0,1,0,0,w^2,1,1,w^2,1,0,0,w^2,
    0,0,0,0,0,1,0,w^2,w,w,w,0,1,w^2,w^2,
    0,0,0,0,0,0,1,1,0,w^2,1,0,0,w^2,w
]);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,0,15)),
        HorizontalJoin(ZeroMatrix(F,7,3),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 3 and Rank(Gsrc2) eq 10;
assert Rank(GX4) eq 10;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[123]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 124
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
A1:=Matrix(F,6,18,[
    1,0,0,0,0,0,1,1,w^2,w,0,w^2,0,1,w^2,0,w,1,
    0,1,0,0,0,0,w^2,w^2,w^2,1,w^2,w^2,0,w^2,1,w,w^2,w,
    0,0,1,0,0,0,0,0,w^2,w^2,w,w^2,w,w^2,w^2,w^2,0,w,
    0,0,0,1,0,0,w^2,1,w,w^2,w,w,w^2,1,w,0,0,0,
    0,0,0,0,1,0,w,w^2,1,w,w,w^2,1,w,w^2,1,w^2,w,
    0,0,0,0,0,1,1,w,w^2,0,1,0,w,w^2,1,0,w,w^2
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,6,3)),
        HorizontalJoin(ZeroMatrix(F,0,18),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 8 and Rank(Gsrc2) eq 2;
assert Rank(GX4) eq 8;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 2;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[124]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 125
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
A1:=ZeroMatrix(F,0,3);
A2:=Matrix(F,11,18,[
    1,0,0,0,0,0,0,0,0,0,0,1,1,0,w,1,w,0,
    0,1,0,0,0,0,0,0,0,0,0,w,w^2,w^2,w,0,w^2,w^2,
    0,0,1,0,0,0,0,0,0,0,0,1,w^2,0,0,w,w^2,1,
    0,0,0,1,0,0,0,0,0,0,0,w^2,1,w^2,0,1,w,0,
    0,0,0,0,1,0,0,0,0,0,0,1,0,1,1,w^2,w,0,
    0,0,0,0,0,1,0,0,0,0,0,0,w,0,w^2,w^2,w,w,
    0,0,0,0,0,0,1,0,0,0,0,w,1,1,0,w,w,w^2,
    0,0,0,0,0,0,0,1,0,0,0,w^2,1,1,1,0,w,w^2,
    0,0,0,0,0,0,0,0,1,0,0,1,w^2,w,1,0,1,w^2,
    0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,1,1,1,1,
    0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,0,w,w^2
]);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,0,18)),
        HorizontalJoin(ZeroMatrix(F,11,3),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 3 and Rank(Gsrc2) eq 14;
assert Rank(GX4) eq 14;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[125]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 126
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
A1:=Matrix(F,6,21,[
    1,0,0,0,0,0,1,w,1,0,1,w^2,w^2,0,w^2,w^2,w^2,0,0,0,w,
    0,1,0,0,0,0,w,1,w,w^2,w^2,w,1,0,w^2,1,0,w,0,w^2,0,
    0,0,1,0,0,0,0,1,w^2,w^2,w,1,w,w,w^2,0,w^2,0,1,w,w,
    0,0,0,1,0,0,w,w,w,0,0,w^2,0,1,1,w^2,w,w,w^2,0,w^2,
    0,0,0,0,1,0,0,0,w^2,1,w,w,1,1,0,1,w,w^2,0,w,w,
    0,0,0,0,0,1,w^2,1,1,1,0,w,1,0,w^2,0,w^2,w^2,1,w^2,0
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,6,3)),
        HorizontalJoin(ZeroMatrix(F,0,21),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 9 and Rank(Gsrc2) eq 3;
assert Rank(GX4) eq 9;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[126]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 127
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
A1:=Matrix(F,7,21,[
    1,0,0,1,0,0,0,0,w,w,w,1,w^2,w,w,1,0,1,w,1,w^2,
    0,1,0,w^2,0,0,0,0,w^2,0,w,w^2,w^2,0,1,w^2,w^2,w,w,0,w,
    0,0,1,w,0,0,0,0,w,0,1,w^2,0,w^2,0,1,w^2,w,w^2,w^2,0,
    0,0,0,0,1,0,0,0,1,w^2,w,w^2,1,1,0,w,1,w^2,w,w,w,
    0,0,0,0,0,1,0,0,w,1,w^2,1,0,w,w,1,w^2,0,w^2,1,0,
    0,0,0,0,0,0,1,0,1,w,0,0,w,1,w^2,0,1,1,w^2,w,w^2,
    0,0,0,0,0,0,0,1,w^2,w,0,1,1,0,w,1,w^2,0,w,w,0
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,7,3)),
        HorizontalJoin(ZeroMatrix(F,0,21),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 10 and Rank(Gsrc2) eq 3;
assert Rank(GX4) eq 10;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[127]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 128
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
A1:=Matrix(F,7,21,[
    1,0,0,0,0,0,0,1,w,w,w,w,w,1,w,1,w^2,0,1,1,w^2,
    0,1,0,0,0,0,0,1,1,0,w^2,w^2,1,0,w^2,w,0,0,w,1,w,
    0,0,1,0,0,0,0,0,w^2,w^2,1,w^2,w,1,w^2,0,w,0,1,w,w,
    0,0,0,1,0,0,0,1,0,1,0,0,w,1,1,w^2,w,w,1,0,1,
    0,0,0,0,1,0,0,w,1,w^2,0,w,w^2,w,0,1,1,1,1,w,0,
    0,0,0,0,0,1,0,1,w,w^2,1,w,1,1,w,w^2,1,w,w^2,1,w,
    0,0,0,0,0,0,1,w,1,w,w^2,w^2,w,w^2,w,0,w^2,w,1,1,w
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,7,3)),
        HorizontalJoin(ZeroMatrix(F,0,21),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 10 and Rank(Gsrc2) eq 3;
assert Rank(GX4) eq 10;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[128]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 129
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
A1:=Matrix(F,9,24,[
    1,0,0,0,0,0,0,0,0,w,0,w,w,1,1,1,1,w,0,w,w,1,1,1,
    0,1,0,0,0,0,0,0,0,1,0,w^2,0,w,w^2,0,1,1,w^2,w^2,w^2,1,w,1,
    0,0,1,0,0,0,0,0,0,0,w^2,0,0,w,w,w^2,0,0,w,0,0,w^2,w^2,1,
    0,0,0,1,0,0,0,0,0,0,w,w^2,1,w,0,w,0,w,1,1,w,w^2,w^2,1,
    0,0,0,0,1,0,0,0,0,1,w^2,w,w^2,0,0,0,1,0,0,w,1,w,0,w^2,
    0,0,0,0,0,1,0,0,0,w,w^2,w^2,1,0,1,0,w,w,1,0,w^2,0,1,w^2,
    0,0,0,0,0,0,1,0,0,w,0,w^2,1,0,w,w^2,0,0,w^2,0,w,0,1,w,
    0,0,0,0,0,0,0,1,0,0,w,0,0,w^2,1,w^2,1,1,1,0,w^2,w^2,w^2,w,
    0,0,0,0,0,0,0,0,1,w,w^2,1,1,w,w,w,w,w,0,0,w,w^2,1,w
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,9,3)),
        HorizontalJoin(ZeroMatrix(F,0,24),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 12 and Rank(Gsrc2) eq 3;
assert Rank(GX4) eq 12;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[129]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 130
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
A1:=Matrix(F,9,24,[
    1,0,0,0,0,0,0,0,0,w,w,0,w^2,1,1,w,0,0,0,w,1,1,w^2,0,
    0,1,0,0,0,0,0,0,0,w,0,1,w,w^2,w^2,1,w^2,w,0,w,1,w,w^2,0,
    0,0,1,0,0,0,0,0,0,w,w^2,1,w,w,1,w,w^2,0,0,w,1,1,w,w,
    0,0,0,1,0,0,0,0,0,1,0,0,w^2,w,1,w,0,1,1,w^2,1,w^2,0,w,
    0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w^2,w,1,1,w,w,w,w^2,w^2,
    0,0,0,0,0,1,0,0,0,1,0,0,w^2,1,1,w^2,w^2,w,0,1,w,1,w,1,
    0,0,0,0,0,0,1,0,0,1,w,w^2,0,1,1,w^2,w^2,w,1,w^2,0,w^2,0,1,
    0,0,0,0,0,0,0,1,0,0,w,w^2,w^2,w,w,w,0,0,1,w,w,1,1,w^2,
    0,0,0,0,0,0,0,0,1,0,1,w,w^2,1,1,1,w^2,w,w,0,1,1,0,0
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,9,3)),
        HorizontalJoin(ZeroMatrix(F,0,24),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 11 and Rank(Gsrc2) eq 2;
assert Rank(GX4) eq 11;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 2;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[130]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 131
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
A1:=Matrix(F,9,24,[
    1,0,0,0,0,0,0,0,0,1,w,0,w^2,w,w,w,0,0,0,w^2,0,1,w^2,w,
    0,1,0,0,0,0,0,0,0,w^2,w^2,w^2,w^2,w,1,w^2,w^2,w,w,w^2,0,w^2,w,w,
    0,0,1,0,0,0,0,0,0,w^2,0,w^2,w,w^2,1,w,0,0,w,1,0,0,w^2,w,
    0,0,0,1,0,0,0,0,0,1,w^2,1,0,0,w,1,w,w^2,0,1,1,1,0,1,
    0,0,0,0,1,0,0,0,0,w^2,w^2,w^2,0,w,w,w,w,0,0,1,w,w,0,0,
    0,0,0,0,0,1,0,0,0,1,w^2,0,0,0,1,w^2,w^2,0,w,w^2,1,1,w,0,
    0,0,0,0,0,0,1,0,0,w,w,w^2,w^2,w,w^2,0,0,w,1,w^2,0,w,0,1,
    0,0,0,0,0,0,0,1,0,w^2,w,1,w^2,0,1,1,1,w^2,0,1,w,w,0,w,
    0,0,0,0,0,0,0,0,1,w,w^2,w^2,w^2,1,0,w,0,w^2,w^2,0,w,w,0,1
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,9,3)),
        HorizontalJoin(ZeroMatrix(F,0,24),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 10 and Rank(Gsrc2) eq 1;
assert Rank(GX4) eq 10;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 1;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[131]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 132
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
A1:=Matrix(F,10,24,[
    1,0,0,0,0,0,0,0,0,0,w^2,0,w,1,w,w^2,0,0,1,1,0,1,0,w,
    0,1,0,0,0,0,0,0,w^2,0,w,0,1,0,w^2,w^2,1,w^2,0,1,w^2,1,0,w,
    0,0,1,0,0,0,0,0,w^2,0,1,0,1,1,1,0,1,1,0,1,w^2,w,1,0,
    0,0,0,1,0,0,0,0,w^2,0,0,0,1,w^2,0,w,0,w^2,1,1,w^2,w^2,0,0,
    0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w^2,w,1,1,w,w,w,w^2,w^2,
    0,0,0,0,0,1,0,0,w^2,0,0,0,1,0,0,w^2,w^2,0,0,w^2,0,1,w,w^2,
    0,0,0,0,0,0,1,0,1,0,0,0,w^2,w,w,1,w,w^2,w,1,0,1,0,w^2,
    0,0,0,0,0,0,0,1,1,0,w^2,0,w^2,1,w^2,w^2,1,1,1,w,1,w^2,w^2,0,
    0,0,0,0,0,0,0,0,0,1,w^2,0,w^2,0,w,w^2,0,0,w^2,w,w^2,0,w,1,
    0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,0,0,w,w^2,w,0,w,w^2,w,w^2
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,10,3)),
        HorizontalJoin(ZeroMatrix(F,0,24),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 11 and Rank(Gsrc2) eq 1;
assert Rank(GX4) eq 11;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 1;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[132]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 133
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
A1:=Matrix(F,11,27,[
    1,0,0,0,0,0,0,0,0,0,0,w,w,w,0,w^2,w,w,w^2,w,w^2,w,w,1,0,0,w,
    0,1,0,0,0,0,0,0,0,0,0,w^2,1,0,1,0,w^2,w,1,w,w^2,w,w^2,w,w,0,w^2,
    0,0,1,0,0,0,0,0,0,0,0,1,w,w,w,w^2,w^2,w^2,0,0,0,w,0,w^2,w,1,w^2,
    0,0,0,1,0,0,0,0,0,0,0,0,1,w^2,0,w^2,1,w,0,w,w^2,w^2,w,1,w,1,w^2,
    0,0,0,0,1,0,0,0,0,0,0,0,0,w,w,w^2,w,w,w,1,0,1,1,1,w,0,0,
    0,0,0,0,0,1,0,0,0,0,0,w,w,w^2,0,0,w^2,0,w^2,w,w,0,0,0,w,0,w^2,
    0,0,0,0,0,0,1,0,0,0,0,1,w^2,0,w,w^2,0,w^2,w^2,0,w,w,w^2,1,w,w,1,
    0,0,0,0,0,0,0,1,0,0,0,w,w^2,1,0,w,1,0,w,0,0,0,w,1,1,0,1,
    0,0,0,0,0,0,0,0,1,0,0,0,w,w^2,1,w^2,w,w^2,w,w^2,w^2,0,w^2,1,1,w^2,1,
    0,0,0,0,0,0,0,0,0,1,0,1,1,0,w,1,w^2,1,w^2,0,w^2,w,w,0,1,w,0,
    0,0,0,0,0,0,0,0,0,0,1,1,0,0,w,1,w,w,1,0,w,0,0,1,w^2,w^2,w
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,11,3)),
        HorizontalJoin(ZeroMatrix(F,0,27),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 12 and Rank(Gsrc2) eq 1;
assert Rank(GX4) eq 12;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 1;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[133]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 134
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
A1:=Matrix(F,7,30,[
    1,0,0,0,0,0,0,w^2,w^2,w,w^2,0,w^2,1,1,0,0,0,1,w,0,w,w^2,1,w^2,1,w^2,w,w^2,0,
    0,1,0,0,0,0,0,0,0,0,w^2,1,0,0,1,w^2,w^2,w,1,w,w^2,w,w,w,0,0,1,w,0,w,
    0,0,1,0,0,0,0,1,0,0,w,0,0,w,0,0,w,w^2,1,w^2,w^2,1,1,w,1,w^2,0,1,w,w^2,
    0,0,0,1,0,0,0,1,w^2,1,w,0,w^2,0,1,1,w^2,w,1,1,1,1,1,w^2,w^2,0,0,1,1,0,
    0,0,0,0,1,0,0,0,0,w,1,w,w,w^2,1,0,1,w,w,w,w,w^2,0,1,w,1,w,0,1,0,
    0,0,0,0,0,1,0,0,w,w^2,w,1,0,w^2,w,w,w,w,1,0,w^2,1,1,w,0,w,1,1,w^2,w^2,
    0,0,0,0,0,0,1,0,w^2,1,w^2,w^2,w^2,0,w^2,w^2,w^2,1,1,1,1,w^2,1,w,0,1,w^2,0,w,0
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,7,3)),
        HorizontalJoin(ZeroMatrix(F,0,30),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 9 and Rank(Gsrc2) eq 2;
assert Rank(GX4) eq 9;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 2;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[134]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 135
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
A1:=Matrix(F,8,30,[
    1,0,0,0,0,0,0,w^2,0,w,w,0,w,w^2,0,w,w,0,w,w^2,0,w^2,w^2,w,w,w^2,1,1,0,w,
    0,1,0,0,0,0,0,0,0,0,w^2,1,0,0,1,w^2,w^2,w,1,w,w^2,w,w,w,0,0,1,w,0,w,
    0,0,1,0,0,0,0,1,0,0,w,0,0,w,0,0,w,w^2,1,w^2,w^2,1,1,w,1,w^2,0,1,w,w^2,
    0,0,0,1,0,0,0,1,0,1,w^2,0,w,w,0,w^2,1,w,w,0,1,0,1,0,w,w,w,w,w,w,
    0,0,0,0,1,0,0,0,0,w,1,w,w,w^2,1,0,1,w,w,w,w,w^2,0,1,w,1,w,0,1,0,
    0,0,0,0,0,1,0,0,0,w^2,1,1,w^2,w,1,w^2,w^2,w,w^2,w^2,w^2,w,1,0,w^2,w^2,0,w^2,1,w,
    0,0,0,0,0,0,1,0,0,1,w,w^2,w,w,w,1,1,1,w,0,1,w,1,1,1,w^2,1,w^2,1,w,
    0,0,0,0,0,0,0,0,1,0,w,0,w,w^2,w,w^2,w^2,0,1,w,0,w,0,1,w,w^2,w^2,1,1,w^2
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,8,3)),
        HorizontalJoin(ZeroMatrix(F,0,30),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 9 and Rank(Gsrc2) eq 1;
assert Rank(GX4) eq 9;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 1;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[135]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 136
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
A1:=Matrix(F,6,30,[
    1,0,0,0,0,0,1,w,w^2,1,1,w^2,0,w^2,1,0,w^2,0,w,w,1,w,0,w,w^2,0,0,w^2,0,w^2,
    0,1,0,0,0,0,0,1,0,0,w^2,0,w,w,0,w^2,w^2,0,w^2,w^2,w,0,w,w^2,w,w^2,1,0,w,w^2,
    0,0,1,0,0,0,1,1,0,w,w,w^2,0,w^2,w,w^2,w^2,1,w,0,1,0,1,0,w^2,w^2,w^2,w^2,1,w,
    0,0,0,1,0,0,1,w^2,1,0,0,1,w,w,0,w,0,w^2,0,1,1,0,w,w,w,w,w^2,1,0,1,
    0,0,0,0,1,0,1,w^2,w,w^2,w,w,0,1,w,w^2,1,1,0,0,w,w,0,1,w^2,w^2,0,w,w,w^2,
    0,0,0,0,0,1,0,w^2,1,1,w^2,w,w,1,w^2,w,w^2,1,0,0,1,0,w,w^2,0,w^2,0,0,w^2,1
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,6,3)),
        HorizontalJoin(ZeroMatrix(F,0,30),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 8 and Rank(Gsrc2) eq 2;
assert Rank(GX4) eq 8;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 2;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[136]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 137
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
A1:=Matrix(F,11,30,[
    1,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,w,0,1,0,w^2,0,w^2,w,w^2,w,w^2,0,w,0,
    0,1,0,0,0,0,0,0,0,0,0,w^2,0,0,0,1,w^2,0,w^2,0,w,w,0,1,w^2,w,w^2,w,w^2,0,
    0,0,1,0,0,0,0,0,0,0,0,1,w,0,1,w^2,w^2,1,1,w,w,0,1,1,w,w,w^2,w,0,w,
    0,0,0,1,0,0,0,0,0,0,0,w^2,w^2,0,0,0,w^2,w^2,1,0,w^2,w^2,1,1,w^2,w,w^2,1,w,w^2,
    0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,1,w^2,1,0,w,w,1,w,w^2,1,w^2,0,w,0,1,
    0,0,0,0,0,1,0,0,0,0,0,0,0,w,1,w^2,w,1,w,w,1,w^2,w^2,0,0,w,w^2,1,1,w^2,
    0,0,0,0,0,0,1,0,0,0,0,w,w,1,1,w,1,1,w^2,w,1,1,w^2,1,w,1,1,0,w^2,0,
    0,0,0,0,0,0,0,1,0,0,0,w,1,w^2,w,1,0,w,1,w^2,w^2,w^2,1,w^2,1,1,0,0,w^2,0,
    0,0,0,0,0,0,0,0,1,0,0,w,0,0,w,w,1,w^2,w,w^2,0,1,0,0,1,1,w^2,w,w^2,w,
    0,0,0,0,0,0,0,0,0,1,0,0,1,w^2,0,w^2,1,1,w^2,1,w,w,w^2,0,0,w,0,w,w^2,0,
    0,0,0,0,0,0,0,0,0,0,1,0,w^2,0,0,1,w,1,0,w^2,w,w,w^2,0,0,w,0,w^2,w,1
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,11,3)),
        HorizontalJoin(ZeroMatrix(F,0,30),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 14 and Rank(Gsrc2) eq 3;
assert Rank(GX4) eq 14;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[137]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 138
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
A1:=Matrix(F,11,30,[
    1,0,0,0,0,0,0,0,0,0,0,w^2,0,0,1,w,w,1,0,w,w^2,1,w^2,0,1,0,0,1,w,w,
    0,1,0,0,0,0,0,0,0,0,0,1,w,w,w^2,0,w,1,0,w^2,1,w,w,1,0,1,0,1,w,1,
    0,0,1,0,0,0,0,0,0,0,0,1,w^2,w,0,w,0,w,0,w^2,w^2,w^2,w,0,1,w,0,w,0,0,
    0,0,0,1,0,0,0,0,0,0,0,w^2,1,1,0,w^2,0,1,0,w,1,w,0,w^2,w,w^2,0,w,0,w,
    0,0,0,0,1,0,0,0,0,0,0,0,w,0,w,w^2,w,1,0,w^2,0,w^2,1,w,w^2,w,0,0,w,w,
    0,0,0,0,0,1,0,0,0,0,0,0,w,1,0,w,1,1,w,1,0,w,1,w^2,1,1,w^2,0,0,1,
    0,0,0,0,0,0,1,0,0,0,0,w,w^2,w^2,1,w,1,0,1,1,1,w,1,w,1,0,0,w,1,0,
    0,0,0,0,0,0,0,1,0,0,0,w,0,0,w,1,0,0,w,w,0,1,0,1,0,1,w^2,w^2,1,w^2,
    0,0,0,0,0,0,0,0,1,0,0,w,0,w^2,1,0,w,w,w^2,w^2,0,1,0,0,1,w^2,0,w^2,0,1,
    0,0,0,0,0,0,0,0,0,1,0,0,1,1,0,1,w^2,w^2,1,w,1,1,0,1,1,w^2,w,1,0,1,
    0,0,0,0,0,0,0,0,0,0,1,1,0,0,w,0,w^2,0,1,w^2,w^2,w,0,0,w,1,w,w,0,w^2
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,11,3)),
        HorizontalJoin(ZeroMatrix(F,0,30),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 14 and Rank(Gsrc2) eq 3;
assert Rank(GX4) eq 14;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[138]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 139
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
A1:=Matrix(F,11,30,[
    1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w,1,0,w,w,0,1,0,1,w,1,1,w^2,0,0,w,
    0,1,0,0,0,0,0,0,0,0,0,1,0,w,0,w,1,1,w,w,w^2,0,1,0,0,w,w,1,0,w^2,
    0,0,1,0,0,0,0,0,0,0,0,1,w,w^2,0,0,w,0,1,w^2,1,w^2,w^2,w,0,w,w,1,1,1,
    0,0,0,1,0,0,0,0,0,0,0,w^2,w^2,w^2,0,0,1,0,1,1,w,w,w,0,0,w^2,w,w,0,w,
    0,0,0,0,1,0,0,0,0,0,0,w^2,w,0,0,w^2,1,w,0,w,0,0,w,w,1,1,0,w,w^2,1,
    0,0,0,0,0,1,0,0,0,0,0,0,0,w,0,1,w,w^2,w^2,w^2,0,0,1,1,w^2,1,w^2,w^2,1,w,
    0,0,0,0,0,0,1,0,0,0,0,0,0,w,w^2,w,w,0,w^2,1,w,1,0,0,1,0,w^2,w,w,w,
    0,0,0,0,0,0,0,1,0,0,0,0,w,w^2,w,0,w,w^2,1,w,1,0,0,w,w,w,0,0,w,w,
    0,0,0,0,0,0,0,0,1,0,0,1,w^2,1,w,w,w,w,1,w^2,1,w,0,w,w^2,1,0,w,1,1,
    0,0,0,0,0,0,0,0,0,1,0,w^2,1,0,w^2,w^2,0,1,w,w^2,0,0,w^2,w,w^2,1,w,w^2,0,0,
    0,0,0,0,0,0,0,0,0,0,1,1,w,1,1,w^2,w,1,w^2,w,w,0,w,0,w^2,1,0,1,0,w
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,11,3)),
        HorizontalJoin(ZeroMatrix(F,0,30),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 14 and Rank(Gsrc2) eq 3;
assert Rank(GX4) eq 14;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[139]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 140
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
A1:=Matrix(F,6,33,[
    1,0,0,0,0,0,0,1,1,0,w^2,1,w,0,0,1,0,w,w,w,0,0,w^2,1,w,0,1,w,w,w^2,0,w,w,
    0,1,0,0,0,0,w,w,w,w^2,1,1,w,1,0,w,w,w^2,w^2,0,w,w^2,1,0,0,w,w^2,w,0,w,w,0,0,
    0,0,1,0,0,0,1,1,1,w,0,w,w^2,1,w^2,w^2,0,w^2,w^2,w,w^2,1,1,w^2,w^2,1,w,w,w^2,1,0,w,w,
    0,0,0,1,0,0,0,w,0,0,0,w^2,w^2,w,w^2,0,0,w^2,1,0,1,1,1,w^2,0,w^2,w^2,1,0,1,w,w^2,w^2,
    0,0,0,0,1,0,1,0,0,1,1,0,0,0,0,w^2,1,1,0,w,1,w^2,0,1,w,w^2,0,1,w,1,w,w,1,
    0,0,0,0,0,1,w,0,w,w,0,0,1,w,w^2,w,w,1,1,w^2,1,w^2,0,w^2,1,w,1,w^2,0,w^2,1,0,w
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,6,3)),
        HorizontalJoin(ZeroMatrix(F,0,33),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 9 and Rank(Gsrc2) eq 3;
assert Rank(GX4) eq 9;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[140]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 141
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
A1:=Matrix(F,5,33,[
    1,0,0,0,0,w^2,0,w^2,w^2,1,w^2,0,w^2,1,w^2,w^2,w^2,0,1,0,w,1,w,w,w^2,w,w,w^2,0,w,1,w^2,w,
    0,1,0,0,0,w^2,w,w^2,w,w,w,w^2,w^2,w,w,w^2,1,1,w,1,w^2,0,0,w^2,0,0,1,w,0,w^2,w^2,w^2,0,
    0,0,1,0,0,w,w,1,w^2,1,w,0,0,w,0,w^2,w^2,0,1,0,w^2,0,1,w,0,w^2,0,1,w^2,w^2,w^2,1,1,
    0,0,0,1,0,1,0,w,1,1,w,w,w^2,1,0,w^2,1,0,1,w,w^2,1,w^2,1,w,w^2,1,1,0,w^2,0,w,w^2,
    0,0,0,0,1,0,1,1,w,w,1,w,w^2,1,1,w,0,1,w,1,0,w,w^2,1,w,w,0,0,1,0,w^2,1,0
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,5,3)),
        HorizontalJoin(ZeroMatrix(F,0,33),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 8 and Rank(Gsrc2) eq 3;
assert Rank(GX4) eq 8;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[141]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 142
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
A1:=Matrix(F,7,33,[
    1,0,0,0,0,0,0,0,1,1,0,0,w^2,0,1,w,w,w^2,w^2,w,0,0,w,w^2,w^2,w^2,w^2,0,w,0,0,w,w^2,
    0,1,0,0,0,0,0,0,w,w^2,w^2,w,w,w,1,w^2,1,w^2,w,1,w^2,w^2,1,w^2,1,w^2,w,w^2,w,1,0,w^2,w^2,
    0,0,1,0,0,0,w,0,1,0,w,1,1,0,w^2,0,w,1,w^2,0,1,1,w^2,1,w^2,w,w^2,w^2,0,1,w^2,w^2,1,
    0,0,0,1,0,0,w^2,0,0,1,0,w^2,w,w^2,0,1,w^2,w,w,w,w^2,1,0,0,w^2,w,w^2,1,w^2,w^2,1,w,w^2,
    0,0,0,0,1,0,w,0,0,w,0,w,w^2,1,1,w^2,1,w,1,0,w^2,w^2,w^2,1,w^2,w^2,w^2,w,1,w,1,w^2,w^2,
    0,0,0,0,0,1,w,0,w,w,0,0,1,w,w^2,w,w,1,1,w^2,1,w^2,0,w^2,1,w,1,w^2,0,w^2,1,0,w,
    0,0,0,0,0,0,0,1,0,1,w^2,1,1,0,1,w^2,w,1,1,0,0,0,1,w,1,w^2,w,w,0,w^2,0,0,1
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,7,3)),
        HorizontalJoin(ZeroMatrix(F,0,33),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 9 and Rank(Gsrc2) eq 2;
assert Rank(GX4) eq 9;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 2;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[142]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 143
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
A1:=Matrix(F,14,33,[
    1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,w^2,1,w,w,w,w^2,0,1,1,1,1,w^2,w^2,0,0,
    0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,w^2,1,1,w^2,w,w,0,1,w,w^2,w^2,0,0,w,1,w,
    0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w,w,0,w^2,0,0,1,w^2,0,w,w,0,w^2,w^2,w,
    0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,w^2,0,1,w^2,w,w,w,0,0,w^2,0,1,1,0,1,
    0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,1,w,1,w,1,1,0,1,w,0,w,0,0,1,
    0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,w^2,w,w,0,1,0,w^2,1,w^2,0,w,0,w^2,w,1,w^2,0,1,
    0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,0,1,w,1,w^2,w,w,w,w,w,w,0,0,0,0,1,
    0,0,0,0,0,0,0,1,0,0,0,0,0,w,0,0,w^2,1,1,w^2,w^2,w^2,w,0,0,w,w^2,1,1,0,1,1,w,
    0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,0,w,w^2,0,0,w^2,0,w,0,0,1,1,0,w^2,w,w,0,0,w^2,
    0,0,0,0,0,0,0,0,0,1,0,0,0,w,0,0,1,0,w,0,0,w,1,w,w^2,w,w^2,0,0,1,0,0,w^2,
    0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,w^2,1,w,w^2,w^2,w^2,w,1,1,w^2,0,w,w,w^2,w,w,1,
    0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,w^2,0,1,w^2,1,w^2,0,w^2,1,1,0,w,0,1,0,w,0,
    0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,w,0,1,0,0,w^2,w^2,1,1,w^2,w,w^2,0,w^2,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w^2,w^2,w,1,w^2,w,0,1,w,1,w,0,w,1,0
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,14,3)),
        HorizontalJoin(ZeroMatrix(F,0,33),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 17 and Rank(Gsrc2) eq 3;
assert Rank(GX4) eq 17;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[143]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 144
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
A1:=Matrix(F,8,36,[
    1,0,0,0,0,0,0,0,1,0,0,1,w,w^2,w^2,1,w,w,w^2,0,w,0,0,w^2,1,0,0,w^2,w,w^2,0,1,0,0,0,w^2,
    0,1,0,0,0,0,0,0,w,w,w,w^2,1,w,1,0,0,1,w^2,w,1,w^2,w,w,w^2,0,w,w,w,w,w,1,1,0,1,1,
    0,0,1,0,0,0,0,0,0,1,w,w^2,1,w^2,w^2,1,0,1,0,w^2,w,1,0,w^2,0,w,w,1,w^2,1,w^2,0,1,0,0,w^2,
    0,0,0,1,0,0,0,0,w^2,0,0,w,w^2,0,0,0,w,w^2,w^2,1,1,w^2,w,w^2,0,w^2,0,1,1,w,0,w,w^2,0,0,0,
    0,0,0,0,1,0,0,0,1,w^2,w,1,0,0,0,1,w^2,0,w,w,w,w,w,0,w,0,1,w,w,1,w^2,0,w^2,w^2,0,w,
    0,0,0,0,0,1,0,0,w^2,0,w^2,1,w^2,0,w^2,w,w^2,0,0,w^2,w^2,w,w^2,0,1,w,w^2,w,0,w^2,w^2,0,0,w^2,w,1,
    0,0,0,0,0,0,1,0,w,1,w^2,1,0,w^2,w,1,1,1,1,w,w^2,w^2,w,w^2,0,w,1,w^2,w^2,w^2,1,1,1,0,0,0,
    0,0,0,0,0,0,0,1,w^2,1,1,w,w^2,w^2,1,w,0,0,w,w,1,0,0,0,w^2,0,w^2,w^2,0,0,0,0,1,w^2,1,0
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,8,3)),
        HorizontalJoin(ZeroMatrix(F,0,36),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 11 and Rank(Gsrc2) eq 3;
assert Rank(GX4) eq 11;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[144]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 145
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
A1:=Matrix(F,11,36,[
    1,0,0,0,0,0,0,0,0,0,w^2,1,0,1,w^2,w,w,w^2,1,1,1,1,1,1,1,0,0,w^2,w^2,w^2,1,w^2,1,w,1,0,
    0,1,0,0,0,0,0,0,0,0,0,w^2,0,0,0,1,w,1,w,1,w,w^2,w^2,1,0,w,1,w^2,w^2,0,w,1,1,1,0,0,
    0,0,1,0,0,0,0,0,0,0,w^2,w,0,w,w^2,1,0,w^2,1,0,1,0,w^2,1,w^2,w,w^2,1,0,0,w,w,1,w,w,w^2,
    0,0,0,1,0,0,0,0,0,0,1,w,0,0,0,w^2,w^2,w,w,1,0,w^2,w,0,w^2,w,0,0,1,1,1,0,0,0,0,w,
    0,0,0,0,1,0,0,0,0,0,0,1,0,1,1,w^2,1,0,w^2,1,w,w^2,0,1,w^2,0,w^2,w,1,w^2,0,1,w,w,1,0,
    0,0,0,0,0,1,0,0,0,0,w,w^2,0,w^2,1,w^2,w,w,1,0,w^2,w,w^2,w^2,w^2,w,w,0,0,w,w,w,w,w^2,w,w^2,
    0,0,0,0,0,0,1,0,0,0,0,w,0,1,w,w,1,w,w,0,1,w^2,0,1,w^2,1,w^2,w,1,1,0,w,1,1,w,w^2,
    0,0,0,0,0,0,0,1,0,0,w^2,w,0,w^2,1,w^2,w,1,0,1,w^2,0,w,0,w^2,w,w^2,w,w^2,w,w^2,0,w^2,1,0,w,
    0,0,0,0,0,0,0,0,1,0,1,w^2,0,1,1,0,1,w^2,w,1,1,0,0,0,0,1,w,1,w^2,w,w,0,w^2,0,0,1,
    0,0,0,0,0,0,0,0,0,1,w,w^2,0,0,w^2,w^2,w^2,1,0,w,w^2,0,1,1,1,1,w^2,0,1,w,1,1,w,1,1,1,
    0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,1,w,w^2,1,0,1,w^2,w,w,0,w,w,w,w^2,1,0,0,w^2,0,w,w^2
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,11,3)),
        HorizontalJoin(ZeroMatrix(F,0,36),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 12 and Rank(Gsrc2) eq 1;
assert Rank(GX4) eq 12;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 1;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[145]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 146
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
A1:=Matrix(F,12,39,[
    1,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,0,1,1,0,w^2,0,w^2,0,w,w^2,w^2,w^2,w,1,0,w^2,1,0,w,w,1,w,w^2,w,
    0,1,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,0,w,w^2,w,w,w^2,w^2,w^2,w,0,0,0,0,w^2,w,w,0,0,0,w^2,1,1,1,
    0,0,1,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w,0,0,w,0,w^2,w^2,w,w^2,0,w^2,w^2,1,0,w,w,1,w^2,w,w,0,1,
    0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,w,w^2,1,0,w,w^2,1,1,w,w,w^2,w,0,1,w^2,w^2,w,w,w^2,0,0,
    0,0,0,0,1,0,0,0,0,0,0,0,w,w,0,1,1,w^2,0,0,1,0,1,0,1,0,1,w,0,w,1,0,w^2,0,0,0,w^2,1,w,
    0,0,0,0,0,1,0,0,0,0,0,0,0,w,0,0,w,1,0,0,w^2,w^2,w,w^2,1,w^2,1,1,w,w^2,w^2,1,w,1,1,w^2,w,0,w^2,
    0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,1,1,0,w^2,1,1,w^2,w,w,w,w,0,w,0,1,0,w^2,1,w,1,w^2,w^2,w,0,1,
    0,0,0,0,0,0,0,1,0,0,0,0,1,1,1,1,w^2,w^2,w^2,w^2,1,1,w^2,w^2,0,w,w^2,0,w,0,1,0,w,1,0,w^2,w^2,1,1,
    0,0,0,0,0,0,0,0,1,0,0,0,w^2,w,w,w,1,0,w,w,0,w^2,0,1,1,0,1,w,1,w,1,1,1,0,w,0,1,0,0,
    0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,w,0,w^2,1,0,w,w,1,w^2,1,w,1,0,0,w,w^2,0,w^2,w,0,1,w,w,1,w,
    0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w^2,w,w,1,0,w^2,w,w^2,0,w,0,w,w,0,0,0,w^2,w,0,w,0,1,w^2,1,1,
    0,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,0,1,1,1,0,w^2,1,w,w,w,w,w^2,w^2,w,1,w,w,w^2,0,w^2,w^2,1,w,w
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,12,3)),
        HorizontalJoin(ZeroMatrix(F,0,39),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 15 and Rank(Gsrc2) eq 3;
assert Rank(GX4) eq 15;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 3;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[146]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 147
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
A1:=Matrix(F,13,39,[
    1,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,0,w,0,1,w^2,w,w,w,w,1,w^2,w^2,w,1,w,0,w,0,w^2,w^2,w^2,w^2,
    0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,1,1,0,0,w^2,1,w^2,0,0,0,1,0,0,w,0,0,w,w^2,w,1,0,
    0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,w,w^2,0,w^2,w^2,1,w^2,w^2,0,w^2,w,w,w,w,w,1,1,w,1,0,0,
    0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,1,w^2,1,w,0,0,w,w,1,w,0,w^2,1,0,w^2,w^2,w,0,w^2,w^2,0,1,w^2,0,1,
    0,0,0,0,1,0,0,0,0,0,0,0,0,w,0,0,w^2,w,w,w^2,0,0,w^2,0,0,1,w^2,w^2,w,0,w^2,w^2,w^2,0,w,w,w,1,w^2,
    0,0,0,0,0,1,0,0,0,0,0,0,0,w,w^2,w,1,0,1,w,1,w,0,0,w,w,w^2,0,w,0,w,w,w,1,0,1,w,0,0,
    0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,w,1,0,0,w^2,w,w^2,w^2,w^2,1,w^2,w^2,w^2,w^2,w,0,1,w^2,w,1,1,w,0,0,0,
    0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,w^2,w,0,w,1,w^2,1,w,w,w^2,1,1,w^2,0,w,w^2,w,1,w^2,1,0,1,w^2,
    0,0,0,0,0,0,0,0,1,0,0,0,0,w,w^2,w^2,w^2,0,w^2,0,1,1,0,0,w,0,1,w,w,0,0,1,1,0,w^2,0,w^2,0,w^2,
    0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,1,1,1,1,0,w^2,w^2,w^2,0,1,1,0,0,1,1,1,w^2,w,0,0,w,0,1,1,
    0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,w^2,1,w^2,w,1,1,1,w^2,1,w,w^2,1,w^2,w^2,1,1,w,0,0,w,1,0,0,1,w,
    0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w^2,0,w,0,w,0,1,w^2,w,1,1,w,0,w^2,0,w^2,0,w^2,0,w,w,w,w,1,
    0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,1,w,w,0,0,1,1,w^2,w^2,0,w,w^2,w,1,w,0,1,0,0,0,w^2,w^2,0,0
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,13,3)),
        HorizontalJoin(ZeroMatrix(F,0,39),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 15 and Rank(Gsrc2) eq 2;
assert Rank(GX4) eq 15;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 2;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[147]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

// Table 2, No. 148
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
A1:=Matrix(F,17,48,[
    1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,0,w,1,0,w^2,1,1,w^2,1,w^2,1,1,w^2,w^2,w^2,0,0,w^2,1,w,w,w,w^2,w^2,0,0,w^2,1,w^2,
    0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,w,0,w,0,1,1,w^2,w,w,w,1,w,w^2,w,1,w^2,w,w,w^2,1,0,0,0,w^2,0,0,0,
    0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,w,1,0,1,0,1,w,w^2,w,w,0,0,w,1,0,w,w,0,1,0,w^2,w,1,w,0,w^2,0,0,
    0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,1,w,w^2,0,w,w,1,w,1,1,0,1,0,0,1,w^2,0,1,w,1,w^2,w,0,0,0,w,1,1,1,
    0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,w,0,w^2,0,w^2,0,0,w^2,w^2,0,0,1,w,1,0,1,0,w^2,1,0,0,0,w,w^2,1,0,w^2,1,
    0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,1,0,w^2,0,1,1,1,0,w,0,1,w,1,w^2,1,w,1,1,w,0,1,w,1,w,w,w,0,w,
    0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,0,w^2,1,1,0,w,0,1,0,w^2,w,0,w,0,w,w^2,w^2,1,w^2,1,w^2,w^2,w^2,0,1,1,0,
    0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,w^2,1,w^2,1,w,0,0,0,1,w,1,0,0,w^2,0,w^2,w,1,0,w^2,w,w^2,w^2,0,w,
    0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,0,0,1,0,w,0,0,1,w,0,0,w,w^2,0,w^2,w,1,1,w^2,w,w^2,w^2,w,w,1,1,w^2,w^2,
    0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,w^2,w^2,1,0,1,w^2,0,w,0,0,w,w^2,w^2,0,1,w^2,1,w,1,0,w,w,0,1,0,1,1,1,w,w,
    0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,0,1,0,w^2,w,0,1,w,w^2,0,w,0,1,1,w^2,0,w,w,1,1,w,w,w,0,w^2,w^2,w^2,w,w,w,
    0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,w^2,1,0,w^2,0,1,w^2,w,0,0,0,w,1,w^2,1,1,w^2,1,w,1,w,0,1,1,0,1,1,1,w^2,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,0,1,0,0,0,1,w^2,w,w^2,1,0,w,0,w^2,1,w^2,w,w,1,w^2,w^2,1,w^2,0,1,w,w,w^2,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,0,1,0,1,w,w^2,0,1,w^2,w,w,w^2,1,w,w,w^2,w^2,1,w^2,0,0,1,w^2,w,w,1,0,w,w^2,1,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,1,1,w^2,1,0,1,w^2,1,w,w^2,w^2,w^2,w,0,w^2,1,0,1,w^2,w^2,1,0,w^2,w^2,w^2,0,0,w,0,w^2,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,1,w,1,w^2,w,0,1,w^2,1,1,w,w^2,w^2,w^2,w^2,w^2,w^2,1,w,0,1,0,w,1,w,w,w^2,w^2,0,w,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,0,0,1,w,1,0,0,0,w^2,1,w^2,0,w,0,1,1,w^2,1,w^2,1,w,w,w^2,w^2,w^2,0,w^2,1,w^2
]);
A2:=ZeroMatrix(F,0,3);
GX4:=VerticalJoin(
    VerticalJoin(
        HorizontalJoin(A1,ZeroMatrix(F,17,3)),
        HorizontalJoin(ZeroMatrix(F,0,48),A2)),
    HorizontalJoin(W1,W2));
assert Rank(Gsrc1) eq 18 and Rank(Gsrc2) eq 1;
assert Rank(GX4) eq 18;
assert W1*HDag(W1) eq W2*HDag(W2);
assert Rank(W1*HDag(W1)) eq 1;
assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(Gsrc1);
assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(Gsrc2);
Table2Generators[148]:=<Gsrc1,Gsrc2,W1,W2,lambda,GX4>;

assert #{i:i in [117..148] | IsDefined(Table2Generators,i)} eq 32;
print "TABLE 2: ALL 32 EXPLICIT X4 BLOCK GENERATORS VERIFIED";
