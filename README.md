# Construction X4 — Supplementary Data

This repository accompanies the manuscript on Hermitian-hull control and Construction X4. It contains explicit generator matrices for **148 direct constructions over GF(4)**, indexed by their result numbers in Tables 1 and 2. Readers can inspect the codes and verify the published parameters without reproducing the search process.

## Files and table numbers

| Manuscript | Result numbers | CSV | Magma |
| --- | --- | --- | --- |
| Table 1: direct Hermitian-hull constructions | 1–116 | [Table1_Matrix_Index.csv](Table1_Matrix_Index.csv) | [Table1_Generators.m](Table1_Generators.m) |
| Table 2: direct QC-X4 constructions | 117–148 | [Table2_Matrix_Index.csv](Table2_Matrix_Index.csv) | [Table2_Generators.m](Table2_Generators.m) |

**Table 1 CSV** has exactly three columns: **No, G_src, G_X4**. These give the original classical generator matrix and the X4 output generator matrix.

**Table 2 CSV** has exactly seven columns: **No, G_src1, G_src2, W1, W2, lambda, G_X4**. Here W1 and W2 are the ordered matching bases of dimension lambda.

All matrices are over GF(4) = GF(2)(w), where w² + w + 1 = 0. A CSV matrix is a list of its **actual rows**:

~~~text
[[a11,a12,...]; [a21,a22,...]; ...]
~~~

Commas separate entries and semicolons separate rows. There are no empty-set symbols or artificial separators inside the matrices.

The Magma files contain the same explicit matrices, retaining the **unreduced Construction X4 row order**. In Table 1 the generator is displayed as
```math
$$
G_{\mathrm{X4}}=\begin{pmatrix} A_1&0\\ W_1&I_\lambda\end{pmatrix}.
$$
```
In Table 2 the generator is displayed as
```math
$$
G_{\mathrm{X4}}=\begin{pmatrix} A_1&0\\0&A_2\\W_1&W_2\end{pmatrix}.
$$
```
The matched rows are paired by their order. No explicit matching map is needed to reconstruct these particular output codes.

## Reproduction with Magma

Use [Magma](https://magma.maths.usyd.edu.au/magma/) and run the following commands **from this directory**:

~~~sh
magma -b Table1_Generators.m
magma -b Table2_Generators.m
~~~

The files include assertions for the recorded generator matrices and the relevant algebraic construction properties. They can also be loaded interactively.

To inspect **Table 1, No. 1**:

~~~magma
load "Table1_Generators.m";
T := Table1Generators[1];
Gsrc := T[1];
GX4  := T[2];
~~~

To inspect **Table 2, No. 117**:

~~~magma
load "Table2_Generators.m";
T := Table2Generators[117];
G1     := T[1];
G2     := T[2];
W1     := T[3];
W2     := T[4];
lambda := T[5];
GX4    := T[6];
~~~

Use the desired table result number as the array index.

## QC coordinate order — important for Table 2

The Table 2 matrices are published in the **concatenated X4 coordinate order** because it makes the construction blocks visible. This is the code called $\mathcal S_0$ in the proof of the QC-X4 theorem.

All 32 examples have co-index 3. If the input lengths are $n_i=3\ell_i$, the concatenated order is

$$
(u_0,u_1,u_2,v_0,v_1,v_2),
\qquad u_t\in\mathrm{GF}(4)^{\ell_1},\quad
v_t\in\mathrm{GF}(4)^{\ell_2}.
$$

The manuscript's coordinate permutation is

$$
P:(u_0,u_1,u_2,v_0,v_1,v_2)
\longmapsto(u_0,v_0,u_1,v_1,u_2,v_2).
$$

**After this column permutation, the output code is an $(\ell_1+\ell_2)$-quasi-cyclic code in the standard coordinate convention.** The raw concatenated matrix need not itself be invariant under the ordinary $(\ell_1+\ell_2)$-step shift.

For example, after loading Table2_Generators.m, check No. 117:

~~~magma
T := Table2Generators[117];
G1 := T[1]; G2 := T[2]; GX4 := T[6];

ell1 := Ncols(G1) div 3;
ell2 := Ncols(G2) div 3;
n1 := Ncols(G1);

P := [];
for t in [0..2] do
    P := P cat [t*ell1+j : j in [1..ell1]];
    P := P cat [n1+t*ell2+j : j in [1..ell2]];
end for;

GQC := Submatrix(GX4,[1..Nrows(GX4)],P);
ell := ell1+ell2;
N := Ncols(GQC);

assert forall{v : v in Rows(GQC) |
    Vector(F,[v[(j-ell-1) mod N+1] : j in [1..N]])
        in RowSpace(GQC)};
~~~

The same permutation rule works for all 32 Table 2 cases. Coordinate permutations preserve dimension, Hermitian hull, Hamming distance and the associated quantum parameters.

## Parameter and distance checks

For a full-rank generator matrix G over GF(4), let $G^\dagger$ denote the conjugate transpose. Its Hermitian hull dimension is

$$
h=k-\mathrm{rank}(GG^\dagger),
$$

and the Hermitian EAQECC construction used in the manuscript gives

$$
[[N,\;k-h,\;d_Q;\;N-k-h]]_2,
\qquad
d_Q=\min\{\mathrm{wt}(x):x\in C\setminus C^{\perp_H}\},
\quad C=\mathrm{RowSpace}(G).
$$

Thus the classical and quantum **length, dimensions, and entanglement parameters** can be checked directly from the supplied matrices. To certify an **exact distance** $d_Q=D$, verify a lower bound $d(C)\ge D$ and exhibit a word of weight D in C outside the Hermitian hull. A distance lower-bound claim needs only the corresponding lower bound. Some minimum-distance computations can be expensive.

For **32 larger Table 1 cases**, the verified lower bound uses Magma's BestKnownLinearCode database: the original generator defines the same code as the corresponding database entry, whose minimum distance is at least the claimed D. Reproducing that route requires a compatible Magma code database. The CSV files determine the codes but are not, by themselves, exhaustive distance-proof certificates.

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

These routines select matching bases automatically. Consequently, they need not reproduce the **same minimum distances** as the particular published examples. For the exact 148 direct constructions in Tables 1 and 2, use the explicit matrices in the table-specific CSV/Magma data files above. The general routines do not implement the extra module-preserving choices needed to produce QC codes.

Propagation-derived results elsewhere in the manuscript are outside the scope of these direct-construction data files.

