// Run from github_upload/X4-for-EAQECCs:
//     magma -b test_HullDecreasing_X4.m
load "HullDecreasing_X4.m";

// Example 1: C1 has hull dimension 1 and C2 is [1,1,1]_4.
// lambda = 1 produces a [6,2,3]_4 code with hull dimension 0.
G1 := Matrix(F,2,5,[
    1,1,0,0,0,
    0,0,1,1,1
]);
G2 := IdentityMatrix(F,1);
assert Dimension(HermitianHull(LinearCode(G1))) eq 1;
GX4,A1,W1,A2,W2 := HullDecreasingX4(G1,G2,1);
assert Ncols(GX4) eq 6;
assert Rank(GX4) eq 2;
assert Dimension(HermitianHull(LinearCode(GX4))) eq 0;
assert MinimumWeight(LinearCode(GX4)) eq 3;
print "PASS 1: length 6, dimension 2, distance 3, hull 0.";

// Example 2: nonzero hulls on both sides, lambda = 1.
G1 := Matrix(F,3,7,[
    1,1,0,0,0,0,0,
    0,0,1,1,0,0,0,
    0,0,0,0,1,1,1
]);
G2 := Matrix(F,3,5,[
    1,1,0,0,0,
    0,0,1,0,0,
    0,0,0,1,0
]);
assert Dimension(HermitianHull(LinearCode(G1))) eq 2;
assert Dimension(HermitianHull(LinearCode(G2))) eq 1;
GX4,A1,W1,A2,W2 := HullDecreasingX4(G1,G2,1);
assert Ncols(GX4) eq 12;
assert Rank(GX4) eq 5;
assert Dimension(HermitianHull(LinearCode(GX4))) eq 2;
print "PASS 2: h_out = 2+1-1 = 2.";

// Example 3: boundary lambda = min(h1, k2-h2) = 2.
GX4,A1,W1,A2,W2 := HullDecreasingX4(G1,G2,2);
assert Ncols(GX4) eq 12;
assert Rank(GX4) eq 4;
assert Dimension(HermitianHull(LinearCode(GX4))) eq 1;
print "PASS 3: h_out = 2+1-2 = 1.";
print "ALL HULL-DECREASING X4 TESTS PASSED";
