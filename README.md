# Construction X4 — Supplementary Data

The files below contain the explicit matrices for the **274 direct constructions over GF(4)** in the manuscript. Result numbers agree with the manuscript.

## Data files

| Manuscript | Result numbers | Records | CSV | Magma |
| --- | --- | ---: | --- | --- |
| Table 1: Corollary 3.6 | 1–67 | 67 | [Table1_Matrix_Index.csv](Table1_Matrix_Index.csv) | [Table1_Generators.m](Table1_Generators.m) |
| Table 2: Corollary 3.4 | 68–222 | 155 | [Table2_Matrix_Index.csv](Table2_Matrix_Index.csv) | [Table2_Generators.m](Table2_Generators.m) |
| Table 3: QC-X4 | 223–274 | 52 | [Table3_Matrix_Index.csv](Table3_Matrix_Index.csv) | [Table3_Generators.m](Table3_Generators.m) |

The three Magma files are self-contained and reconstruct all listed codes. The CSV files contain the same matrices in a readable form. The optional construction routines below are also retained.

All entries lie in $GF(4) = GF(2)(w)$, where $w^2+w+1=0$. CSV matrices list their rows as

~~~text
[[a11,a12,...]; [a21,a22,...]; ...]
~~~

Commas separate entries; semicolons separate rows. A zero-row matrix is written as `[]`; its column count is specified in the Magma file.

## Matrix entries

**Table 1 CSV** has three columns: `No, G_src, G_X4`. The first matrix generates the input code. The second is the extension generator, with final columns `[0; I_lambda]`.

**Table 2 CSV** has seven columns: `No, G_src1, G_src2, W1, W2, lambda, G_X4`.

- `G_src1` and `G_src2` are ordered as `[U1; W1]` and `[U2; W2]`.
- The last `lambda` rows are the matched bases; their rows are paired in order.
- The preceding rows specify the two unmatched subspaces.
- `G_X4` is the block matrix `[U1,0; 0,U2; W1,W2]`.

Both input codes in Tables 2 and 3 are proper subspaces of their ambient spaces. An input may be entirely matched. Results with the same parameters are listed once, with priority given to Table 3. Table 2 has 24 part-(a) and 131 part-(b) constructions.

**Table 3 CSV** has the same seven columns as Table 2 and records the QC-X4 inputs and matching bases. All Table 3 constructions use m = 3. Interleaving the three blocks gives a QC generator with shift size (N1 + N2)/3.

**The Table 2 EAQECC uses `HermitianDual(LinearCode(GX4))`.** Tables 1 and 3 use `LinearCode(GX4)` directly.

## Use with Magma

Run from this directory:

~~~sh
magma -b Table1_Generators.m
magma -b Table2_Generators.m
magma -b Table3_Generators.m
~~~

The files check matrix ranks, hull dimensions, matching conditions and the recorded quantum length, dimension and entanglement. These checks do not recompute minimum distances.

The arrays are indexed by the manuscript result number:

~~~text
Table1Generators[No] = <Gsrc, GX4>
Table2Generators[No] = <Gsrc1, Gsrc2, W1, W2, lambda, GX4>
Table3Generators[No] = <Gsrc1, Gsrc2, W1, W2, lambda, GX4>
~~~

`TableNParameters[No]` stores `[N,K,d,c]`. `TableNDistanceTypes[No]` states whether d is `exact` or `lower_bound`. `Table2Parts[No]` gives `"a"` or `"b"`.

For example, to reconstruct Table 2, No. 68:

~~~magma
load "Table2_Generators.m";
T := Table2Generators[68];
Q := HermitianDual(LinearCode(T[6]));
parameters := Table2Parameters[68];
~~~

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
