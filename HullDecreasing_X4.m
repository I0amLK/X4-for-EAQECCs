// Hull-decreasing Construction X4 over GF(4).
// Uses only the generic X4 block assembly and Magma's Hermitian hull tools.
// No phi, beta, QC-X4, or propagation.

load "X4_core.m";
load "HermitianBasis_X4.m";

// C1 = H1 (+) K1; choose lambda rows from H1 for matching.
// C2 = H2 (+) K2; choose lambda orthonormal rows from K2.
//
// A1 = [H1top; K1], W1 = H1bot   (W1*W1^dagger = 0)
// A2 = [H2; K2top], W2 = K2bot   (W2*W2^dagger = I)
//
// X4 output: [ A1  0 ]
//            [ 0   A2]
//            [ W1  W2]
// In characteristic two the matched Gram block is 0 + I = I.
// The output hull dimension is h1 + h2 - lambda.
function HullDecreasingX4(G1,G2,lambda)
    F := BaseRing(G1);
    assert #F eq 4 and BaseRing(G2) eq F;

    H1,K1 := HullAndOrthonormalComplement(G1);
    H2,K2 := HullAndOrthonormalComplement(G2);
    h1 := Nrows(H1);
    h2 := Nrows(H2);
    r2 := Nrows(K2);
    assert lambda ge 1 and lambda le Min(h1,r2);

    // Split the first hull and the second orthonormal complement.
    H1top := RowSubmatrix(H1,h1-lambda);
    W1 := RowSubmatrix(H1,h1-lambda+1,lambda);
    K2top := RowSubmatrix(K2,r2-lambda);
    W2 := RowSubmatrix(K2,r2-lambda+1,lambda);

    A1 := VerticalJoin(H1top,K1);
    A2 := VerticalJoin(H2,K2top);

    // Check the two different kinds of matched directions.
    assert IsZero(W1*HAdjoint(G1));
    assert W2*HAdjoint(W2) eq IdentityMatrix(F,lambda);
    assert IsZero(A1*HAdjoint(W1));
    assert IsZero(A2*HAdjoint(W2));

    // Pair row i of W1 with row i of W2, directly.
    GX4 := ConstructionX4(A1,W1,A2,W2);

    k1 := Dimension(RowSpace(G1));
    k2 := Dimension(RowSpace(G2));
    assert Nrows(GX4) eq k1+k2-lambda;
    assert Dimension(HermitianHull(LinearCode(GX4)))
           eq h1+h2-lambda;

    return GX4,A1,W1,A2,W2;
end function;
