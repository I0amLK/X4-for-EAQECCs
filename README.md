# Construction X4 — Supplementary Data

This repository accompanies the manuscript on Hermitian-hull control and Construction X4. It contains explicit matrices for **226 direct constructions over GF(4)**, indexed by their current manuscript result numbers in Tables 1–3.

## Files and table numbers

| Manuscript | Result numbers | Records | CSV | Magma |
| --- | --- | ---: | --- | --- |
| Table 1: Corollary 3.6, arbitrary-hull constructions | 1–68 | 68 | [Table1_Matrix_Index.csv](Table1_Matrix_Index.csv) | [Table1_Generators.m](Table1_Generators.m) |
| Table 2: Corollary 3.4, two-ingredient dual constructions | 69–194 | 126 | [Table2_Matrix_Index.csv](Table2_Matrix_Index.csv) | [Table2_Generators.m](Table2_Generators.m) |
| Table 3: direct QC-X4 constructions | 195–226 | 32 | [Table3_Matrix_Index.csv](Table3_Matrix_Index.csv) | [Table3_Generators.m](Table3_Generators.m) |

Table 2 contains 58 part-(a) and 68 part-(b) constructions. The 48 parameter sets also obtained in the previous Table 1 are recorded in Table 2 only. [Table_Migration.csv](Table_Migration.csv) gives their previous and current numbers. All current tables use the manuscript's updated numbering.

**Table 1 CSV** has exactly three columns: **No, G_src, G_X4**.

**Tables 2 and 3 CSVs** each have exactly seven columns: **No, G_src1, G_src2, W1, W2, lambda, G_X4**. Here W1 and W2 are the ordered matching bases, and lambda is their common dimension. For Table 2, lambda is the matched dimension k′ in Corollary 3.4.

All matrices are over GF(4) = GF(2)(w), where w² + w + 1 = 0. A CSV matrix lists its actual rows:

~~~text
[[a11,a12,...]; [a21,a22,...]; ...]
~~~

Commas separate entries and semicolons separate rows. An empty row list `[]` denotes a matrix with zero rows; its number of columns is determined by the ingredient length. The Magma file specifies this shape explicitly.

## Matrix conventions

For **Table 1**, G_src generates the original ingredient and G_X4 is the unreduced extension generator

```math
G_{\mathrm{X4}}=\begin{pmatrix} A_1&0\\ W_1&I_\lambda\end{pmatrix}.
```

The final lambda columns are the displayed unit block. The quantum construction uses the row space of G_X4 directly.

For **Table 2**, the input generators are in proof-adapted row order:

```math
G_{\mathrm{src},1}=\begin{pmatrix}U_1\\W_1\end{pmatrix},\qquad
G_{\mathrm{src},2}=\begin{pmatrix}U_2\\W_2\end{pmatrix}.
```

Thus the last lambda rows are the matched basis. The preceding rows specify the unmatched subspace, including the required choice of complement in part (b). This row order preserves the full construction in the seven-column format.

The recorded X4 output is

```math
G_{\mathrm{X4}}=\begin{pmatrix}U_1&0\\0&U_2\\W_1&W_2\end{pmatrix}.
```

**In Table 2, G_X4 generates the check space C. The classical code used for the quantum construction is its Hermitian dual.** In Magma, use `HermitianDual(LinearCode(GX4))`. Consequently, if C has dimension r and hull dimension h, the quantum parameters are

```math
[[N,\;N-r-h,\;d(C^{\perp_H}\setminus C);\;r-h]]_2.
```

The branch, ingredient hulls, quantum parameters, distance type and individual certificate are listed in [Corollary34_Parameters.csv](Corollary34_Parameters.csv).

For **Table 3**, G_src1 and G_src2 are the two QC ingredient generators. G_X4 is the unreduced concatenated output

```math
G_{\mathrm{X4}}=\begin{pmatrix}A_1&0\\0&A_2\\W_1&W_2\end{pmatrix}.
```

The quantum construction uses this output row space directly. In both Tables 2 and 3, matched rows are paired by their order.

## Reproduction with Magma

Run these commands from this directory:

~~~sh
magma -b Table1_Generators.m
magma -b Table2_Generators.m
magma -b Table3_Generators.m
~~~

Each file includes assertions for the matrices and the recorded quantum length, dimension and entanglement. Table 2 also checks the two ingredient hulls, branch-specific Gram conditions, block assembly and dual output. Table 3 checks the QC coordinate permutation and shift invariance.

The files can also be loaded interactively. To inspect **Table 1, No. 1**:

~~~magma
load "Table1_Generators.m";
T := Table1Generators[1];
Gsrc := T[1];
GX4  := T[2];
~~~

To inspect **Table 2, No. 69**:

~~~magma
load "Table2_Generators.m";
T := Table2Generators[69];
G1 := T[1]; G2 := T[2];
W1 := T[3]; W2 := T[4];
lambda := T[5]; GX4 := T[6];
Q := HermitianDual(LinearCode(GX4));
part := Table2Parts[69];
parameters := Table2Parameters[69];
distance_type := Table2DistanceTypes[69];
~~~

To inspect **Table 3, No. 195**, load `Table3_Generators.m` and use `Table3Generators[195]`. Its six tuple entries have the same order as Table 2; the classical quantum ingredient is `LinearCode(T[6])`.

The auxiliary arrays `TableNParameters[No]` and `TableNDistanceTypes[No]` record `[N,K,d,c]` and whether the displayed distance is `exact` or `lower_bound`. The input/output matrix tuples retain the previous compact interface.

## QC coordinate order — Table 3

All 32 QC examples have co-index 3. For input lengths n_i = 3 ell_i, the published concatenated coordinate order is

```math
(u_0,u_1,u_2,v_0,v_1,v_2),\qquad
u_t\in\mathrm{GF}(4)^{\ell_1},\quad v_t\in\mathrm{GF}(4)^{\ell_2}.
```

Apply the manuscript's column permutation

```math
(u_0,u_1,u_2,v_0,v_1,v_2)\longmapsto(u_0,v_0,u_1,v_1,u_2,v_2)
```

to obtain the standard (ell_1 + ell_2)-QC coordinate order. This permutation preserves the code parameters. The Table 3 Magma file performs and verifies it for every example.

## Parameter and distance checks

For a full-rank generator G of a classical quantum ingredient S, let k = rank(G) and h = k − rank(GG†). The Hermitian construction gives

```math
[[N,\;k-h,\;d_Q;\;N-k-h]]_2,\qquad
d_Q=\min\{\mathrm{wt}(x):x\in S\setminus S^{\perp_H}\}.
```

For Tables 1 and 3, S is generated by G_X4. For Table 2, S is the Hermitian dual of the space generated by G_X4.

Matrix assertions verify the dimensions and construction conditions. Exact-distance proofs additionally require a lower bound and a non-hull word attaining it. Table 2 has **119 exact distances and 7 lower bounds**. Its 126 individual Magma files are in [certificates/](certificates/). Run a file with `magma -b certificates/<id>.m`; the parameter CSV maps manuscript numbers to certificate names.

For 47 Table 2 entries, the certificate verifies equality with a previously verified arbitrary-hull output space and transfers its distance statement. Other retained Table 2 constructions include independent distance lower-bound checks and a word attaining the stated exact distance. Some ingredient lower bounds use Magma's BestKnownLinearCode database and require that database to reproduce the proof.

The table-specific generator files provide algebraic checks; they do not repeat every minimum-distance computation. Benchmark improvements use the archived CodeTables snapshot and the printed literature records under the manuscript's fixed-three-parameter comparison.

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

These routines select matching bases automatically. Consequently, they need not reproduce the **same minimum distances** as the particular published examples. For the 226 direct constructions in Tables 1, 2 and 3, use the explicit matrices in the table-specific CSV/Magma data files above. The general routines do not implement the extra module-preserving choices needed to produce QC codes.

Propagation-derived results elsewhere in the manuscript are outside the scope of these direct-construction data files.

