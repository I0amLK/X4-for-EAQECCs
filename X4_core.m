// Minimal Construction X4 over GF(4).
//
// Ingredient codes are C1=<A1,W1> and C2=<A2,W2>.
// Rows W1[i] and W2[i] are matched by their common row index.
//
//       [ A1   0  ]
//  GX4= [ 0    A2 ]
//       [ W1   W2 ]
//
// The caller chooses the decompositions and checks the desired hull/distance.

F<w> := GF(4);

function ConstructionX4(A1,W1,A2,W2)
    F := BaseRing(W1);
    n1 := Ncols(W1);
    n2 := Ncols(W2);
    lambda := Nrows(W1);

    assert BaseRing(A1) eq F and BaseRing(A2) eq F;
    assert BaseRing(W2) eq F;
    assert Ncols(A1) eq n1 and Ncols(A2) eq n2;
    assert Nrows(W2) eq lambda;

    // Each ingredient is a direct sum of its retained and matched parts.
    assert Rank(VerticalJoin(A1,W1)) eq Nrows(A1)+lambda;
    assert Rank(VerticalJoin(A2,W2)) eq Nrows(A2)+lambda;

    Top := HorizontalJoin(A1,ZeroMatrix(F,Nrows(A1),n2));
    Middle := HorizontalJoin(ZeroMatrix(F,Nrows(A2),n1),A2);
    Matched := HorizontalJoin(W1,W2);

    GX4 := VerticalJoin(VerticalJoin(Top,Middle),Matched);
    assert Rank(GX4) eq Nrows(A1)+Nrows(A2)+lambda;
    return GX4;
end function;
