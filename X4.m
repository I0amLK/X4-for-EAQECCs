// Construction X4 over GF(4).
// Read in order: HermitianOrthogonalize -> HullX4Blocks -> ConstructionX4 -> HullSource.
// Existing data files keep their Gin, U, witnesses, and HullSource calls unchanged.
// In characteristic 2, beta=1: matched forms cancel by I_g + I_g = 0.
F<w> := GF(4);

function Dag(M)
    return Transpose(Matrix(BaseRing(M),Nrows(M),Ncols(M),[x^2:x in Eltseq(M)]));
end function;

// Split G after row s: G = VerticalJoin(Top,Bottom).
// Also works for s=0 or s=Nrows(G).
function SplitRows(G,s)
    r := Nrows(G);
    n := Ncols(G);
    F := BaseRing(G);
    assert s ge 0 and s le r;

    if s eq 0 then
        Top := ZeroMatrix(F,0,n);
    else
        Top := RowSubmatrix(G,1,s);
    end if;
    if s eq r then
        Bottom := ZeroMatrix(F,0,n);
    else
        Bottom := RowSubmatrix(G,s+1,r-s);
    end if;
    assert VerticalJoin(Top,Bottom) eq G;
    return Top,Bottom;
end function;

// 1. Hull and complement come directly from Magma.
//    H = HermitianHull(C), K0 = Complement(C,H).
// Since H is the radical of the Hermitian form on C, every complement
// K0 is automatically orthogonal to H and nondegenerate.
// Only normalize a basis of K0, to obtain K*K^dagger = I.
function HermitianOrthogonalize(G)
    F := BaseRing(G);
    n := Ncols(G);
    assert #F eq 4;

    Cspace := RowSpace(G);
    if Dimension(Cspace) eq 0 then
        Z := ZeroMatrix(F,0,n);
        return Z,Z;
    end if;

    C := LinearCode(G);
    Hspace := RowSpace(GeneratorMatrix(HermitianHull(C)));
    assert Hspace subset Cspace;
    Kspace := Complement(Cspace,Hspace);

    H := BasisMatrix(Hspace);
    K0 := BasisMatrix(Kspace);
    r := Nrows(K0);
    assert Nrows(H)+r eq Dimension(Cspace);
    if r eq 0 then return H,K0; end if;

    // Only the nondegenerate complement requires Gram normalization.
    J := K0*Dag(K0);
    assert Rank(J) eq r;
    R := MatrixAlgebra(F,r);
    D0,A0 := GramSchmidtPair(R ! Eltseq(J));
    D := Matrix(F,r,r,Eltseq(D0));
    A := Matrix(F,r,r,Eltseq(A0));
    assert Rank(A) eq r and D eq A*J*Dag(A);

    X := A*K0;
    K := ZeroMatrix(F,0,n);
    omega := F.1;
    i := 1;
    while i le r do
        if D[i,i] ne 0 then
            assert D[i,i] eq F!1;
            K := VerticalJoin(K,Matrix([X[i]]));
            i +:= 1;
        else
            // Nondegenerate zero-diagonal Hermitian pair [0,a;a^2,0].
            assert i lt r and D[i,i+1] ne 0;
            a := D[i,i+1];
            assert D[i+1,i+1] eq 0 and D[i+1,i] eq a^2;
            e := X[i] + omega*a*X[i+1];
            f := X[i] + omega^2*a*X[i+1];
            K := VerticalJoin(K,Matrix([e,f]));
            i +:= 2;
        end if;
    end while;

    assert K*Dag(K) eq IdentityMatrix(F,r);
    assert IsZero(H*Dag(G));
    assert RowSpace(VerticalJoin(H,K)) eq Cspace;
    return H,K;
end function;


// Preserve the original interface used by HullX4Blocks and HullExtension.
function HermitianSplit(G)
    return HermitianOrthogonalize(G);
end function;


// 2. Construction X4 itself. Rows W1[j] and W2[j] are matched.
// Input: C_i=<A_i> direct-sum <W_i>. Output generator:
//                       [ A1   0  ]
//                       [  0  A2  ]
//                       [ W1  W2  ]
// Hermitian matching conditions are checked by the caller, not assumed here.
function ConstructionX4(G1,G2,A1,A2,W1,W2)
    F := BaseRing(G1); n1 := Ncols(G1); n2 := Ncols(G2); g := Nrows(W1);
    assert BaseRing(G2) eq F and Nrows(W2) eq g;
    assert Rank(VerticalJoin(A1,W1)) eq Nrows(A1)+g;
    assert Rank(VerticalJoin(A2,W2)) eq Nrows(A2)+g;
    assert RowSpace(VerticalJoin(A1,W1)) eq RowSpace(G1);
    assert RowSpace(VerticalJoin(A2,W2)) eq RowSpace(G2);
    Top := HorizontalJoin(A1,ZeroMatrix(F,Nrows(A1),n2));
    Middle := HorizontalJoin(ZeroMatrix(F,Nrows(A2),n1),A2);
    Bottom := HorizontalJoin(W1,W2);
    Gout := VerticalJoin(VerticalJoin(Top,Middle),Bottom);
    assert Rank(Gout) eq Nrows(A1)+Nrows(A2)+g;
    return Gout;
end function;

function X4Phi(W1,W2)
    Domain := RowSpace(W1); Codomain := RowSpace(W2);
    assert Rank(W1) eq Nrows(W1) and Rank(W2) eq Nrows(W2);
    assert Nrows(W1) eq Nrows(W2);
    phi := hom<Domain -> Codomain | [Solution(W1,u)*W2:u in Basis(Domain)]>;
    assert forall{j:j in [1..Nrows(W1)] | phi(W1[j]) eq W2[j]};
    return phi;
end function;

// 3. Read the recorded matching choice U, then produce the theorem's blocks.
// A message a selects auxiliary coordinates a*U. Thus ker(U) specifies the
// retained subcode, and matched messages P satisfy P*U=I_g.
// U fixes the published example: replacing it arbitrarily can change distance.
function HullX4Blocks(G,U,s)
    F := BaseRing(G); k := Nrows(G); g := Ncols(U); M := G*Dag(G);
    h := k-Rank(M);
    assert #F eq 4 and Rank(G) eq k and BaseRing(U) eq F;
    assert Nrows(U) eq k and Rank(U) eq g and 0 le s and s le k;
    assert g gt 0 and g eq Abs(s-h);
    B := BasisMatrix(Nullspace(U)); // Magma uses the LEFT kernel: B*U=0.
    Htop,Ktop := HermitianSplit(B*G);
    if s gt h then
        // Increase: match g nondegenerate directions with the full-space code.
        P := Matrix([Solution(M,r):r in Rows(Dag(U))]); // P*M=U^dagger.
        W1 := P*G;
        assert W1*Dag(W1) eq IdentityMatrix(F,g);
        assert Nrows(Htop) eq h and Nrows(Ktop) eq k-s;
    else
        // Decrease: match g directions from the original hull.
        Hcoef := BasisMatrix(Nullspace(M));
        L := Matrix([Solution(Hcoef*U,e):e in Rows(IdentityMatrix(F,g))]);
        P := L*Hcoef; W1 := P*G;
        assert IsZero(W1*Dag(G));
        assert Nrows(Htop) eq s and Nrows(Ktop) eq k-h;
    end if;
    assert P*U eq IdentityMatrix(F,g);
    assert IsZero(VerticalJoin(Htop,Ktop)*Dag(W1));
    return Htop,Ktop,W1;
end function;

// Optional: construct from G and target s alone (not the recorded choices).
// This implements the corollary, but need not reproduce a published distance.
function HullExtension(G,s)
    F := BaseRing(G); k := Nrows(G);
    assert #F eq 4 and Rank(G) eq k and 0 le s and s le k;
    H,K := HermitianSplit(G); h := Nrows(H); g := Abs(s-h);
    if g eq 0 then return G; end if;
    if s gt h then
        A1 := VerticalJoin(H,RowSubmatrix(K,k-h-g));
        W1 := RowSubmatrix(K,k-h-g+1,g);
    else
        A1 := VerticalJoin(RowSubmatrix(H,h-g),K);
        W1 := RowSubmatrix(H,h-g+1,g);
    end if;
    W2 := IdentityMatrix(F,g); A2 := ZeroMatrix(F,0,g);
    Gout := ConstructionX4(G,W2,A1,A2,W1,W2);
    assert k-Rank(Gout*Dag(Gout)) eq s;
    return Gout;
end function;

// 4. Data-record formats. Existing names are retained for the data files.
SourceFormat := recformat<Id,Direction,IngredientName,Ingredient,IngredientGenerator,
    IngredientParameters,Ingredient2,Ingredient2Generator,Ingredient2Parameters,
    AdaptedGenerator,GraphColumns,AppendedBlock,Kernel1,Kernel2,MatchedBasis1,
    MatchedBasis2,Phi,Lambda,X4Code,OutputCode,OutputGenerator,OutputParameters,
    OutputHull,DistanceType,Witness,Preprocessing,PaperRows,HullTop,NondegenerateTop>;
QCFormat := recformat<Id,Ingredients,IngredientLabels,IngredientParameters,
    PolynomialGenerators,ShiftLength,Lambda,MatchedDomain,MatchedCodomain,Phi,
    DomainGenerator,ImageGenerator,DomainPolynomials,ImagePolynomials,Unpaired1,
    Unpaired2,Output,OutputParameters,OutputHull,OutputGenerator,Witness,
    DistanceType,PaperRows>;

function HullSource(Id,Name,G,U,InputD,s,OutputD,DistanceType,Witness)
    F := BaseRing(G); k := Nrows(G); n := Ncols(G); g := Ncols(U);
    h := k-Rank(G*Dag(G));

    // Decompose the first ingredient, and display the second ingredient F^g.
    Htop,Ktop,W1 := HullX4Blocks(G,U,s);
    A1 := VerticalJoin(Htop,Ktop);
    A2 := ZeroMatrix(F,0,g); W2 := IdentityMatrix(F,g);
    Gstar := VerticalJoin(A1,W1);

    // This is the construction, not a test of a preassembled (G|U).
    Gout := ConstructionX4(G,W2,A1,A2,W1,W2);

    // Explain the hull change through the matched Gram block.
    MatchedGram := W1*Dag(W1)+W2*Dag(W2);
    assert MatchedGram eq (s gt h select ZeroMatrix(F,g,g) else W2);
    ExpectedGram := DiagonalJoin(ZeroMatrix(F,Nrows(Htop),Nrows(Htop)),
                                 IdentityMatrix(F,Nrows(Ktop)));
    assert Gout*Dag(Gout) eq DiagonalJoin(ExpectedGram,MatchedGram);
    assert k-Rank(Gout*Dag(Gout)) eq s;
    E := VerticalJoin(ZeroMatrix(F,k-g,g),W2);
    assert Gout eq HorizontalJoin(Gstar,E);
    // Only now compare with the old coordinate record, to preserve the example.
    assert RowSpace(Gout) eq RowSpace(HorizontalJoin(G,U));

    // InputD is certified by the calling data block, before HullSource is used.
    // Puncturing the auxiliary block recovers <G>. Exact quantum distance also
    // needs the supplied word outside the hull; the rank checks alone do not.
    assert DistanceType in {"exact","lower_bound"} and OutputD ge InputD;
    C := LinearCode(Gout); H := C meet HermitianDual(C);
    if OutputD gt InputD then assert MinimumWeight(C) ge OutputD; end if;
    if DistanceType eq "exact" then
        assert Witness in C and not Witness in H and Weight(Witness) eq OutputD;
    end if;
    data := rec<SourceFormat | Id:=Id,
        Direction:=(s gt h select "increasing" else "decreasing"),
        IngredientName:=Name,Ingredient:=LinearCode(G),IngredientGenerator:=G,
        IngredientParameters:=[n,k,InputD,h],Ingredient2:=LinearCode(W2),
        Ingredient2Generator:=W2,Ingredient2Parameters:=[g,g,1,0],
        AdaptedGenerator:=Gstar,GraphColumns:=U,AppendedBlock:=E,
        HullTop:=Htop,NondegenerateTop:=Ktop,Kernel1:=A1,Kernel2:=A2,
        MatchedBasis1:=W1,MatchedBasis2:=W2,Phi:=X4Phi(W1,W2),Lambda:=g,
        X4Code:=C,OutputCode:=C,OutputGenerator:=Gout,
        OutputParameters:=[n+g,k-s,OutputD,n+g-k-s],OutputHull:=s,
        DistanceType:=DistanceType>;
    if DistanceType eq "exact" then data`Witness := Witness; end if;
    return data;
end function;

// 5. Coordinate helpers used by the unchanged input-data and QC-X4 files.
function SelectColumns(M,J)
    return Submatrix(M,[1..Nrows(M)],J);
end function;

// Interleaved coefficient order: coefficient i, then polynomial block j.
function QCMatrix(Generators,m)
    ell := #Generators[1]; rr := [];
    for row in Generators do
        for t in [0..m-1] do
            Append(~rr,&cat[[Coefficient(row[j],(i-t) mod m):j in [1..ell]]
                            :i in [0..m-1]]);
        end for;
    end for;
    return Matrix(F,#rr,ell*m,&cat rr);
end function;

function QCShift(v,ell)
    n := #Eltseq(v);
    return Vector(F,[v[(i-ell-1) mod n+1]:i in [1..n]]);
end function;

X4Sources := AssociativeArray(); QCExamples := AssociativeArray();
PaperSourceIds := AssociativeArray(); InputDistanceCache := AssociativeArray();
X4Loaded := true;
