// Self-contained checks of the generic hull-increasing X4 module.
// Run in the folder containing HullIncreasing_X4.m.
load "HullIncreasing_X4.m";

// Example 1: C1 is LCD [8,2,3]_4, C2 = GF(4)^1.
G1 := Matrix(F,2,8,[
    1,1,1,1,1,0,0,0,
    0,0,0,0,0,1,1,1
]);
G2 := IdentityMatrix(F,1);
Gout,A1,W1,A2,W2 := HullIncreasingX4(G1,G2,1);

assert Ncols(Gout) eq 9;
assert Rank(Gout) eq 2;
assert Dimension(HermitianHull(LinearCode(Gout))) eq 1;
assert MinimumWeight(LinearCode(Gout)) ge 3;
print "PASS 1: [8,2,3] and [1,1,1] give length 9, dimension 2, hull 1.";

// Example 2: both ingredients have nontrivial Hermitian hull.
G1 := Matrix(F,3,5,[
    1,w,0,0,0,
    0,1,1,0,0,
    0,0,0,1,1
]);
G2 := Matrix(F,2,3,[
    1,0,0,
    0,1,1
]);
assert Dimension(HermitianHull(LinearCode(G1))) eq 1;
assert Dimension(HermitianHull(LinearCode(G2))) eq 1;

Gout,A1,W1,A2,W2 := HullIncreasingX4(G1,G2,1);
assert Ncols(Gout) eq 8;
assert Rank(Gout) eq 4;
assert Dimension(HermitianHull(LinearCode(Gout))) eq 3;
print "PASS 2: hull 1+1+1=3 and dimension 3+2-1=4.";
print "ALL HULL-INCREASING X4 TESTS PASSED";
