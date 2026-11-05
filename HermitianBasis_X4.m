// GF(4) Hermitian hull and orthonormal complement.
// This is linear algebra only; no X4-specific hull changing logic.
function HAdjoint(M)
    F := BaseRing(M);
    return Transpose(Matrix(F,Nrows(M),Ncols(M),
                            [x^2 : x in Eltseq(M)]));
end function;

// C=<H> direct-sum <K>, with H=Hull_H(C), K*K^dagger=I.
// HermitianHull and Complement are Magma built-ins.
function HullAndOrthonormalComplement(G)
    F := BaseRing(G);
    n := Ncols(G);
    assert #F eq 4;

    C := LinearCode(G);
    V := RowSpace(G);
    Hspace := RowSpace(GeneratorMatrix(HermitianHull(C)));
    Kspace := Complement(V,Hspace);
    H := BasisMatrix(Hspace);
    K0 := BasisMatrix(Kspace);
    r := Nrows(K0);

    assert Nrows(H)+r eq Dimension(V);
    if r eq 0 then return H,K0; end if;

    // The complement is nondegenerate; normalize its Gram form.
    J := K0*HAdjoint(K0);
    assert Rank(J) eq r;
    D0,A0 := GramSchmidtPair(MatrixAlgebra(F,r) ! Eltseq(J));
    D := Matrix(F,r,r,Eltseq(D0));
    A := Matrix(F,r,r,Eltseq(A0));
    assert Rank(A) eq r and D eq A*J*HAdjoint(A);

    X := A*K0;
    K := ZeroMatrix(F,0,n);
    omega := F.1;
    i := 1;
    while i le r do
        if D[i,i] eq 1 then
            K := VerticalJoin(K,Matrix([X[i]]));
            i +:= 1;
        else
            // Convert [0,a; a^2,0] to I_2 in characteristic two.
            assert i lt r and D[i,i] eq 0 and D[i+1,i+1] eq 0;
            a := D[i,i+1];
            assert a ne 0 and D[i+1,i] eq a^2;
            u := X[i]+omega*a*X[i+1];
            v := X[i]+omega^2*a*X[i+1];
            K := VerticalJoin(K,Matrix([u,v]));
            i +:= 2;
        end if;
    end while;

    assert K*HAdjoint(K) eq IdentityMatrix(F,r);
    assert IsZero(H*HAdjoint(G));
    assert RowSpace(VerticalJoin(H,K)) eq V;
    return H,K;
end function;
