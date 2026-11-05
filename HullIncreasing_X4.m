// Hull-increasing Construction X4 over GF(4) for two ingredient codes.
// Load from this directory; X4_core.m handles only block assembly.
load "X4_core.m";
load "HermitianBasis_X4.m";

// C_i=<H_i> direct-sum <K_i>, where K_i has an orthonormal basis.
// Select the final lambda basis rows of each K_i for matching.
// Output: generator of X4(C1,C2) and its four explicit ingredient blocks.
function HullIncreasingX4(G1,G2,lambda)
    F := BaseRing(G1);
    assert #F eq 4 and BaseRing(G2) eq F;

    H1,K1 := HullAndOrthonormalComplement(G1);
    H2,K2 := HullAndOrthonormalComplement(G2);
    r1 := Nrows(K1);
    r2 := Nrows(K2);
    assert lambda ge 1 and lambda le Min(r1,r2);

    // Split each orthonormal complement into retained and matched parts.
    K1top := RowSubmatrix(K1,r1-lambda);
    W1 := RowSubmatrix(K1,r1-lambda+1,lambda);
    K2top := RowSubmatrix(K2,r2-lambda);
    W2 := RowSubmatrix(K2,r2-lambda+1,lambda);
    A1 := VerticalJoin(H1,K1top);
    A2 := VerticalJoin(H2,K2top);

    // Characteristic 2: paired forms cancel, I_lambda+I_lambda=0.
    assert W1*HAdjoint(W1) eq IdentityMatrix(F,lambda);
    assert W2*HAdjoint(W2) eq IdentityMatrix(F,lambda);
    assert IsZero(A1*HAdjoint(W1));
    assert IsZero(A2*HAdjoint(W2));

    // Actual Construction X4, pairing the i-th rows directly.
    GX4 := ConstructionX4(A1,W1,A2,W2);

    k1 := Dimension(RowSpace(G1));
    k2 := Dimension(RowSpace(G2));
    h1 := Nrows(H1);
    h2 := Nrows(H2);
    assert Nrows(GX4) eq k1+k2-lambda;
    assert Dimension(HermitianHull(LinearCode(GX4)))
           eq h1+h2+lambda;

    return GX4,A1,W1,A2,W2;
end function;
