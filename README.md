# Construction X4 — Supplementary Data

The files below contain the explicit matrices for the **200 direct constructions over GF(4)** in Tables 1–3 of the manuscript. Result numbers agree with the manuscript.

## Data files

| Manuscript | Result numbers | Records | CSV | Magma |
| --- | --- | ---: | --- | --- |
| Table 1: Corollary 3.6 | 1–68 | 68 | [Table1_Matrix_Index.csv](Table1_Matrix_Index.csv) | [Table1_Generators.m](Table1_Generators.m) |
| Table 2: Corollary 3.4 | 69–177 | 109 | [Table2_Matrix_Index.csv](Table2_Matrix_Index.csv) | [Table2_Generators.m](Table2_Generators.m) |
| Table 3: QC-X4 | 178–200 | 23 | [Table3_Matrix_Index.csv](Table3_Matrix_Index.csv) | [Table3_Generators.m](Table3_Generators.m) |

The three Magma files are self-contained and sufficient to reconstruct all listed codes. The CSV files contain the same matrices in a readable form.

All entries lie in GF(4) = GF(2)(w), where w² + w + 1 = 0. CSV matrices list their rows as

~~~text
[[a11,a12,...]; [a21,a22,...]; ...]
~~~

Commas separate entries; semicolons separate rows. A zero-row matrix is written as `[]`; its column count is specified in the Magma file.

## Matrix entries

**Table 1 CSV** has three columns: `No, G_src, G_X4`.

- `G_src` generates the input code.
- `G_X4` is the extension generator, with the final lambda columns equal to the block `[0; I_lambda]`. Its row space is the classical ingredient used for the EAQECC.

**Tables 2 and 3 CSVs** have seven columns: `No, G_src1, G_src2, W1, W2, lambda, G_X4`.

- `G_src1` and `G_src2` generate the two input codes.
- `W1` and `W2` are the ordered matched bases; corresponding rows are paired.
- `lambda` is the matched dimension, denoted k′ in Corollary 3.4.
- `G_X4` is the X4 output generator in the displayed block-row order.

For **Table 2**, the input generators are ordered as `[U1; W1]` and `[U2; W2]`: their last lambda rows are matched, and the preceding rows specify the unmatched subspaces. The output is

```math
G_{\mathrm{X4}}=
\begin{pmatrix}U_1&0\\0&U_2\\W_1&W_2\end{pmatrix}.
```

**The Table 2 EAQECC uses the Hermitian dual of this output code.** In Magma, the classical quantum ingredient is `HermitianDual(LinearCode(GX4))`. For **Tables 1 and 3**, it is `LinearCode(GX4)` directly.

## Use with Magma

Run from this directory:

~~~sh
magma -b Table1_Generators.m
magma -b Table2_Generators.m
magma -b Table3_Generators.m
~~~

The files check matrix ranks, hull dimensions and the recorded quantum length, dimension and entanglement. Table 2 also checks the matching conditions; Table 3 checks QC shift invariance after the coordinate permutation below. These checks do not recompute the minimum distances.

Each file defines an array indexed by the manuscript result number:

~~~text
Table1Generators[No] = <Gsrc, GX4>
Table2Generators[No] = <Gsrc1, Gsrc2, W1, W2, lambda, GX4>
Table3Generators[No] = <Gsrc1, Gsrc2, W1, W2, lambda, GX4>
~~~

`TableNParameters[No]` stores `[N,K,d,c]`, and `TableNDistanceTypes[No]` states whether d is `exact` or `lower_bound`. `Table2Parts[No]` gives `"a"` or `"b"` for Corollary 3.4.

For example, to reconstruct **Table 2, No. 69**:

~~~magma
load "Table2_Generators.m";
T := Table2Generators[69];
GX4 := T[6];
Q := HermitianDual(LinearCode(GX4));
parameters := Table2Parameters[69];
distance_type := Table2DistanceTypes[69];
~~~

## QC coordinate order — Table 3

All 23 examples have co-index 3. For input lengths n_i = 3 ell_i, the matrices use the concatenated order `(u0,u1,u2,v0,v1,v2)`, with each u block of length ell_1 and each v block of length ell_2. Apply

```math
(u_0,u_1,u_2,v_0,v_1,v_2)
\longmapsto (u_0,v_0,u_1,v_1,u_2,v_2)
```

to obtain the standard (ell_1 + ell_2)-QC coordinate order. The Table 3 Magma file performs and verifies this permutation.

## Construction routines (optional)

Four small Magma modules are included for constructing new examples over GF(4):

- [X4_core.m](X4_core.m) implements the block-matrix assembly `ConstructionX4(A1,W1,A2,W2)`, with matching rows placed side by side.
- [HermitianBasis_X4.m](HermitianBasis_X4.m) computes the Hermitian hull, a complementary subspace, and an orthonormal basis using Magma's built-in linear-algebra routines.
- [HullIncreasing_X4.m](HullIncreasing_X4.m) implements `HullIncreasingX4(G1,G2,lambda)` by matching orthonormal directions from both ingredients. It produces output hull dimension $h_1+h_2+\lambda$.
- [HullDecreasing_X4.m](HullDecreasing_X4.m) implements `HullDecreasingX4(G1,G2,lambda)` by matching directions from the first ingredient's hull with orthonormal directions from the second. It produces output hull dimension $h_1+h_2-\lambda$.

Run the following examples from this directory. The increasing/decreasing files automatically load their two dependencies.

**Increasing the hull:**

~~~magma
load "HullIncreasing_X4.m";
G1 := IdentityMatrix(F,2);
G2 := IdentityMatrix(F,1);
GX4,A1,W1,A2,W2 := HullIncreasingX4(G1,G2,1);
assert Dimension(HermitianHull(LinearCode(GX4))) eq 1;
~~~

**Decreasing the hull:**

~~~magma
load "HullDecreasing_X4.m";
G1 := Matrix(F,2,5,[1,1,0,0,0, 0,0,1,1,1]);
G2 := IdentityMatrix(F,1);
GX4,A1,W1,A2,W2 := HullDecreasingX4(G1,G2,1);
assert Dimension(HermitianHull(LinearCode(GX4))) eq 0;
~~~

These routines select matching bases automatically. Consequently, they need not reproduce the **same minimum distances** as the particular published examples. For the 200 direct constructions in Tables 1, 2 and 3, use the explicit matrices in the table-specific CSV/Magma data files above. The general routines do not implement the extra module-preserving choices needed to produce QC codes.

Propagation-derived results elsewhere in the manuscript are outside the scope of these direct-construction data files.

