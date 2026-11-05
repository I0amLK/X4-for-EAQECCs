// Increasing the Hermitian hull by Construction X4.
// First run: load "X4.m";
// Each example records both ingredients and the direct X4 output.
// U selects the graph map. HullSource first changes Gin to Gstar,
// then appends the proof's unit block E=(0;I_lambda).
assert assigned X4Loaded;
HullIncreasingExamples:=AssociativeArray();

// H01: ingredient Q14.
Gin:=Matrix(F,8,18,[
1,0,0,0,0,0,0,w,w^2,0,w^2,w,1,1,w^2,0,w,w^2,
0,1,0,0,0,0,0,1,0,0,1,1,w,1,0,0,w,w^2,
0,0,1,0,0,0,0,0,1,0,w^2,w,w,1,w,w^2,w^2,1,
0,0,0,1,0,0,0,w,w^2,0,w,0,w,w,w^2,w^2,0,1,
0,0,0,0,1,0,0,1,0,0,w^2,w,w,0,1,w,w^2,w^2,
0,0,0,0,0,1,0,0,1,0,w^2,0,1,1,w^2,w,1,0,
0,0,0,0,0,0,1,w,w^2,0,w^2,1,1,0,w,w^2,0,w,
0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1]);
U:=Matrix(F,8,1,[
1,
0,
0,
w^2,
0,
w,
w^2,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"Q14_18_8") then
assert MinimumWeight(Cin) ge 8;
InputDistanceCache["Q14_18_8"]:=Cin;
else assert Cin eq InputDistanceCache["Q14_18_8"];end if;
S:=HullSource("H01","Q14",Gin,U,8,2,8,"exact",Vector(F,[0,0,0,0,1,0,0,1,0,w,1,0,0,w,w^2,0,1,1,0]));
S`PaperRows:=[1];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="H01";
end for;
HullIncreasingExamples["H01"]:=S;X4Sources["H01"]:=S;
print "VERIFIED SOURCE H01";

// H06: ingredient Q18.
Gin:=Matrix(F,10,24,[
1,0,0,0,0,0,0,0,0,w^2,1,w^2,0,1,w^2,1,w^2,0,0,w^2,w,w^2,0,w,
0,1,0,0,0,0,0,0,0,w,0,w^2,0,1,1,w,1,1,w,0,0,w,1,w^2,
0,0,1,0,0,0,0,0,0,w,1,w,0,0,0,1,w^2,w,w,w^2,w,1,1,w^2,
0,0,0,1,0,0,0,0,0,1,0,0,0,1,w,1,w^2,0,1,0,w^2,0,w,1,
0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,w^2,0,w,1,0,1,w,1,w^2,
0,0,0,0,0,1,0,0,0,0,0,1,0,w^2,w,w^2,0,w^2,1,w,w^2,w,1,w,
0,0,0,0,0,0,1,0,0,w^2,1,w^2,0,w^2,w,1,w,w,1,0,w,w,0,1,
0,0,0,0,0,0,0,1,0,w,0,w^2,0,w,0,0,w,w^2,w^2,w,0,1,w^2,0,
0,0,0,0,0,0,0,0,1,w,1,w,0,w^2,0,w^2,w,w,w^2,1,w^2,w,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1]);
U:=Matrix(F,10,1,[
1,
w,
0,
0,
w,
1,
w,
w^2,
w,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"Q18_24_10") then
assert MinimumWeight(Cin) ge 10;
InputDistanceCache["Q18_24_10"]:=Cin;
else assert Cin eq InputDistanceCache["Q18_24_10"];end if;
S:=HullSource("H06","Q18",Gin,U,10,4,10,"exact",Vector(F,[0,0,0,0,0,1,0,w,0,w^2,0,0,0,0,w,w^2,w^2,w,0,1,w^2,0,0,w,0]));
S`PaperRows:=[6,152];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="H06";
end for;
HullIncreasingExamples["H06"]:=S;X4Sources["H06"]:=S;
print "VERIFIED SOURCE H06";

// H07: ingredient Q11.
Gin:=Matrix(F,10,24,[
1,0,0,0,0,0,0,0,0,w^2,w^2,1,0,1,0,1,1,w,0,1,w^2,0,0,0,
0,1,0,0,0,0,0,0,0,w^2,0,w,0,1,1,1,0,w^2,w,1,w,w^2,0,0,
0,0,1,0,0,0,0,0,0,1,w,w,0,w,1,w^2,w^2,w^2,w^2,0,0,w,w^2,0,
0,0,0,1,0,0,0,0,0,1,0,0,0,w,w,w^2,1,0,w^2,1,1,0,w,w^2,
0,0,0,0,1,0,0,0,0,0,1,0,0,w^2,1,1,0,w,w^2,0,w,w,w^2,1,
0,0,0,0,0,1,0,0,0,0,0,1,0,1,w,0,0,1,w^2,w,1,w^2,w^2,w,
0,0,0,0,0,0,1,0,0,w^2,w^2,1,0,w^2,w^2,1,w^2,0,w^2,0,w^2,w^2,1,1,
0,0,0,0,0,0,0,1,0,w^2,0,w,0,0,w,w^2,1,0,1,w^2,w,w,w,0,
0,0,0,0,0,0,0,0,1,1,w,w,0,w,0,0,1,w,0,w^2,w,w,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1]);
U:=Matrix(F,10,1,[
1,
w,
w,
0,
0,
1,
1,
1,
w,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"Q11_24_10") then
assert MinimumWeight(Cin) ge 10;
InputDistanceCache["Q11_24_10"]:=Cin;
else assert Cin eq InputDistanceCache["Q11_24_10"];end if;
S:=HullSource("H07","Q11",Gin,U,10,3,10,"exact",Vector(F,[0,0,0,0,0,1,0,0,w^2,w^2,1,0,0,0,w,0,w^2,0,w^2,0,0,w,w,w^2,0]));
S`PaperRows:=[7];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="H07";
end for;
HullIncreasingExamples["H07"]:=S;X4Sources["H07"]:=S;
print "VERIFIED SOURCE H07";

// H10: ingredient Q18.
Gin:=Matrix(F,10,24,[
1,0,0,0,0,0,0,0,0,w^2,1,w^2,0,1,w^2,1,w^2,0,0,w^2,w,w^2,0,w,
0,1,0,0,0,0,0,0,0,w,0,w^2,0,1,1,w,1,1,w,0,0,w,1,w^2,
0,0,1,0,0,0,0,0,0,w,1,w,0,0,0,1,w^2,w,w,w^2,w,1,1,w^2,
0,0,0,1,0,0,0,0,0,1,0,0,0,1,w,1,w^2,0,1,0,w^2,0,w,1,
0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,w^2,0,w,1,0,1,w,1,w^2,
0,0,0,0,0,1,0,0,0,0,0,1,0,w^2,w,w^2,0,w^2,1,w,w^2,w,1,w,
0,0,0,0,0,0,1,0,0,w^2,1,w^2,0,w^2,w,1,w,w,1,0,w,w,0,1,
0,0,0,0,0,0,0,1,0,w,0,w^2,0,w,0,0,w,w^2,w^2,w,0,1,w^2,0,
0,0,0,0,0,0,0,0,1,w,1,w,0,w^2,0,w^2,w,w,w^2,1,w^2,w,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1]);
U:=Matrix(F,10,2,[
1,0,
w^2,w,
1,0,
w,1,
1,0,
0,1,
0,w,
1,1,
w,w,
0,0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"Q18_24_10") then
assert MinimumWeight(Cin) ge 10;
InputDistanceCache["Q18_24_10"]:=Cin;
else assert Cin eq InputDistanceCache["Q18_24_10"];end if;
S:=HullSource("H10","Q18",Gin,U,10,5,10,"lower_bound",Vector(F,[]));
S`PaperRows:=[9];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="H10";
end for;
HullIncreasingExamples["H10"]:=S;X4Sources["H10"]:=S;
print "VERIFIED SOURCE H10";

// EX03: ingredient Q21.
Gin:=Matrix(F,10,26,[
1,0,0,0,0,0,0,0,0,0,0,1,1,1,0,w,w,0,w,0,w,1,1,1,1,0,
0,1,0,0,0,0,0,0,0,0,1,0,1,1,w,w,w,0,w,0,w^2,w,0,0,0,1,
0,0,1,0,0,0,0,0,0,0,w,0,w^2,0,0,1,0,w^2,w^2,0,w,0,1,w^2,w^2,w,
0,0,0,1,0,0,0,0,0,0,w,w^2,w,w,w,w,w^2,0,1,w,1,0,w^2,w,0,0,
0,0,0,0,1,0,0,0,0,0,0,w^2,1,w^2,w^2,w^2,0,0,1,w^2,w,w^2,1,w,w^2,w^2,
0,0,0,0,0,1,0,0,0,0,0,w,0,w^2,w,1,0,1,w,w,w^2,1,1,w^2,0,w,
0,0,0,0,0,0,1,0,0,0,w,w,w^2,w,w,1,w,0,w,w^2,w,w,1,1,w^2,w^2,
0,0,0,0,0,0,0,1,0,0,w,1,w,0,w^2,w^2,0,w,1,w^2,1,w,w^2,0,0,0,
0,0,0,0,0,0,0,0,1,0,1,1,0,1,0,w,w,0,w^2,w,0,0,0,1,w,w,
0,0,0,0,0,0,0,0,0,1,w,0,w,1,w^2,w^2,0,w^2,w^2,1,0,w^2,w^2,w^2,w,0]);
U:=Matrix(F,10,1,[
1,
0,
w,
w,
w,
0,
0,
w^2,
w,
w^2]);
Cin:=LinearCode(Gin);
ParentG:=Matrix(F,12,28,[
1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,w^2,1,1,w^2,w^2,1,0,1,1,0,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,w^2,w^2,1,1,w^2,w^2,1,0,1,1,0,
0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,0,w,w,w,w,w,w,w,w^2,0,1,1,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,0,w,w,w,w,w,w,w,w^2,0,1,1,
0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,1,w,w^2,w^2,w^2,1,1,w^2,w,w^2,w,0,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,1,w,w^2,w^2,w^2,1,1,w^2,w,w^2,w,0,
0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,1,w^2,w,w^2,w,0,0,0,1,w,w^2,w^2,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,1,w^2,1,1,w^2,w,w^2,w,0,0,0,1,w,w^2,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,1,0,w,w,w,w,w,w^2,0,1,1,0,1,0,w,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,1,w,w,w,w,w,w,w^2,0,1,1,0,1,0,w,
0,0,0,0,0,0,0,0,0,0,1,0,1,0,w^2,w^2,1,1,w^2,w^2,1,0,1,1,0,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,w^2,1,1,w^2,w^2,1,0,1,1,0,1,1]);
ParentCode:=LinearCode(ParentG);
assert MinimumWeight(ParentCode) ge 11;
PreprocessCoordinates:=[17,25];Keep:=[j:j in [1..Ncols(ParentG)]|not j in PreprocessCoordinates];
PreG:=Matrix(Basis(Nullspace(SelectColumns(ParentG,PreprocessCoordinates))))*ParentG;
assert Cin eq LinearCode(SelectColumns(PreG,Keep));
S:=HullSource("EX03","Q21",Gin,U,11,1,11,"exact",Vector(F,[0,1,0,0,0,0,0,0,0,0,1,0,1,1,w,w,w,0,w,0,w^2,w,0,0,0,1,0]));
S`Preprocessing:=<"shortening","Q21",ParentG,PreprocessCoordinates>;
S`PaperRows:=[11,154];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="EX03";
end for;
HullIncreasingExamples["EX03"]:=S;X4Sources["EX03"]:=S;
print "VERIFIED SOURCE EX03";

// BS001: ingredient B27_9.
Gin:=Matrix(F,9,27,[
1,0,0,0,0,0,0,0,0,1,w,w^2,0,w,w,1,1,0,w^2,w,w,w^2,w,0,1,w,w,
0,1,0,0,0,0,0,0,0,0,1,w,w^2,0,w,w,1,1,w,w^2,w,w,w^2,w,0,1,w,
0,0,1,0,0,0,0,0,0,1,0,1,w,w^2,0,w,w,1,w,w,w^2,w,w,w^2,w,0,1,
0,0,0,1,0,0,0,0,0,1,1,0,1,w,w^2,0,w,w,1,w,w,w^2,w,w,w^2,w,0,
0,0,0,0,1,0,0,0,0,w,1,1,0,1,w,w^2,0,w,0,1,w,w,w^2,w,w,w^2,w,
0,0,0,0,0,1,0,0,0,w,w,1,1,0,1,w,w^2,0,w,0,1,w,w,w^2,w,w,w^2,
0,0,0,0,0,0,1,0,0,0,w,w,1,1,0,1,w,w^2,w^2,w,0,1,w,w,w^2,w,w,
0,0,0,0,0,0,0,1,0,w^2,0,w,w,1,1,0,1,w,w,w^2,w,0,1,w,w,w^2,w,
0,0,0,0,0,0,0,0,1,w,w^2,0,w,w,1,1,0,1,w,w,w^2,w,0,1,w,w,w^2]);
U:=Matrix(F,9,1,[
0,
0,
w^2,
1,
w^2,
0,
0,
1,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B27_9_27_9") then
DatabaseCode:=BestKnownLinearCode(F,27,9);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 13;
InputDistanceCache["B27_9_27_9"]:=Cin;
else assert Cin eq InputDistanceCache["B27_9_27_9"];end if;
S:=HullSource("BS001","B27_9",Gin,U,13,3,13,"exact",Vector(F,[1,w,0,w,w^2,1,w,0,0,0,0,1,0,0,0,0,0,1,1,0,w,0,w^2,1,w,0,0,0]));
S`PaperRows:=[15,161];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS001";
end for;
HullIncreasingExamples["BS001"]:=S;X4Sources["BS001"]:=S;
print "VERIFIED SOURCE BS001";

// B27_19_s2: ingredient B27_19.
Gin:=Matrix(F,19,27,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w^2,w,w,w,0,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,w,1,w^2,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,w,w,w^2,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w,1,1,0,w^2,w^2,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,w^2,w,w^2,w,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w^2,w^2,1,0,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,w,0,w^2,w^2,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,0,w,w^2,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,1,w^2,w,w,0,w^2,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,w,0,w,0,0,w,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,0,w^2,w^2,1,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,1,w,w^2,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,w^2,w^2,w,w^2,1,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,w^2,w^2,0,1,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,1,w^2,w,w,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,w,w,0,1,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,w,w,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,w,w^2,w^2,1,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,0,1,0,0,1]);
U:=Matrix(F,19,1,[
1,
0,
w^2,
0,
w^2,
0,
0,
w^2,
w,
1,
w^2,
w,
1,
w,
0,
w^2,
w,
0,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B27_19_27_19") then
DatabaseCode:=BestKnownLinearCode(F,27,19);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 6;
InputDistanceCache["B27_19_27_19"]:=Cin;
else assert Cin eq InputDistanceCache["B27_19_27_19"];end if;
S:=HullSource("B27_19_s2","B27_19",Gin,U,6,2,6,"exact",Vector(F,[0,0,w^2,0,0,1,0,w^2,0,0,0,0,0,0,0,0,0,w,0,0,0,0,0,w^2,w^2,0,0,0]));
S`PaperRows:=[16,164];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B27_19_s2";
end for;
HullIncreasingExamples["B27_19_s2"]:=S;X4Sources["B27_19_s2"]:=S;
print "VERIFIED SOURCE B27_19_s2";

// B28_6_s1: ingredient B28_6.
Gin:=Matrix(F,6,28,[
1,0,0,0,0,0,1,w^2,0,w,w,w^2,w,w,w^2,w,w,1,0,w,0,w^2,1,1,0,w^2,0,0,
0,1,0,0,0,0,1,1,w^2,w,0,1,1,0,w^2,1,0,w^2,1,w,w,w^2,w,0,1,w^2,w^2,0,
0,0,1,0,0,0,1,w^2,1,1,0,w^2,w^2,w^2,1,1,w^2,1,w^2,w^2,w,w^2,w,w^2,0,w,w^2,w^2,
0,0,0,1,0,0,1,0,w^2,w^2,w^2,w^2,1,1,1,w^2,w^2,w,1,1,w^2,0,w,w^2,w^2,w^2,w,w^2,
0,0,0,0,1,0,1,w,0,1,1,0,1,w^2,0,w^2,1,w,w,w^2,1,0,1,w^2,w^2,0,w^2,w,
0,0,0,0,0,1,1,0,w,w,w^2,w,w,w^2,w,w,1,0,w,0,w^2,1,1,0,w^2,0,0,w^2]);
U:=Matrix(F,6,1,[
1,
1,
1,
w^2,
0,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B28_6_28_6") then
DatabaseCode:=BestKnownLinearCode(F,28,6);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 17;
InputDistanceCache["B28_6_28_6"]:=Cin;
else assert Cin eq InputDistanceCache["B28_6_28_6"];end if;
S:=HullSource("B28_6_s1","B28_6",Gin,U,17,1,17,"exact",Vector(F,[1,1,0,0,0,0,0,w,w^2,0,w,w,w^2,w,0,w^2,w,w,1,0,w,0,w^2,1,1,0,w^2,0,0]));
S`PaperRows:=[18,160];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B28_6_s1";
end for;
HullIncreasingExamples["B28_6_s1"]:=S;X4Sources["B28_6_s1"]:=S;
print "VERIFIED SOURCE B28_6_s1";

// B30_10_shorten12_s1: ingredient B30_10_shorten12.
Gin:=Matrix(F,9,29,[
1,0,0,0,0,0,0,0,0,w,w,1,0,1,1,w^2,w^2,w^2,w,w^2,w^2,0,0,0,0,0,w,1,w,
0,1,0,0,0,0,0,0,0,w,w,0,0,w,0,0,0,1,w^2,1,1,1,1,w^2,w,1,1,w,w,
0,0,1,0,0,0,0,0,0,w,w^2,0,1,w,w^2,1,w^2,w,1,1,w^2,w^2,0,w,1,w^2,0,1,1,
0,0,0,1,0,0,0,0,0,1,w^2,1,w,w^2,1,w,w^2,w^2,0,w^2,1,0,1,1,1,w^2,w^2,1,w,
0,0,0,0,1,0,0,0,0,0,w^2,w,w^2,w^2,w^2,w,w,1,0,w,1,w,w,0,w,w^2,w,1,w^2,
0,0,0,0,0,1,0,0,0,w,1,w^2,0,w^2,w,w^2,1,w^2,0,0,w^2,w,0,w^2,w^2,0,0,1,1,
0,0,0,0,0,0,1,0,0,0,1,w^2,0,w,w^2,w^2,w^2,w,w,1,w^2,w,1,w,w,0,w,w^2,w,
0,0,0,0,0,0,0,1,0,w^2,0,1,0,0,0,w^2,w,1,0,w^2,w^2,w,1,w^2,w^2,1,1,w^2,w^2,
0,0,0,0,0,0,0,0,1,1,1,w^2,1,w^2,w^2,w,1,0,0,1,1,w^2,w,1,w^2,w^2,0,w,w]);
U:=Matrix(F,9,1,[
0,
w,
0,
w,
w^2,
0,
0,
0,
1]);
Cin:=LinearCode(Gin);
ParentG:=Matrix(F,10,30,[
1,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w,1,0,w^2,0,w,w^2,0,w,w^2,w,1,w^2,w,1,w,w,
0,1,0,0,0,0,0,0,0,0,w^2,w^2,w^2,w,w,1,0,w^2,0,w,w,0,w,w^2,w,1,w^2,w,1,w,
0,0,1,0,0,0,0,0,0,0,w,w^2,w^2,w^2,w,w,1,0,w^2,0,w,w,0,w,w^2,w,1,w^2,w,1,
0,0,0,1,0,0,0,0,0,0,0,w,w^2,w^2,w^2,w,w,1,0,w^2,1,w,w,0,w,w^2,w,1,w^2,w,
0,0,0,0,1,0,0,0,0,0,w^2,0,w,w^2,w^2,w^2,w,w,1,0,w,1,w,w,0,w,w^2,w,1,w^2,
0,0,0,0,0,1,0,0,0,0,0,w^2,0,w,w^2,w^2,w^2,w,w,1,w^2,w,1,w,w,0,w,w^2,w,1,
0,0,0,0,0,0,1,0,0,0,1,0,w^2,0,w,w^2,w^2,w^2,w,w,1,w^2,w,1,w,w,0,w,w^2,w,
0,0,0,0,0,0,0,1,0,0,w,1,0,w^2,0,w,w^2,w^2,w^2,w,w,1,w^2,w,1,w,w,0,w,w^2,
0,0,0,0,0,0,0,0,1,0,w,w,1,0,w^2,0,w,w^2,w^2,w^2,w^2,w,1,w^2,w,1,w,w,0,w,
0,0,0,0,0,0,0,0,0,1,w^2,w,w,1,0,w^2,0,w,w^2,w^2,w,w^2,w,1,w^2,w,1,w,w,0]);
ParentCode:=LinearCode(ParentG);
DatabaseCode:=BestKnownLinearCode(F,30,10);assert ParentCode eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 14;
PreprocessCoordinates:=[12];Keep:=[j:j in [1..Ncols(ParentG)]|not j in PreprocessCoordinates];
PreG:=Matrix(Basis(Nullspace(SelectColumns(ParentG,PreprocessCoordinates))))*ParentG;
assert Cin eq LinearCode(SelectColumns(PreG,Keep));
S:=HullSource("B30_10_shorten12_s1","B30_10_shorten12",Gin,U,14,1,14,"exact",Vector(F,[0,w,w^2,w,0,w,1,1,0,0,w^2,1,0,0,0,1,0,0,0,w,w^2,w^2,0,w,w,0,0,0,0,0]));
S`Preprocessing:=<"shortening","B30_10",ParentG,PreprocessCoordinates>;
S`PaperRows:=[20];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B30_10_shorten12_s1";
end for;
HullIncreasingExamples["B30_10_shorten12_s1"]:=S;X4Sources["B30_10_shorten12_s1"]:=S;
print "VERIFIED SOURCE B30_10_shorten12_s1";

// H15: ingredient Q10.
Gin:=Matrix(F,12,30,[
1,0,0,0,0,0,0,0,0,0,w^2,w,1,0,1,0,0,1,w^2,w^2,w^2,w,w,1,1,0,1,w^2,w^2,w^2,
0,1,0,0,0,0,0,0,0,0,w^2,1,w^2,1,1,0,0,w,0,w,w^2,1,w^2,1,w,w,1,1,w,w,
0,0,1,0,0,0,0,0,0,0,w^2,1,0,w^2,0,0,0,w^2,0,w,w^2,1,1,w^2,1,0,w^2,0,w^2,0,
0,0,0,1,0,0,0,0,0,0,0,w^2,1,0,w^2,0,0,0,w^2,0,w,w^2,1,1,w^2,1,0,w^2,0,w^2,
0,0,0,0,1,0,0,0,0,0,w,1,0,1,w^2,0,0,0,0,w^2,1,w^2,1,0,0,0,w,1,w^2,0,
0,0,0,0,0,1,0,0,0,0,w,w^2,w,0,w,0,0,w^2,w,w,1,0,w,w,w^2,0,w^2,0,w^2,1,
0,0,0,0,0,0,1,0,0,0,1,1,1,w,w,0,0,w^2,1,0,w,w,w,w^2,w^2,w,w,w^2,w,1,
0,0,0,0,0,0,0,1,0,0,1,w,w^2,1,0,0,0,w^2,1,w^2,0,1,0,w^2,w,w,0,w,1,0,
0,0,0,0,0,0,0,0,1,0,0,1,w,w^2,1,0,0,0,w^2,1,w^2,0,1,0,w^2,w,w,0,w,1,
0,0,0,0,0,0,0,0,0,1,w^2,w,0,w,w,0,0,0,0,w^2,w^2,1,w^2,w^2,w,w,w^2,0,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w^2,1,0,1,w^2,w^2,1,0,1,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,1,0,1,w^2,w^2,1,0,1,w^2,w^2,1]);
U:=Matrix(F,12,1,[
1,
1,
w^2,
1,
0,
0,
w,
w^2,
1,
w,
w,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"Q10_30_12") then
assert MinimumWeight(Cin) ge 12;
InputDistanceCache["Q10_30_12"]:=Cin;
else assert Cin eq InputDistanceCache["Q10_30_12"];end if;
S:=HullSource("H15","Q10",Gin,U,12,4,12,"lower_bound",Vector(F,[]));
S`PaperRows:=[23,165,169,172];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="H15";
end for;
HullIncreasingExamples["H15"]:=S;X4Sources["H15"]:=S;
print "VERIFIED SOURCE H15";

// H16: ingredient Q10.
Gin:=Matrix(F,12,30,[
1,0,0,0,0,0,0,0,0,0,w^2,w,1,0,1,0,0,1,w^2,w^2,w^2,w,w,1,1,0,1,w^2,w^2,w^2,
0,1,0,0,0,0,0,0,0,0,w^2,1,w^2,1,1,0,0,w,0,w,w^2,1,w^2,1,w,w,1,1,w,w,
0,0,1,0,0,0,0,0,0,0,w^2,1,0,w^2,0,0,0,w^2,0,w,w^2,1,1,w^2,1,0,w^2,0,w^2,0,
0,0,0,1,0,0,0,0,0,0,0,w^2,1,0,w^2,0,0,0,w^2,0,w,w^2,1,1,w^2,1,0,w^2,0,w^2,
0,0,0,0,1,0,0,0,0,0,w,1,0,1,w^2,0,0,0,0,w^2,1,w^2,1,0,0,0,w,1,w^2,0,
0,0,0,0,0,1,0,0,0,0,w,w^2,w,0,w,0,0,w^2,w,w,1,0,w,w,w^2,0,w^2,0,w^2,1,
0,0,0,0,0,0,1,0,0,0,1,1,1,w,w,0,0,w^2,1,0,w,w,w,w^2,w^2,w,w,w^2,w,1,
0,0,0,0,0,0,0,1,0,0,1,w,w^2,1,0,0,0,w^2,1,w^2,0,1,0,w^2,w,w,0,w,1,0,
0,0,0,0,0,0,0,0,1,0,0,1,w,w^2,1,0,0,0,w^2,1,w^2,0,1,0,w^2,w,w,0,w,1,
0,0,0,0,0,0,0,0,0,1,w^2,w,0,w,w,0,0,0,0,w^2,w^2,1,w^2,w^2,w,w,w^2,0,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w^2,1,0,1,w^2,w^2,1,0,1,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,1,0,1,w^2,w^2,1,0,1,w^2,w^2,1]);
U:=Matrix(F,12,2,[
1,0,
1,0,
w^2,w^2,
1,w,
0,w,
0,w,
w,0,
w^2,w^2,
1,0,
w,1,
w,w,
0,0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"Q10_30_12") then
assert MinimumWeight(Cin) ge 12;
InputDistanceCache["Q10_30_12"]:=Cin;
else assert Cin eq InputDistanceCache["Q10_30_12"];end if;
S:=HullSource("H16","Q10",Gin,U,12,5,12,"lower_bound",Vector(F,[]));
S`PaperRows:=[28,171,178];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="H16";
end for;
HullIncreasingExamples["H16"]:=S;X4Sources["H16"]:=S;
print "VERIFIED SOURCE H16";

// B32_21_shorten5_s2: ingredient B32_21_shorten5.
Gin:=Matrix(F,20,31,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,0,0,1,1,w,w^2,0,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,0,0,1,w,w^2,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,w,1,1,w^2,w^2,0,1,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,w^2,1,w^2,0,w,w^2,w^2,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,0,0,w^2,1,0,1,w^2,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,0,1,w^2,1,w^2,0,w^2,w,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,0,1,w^2,w^2,w,0,w^2,w^2,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,1,w,1,w,w^2,0,1,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,w^2,w^2,w,1,w,0,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,w^2,w^2,w,w,0,1,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,w^2,w,1,w,1,0,0,0,w,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,w,0,w^2,w^2,w^2,w,w^2,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,w^2,0,w,w,0,1,0,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,w^2,0,w^2,w^2,w,1,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w,0,w,w^2,1,1,0,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w,0,w,w^2,1,0,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,w^2,0,w^2,0,1,1,0,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,0,w,w,0,w,0,0,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,0,0,1,1,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,w,1,w^2,w^2,w^2,w,1,1]);
U:=Matrix(F,20,1,[
w^2,
w,
0,
w^2,
w^2,
w^2,
0,
1,
w^2,
0,
w^2,
w,
1,
w,
w,
1,
0,
w,
1,
w^2]);
Cin:=LinearCode(Gin);
ParentG:=Matrix(F,21,32,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,0,0,1,1,w,w^2,0,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,0,0,1,w,w^2,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,w,1,1,w^2,w^2,0,1,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,w^2,1,w^2,0,w,w^2,w^2,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,1,0,w^2,w,1,0,w^2,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,0,0,w^2,1,0,1,w^2,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,0,1,w^2,1,w^2,0,w^2,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,0,1,w^2,w^2,w,0,w^2,w^2,w,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,1,w,1,w,w^2,0,1,1,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,w^2,w^2,w,1,w,0,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,w^2,w^2,w,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,w^2,w,1,w,1,0,0,0,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,w,0,w^2,w^2,w^2,w,w^2,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,w^2,0,w,w,0,1,0,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,w^2,0,w^2,w^2,w,1,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w,0,w,w^2,1,1,0,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w,0,w,w^2,1,0,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,w^2,0,w^2,0,1,1,0,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,0,w,w,0,w,0,0,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,0,0,1,1,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,w,1,w^2,w^2,w^2,w,1,1]);
ParentCode:=LinearCode(ParentG);
DatabaseCode:=BestKnownLinearCode(F,32,21);assert ParentCode eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 7;
PreprocessCoordinates:=[5];Keep:=[j:j in [1..Ncols(ParentG)]|not j in PreprocessCoordinates];
PreG:=Matrix(Basis(Nullspace(SelectColumns(ParentG,PreprocessCoordinates))))*ParentG;
assert Cin eq LinearCode(SelectColumns(PreG,Keep));
S:=HullSource("B32_21_shorten5_s2","B32_21_shorten5",Gin,U,7,2,7,"exact",Vector(F,[0,0,0,0,0,1,0,w^2,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,0,w^2,0,0,0,1,0,0,1,0]));
S`Preprocessing:=<"shortening","B32_21",ParentG,PreprocessCoordinates>;
S`PaperRows:=[31];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B32_21_shorten5_s2";
end for;
HullIncreasingExamples["B32_21_shorten5_s2"]:=S;X4Sources["B32_21_shorten5_s2"]:=S;
print "VERIFIED SOURCE B32_21_shorten5_s2";

// B32_16_s7: ingredient B32_16.
Gin:=Matrix(F,16,32,[
1,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,0,0,0,w^2,w^2,w^2,0,1,0,w^2,0,1,w,0,w^2,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,0,0,0,w^2,w^2,w^2,0,1,0,w^2,0,1,w,w^2,w,
0,0,1,0,0,0,0,0,0,0,0,0,w,1,w,0,0,0,0,0,0,0,w,0,w,1,w,1,w,w,w^2,0,
0,0,0,1,0,0,0,0,0,0,0,0,w^2,0,1,0,0,0,0,w,w,1,1,w,w,0,w^2,w^2,w,1,1,w^2,
0,0,0,0,1,0,0,0,0,0,0,0,w,w,0,0,0,0,0,1,w^2,1,w,1,w^2,w^2,1,0,1,0,0,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,w,w,0,0,0,0,0,1,w^2,1,w,1,w^2,w^2,1,0,1,0,1,
0,0,0,0,0,0,1,0,0,0,0,0,w^2,w,w,0,0,0,0,w^2,w^2,0,0,w,w^2,w,w,w^2,w,w,w^2,w,
0,0,0,0,0,0,0,1,0,0,0,0,w^2,1,w,0,0,0,0,w,1,w,1,0,0,1,0,w^2,0,1,1,1,
0,0,0,0,0,0,0,0,1,0,0,0,w^2,1,1,0,0,0,0,w^2,1,0,1,w,1,w^2,0,0,0,w,w,w,
0,0,0,0,0,0,0,0,0,1,0,0,w,w,1,0,0,0,0,0,w^2,w,1,w,0,1,1,w,w,w^2,w,0,
0,0,0,0,0,0,0,0,0,0,1,0,w,w^2,w,0,0,0,0,w,w,0,0,w^2,1,w,w,1,0,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,w^2,0,0,0,0,0,w,w^2,w,1,0,1,1,1,w,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,w,0,w^2,1,1,w,1,w,0,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,1,1,w^2,w,0,w,w,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,1,0,w,w,w,1,1,w,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,w,w^2,w^2,1,w^2,1,0,1,w^2,1,0]);
U:=Matrix(F,16,1,[
0,
0,
0,
0,
0,
1,
1,
0,
1,
w,
1,
w,
w,
w,
w,
w]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B32_16_32_16") then
DatabaseCode:=BestKnownLinearCode(F,32,16);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 11;
InputDistanceCache["B32_16_32_16"]:=Cin;
else assert Cin eq InputDistanceCache["B32_16_32_16"];end if;
S:=HullSource("B32_16_s7","B32_16",Gin,U,11,7,11,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,w^2,w,w,0,w,0,1,0,w,1,w^2,0,0]));
S`PaperRows:=[32,183];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B32_16_s7";
end for;
HullIncreasingExamples["B32_16_s7"]:=S;X4Sources["B32_16_s7"]:=S;
print "VERIFIED SOURCE B32_16_s7";

// B32_11_s1: ingredient B32_11.
Gin:=Matrix(F,11,32,[
1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,w,w^2,w,w,w,w^2,0,1,1,0,w,w,1,1,1,
0,1,0,0,0,0,0,0,0,0,0,w,1,0,0,0,1,0,w,w^2,w,w,1,w^2,0,1,1,0,w,w,1,1,
0,0,1,0,0,0,0,0,0,0,0,w,w,1,0,0,0,1,0,w,w^2,w,1,1,w^2,0,1,1,0,w,w,1,
0,0,0,1,0,0,0,0,0,0,0,w,w,w,1,0,0,0,1,0,w,w^2,1,1,1,w^2,0,1,1,0,w,w,
0,0,0,0,1,0,0,0,0,0,0,w^2,w,w,w,1,0,0,0,1,0,w,1,1,1,1,w^2,0,1,1,0,w,
0,0,0,0,0,1,0,0,0,0,0,w,w^2,w,w,w,1,0,0,0,1,0,w,1,1,1,1,w^2,0,1,1,0,
0,0,0,0,0,0,1,0,0,0,0,0,w,w^2,w,w,w,1,0,0,0,1,w,w,1,1,1,1,w^2,0,1,1,
0,0,0,0,0,0,0,1,0,0,0,1,0,w,w^2,w,w,w,1,0,0,0,0,w,w,1,1,1,1,w^2,0,1,
0,0,0,0,0,0,0,0,1,0,0,0,1,0,w,w^2,w,w,w,1,0,0,1,0,w,w,1,1,1,1,w^2,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,w,w^2,w,w,w,1,0,1,1,0,w,w,1,1,1,1,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,w,w^2,w,w,w,1,0,1,1,0,w,w,1,1,1,1]);
U:=Matrix(F,11,1,[
0,
w^2,
w,
0,
0,
w^2,
w^2,
w^2,
0,
w,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B32_11_32_11") then
DatabaseCode:=BestKnownLinearCode(F,32,11);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 14;
InputDistanceCache["B32_11_32_11"]:=Cin;
else assert Cin eq InputDistanceCache["B32_11_32_11"];end if;
S:=HullSource("B32_11_s1","B32_11",Gin,U,14,1,14,"exact",Vector(F,[w,0,0,0,0,0,0,0,0,0,w,w,0,0,w,w,w^2,w,w,0,0,1,1,w,0,w,w^2,0,1,0,0,0,0]));
S`PaperRows:=[33,184];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B32_11_s1";
end for;
HullIncreasingExamples["B32_11_s1"]:=S;X4Sources["B32_11_s1"]:=S;
print "VERIFIED SOURCE B32_11_s1";

// B33_22_shorten10_s3: ingredient B33_22_shorten10.
Gin:=Matrix(F,21,32,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,0,0,w,0,w^2,w^2,1,w,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,0,0,1,w,w^2,1,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,1,w^2,w,1,1,w^2,0,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,1,0,w,1,1,0,1,w^2,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,0,0,0,w,w,0,0,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,w,w,1,w,w,w,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,0,1,w,w,w,w^2,w,w^2,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,0,0,w^2,1,0,1,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,w,0,0,w,w,w,w^2,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,w^2,w^2,w,w,0,1,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w,0,1,w,w^2,1,w,1,0,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,w,w^2,w^2,1,w^2,1,w^2,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,w,w,1,w,1,0,w^2,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,w,w^2,0,1,w,0,0,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,0,w,w,w,0,w^2,w^2,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w,0,w,w^2,1,0,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,w,w^2,0,w^2,0,w,w^2,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,1,w,0,1,w,w^2,w^2,w,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,w^2,0,1,w,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,w,1,w,0,w,1,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,0,0,w,1,w,1,w,w,w]);
U:=Matrix(F,21,1,[
0,
1,
w,
w^2,
0,
w,
w,
1,
1,
w^2,
0,
1,
0,
0,
0,
w^2,
w^2,
1,
w^2,
0,
w]);
Cin:=LinearCode(Gin);
ParentG:=Matrix(F,22,33,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,0,0,w,0,w^2,w^2,1,w,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,0,0,1,w,w^2,1,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,1,w^2,w,1,1,w^2,0,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,1,0,w,1,1,0,1,w^2,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,0,0,0,w,w,0,0,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,w,w,1,w,w,w,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,0,1,w,w,w,w^2,w,w^2,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,0,0,w^2,1,0,1,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,w,0,0,w,w,w,w^2,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,w^2,w^2,w^2,w,w,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,w^2,w^2,w,w,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w,0,1,w,w^2,1,w,1,0,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,w,w^2,w^2,1,w^2,1,w^2,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,w,w,1,w,1,0,w^2,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,w,w^2,0,1,w,0,0,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,0,w,w,w,0,w^2,w^2,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w,0,w,w^2,1,0,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,w,w^2,0,w^2,0,w,w^2,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,1,w,0,1,w,w^2,w^2,w,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,w^2,0,1,w,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,w,1,w,0,w,1,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,0,0,w,1,w,1,w,w,w]);
ParentCode:=LinearCode(ParentG);
DatabaseCode:=BestKnownLinearCode(F,33,22);assert ParentCode eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 7;
PreprocessCoordinates:=[10];Keep:=[j:j in [1..Ncols(ParentG)]|not j in PreprocessCoordinates];
PreG:=Matrix(Basis(Nullspace(SelectColumns(ParentG,PreprocessCoordinates))))*ParentG;
assert Cin eq LinearCode(SelectColumns(PreG,Keep));
S:=HullSource("B33_22_shorten10_s3","B33_22_shorten10",Gin,U,7,3,7,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,w,0,0,0,0,1,w^2,0,0,1,0,0,w^2,0,1,0]));
S`Preprocessing:=<"shortening","B33_22",ParentG,PreprocessCoordinates>;
S`PaperRows:=[35];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B33_22_shorten10_s3";
end for;
HullIncreasingExamples["B33_22_shorten10_s3"]:=S;X4Sources["B33_22_shorten10_s3"]:=S;
print "VERIFIED SOURCE B33_22_shorten10_s3";

// B32_21_s2: ingredient B32_21.
Gin:=Matrix(F,21,32,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,0,0,1,1,w,w^2,0,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,0,0,1,w,w^2,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,w,1,1,w^2,w^2,0,1,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,w^2,1,w^2,0,w,w^2,w^2,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,1,0,w^2,w,1,0,w^2,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,0,0,w^2,1,0,1,w^2,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,0,1,w^2,1,w^2,0,w^2,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,0,1,w^2,w^2,w,0,w^2,w^2,w,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,1,w,1,w,w^2,0,1,1,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,w^2,w^2,w,1,w,0,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,w^2,w^2,w,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,w^2,w,1,w,1,0,0,0,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,w,0,w^2,w^2,w^2,w,w^2,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,w^2,0,w,w,0,1,0,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,w^2,0,w^2,w^2,w,1,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w,0,w,w^2,1,1,0,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w,0,w,w^2,1,0,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,w^2,0,w^2,0,1,1,0,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,0,w,w,0,w,0,0,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,0,0,1,1,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,w,1,w^2,w^2,w^2,w,1,1]);
U:=Matrix(F,21,1,[
w^2,
w,
0,
w^2,
1,
w^2,
w^2,
0,
1,
w^2,
0,
w^2,
w,
1,
w,
w,
1,
0,
w,
1,
w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B32_21_32_21") then
DatabaseCode:=BestKnownLinearCode(F,32,21);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 7;
InputDistanceCache["B32_21_32_21"]:=Cin;
else assert Cin eq InputDistanceCache["B32_21_32_21"];end if;
S:=HullSource("B32_21_s2","B32_21",Gin,U,7,2,7,"exact",Vector(F,[0,0,0,0,0,0,1,0,w^2,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,0,w^2,0,0,0,1,0,0,1,0]));
S`PaperRows:=[36,181,187];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B32_21_s2";
end for;
HullIncreasingExamples["B32_21_s2"]:=S;X4Sources["B32_21_s2"]:=S;
print "VERIFIED SOURCE B32_21_s2";

// DV03: ingredient B32_16.
Gin:=Matrix(F,16,32,[
1,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,0,0,0,w^2,w^2,w^2,0,1,0,w^2,0,1,w,0,w^2,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,0,0,0,w^2,w^2,w^2,0,1,0,w^2,0,1,w,w^2,w,
0,0,1,0,0,0,0,0,0,0,0,0,w,1,w,0,0,0,0,0,0,0,w,0,w,1,w,1,w,w,w^2,0,
0,0,0,1,0,0,0,0,0,0,0,0,w^2,0,1,0,0,0,0,w,w,1,1,w,w,0,w^2,w^2,w,1,1,w^2,
0,0,0,0,1,0,0,0,0,0,0,0,w,w,0,0,0,0,0,1,w^2,1,w,1,w^2,w^2,1,0,1,0,0,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,w,w,0,0,0,0,0,1,w^2,1,w,1,w^2,w^2,1,0,1,0,1,
0,0,0,0,0,0,1,0,0,0,0,0,w^2,w,w,0,0,0,0,w^2,w^2,0,0,w,w^2,w,w,w^2,w,w,w^2,w,
0,0,0,0,0,0,0,1,0,0,0,0,w^2,1,w,0,0,0,0,w,1,w,1,0,0,1,0,w^2,0,1,1,1,
0,0,0,0,0,0,0,0,1,0,0,0,w^2,1,1,0,0,0,0,w^2,1,0,1,w,1,w^2,0,0,0,w,w,w,
0,0,0,0,0,0,0,0,0,1,0,0,w,w,1,0,0,0,0,0,w^2,w,1,w,0,1,1,w,w,w^2,w,0,
0,0,0,0,0,0,0,0,0,0,1,0,w,w^2,w,0,0,0,0,w,w,0,0,w^2,1,w,w,1,0,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,w^2,0,0,0,0,0,w,w^2,w,1,0,1,1,1,w,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,w,0,w^2,1,1,w,1,w,0,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,1,1,w^2,w,0,w,w,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,1,0,w,w,w,1,1,w,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,w,w^2,w^2,1,w^2,1,0,1,w^2,1,0]);
U:=Matrix(F,16,2,[
1,1,
0,1,
w,w,
0,0,
1,1,
w,w,
0,0,
w,w,
0,0,
w^2,w^2,
w^2,w^2,
w,w^2,
0,1,
w^2,w^2,
w,w^2,
1,1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B32_16_32_16") then
DatabaseCode:=BestKnownLinearCode(F,32,16);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 11;
InputDistanceCache["B32_16_32_16"]:=Cin;
else assert Cin eq InputDistanceCache["B32_16_32_16"];end if;
S:=HullSource("DV03","B32_16",Gin,U,11,8,11,"exact",Vector(F,[1,0,w,w^2,w^2,1,w^2,1,0,1,w^2,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0]));
S`PaperRows:=[39];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV03";
end for;
HullIncreasingExamples["DV03"]:=S;X4Sources["DV03"]:=S;
print "VERIFIED SOURCE DV03";

// H19: ingredient Q7.
Gin:=Matrix(F,11,33,[
1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,w,w^2,w,w,w,w^2,0,1,1,0,w,w,1,1,1,1,
0,1,0,0,0,0,0,0,0,0,0,w,1,0,0,0,1,0,w,w^2,w,w,1,w^2,0,1,1,0,w,w,1,1,1,
0,0,1,0,0,0,0,0,0,0,0,w,w,1,0,0,0,1,0,w,w^2,w,1,1,w^2,0,1,1,0,w,w,1,1,
0,0,0,1,0,0,0,0,0,0,0,w,w,w,1,0,0,0,1,0,w,w^2,1,1,1,w^2,0,1,1,0,w,w,1,
0,0,0,0,1,0,0,0,0,0,0,w^2,w,w,w,1,0,0,0,1,0,w,1,1,1,1,w^2,0,1,1,0,w,w,
0,0,0,0,0,1,0,0,0,0,0,w,w^2,w,w,w,1,0,0,0,1,0,w,1,1,1,1,w^2,0,1,1,0,w,
0,0,0,0,0,0,1,0,0,0,0,0,w,w^2,w,w,w,1,0,0,0,1,w,w,1,1,1,1,w^2,0,1,1,0,
0,0,0,0,0,0,0,1,0,0,0,1,0,w,w^2,w,w,w,1,0,0,0,0,w,w,1,1,1,1,w^2,0,1,1,
0,0,0,0,0,0,0,0,1,0,0,0,1,0,w,w^2,w,w,w,1,0,0,1,0,w,w,1,1,1,1,w^2,0,1,
0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,w,w^2,w,w,w,1,0,1,1,0,w,w,1,1,1,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,w,w^2,w,w,w,1,0,1,1,0,w,w,1,1,1,1,w^2]);
U:=Matrix(F,11,1,[
1,
w^2,
1,
0,
0,
0,
0,
w,
w^2,
w,
w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"Q7_33_11") then
assert MinimumWeight(Cin) ge 15;
InputDistanceCache["Q7_33_11"]:=Cin;
else assert Cin eq InputDistanceCache["Q7_33_11"];end if;
S:=HullSource("H19","Q7",Gin,U,15,1,15,"exact",Vector(F,[0,0,0,0,0,0,1,w,w,0,w^2,w,0,0,w^2,0,w^2,w^2,0,w^2,1,w,0,w,w,0,0,0,0,0,w^2,0,w,0]));
S`PaperRows:=[40,180];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="H19";
end for;
HullIncreasingExamples["H19"]:=S;X4Sources["H19"]:=S;
print "VERIFIED SOURCE H19";

// BS005: ingredient B34_10.
Gin:=Matrix(F,10,34,[
1,0,0,0,0,0,0,0,0,0,0,1,1,0,1,w^2,0,1,1,0,0,w,0,1,w^2,0,0,1,w,w,1,1,0,w,
0,1,0,0,0,0,0,0,0,0,w^2,1,0,w,0,w^2,1,0,1,0,0,w,1,1,w^2,w^2,w^2,w^2,0,0,0,w^2,w^2,0,
0,0,1,0,0,0,0,0,0,0,0,w,0,0,w^2,w^2,w^2,0,1,1,0,w,w,0,w^2,w^2,w^2,w,1,w,1,1,w^2,1,
0,0,0,1,0,0,0,0,0,0,w,w,w,w,1,1,w,w,1,w,1,w^2,0,0,1,w^2,1,0,w^2,w,w,1,0,1,
0,0,0,0,1,0,0,0,0,0,w,0,w,0,w^2,w^2,0,w^2,w^2,w,w,w,1,w,1,1,1,w,1,0,w,w,0,w,
0,0,0,0,0,1,0,0,0,0,w^2,w,w,1,1,w,1,1,w,w,w,w,1,1,0,1,w,w^2,1,1,w^2,1,0,w,
0,0,0,0,0,0,1,0,0,0,w^2,1,w^2,1,w,1,0,w,w,w^2,w,1,1,w^2,1,0,w,w,w^2,w,0,w,w^2,1,
0,0,0,0,0,0,0,1,0,0,w,w,w,1,w^2,w,0,w,0,1,w^2,0,w^2,0,w^2,1,w,w,w,1,1,w^2,w^2,0,
0,0,0,0,0,0,0,0,1,0,0,0,w,w,w^2,w,w,w,0,0,1,0,0,1,1,w^2,1,0,1,1,w^2,w^2,w^2,0,
0,0,0,0,0,0,0,0,0,1,0,0,1,w,w,w^2,w,w,w,0,0,1,0,0,0,1,w^2,1,0,1,1,w^2,w^2,w^2]);
U:=Matrix(F,10,1,[
0,
0,
0,
1,
1,
0,
0,
0,
w,
w]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B34_10_34_10") then
DatabaseCode:=BestKnownLinearCode(F,34,10);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 16;
InputDistanceCache["B34_10_34_10"]:=Cin;
else assert Cin eq InputDistanceCache["B34_10_34_10"];end if;
S:=HullSource("BS005","B34_10",Gin,U,16,3,16,"exact",Vector(F,[w,0,0,0,0,0,0,0,0,0,0,w,w,0,w,1,0,w,w,0,0,w^2,0,w,1,0,0,w,w^2,w^2,w,w,0,w^2,0]));
S`PaperRows:=[43,182];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS005";
end for;
HullIncreasingExamples["BS005"]:=S;X4Sources["BS005"]:=S;
print "VERIFIED SOURCE BS005";

// H21: ingredient Q26.
Gin:=Matrix(F,9,36,[
1,0,0,0,0,0,0,0,0,w,0,w,w,1,w^2,1,0,0,w,w,0,0,1,w^2,w^2,0,1,w^2,w^2,0,1,0,w^2,w,w^2,0,
0,1,0,0,0,0,0,0,0,0,w,0,w,w,1,w^2,1,0,1,w,w,0,0,1,w^2,w^2,0,0,w^2,w^2,0,1,0,w^2,w,w^2,
0,0,1,0,0,0,0,0,0,0,0,w,0,w,w,1,w^2,1,0,1,w,w,0,0,1,w^2,w^2,w^2,0,w^2,w^2,0,1,0,w^2,w,
0,0,0,1,0,0,0,0,0,1,0,0,w,0,w,w,1,w^2,w^2,0,1,w,w,0,0,1,w^2,w,w^2,0,w^2,w^2,0,1,0,w^2,
0,0,0,0,1,0,0,0,0,w^2,1,0,0,w,0,w,w,1,w^2,w^2,0,1,w,w,0,0,1,w^2,w,w^2,0,w^2,w^2,0,1,0,
0,0,0,0,0,1,0,0,0,1,w^2,1,0,0,w,0,w,w,1,w^2,w^2,0,1,w,w,0,0,0,w^2,w,w^2,0,w^2,w^2,0,1,
0,0,0,0,0,0,1,0,0,w,1,w^2,1,0,0,w,0,w,0,1,w^2,w^2,0,1,w,w,0,1,0,w^2,w,w^2,0,w^2,w^2,0,
0,0,0,0,0,0,0,1,0,w,w,1,w^2,1,0,0,w,0,0,0,1,w^2,w^2,0,1,w,w,0,1,0,w^2,w,w^2,0,w^2,w^2,
0,0,0,0,0,0,0,0,1,0,w,w,1,w^2,1,0,0,w,w,0,0,1,w^2,w^2,0,1,w,w^2,0,1,0,w^2,w,w^2,0,w^2]);
U:=Matrix(F,9,1,[
1,
w,
w,
1,
w^2,
w,
1,
1,
w]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"Q26_36_9") then
assert MinimumWeight(Cin) ge 18;
InputDistanceCache["Q26_36_9"]:=Cin;
else assert Cin eq InputDistanceCache["Q26_36_9"];end if;
S:=HullSource("H21","Q26",Gin,U,18,5,18,"exact",Vector(F,[0,0,1,0,w^2,w^2,0,0,w^2,1,0,0,w^2,1,0,0,w^2,w,0,1,0,w,0,w,0,0,1,w^2,w^2,w^2,1,0,0,0,0,w^2,0]));
S`PaperRows:=[50,200];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="H21";
end for;
HullIncreasingExamples["H21"]:=S;X4Sources["H21"]:=S;
print "VERIFIED SOURCE H21";

// BS011: ingredient B36_15.
Gin:=Matrix(F,15,36,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,1,0,0,w^2,w^2,0,0,1,0,w^2,w,w^2,w^2,1,w,0,w,1,0,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,1,0,0,w^2,w^2,0,0,1,0,w^2,w,w^2,w^2,1,w,0,w,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,0,0,1,0,1,1,w^2,w^2,w^2,w,0,1,w^2,w,0,w,1,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,0,0,1,0,1,1,w^2,w^2,w^2,w,0,1,w^2,w,0,w,1,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,w^2,0,w^2,w,1,0,w^2,w,w,w,1,1,0,1,0,0,w,w,1,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,w^2,0,w^2,w,1,0,w^2,w,w,w,1,1,0,1,0,0,w,w,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,w^2,0,w^2,1,w,w,w^2,w,0,1,0,0,w,w,0,0,1,0,w^2,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,w^2,0,w^2,1,w,w,w^2,w,0,1,0,0,w,w,0,0,1,0,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,w,w,w^2,w^2,0,1,w^2,w^2,1,0,1,0,w,w,w,1,w^2,0,w,1,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,w^2,w,w,w,0,w^2,1,0,w,w,w^2,w^2,1,w,w^2,0,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,w^2,w,w,w,0,w^2,1,0,w,w,w^2,w^2,1,w,w^2,0,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,w^2,0,0,w,w^2,w,0,w,0,w,w,0,1,0,w^2,0,w^2,w^2,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,w,w,0,1,w^2,w^2,0,w,1,w^2,0,0,w^2,w,0,w,1,w^2,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,1,w,w^2,w,w^2,w,1,0,w^2,w,1,w,1,w,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,0,1,1,0,w,w,w^2,w^2,w,w,w^2,w^2,0,1,1,0,1,w,1]);
U:=Matrix(F,15,1,[
0,
0,
1,
0,
0,
0,
0,
0,
0,
0,
0,
0,
1,
1,
w]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B36_15_36_15") then
DatabaseCode:=BestKnownLinearCode(F,36,15);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 13;
InputDistanceCache["B36_15_36_15"]:=Cin;
else assert Cin eq InputDistanceCache["B36_15_36_15"];end if;
S:=HullSource("BS011","B36_15",Gin,U,13,4,13,"exact",Vector(F,[0,0,0,w,0,0,0,1,w^2,0,0,w,0,0,0,0,w^2,w^2,w^2,w,0,0,0,0,w^2,w,0,1,0,w^2,0,w,0,0,0,0,0]));
S`PaperRows:=[51,192];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS011";
end for;
HullIncreasingExamples["BS011"]:=S;X4Sources["BS011"]:=S;
print "VERIFIED SOURCE BS011";

// H24: ingredient Q7.
Gin:=Matrix(F,11,33,[
1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,w,w^2,w,w,w,w^2,0,1,1,0,w,w,1,1,1,1,
0,1,0,0,0,0,0,0,0,0,0,w,1,0,0,0,1,0,w,w^2,w,w,1,w^2,0,1,1,0,w,w,1,1,1,
0,0,1,0,0,0,0,0,0,0,0,w,w,1,0,0,0,1,0,w,w^2,w,1,1,w^2,0,1,1,0,w,w,1,1,
0,0,0,1,0,0,0,0,0,0,0,w,w,w,1,0,0,0,1,0,w,w^2,1,1,1,w^2,0,1,1,0,w,w,1,
0,0,0,0,1,0,0,0,0,0,0,w^2,w,w,w,1,0,0,0,1,0,w,1,1,1,1,w^2,0,1,1,0,w,w,
0,0,0,0,0,1,0,0,0,0,0,w,w^2,w,w,w,1,0,0,0,1,0,w,1,1,1,1,w^2,0,1,1,0,w,
0,0,0,0,0,0,1,0,0,0,0,0,w,w^2,w,w,w,1,0,0,0,1,w,w,1,1,1,1,w^2,0,1,1,0,
0,0,0,0,0,0,0,1,0,0,0,1,0,w,w^2,w,w,w,1,0,0,0,0,w,w,1,1,1,1,w^2,0,1,1,
0,0,0,0,0,0,0,0,1,0,0,0,1,0,w,w^2,w,w,w,1,0,0,1,0,w,w,1,1,1,1,w^2,0,1,
0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,w,w^2,w,w,w,1,0,1,1,0,w,w,1,1,1,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,w,w^2,w,w,w,1,0,1,1,0,w,w,1,1,1,1,w^2]);
U:=Matrix(F,11,5,[
1,0,0,0,0,
w,w^2,w,w^2,w,
1,1,w^2,0,0,
w,1,w,w,w^2,
0,w,0,0,w,
0,0,0,w,w^2,
0,0,w,0,1,
0,1,0,1,0,
w^2,w,0,0,w,
1,w,1,w^2,w,
w^2,w^2,w^2,1,w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"Q7_33_11") then
assert MinimumWeight(Cin) ge 15;
InputDistanceCache["Q7_33_11"]:=Cin;
else assert Cin eq InputDistanceCache["Q7_33_11"];end if;
S:=HullSource("H24","Q7",Gin,U,15,5,15,"lower_bound",Vector(F,[]));
S`PaperRows:=[54];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="H24";
end for;
HullIncreasingExamples["H24"]:=S;X4Sources["H24"]:=S;
print "VERIFIED SOURCE H24";

// H25: ingredient Q27.
Gin:=Matrix(F,12,36,[
1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,w,w^2,1,w,w,w,0,w^2,w^2,1,0,w^2,1,0,1,w^2,0,0,0,w^2,w,
0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,1,0,w,w^2,1,w,w,w,0,w^2,w,1,0,w^2,1,0,1,w^2,0,0,0,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,w^2,w^2,1,1,0,w,w^2,1,w,w,w,0,w^2,w,1,0,w^2,1,0,1,w^2,0,0,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,w^2,1,1,0,w,w^2,1,w,w,w,0,w^2,w,1,0,w^2,1,0,1,w^2,0,0,
0,0,0,0,1,0,0,0,0,0,0,0,w,0,w^2,w^2,1,1,0,w,w^2,1,w,w,0,0,w^2,w,1,0,w^2,1,0,1,w^2,0,
0,0,0,0,0,1,0,0,0,0,0,0,w,w,0,w^2,w^2,1,1,0,w,w^2,1,w,0,0,0,w^2,w,1,0,w^2,1,0,1,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,w,w,w,0,w^2,w^2,1,1,0,w,w^2,1,w^2,0,0,0,w^2,w,1,0,w^2,1,0,1,
0,0,0,0,0,0,0,1,0,0,0,0,1,w,w,w,0,w^2,w^2,1,1,0,w,w^2,1,w^2,0,0,0,w^2,w,1,0,w^2,1,0,
0,0,0,0,0,0,0,0,1,0,0,0,w^2,1,w,w,w,0,w^2,w^2,1,1,0,w,0,1,w^2,0,0,0,w^2,w,1,0,w^2,1,
0,0,0,0,0,0,0,0,0,1,0,0,w,w^2,1,w,w,w,0,w^2,w^2,1,1,0,1,0,1,w^2,0,0,0,w^2,w,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,w,w^2,1,w,w,w,0,w^2,w^2,1,1,w^2,1,0,1,w^2,0,0,0,w^2,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,1,1,0,w,w^2,1,w,w,w,0,w^2,w^2,1,0,w^2,1,0,1,w^2,0,0,0,w^2,w,1]);
U:=Matrix(F,12,2,[
w^2,0,
1,0,
1,w^2,
0,w^2,
0,0,
1,w,
w^2,w,
1,w,
w^2,w,
0,0,
0,1,
w^2,1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"Q27_36_12") then
assert MinimumWeight(Cin) ge 15;
InputDistanceCache["Q27_36_12"]:=Cin;
else assert Cin eq InputDistanceCache["Q27_36_12"];end if;
S:=HullSource("H25","Q27",Gin,U,15,4,15,"lower_bound",Vector(F,[]));
S`PaperRows:=[55,201,204];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="H25";
end for;
HullIncreasingExamples["H25"]:=S;X4Sources["H25"]:=S;
print "VERIFIED SOURCE H25";

// B40_26_shorten13_s4: ingredient B40_26_shorten13.
Gin:=Matrix(F,25,39,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,0,w^2,0,w^2,w,0,w,1,w,1,w^2,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,w^2,0,w^2,w^2,w,0,w^2,0,w^2,1,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,1,1,w,w^2,w^2,w,w^2,0,w^2,w^2,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,1,1,w,w^2,w^2,w,w^2,0,w^2,w^2,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w,1,0,1,w,w^2,1,0,1,0,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w,1,0,1,w,w^2,1,0,1,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w,1,0,1,w,w^2,1,0,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,w^2,w,1,0,w,1,0,1,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,w^2,w^2,w,1,w^2,1,w,0,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,w^2,w^2,w,1,w^2,1,w,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,w^2,w^2,w,1,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,0,w,w^2,w,w,w^2,w^2,w,w^2,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,1,w^2,w,w,w,w^2,1,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,1,w^2,w,w,w,w^2,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,0,1,w^2,0,1,w^2,w,1,1,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,1,0,1,w^2,1,w,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,1,0,1,w^2,1,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,1,0,1,w^2,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,0,w,w^2,w,w,w^2,1,1,0,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,0,w,w^2,w,w,w^2,1,1,0,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,w,0,w,0,w^2,w,w,0,w,w,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,w,1,w^2,1,w^2,0,w^2,w,0,w,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,w,0,w,0,w^2,0,w^2,0,w,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,0,0,w,0,0,w^2,0,0,w^2,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,w,w,w,0,0,0,w^2,w^2,w^2,0,1,1]);
U:=Matrix(F,25,1,[
w,
0,
1,
1,
w,
1,
1,
w^2,
w,
w^2,
0,
w^2,
1,
1,
0,
1,
w^2,
w^2,
1,
w,
w,
0,
0,
0,
w]);
Cin:=LinearCode(Gin);
ParentG:=Matrix(F,26,40,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,0,w^2,0,w^2,w,0,w,1,w,1,w^2,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,w^2,0,w^2,w^2,w,0,w^2,0,w^2,1,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,1,1,w,w^2,w^2,w,w^2,0,w^2,w^2,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,1,1,w,w^2,w^2,w,w^2,0,w^2,w^2,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w,1,0,1,w,w^2,1,0,1,0,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w,1,0,1,w,w^2,1,0,1,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w,1,0,1,w,w^2,1,0,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,w^2,w,1,0,w,1,0,1,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,w^2,w^2,w,1,w^2,1,w,0,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,w^2,w^2,w,1,w^2,1,w,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,w^2,w^2,w,1,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,0,w,w^2,w,w,w^2,w^2,w,w^2,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,1,w^2,w,w,w,w^2,1,0,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,1,w^2,w,w,w,w^2,1,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,1,w^2,w,w,w,w^2,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,0,1,w^2,0,1,w^2,w,1,1,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,1,0,1,w^2,1,w,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,1,0,1,w^2,1,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,1,0,1,w^2,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,0,w,w^2,w,w,w^2,1,1,0,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,0,w,w^2,w,w,w^2,1,1,0,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,w,0,w,0,w^2,w,w,0,w,w,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,w,1,w^2,1,w^2,0,w^2,w,0,w,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,w,0,w,0,w^2,0,w^2,0,w,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,0,0,w,0,0,w^2,0,0,w^2,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,w,w,w,0,0,0,w^2,w^2,w^2,0,1,1]);
ParentCode:=LinearCode(ParentG);
DatabaseCode:=BestKnownLinearCode(F,40,26);assert ParentCode eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 8;
PreprocessCoordinates:=[13];Keep:=[j:j in [1..Ncols(ParentG)]|not j in PreprocessCoordinates];
PreG:=Matrix(Basis(Nullspace(SelectColumns(ParentG,PreprocessCoordinates))))*ParentG;
assert Cin eq LinearCode(SelectColumns(PreG,Keep));
S:=HullSource("B40_26_shorten13_s4","B40_26_shorten13",Gin,U,8,4,8,"exact",Vector(F,[0,0,0,0,0,w,0,0,0,0,0,0,w,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,w^2,w^2,1,0,0,0,0,0,0,0]));
S`Preprocessing:=<"shortening","B40_26",ParentG,PreprocessCoordinates>;
S`PaperRows:=[63];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B40_26_shorten13_s4";
end for;
HullIncreasingExamples["B40_26_shorten13_s4"]:=S;X4Sources["B40_26_shorten13_s4"]:=S;
print "VERIFIED SOURCE B40_26_shorten13_s4";

// B39_25_s2: ingredient B39_25.
Gin:=Matrix(F,25,39,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,w^2,0,w^2,w^2,w,0,w^2,0,w^2,1,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,1,1,w,w^2,w^2,w,w^2,0,w^2,w^2,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,1,1,w,w^2,w^2,w,w^2,0,w^2,w^2,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w,1,0,1,w,w^2,1,0,1,0,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w,1,0,1,w,w^2,1,0,1,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w,1,0,1,w,w^2,1,0,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,w^2,w,1,0,w,1,0,1,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,w^2,w^2,w,1,w^2,1,w,0,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,w^2,w^2,w,1,w^2,1,w,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,w^2,w^2,w,1,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,0,w,w^2,w,w,w^2,w^2,w,w^2,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,1,w^2,w,w,w,w^2,1,0,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,1,w^2,w,w,w,w^2,1,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,1,w^2,w,w,w,w^2,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,0,1,w^2,0,1,w^2,w,1,1,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,1,0,1,w^2,1,w,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,1,0,1,w^2,1,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,1,0,1,w^2,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,0,w,w^2,w,w,w^2,1,1,0,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,0,w,w^2,w,w,w^2,1,1,0,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,w,0,w,0,w^2,w,w,0,w,w,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,w,1,w^2,1,w^2,0,w^2,w,0,w,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,w,0,w,0,w^2,0,w^2,0,w,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,0,0,w,0,0,w^2,0,0,w^2,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,w,w,w,0,0,0,w^2,w^2,w^2,0,1,1]);
U:=Matrix(F,25,1,[
0,
w^2,
w^2,
1,
0,
0,
1,
0,
1,
1,
1,
w^2,
w^2,
0,
1,
0,
1,
0,
w^2,
0,
w^2,
1,
w^2,
0,
1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B39_25_39_25") then
DatabaseCode:=BestKnownLinearCode(F,39,25);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 8;
InputDistanceCache["B39_25_39_25"]:=Cin;
else assert Cin eq InputDistanceCache["B39_25_39_25"];end if;
S:=HullSource("B39_25_s2","B39_25",Gin,U,8,2,8,"exact",Vector(F,[0,0,0,0,0,w,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,0,0,w^2,0,w,0,0,0,w,w^2,0,0,0,w^2,0,w,0]));
S`PaperRows:=[64];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B39_25_s2";
end for;
HullIncreasingExamples["B39_25_s2"]:=S;X4Sources["B39_25_s2"]:=S;
print "VERIFIED SOURCE B39_25_s2";

// DV01: ingredient B40_14.
Gin:=Matrix(F,14,40,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,1,1,0,w,w^2,0,w^2,0,1,1,w,w,w,1,w,w,0,1,0,w,1,w,0,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w,w,w^2,1,w^2,1,w^2,1,w^2,w,w^2,w,1,1,0,w,1,w,w,1,w^2,0,w,w,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,1,1,w^2,0,1,1,1,1,0,1,w,w^2,0,w,1,w^2,1,1,w,0,0,1,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,1,1,w^2,1,1,1,1,1,0,1,w,w^2,0,w,1,w^2,1,1,w,0,0,1,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,1,w^2,0,1,1,0,w,1,w^2,1,w,w,1,0,w^2,0,1,w^2,1,0,1,0,1,1,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,1,w^2,0,1,1,w,w,1,w^2,1,w,w,1,0,w^2,0,1,w^2,1,0,1,0,1,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,w,w^2,0,w,0,w^2,0,w,1,1,w,0,0,0,w^2,1,1,w,1,w,1,w,0,w,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,0,w,0,w^2,w,1,w,0,0,1,w,1,1,1,1,0,0,0,w,w,w,0,1,1,w,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,0,w^2,1,w^2,0,1,w,w^2,0,0,w^2,w^2,w^2,w^2,0,w,w,0,w^2,w,0,1,w^2,1,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,0,w^2,1,w^2,w^2,1,w,w^2,0,0,w^2,w^2,w^2,w^2,0,w,w,0,w^2,w,0,1,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,1,1,w,w^2,w^2,0,w^2,w^2,w^2,w,0,w^2,1,w,w,0,w,1,w,1,0,w,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,1,1,w,w^2,w^2,1,w^2,w^2,w^2,w,0,w^2,1,w,w,0,w,1,w,1,0,w,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,1,w^2,w,w,w,w,w^2,1,1,w^2,0,1,1,w,0,1,w^2,1,w,w,w,0,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,1,1,0,w,1,0,w^2,0,1,1,w,w,w,1,w,w,0,1,0,w,1,w,0,w^2]);
U:=Matrix(F,14,1,[
0,
0,
w^2,
0,
0,
0,
0,
0,
1,
w^2,
0,
1,
1,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B40_14_40_14") then
DatabaseCode:=BestKnownLinearCode(F,40,14);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 16;
InputDistanceCache["B40_14_40_14"]:=Cin;
else assert Cin eq InputDistanceCache["B40_14_40_14"];end if;
S:=HullSource("DV01","B40_14",Gin,U,16,7,16,"exact",Vector(F,[0,0,0,w^2,1,0,0,0,w^2,0,0,w^2,0,0,0,w,w,0,0,w,0,1,1,0,0,0,0,w,0,w,1,1,0,0,0,0,1,w^2,0,w^2,0]));
S`PaperRows:=[65,211];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV01";
end for;
HullIncreasingExamples["DV01"]:=S;X4Sources["DV01"]:=S;
print "VERIFIED SOURCE DV01";

// H28: ingredient Q3.
Gin:=Matrix(F,16,40,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,w^2,w,w,w^2,1,w,0,w^2,w^2,w,1,w^2,w,w^2,0,1,0,w,w,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,1,w,w^2,w,w^2,0,1,w^2,w,1,1,w^2,1,1,w,0,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,1,w,w^2,w,w^2,0,1,w^2,w,1,1,w^2,1,1,w,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,1,w,w^2,w,w^2,0,1,w^2,w,1,1,w^2,1,1,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,0,1,1,0,1,w,w^2,w,w^2,0,1,w^2,w,1,1,w^2,1,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,w,0,w,w^2,0,w^2,0,w,1,1,w^2,0,w,w,w^2,w^2,1,w^2,1,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w,1,w,w,w^2,w^2,1,w^2,0,0,w,1,w,w,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,w,1,w,w,w^2,w^2,1,w^2,0,0,w,1,w,w,w^2,w^2,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,w^2,0,0,w,1,w,w,w^2,w^2,1,w^2,0,0,w,1,w,w,w^2,w^2,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,w^2,1,w^2,0,0,w,1,w,w,w^2,w^2,1,w^2,0,0,w,1,w,w,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,1,1,0,1,w^2,0,1,w,w,w,1,0,w,0,w^2,0,0,1,w,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,w^2,w,w^2,0,1,w^2,w,1,1,w^2,1,1,w,0,0,1,1,0,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,w,w^2,w,w^2,0,1,w^2,w,1,1,w^2,1,1,w,0,0,1,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,1,w,w^2,w,w^2,0,1,w^2,w,1,1,w^2,1,1,w,0,0,1,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,1,w,w^2,w,w^2,0,1,w^2,w,1,1,w^2,1,1,w,0,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,w,w,w^2,1,w,0,w^2,w^2,w,1,w^2,w,w^2,0,1,0,w,w,w,w^2]);
U:=Matrix(F,16,1,[
w^2,
w,
1,
1,
0,
1,
1,
0,
1,
w^2,
1,
w^2,
1,
0,
w^2,
w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"Q3_40_16") then
assert MinimumWeight(Cin) ge 15;
InputDistanceCache["Q3_40_16"]:=Cin;
else assert Cin eq InputDistanceCache["Q3_40_16"];end if;
S:=HullSource("H28","Q3",Gin,U,15,6,15,"lower_bound",Vector(F,[]));
S`PaperRows:=[66,202,206,207,208,212];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="H28";
end for;
HullIncreasingExamples["H28"]:=S;X4Sources["H28"]:=S;
print "VERIFIED SOURCE H28";

// H29: ingredient Q8.
Gin:=Matrix(F,15,45,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,w^2,w^2,0,1,1,w,w^2,0,1,1,0,w,0,0,1,0,0,1,w,0,0,w^2,w^2,0,w,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,w^2,w^2,0,1,1,w,w^2,0,1,1,1,w,0,0,1,0,0,1,w,0,0,w^2,w^2,0,w,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w^2,w^2,w^2,w^2,0,1,1,w,w^2,0,1,w,1,w,0,0,1,0,0,1,w,0,0,w^2,w^2,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,w^2,w^2,w^2,w^2,w^2,0,1,1,w,w^2,0,0,w,1,w,0,0,1,0,0,1,w,0,0,w^2,w^2,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,w^2,w^2,w^2,w^2,w^2,0,1,1,w,w^2,w^2,0,w,1,w,0,0,1,0,0,1,w,0,0,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,0,1,1,0,1,w^2,w^2,w^2,w^2,w^2,0,1,1,w,w^2,w^2,0,w,1,w,0,0,1,0,0,1,w,0,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,0,1,1,0,1,w^2,w^2,w^2,w^2,w^2,0,1,1,0,w^2,w^2,0,w,1,w,0,0,1,0,0,1,w,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,w,w^2,0,1,1,0,1,w^2,w^2,w^2,w^2,w^2,0,1,0,0,w^2,w^2,0,w,1,w,0,0,1,0,0,1,w,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,w,w^2,0,1,1,0,1,w^2,w^2,w^2,w^2,w^2,0,w,0,0,w^2,w^2,0,w,1,w,0,0,1,0,0,1,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,w,w^2,0,1,1,0,1,w^2,w^2,w^2,w^2,w^2,1,w,0,0,w^2,w^2,0,w,1,w,0,0,1,0,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,0,1,1,w,w^2,0,1,1,0,1,w^2,w^2,w^2,w^2,0,1,w,0,0,w^2,w^2,0,w,1,w,0,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,w^2,0,1,1,w,w^2,0,1,1,0,1,w^2,w^2,w^2,0,0,1,w,0,0,w^2,w^2,0,w,1,w,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,w^2,w^2,0,1,1,w,w^2,0,1,1,0,1,w^2,w^2,1,0,0,1,w,0,0,w^2,w^2,0,w,1,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,w^2,w^2,0,1,1,w,w^2,0,1,1,0,1,w^2,0,1,0,0,1,w,0,0,w^2,w^2,0,w,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,w^2,w^2,0,1,1,w,w^2,0,1,1,0,1,0,0,1,0,0,1,w,0,0,w^2,w^2,0,w,1,w]);
U:=Matrix(F,15,1,[
1,
1,
0,
w^2,
0,
0,
w,
1,
1,
w^2,
0,
0,
w,
0,
1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"Q8_45_15") then
assert MinimumWeight(Cin) ge 18;
InputDistanceCache["Q8_45_15"]:=Cin;
else assert Cin eq InputDistanceCache["Q8_45_15"];end if;
S:=HullSource("H29","Q8",Gin,U,18,5,18,"lower_bound",Vector(F,[]));
S`PaperRows:=[69,215];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="H29";
end for;
HullIncreasingExamples["H29"]:=S;X4Sources["H29"]:=S;
print "VERIFIED SOURCE H29";

// DV06: ingredient B47_26.
Gin:=Matrix(F,26,47,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w,1,w,1,1,0,w,w^2,w^2,w,1,w,w^2,1,0,w,0,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w,1,0,w^2,1,w,1,0,1,w,w^2,0,w^2,1,1,w^2,1,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,w,w,w^2,w^2,w,w^2,0,w^2,1,1,0,0,w^2,w^2,w^2,1,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,0,1,1,w^2,0,w^2,w,w^2,w^2,w,w,0,0,1,1,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,w^2,0,w^2,w,1,0,1,w,1,w^2,0,1,w,0,w,w^2,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,1,w^2,w,1,w,w^2,w^2,w,0,1,1,w,1,w,1,w^2,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,w^2,1,1,0,w,w,w^2,1,0,1,w,1,0,0,1,w,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,w^2,w^2,0,0,0,w^2,0,1,0,0,0,w^2,1,0,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,0,w,0,w^2,w,w^2,1,1,w^2,0,w,w^2,w,w^2,w^2,w^2,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,w^2,w,w,w,1,1,1,w,0,w,w^2,w^2,w^2,1,1,w^2,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w^2,w,w,w,0,w^2,1,w^2,1,w^2,0,w^2,1,1,1,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,w^2,w,w,0,0,0,0,0,0,w,w,w^2,w,1,w^2,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,0,w^2,w,1,w^2,0,w^2,1,1,w^2,w,1,0,w,1,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,0,w^2,w^2,0,w^2,1,1,w^2,0,w^2,w^2,0,0,w,w,w,1]);
U:=Matrix(F,26,1,[
1,
0,
w^2,
0,
w^2,
0,
w^2,
1,
w^2,
1,
1,
0,
1,
w,
w^2,
w^2,
1,
1,
1,
1,
0,
w,
w^2,
0,
1,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B47_26_47_26") then
DatabaseCode:=BestKnownLinearCode(F,47,26);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B47_26_47_26"]:=Cin;
else assert Cin eq InputDistanceCache["B47_26_47_26"];end if;
S:=HullSource("DV06","B47_26",Gin,U,12,3,12,"exact",Vector(F,[0,0,0,0,w,0,0,w,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,0,w,w,1,w^2,w,0,0,0,w^2,0,w,w^2,1,0,0,0,0,0,0,0]));
S`PaperRows:=[71,217,220];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV06";
end for;
HullIncreasingExamples["DV06"]:=S;X4Sources["DV06"]:=S;
print "VERIFIED SOURCE DV06";

// DV07: ingredient B47_26.
Gin:=Matrix(F,26,47,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w,1,w,1,1,0,w,w^2,w^2,w,1,w,w^2,1,0,w,0,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w,1,0,w^2,1,w,1,0,1,w,w^2,0,w^2,1,1,w^2,1,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,w,w,w^2,w^2,w,w^2,0,w^2,1,1,0,0,w^2,w^2,w^2,1,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,0,1,1,w^2,0,w^2,w,w^2,w^2,w,w,0,0,1,1,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,w^2,0,w^2,w,1,0,1,w,1,w^2,0,1,w,0,w,w^2,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,1,w^2,w,1,w,w^2,w^2,w,0,1,1,w,1,w,1,w^2,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,w^2,1,1,0,w,w,w^2,1,0,1,w,1,0,0,1,w,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,w^2,w^2,0,0,0,w^2,0,1,0,0,0,w^2,1,0,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,0,w,0,w^2,w,w^2,1,1,w^2,0,w,w^2,w,w^2,w^2,w^2,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,w^2,w,w,w,1,1,1,w,0,w,w^2,w^2,w^2,1,1,w^2,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w^2,w,w,w,0,w^2,1,w^2,1,w^2,0,w^2,1,1,1,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,w^2,w,w,0,0,0,0,0,0,w,w,w^2,w,1,w^2,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,0,w^2,w,1,w^2,0,w^2,1,1,w^2,w,1,0,w,1,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,0,w^2,w^2,0,w^2,1,1,w^2,0,w^2,w^2,0,0,w,w,w,1]);
U:=Matrix(F,26,2,[
0,1,
0,0,
0,w^2,
0,0,
w^2,w^2,
w^2,0,
w^2,w^2,
w,1,
w^2,w^2,
0,1,
w,1,
0,0,
w,1,
1,w,
w,w^2,
0,w^2,
1,1,
w^2,1,
0,1,
w,1,
0,0,
0,w,
0,w^2,
0,0,
w,1,
0,0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B47_26_47_26") then
DatabaseCode:=BestKnownLinearCode(F,47,26);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B47_26_47_26"]:=Cin;
else assert Cin eq InputDistanceCache["B47_26_47_26"];end if;
S:=HullSource("DV07","B47_26",Gin,U,12,4,12,"exact",Vector(F,[0,0,0,w^2,0,0,1,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,0,0,0,1,w,0,w^2,0,w,0,0,1,0,0,0,0,w^2,0,w^2,w^2,1,0,0,0,0]));
S`PaperRows:=[73,219,223];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV07";
end for;
HullIncreasingExamples["DV07"]:=S;X4Sources["DV07"]:=S;
print "VERIFIED SOURCE DV07";

// DV08: ingredient B47_26.
Gin:=Matrix(F,26,47,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w,1,w,1,1,0,w,w^2,w^2,w,1,w,w^2,1,0,w,0,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w,1,0,w^2,1,w,1,0,1,w,w^2,0,w^2,1,1,w^2,1,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,w,w,w^2,w^2,w,w^2,0,w^2,1,1,0,0,w^2,w^2,w^2,1,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,0,1,1,w^2,0,w^2,w,w^2,w^2,w,w,0,0,1,1,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,w^2,0,w^2,w,1,0,1,w,1,w^2,0,1,w,0,w,w^2,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,1,w^2,w,1,w,w^2,w^2,w,0,1,1,w,1,w,1,w^2,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,w^2,1,1,0,w,w,w^2,1,0,1,w,1,0,0,1,w,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,w^2,w^2,0,0,0,w^2,0,1,0,0,0,w^2,1,0,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,0,w,0,w^2,w,w^2,1,1,w^2,0,w,w^2,w,w^2,w^2,w^2,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,w^2,w,w,w,1,1,1,w,0,w,w^2,w^2,w^2,1,1,w^2,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w^2,w,w,w,0,w^2,1,w^2,1,w^2,0,w^2,1,1,1,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,w^2,w,w,0,0,0,0,0,0,w,w,w^2,w,1,w^2,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,0,w^2,w,1,w^2,0,w^2,1,1,w^2,w,1,0,w,1,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,0,w^2,w^2,0,w^2,1,1,w^2,0,w^2,w^2,0,0,w,w,w,1]);
U:=Matrix(F,26,3,[
w,0,1,
0,0,0,
1,0,w^2,
w,0,0,
w^2,w^2,w^2,
0,w^2,0,
0,w^2,w^2,
w^2,w,1,
0,w^2,w^2,
1,0,1,
w,w,1,
0,0,0,
w^2,w,1,
0,1,w,
0,w,w^2,
1,0,w^2,
1,1,1,
0,w^2,1,
w,0,1,
w^2,w,1,
0,0,0,
w^2,0,w,
1,0,w^2,
0,0,0,
w,w,1,
w,0,0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B47_26_47_26") then
DatabaseCode:=BestKnownLinearCode(F,47,26);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B47_26_47_26"]:=Cin;
else assert Cin eq InputDistanceCache["B47_26_47_26"];end if;
S:=HullSource("DV08","B47_26",Gin,U,12,5,12,"exact",Vector(F,[0,0,0,w^2,0,0,0,0,0,w,w^2,0,0,0,0,w,0,1,1,1,w,0,w,1,0,w,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,0,0,0,0,0]));
S`PaperRows:=[75,229];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV08";
end for;
HullIncreasingExamples["DV08"]:=S;X4Sources["DV08"]:=S;
print "VERIFIED SOURCE DV08";

// DV10: ingredient B49_27.
Gin:=Matrix(F,27,49,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,w,1,1,w^2,0,w,1,w,w^2,w,1,w^2,1,w^2,1,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,w,0,w^2,w^2,w^2,w,0,w,w,w^2,1,w,0,1,1,w,0,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w,1,1,w,1,w^2,w^2,w,0,w,w,1,w^2,1,w,0,w,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,1,0,w,0,1,w^2,0,0,w^2,1,1,w^2,w,0,w^2,w,w,0,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,w^2,1,1,0,w,w^2,w^2,w^2,0,0,w,w,w,w,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w,w^2,0,w,w^2,1,1,w^2,0,0,w^2,1,0,w,0,1,0,0,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,1,w^2,w,1,w,w^2,w^2,w,0,1,1,w,1,w,1,w^2,w,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,0,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,1,1,0,w,1,w^2,w,w,0,w,w^2,w^2,w^2,0,w,w^2,w^2,0,1,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w^2,w^2,w,w,0,1,w^2,w,w,0,w,1,1,0,w,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,w,w,w,1,w,w^2,w,0,1,w^2,w,w,1,w^2,w^2,0,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,w,w,w^2,0,w^2,0,w,w^2,w,0,1,w^2,w^2,w^2,w^2,w,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,0,w,w^2,w^2,w^2,w^2,0,0,0,0,1,w,w^2,w^2,w,w^2,1,0,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,0,1,0,w,w,w,w,1,1,1,w^2,0,w^2,0,w,1,w^2,w,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,1,w,w,1,w,1,w,w^2,1,1,w^2,0,0,1,1,1,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,0,0,0,w,w,w^2,1,w^2,0,1,w^2,w,0,w,0,1,1,w,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,0,1,1,w,w,w^2,1,w,w,1,w,w^2,1,1,0,w^2,1,w,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,0,w,1,w^2,w,w^2,1,0,1,w,w,1,w,w^2,w,w,1,0,w^2,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,0,w,0,w^2,0,w^2,w^2,w,0,w,w^2,w^2,0,w^2,0,w,0,0,w^2,1]);
U:=Matrix(F,27,1,[
0,
0,
w^2,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
w^2,
1,
w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B49_27_49_27") then
DatabaseCode:=BestKnownLinearCode(F,49,27);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B49_27_49_27"]:=Cin;
else assert Cin eq InputDistanceCache["B49_27_49_27"];end if;
S:=HullSource("DV10","B49_27",Gin,U,12,4,12,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,0,w,0,0,0,0,0,0,w,0,0,0,0,0,w,0,0,0,0,0,w,w^2,w^2,0,0,0,0,w,0,0,0,1,w,w^2,0,0,0,1,0,w^2,0]));
S`PaperRows:=[76,231];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV10";
end for;
HullIncreasingExamples["DV10"]:=S;X4Sources["DV10"]:=S;
print "VERIFIED SOURCE DV10";

// BS041: ingredient B49_29.
Gin:=Matrix(F,29,49,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,1,w^2,0,0,0,1,0,w^2,0,0,0,w^2,w^2,w,0,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,0,0,1,w,1,0,1,w^2,w,w,0,1,1,w^2,w^2,1,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w,1,w,1,1,0,w,w^2,w^2,w,1,w,w^2,1,0,w,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w,1,0,w^2,1,w,1,0,1,w,w^2,0,w^2,1,1,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,w,w,w^2,w^2,w,w^2,0,w^2,1,1,0,0,w^2,w^2,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,0,1,1,w^2,0,w^2,w,w^2,w^2,w,w,0,0,1,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,w^2,0,w^2,w,1,0,1,w,1,w^2,0,1,w,0,w,w^2,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,1,w^2,w,1,w,w^2,w^2,w,0,1,1,w,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,w^2,1,1,0,w,w,w^2,1,0,1,w,1,0,0,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,w^2,w^2,0,0,0,w^2,0,1,0,0,0,w^2,1,0,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,0,w,0,w^2,w,w^2,1,1,w^2,0,w,w^2,w,w^2,w^2,w^2,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,w^2,w,w,w,1,1,1,w,0,w,w^2,w^2,w^2,1,1,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w^2,w,w,w,0,w^2,1,w^2,1,w^2,0,w^2,1,1,1,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,w^2,w,w,0,0,0,0,0,0,w,w,w^2,w,1,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,0,w^2,w,1,w^2,0,w^2,1,1,w^2,w,1,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,0,w^2,w^2,0,w^2,1,1,w^2,0,w^2,w^2,0,0,w,w,w]);
U:=Matrix(F,29,1,[
0,
0,
w,
0,
0,
0,
0,
w^2,
w,
1,
1,
1,
0,
w,
0,
w^2,
w,
1,
w^2,
w^2,
1,
w^2,
w,
0,
w^2,
w^2,
0,
0,
1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B49_29_49_29") then
DatabaseCode:=BestKnownLinearCode(F,49,29);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 11;
InputDistanceCache["B49_29_49_29"]:=Cin;
else assert Cin eq InputDistanceCache["B49_29_49_29"];end if;
S:=HullSource("BS041","B49_29",Gin,U,11,5,11,"exact",Vector(F,[0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,0,0,0,0,0,0,0,w,w,1,0,0,w^2,0,0,w,0,1,0,0,w,0,1,0,0,0]));
S`PaperRows:=[77,224];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS041";
end for;
HullIncreasingExamples["BS041"]:=S;X4Sources["BS041"]:=S;
print "VERIFIED SOURCE BS041";

// DV11: ingredient B49_27.
Gin:=Matrix(F,27,49,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,w,1,1,w^2,0,w,1,w,w^2,w,1,w^2,1,w^2,1,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,w,0,w^2,w^2,w^2,w,0,w,w,w^2,1,w,0,1,1,w,0,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w,1,1,w,1,w^2,w^2,w,0,w,w,1,w^2,1,w,0,w,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,1,0,w,0,1,w^2,0,0,w^2,1,1,w^2,w,0,w^2,w,w,0,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,w^2,1,1,0,w,w^2,w^2,w^2,0,0,w,w,w,w,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w,w^2,0,w,w^2,1,1,w^2,0,0,w^2,1,0,w,0,1,0,0,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,1,w^2,w,1,w,w^2,w^2,w,0,1,1,w,1,w,1,w^2,w,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,0,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,1,1,0,w,1,w^2,w,w,0,w,w^2,w^2,w^2,0,w,w^2,w^2,0,1,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w^2,w^2,w,w,0,1,w^2,w,w,0,w,1,1,0,w,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,w,w,w,1,w,w^2,w,0,1,w^2,w,w,1,w^2,w^2,0,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,w,w,w^2,0,w^2,0,w,w^2,w,0,1,w^2,w^2,w^2,w^2,w,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,0,w,w^2,w^2,w^2,w^2,0,0,0,0,1,w,w^2,w^2,w,w^2,1,0,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,0,1,0,w,w,w,w,1,1,1,w^2,0,w^2,0,w,1,w^2,w,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,1,w,w,1,w,1,w,w^2,1,1,w^2,0,0,1,1,1,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,0,0,0,w,w,w^2,1,w^2,0,1,w^2,w,0,w,0,1,1,w,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,0,1,1,w,w,w^2,1,w,w,1,w,w^2,1,1,0,w^2,1,w,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,0,w,1,w^2,w,w^2,1,0,1,w,w,1,w,w^2,w,w,1,0,w^2,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,0,w,0,w^2,0,w^2,w^2,w,0,w,w^2,w^2,0,w^2,0,w,0,0,w^2,1]);
U:=Matrix(F,27,2,[
0,0,
1,0,
w^2,w^2,
w,0,
0,0,
w,0,
1,0,
0,0,
w^2,0,
1,0,
w^2,0,
w,0,
w^2,0,
0,0,
w^2,0,
0,0,
0,0,
w^2,0,
w^2,0,
1,0,
w,0,
0,0,
w,0,
w,0,
w^2,w^2,
w^2,1,
1,w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B49_27_49_27") then
DatabaseCode:=BestKnownLinearCode(F,49,27);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B49_27_49_27"]:=Cin;
else assert Cin eq InputDistanceCache["B49_27_49_27"];end if;
S:=HullSource("DV11","B49_27",Gin,U,12,5,12,"exact",Vector(F,[0,0,0,0,0,w^2,0,1,0,0,0,0,0,0,w,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,w^2,w,1,0,0,0,w^2,1,0,0,w^2,0,0]));
S`PaperRows:=[79,234];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV11";
end for;
HullIncreasingExamples["DV11"]:=S;X4Sources["DV11"]:=S;
print "VERIFIED SOURCE DV11";

// BS042: ingredient B50_29.
Gin:=Matrix(F,29,50,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,1,w^2,0,0,0,1,0,w^2,0,0,0,w^2,w^2,w,0,1,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,0,0,1,w,1,0,1,w^2,w,w,0,1,1,w^2,w^2,1,w^2,w,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w,1,w,1,1,0,w,w^2,w^2,w,1,w,w^2,1,0,w,0,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w,1,0,w^2,1,w,1,0,1,w,w^2,0,w^2,1,1,w^2,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,w,w,w^2,w^2,w,w^2,0,w^2,1,1,0,0,w^2,w^2,w^2,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,0,1,1,w^2,0,w^2,w,w^2,w^2,w,w,0,0,1,1,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,w^2,0,w^2,w,1,0,1,w,1,w^2,0,1,w,0,w,w^2,w^2,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,1,w^2,w,1,w,w^2,w^2,w,0,1,1,w,1,w,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,w^2,1,1,0,w,w,w^2,1,0,1,w,1,0,0,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,w^2,w^2,0,0,0,w^2,0,1,0,0,0,w^2,1,0,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,0,w,0,w^2,w,w^2,1,1,w^2,0,w,w^2,w,w^2,w^2,w^2,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,w^2,w,w,w,1,1,1,w,0,w,w^2,w^2,w^2,1,1,w^2,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w^2,w,w,w,0,w^2,1,w^2,1,w^2,0,w^2,1,1,1,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,w^2,w,w,0,0,0,0,0,0,w,w,w^2,w,1,w^2,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,0,w^2,w,1,w^2,0,w^2,1,1,w^2,w,1,0,w,1,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,0,w^2,w^2,0,w^2,1,1,w^2,0,w^2,w^2,0,0,w,w,w,1]);
U:=Matrix(F,29,1,[
0,
0,
1,
1,
0,
1,
w,
w,
1,
1,
1,
w,
1,
w,
1,
w^2,
w,
w,
0,
1,
0,
0,
0,
0,
w,
w,
w,
w,
w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B50_29_50_29") then
DatabaseCode:=BestKnownLinearCode(F,50,29);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B50_29_50_29"]:=Cin;
else assert Cin eq InputDistanceCache["B50_29_50_29"];end if;
S:=HullSource("BS042","B50_29",Gin,U,12,6,12,"exact",Vector(F,[0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,0,0,w^2,0,0,0,0,0,0,0,w^2,w^2,w,0,0,1,0,0,w^2,0,w,0,0,w^2,0,w,0,0,w^2,0,0]));
S`PaperRows:=[80,230];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS042";
end for;
HullIncreasingExamples["BS042"]:=S;X4Sources["BS042"]:=S;
print "VERIFIED SOURCE BS042";

// DV12: ingredient B49_27.
Gin:=Matrix(F,27,49,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,w,1,1,w^2,0,w,1,w,w^2,w,1,w^2,1,w^2,1,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,w,0,w^2,w^2,w^2,w,0,w,w,w^2,1,w,0,1,1,w,0,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w,1,1,w,1,w^2,w^2,w,0,w,w,1,w^2,1,w,0,w,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,1,0,w,0,1,w^2,0,0,w^2,1,1,w^2,w,0,w^2,w,w,0,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,w^2,1,1,0,w,w^2,w^2,w^2,0,0,w,w,w,w,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w,w^2,0,w,w^2,1,1,w^2,0,0,w^2,1,0,w,0,1,0,0,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,1,w^2,w,1,w,w^2,w^2,w,0,1,1,w,1,w,1,w^2,w,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,0,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,1,1,0,w,1,w^2,w,w,0,w,w^2,w^2,w^2,0,w,w^2,w^2,0,1,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w^2,w^2,w,w,0,1,w^2,w,w,0,w,1,1,0,w,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,w,w,w,1,w,w^2,w,0,1,w^2,w,w,1,w^2,w^2,0,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,w,w,w^2,0,w^2,0,w,w^2,w,0,1,w^2,w^2,w^2,w^2,w,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,0,w,w^2,w^2,w^2,w^2,0,0,0,0,1,w,w^2,w^2,w,w^2,1,0,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,0,1,0,w,w,w,w,1,1,1,w^2,0,w^2,0,w,1,w^2,w,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,1,w,w,1,w,1,w,w^2,1,1,w^2,0,0,1,1,1,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,0,0,0,w,w,w^2,1,w^2,0,1,w^2,w,0,w,0,1,1,w,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,0,1,1,w,w,w^2,1,w,w,1,w,w^2,1,1,0,w^2,1,w,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,0,w,1,w^2,w,w^2,1,0,1,w,w,1,w,w^2,w,w,1,0,w^2,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,0,w,0,w^2,0,w^2,w^2,w,0,w,w^2,w^2,0,w^2,0,w,0,0,w^2,1]);
U:=Matrix(F,27,3,[
0,0,0,
1,1,0,
0,w^2,w^2,
w,w,0,
0,0,0,
w,w,0,
w^2,1,0,
w^2,0,0,
w^2,w^2,0,
w^2,1,0,
w,w^2,0,
0,w,0,
1,w^2,0,
w,0,0,
1,w^2,0,
1,0,0,
1,0,0,
w^2,w^2,0,
1,w^2,0,
w^2,1,0,
1,w,0,
w,0,0,
w,w,0,
w,w,0,
w^2,w^2,w^2,
w^2,w^2,1,
0,1,w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B49_27_49_27") then
DatabaseCode:=BestKnownLinearCode(F,49,27);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B49_27_49_27"]:=Cin;
else assert Cin eq InputDistanceCache["B49_27_49_27"];end if;
S:=HullSource("DV12","B49_27",Gin,U,12,6,12,"exact",Vector(F,[0,0,0,0,0,w^2,0,1,0,0,0,0,0,0,w,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,w^2,w,1,0,0,0,w^2,1,0,0,w^2,0,0,0]));
S`PaperRows:=[81];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV12";
end for;
HullIncreasingExamples["DV12"]:=S;X4Sources["DV12"]:=S;
print "VERIFIED SOURCE DV12";

// DV14: ingredient B51_28.
Gin:=Matrix(F,28,51,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w^2,w,1,0,0,w^2,w^2,w^2,0,1,w^2,w^2,0,0,w^2,0,0,1,1,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,0,w,0,0,0,w,1,0,0,w,1,1,w^2,w,w^2,0,0,w,w,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,0,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,0,w,0,1,0,0,w,w,w,1,0,1,w^2,w^2,0,1,1,1,w^2,w,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,w,w^2,w,0,0,w,0,1,1,w^2,0,w^2,w^2,1,w^2,w,1,w^2,0,w,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,w^2,1,1,0,w,w^2,w^2,w^2,0,0,w,w,w,w,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,w^2,1,1,0,w,w^2,w^2,w^2,0,0,w,w,w,w,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,0,1,1,w^2,0,w^2,w,w^2,w^2,w,w,0,0,1,1,1,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w^2,w^2,1,0,0,0,1,w^2,0,w^2,1,w,w^2,w^2,1,0,0,w,0,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,1,w,w^2,0,0,0,0,0,w,w,1,0,1,w,w^2,w,w,0,w^2,0,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,0,1,0,0,w^2,w^2,0,1,w^2,0,w^2,1,1,0,w,w,w,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,w^2,w^2,0,0,0,w^2,0,1,0,0,0,w^2,1,0,w^2,w,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,w^2,0,0,w^2,w^2,1,0,w^2,w^2,w^2,0,0,1,w,w^2,w,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,w^2,0,w,0,0,0,w^2,1,w,w^2,1,w^2,w^2,0,w^2,w^2,w,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,w,0,w,0,0,1,1,w,w,w,0,0,w^2,w,w^2,w,w^2,0,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,0,0,w^2,0,0,w^2,w,0,w^2,1,w,w^2,0,0,w^2,w,w,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,w,0,0,0,w^2,0,w^2,0,w^2,w,w^2,0,w^2,1,w,0,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w^2,1,w^2,0,0,w^2,w^2,w,1,0,0,0,w,0,1,w,1,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,w,0,w^2,w^2,0,0,0,w^2,1,1,w,w,0,0,w,w^2,w^2,w,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,w,w,1,1,0,0,0,w,w,1,0,1,w^2,0,0,w,w^2,1,w^2,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w,1,0,0,w,0,0,w,w^2,w,w,1,0,1,w,w,1,w,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,1,w^2,w^2,w^2,w,0,0,1,w^2,w,1,w,w,1,1,w^2,1,0,w,1,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,1,w,w,w^2,w,0,0,0,1,w,0,w^2,w^2,w,1,1,1,0,0,w^2,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,w^2,w,w,0,0,0,0,0,0,w,w,w^2,w,1,w^2,0,0,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,1,1,w,w,w,0,0,w,w,1,0,1,0,0,w^2,0,1,w,0,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w,0,w,w^2,0,0,0,w,w^2,w^2,w,0,0,0,w^2,w,0,w,1,w^2,1]);
U:=Matrix(F,28,1,[
0,
w^2,
w,
1,
w^2,
w^2,
w^2,
1,
w^2,
w,
w,
w^2,
w,
1,
w,
w,
0,
1,
w^2,
0,
w^2,
1,
w,
w,
1,
w^2,
1,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B51_28_51_28") then
DatabaseCode:=BestKnownLinearCode(F,51,28);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B51_28_51_28"]:=Cin;
else assert Cin eq InputDistanceCache["B51_28_51_28"];end if;
S:=HullSource("DV14","B51_28",Gin,U,12,5,12,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,w,0,0,w^2,1,0,0,0,0,w^2,w,0,1,0,0,1,0,w,0,0,w^2,0,1,0]));
S`PaperRows:=[82];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV14";
end for;
HullIncreasingExamples["DV14"]:=S;X4Sources["DV14"]:=S;
print "VERIFIED SOURCE DV14";

// DV16: ingredient B52_39.
Gin:=Matrix(F,39,52,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,1,1,0,w,0,1,w^2,w^2,w,w^2,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,1,1,w,w,0,0,1,1,w^2,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,0,0,w,0,w^2,1,1,0,w,w,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,0,0,w,0,w^2,1,1,0,w,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,w,1,w,0,1,1,1,0,1,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,w,1,w,w,1,w^2,w,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,0,w^2,w^2,1,w^2,1,w,w^2,1,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,0,w^2,w^2,1,w^2,1,w,w^2,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,w^2,w^2,1,w,0,0,w^2,w,1,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,w^2,w^2,1,w,0,0,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,0,w^2,0,w,w,w,w^2,0,w^2,0,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,0,0,1,w^2,1,w^2,w^2,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,w,w^2,w,1,w,w^2,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,0,0,0,1,w^2,w^2,w,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,0,0,0,1,w^2,w^2,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,0,0,0,1,w^2,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w^2,1,1,w,1,w,1,w,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,w^2,1,w,w,0,w,w,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,w^2,1,w,w,0,w,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,w^2,1,w,w,0,w,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,1,w^2,w^2,0,w^2,1,w,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,1,w^2,w^2,0,w^2,1,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,1,w^2,w^2,0,w^2,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,1,w^2,w^2,w^2,w,1,0,w,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,w^2,w^2,0,0,1,1,1,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,w,1,w,1,w^2,1,0,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,w,w^2,w^2,0,1,0,w^2,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,w,w^2,w^2,0,1,0,w^2,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,0,1,0,1,w^2,1,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,0,1,0,1,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,w^2,w,0,1,1,w,1,1,0,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,1,1,w^2,1,1,0,w,w^2,1,w,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,1,w^2,1,0,0,0,w^2,w^2,w^2,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,1,w^2,1,0,0,0,w^2,w^2,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,w^2,0,1,0,0,1,w^2,1,w^2,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,1,1,0,w,1,1,w,w,1,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,w,1,w,w^2,1,w,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,w,w,0,w,w^2,0,1,w,1,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,0,w,w^2,w^2,w,w^2,0,w,w,w,w^2]);
U:=Matrix(F,39,1,[
1,
0,
1,
0,
w^2,
w,
w,
0,
0,
1,
w,
w^2,
0,
0,
0,
1,
1,
w,
w^2,
0,
w^2,
w,
w^2,
w,
w^2,
0,
w^2,
w,
w^2,
w^2,
0,
w^2,
1,
0,
0,
0,
1,
0,
w]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B52_39_52_39") then
DatabaseCode:=BestKnownLinearCode(F,52,39);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 7;
InputDistanceCache["B52_39_52_39"]:=Cin;
else assert Cin eq InputDistanceCache["B52_39_52_39"];end if;
S:=HullSource("DV16","B52_39",Gin,U,7,2,7,"exact",Vector(F,[0,0,0,0,0,0,0,w,w,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,0,0,0,0,0,w^2,0,0]));
S`PaperRows:=[84];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV16";
end for;
HullIncreasingExamples["DV16"]:=S;X4Sources["DV16"]:=S;
print "VERIFIED SOURCE DV16";

// DV18: ingredient B53_39.
Gin:=Matrix(F,39,53,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,1,w,0,w,w^2,1,0,0,w,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,1,w,0,w,w,w^2,w^2,0,w,w^2,1,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,1,w,w^2,w,1,w,0,w^2,1,w,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,1,w,w^2,w,1,w,0,w^2,1,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,1,w,w^2,w,1,1,w^2,0,w,0,w,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,1,0,w^2,0,w,w^2,1,w,1,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,1,w^2,w,0,0,1,1,0,w,w^2,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,1,w^2,w,0,0,1,1,0,w,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,0,w^2,w,w^2,1,1,w^2,w,w,1,w^2,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,w^2,0,0,w,0,0,w,0,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,w^2,0,0,w,0,0,w,0,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,1,w,0,0,w^2,w^2,w^2,w^2,1,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,1,w,0,0,w^2,w^2,w^2,w^2,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w,w^2,0,w,1,w,w,w,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,w^2,w,0,0,1,0,1,1,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,w^2,w,0,0,1,0,1,1,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,w^2,w^2,0,w,w^2,1,w,w^2,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,w^2,w^2,0,w,w^2,1,w,w^2,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,w^2,w^2,0,w,w^2,1,w,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w^2,w,1,w^2,1,w^2,0,1,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w^2,w,1,w^2,1,w^2,0,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,1,0,w,w,0,1,0,w,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,1,1,w,w^2,w,0,1,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w^2,w,0,1,w^2,1,w^2,1,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,w^2,w^2,0,0,1,0,w,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w,w,0,w^2,w^2,1,w,w^2,1,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w,w,1,0,0,w,w,1,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w,w,1,0,0,w,w,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w,w,1,0,0,w,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w,w,1,0,0,w,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,w^2,0,0,w^2,0,w^2,w^2,0,0,1,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,w^2,0,0,w^2,0,w^2,w^2,0,0,1,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,w^2,0,0,w^2,0,w^2,w^2,0,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,w^2,0,1,w^2,1,0,w,w,w,w,1,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w^2,w^2,0,1,0,1,w^2,w^2,1,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,1,w^2,w^2,0,w,0,w,w,0,w,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,1,w^2,w^2,1,w,1,0,w^2,1,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,0,0,1,w^2,1,1,0,w,w,1,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,0,0,1,0,1,w,1,1,1,w,w,1]);
U:=Matrix(F,39,1,[
w,
0,
0,
w,
1,
1,
0,
w,
w,
0,
0,
0,
1,
w^2,
w,
w^2,
w^2,
w,
w,
w,
w^2,
0,
w^2,
1,
w^2,
0,
w,
1,
0,
w^2,
w^2,
w^2,
w,
0,
0,
0,
1,
w^2,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B53_39_53_39") then
DatabaseCode:=BestKnownLinearCode(F,53,39);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 8;
InputDistanceCache["B53_39_53_39"]:=Cin;
else assert Cin eq InputDistanceCache["B53_39_53_39"];end if;
S:=HullSource("DV18","B53_39",Gin,U,8,3,8,"exact",Vector(F,[0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,0,0,0,0,w^2,w,0]));
S`PaperRows:=[86,241];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV18";
end for;
HullIncreasingExamples["DV18"]:=S;X4Sources["DV18"]:=S;
print "VERIFIED SOURCE DV18";

// BS052: ingredient B57_31.
Gin:=Matrix(F,31,57,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,0,w,w^2,w,1,1,0,1,0,1,w^2,0,w^2,w^2,w,w,w,1,w^2,w^2,w,w^2,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,0,0,w,1,w^2,w,0,w,w,0,1,w,0,w,1,1,0,w^2,1,0,0,w^2,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,0,0,1,w^2,w,0,w^2,w^2,w,0,w^2,w,w,1,0,w,w,w^2,0,1,w,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,0,0,1,w^2,w,0,w^2,w^2,w,0,w^2,w,w,1,0,w,w,w^2,0,1,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w^2,0,w,1,w^2,w^2,0,w^2,w,w^2,w^2,1,0,0,w^2,0,0,w^2,w,0,1,w^2,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w^2,0,w,1,w^2,w^2,0,w^2,w,w^2,w^2,1,0,0,w^2,0,0,w^2,w,0,1,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,w,w^2,w,w^2,w,w,1,w^2,w^2,w,w,w^2,0,w,w^2,1,1,0,0,1,1,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,w^2,w,1,w^2,0,w^2,0,w,w^2,w^2,w^2,w,w,w,1,1,0,1,w^2,w^2,0,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,0,w^2,0,0,0,1,1,w^2,w,w^2,w,w^2,w^2,0,1,w^2,0,0,w,0,w,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,w^2,w^2,0,w,w^2,w,w^2,0,w^2,w^2,w,0,w,0,w,w,0,0,0,w,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w,w^2,w^2,w,w^2,0,w^2,1,w^2,w^2,w^2,w^2,0,w^2,w,1,0,1,0,w^2,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,0,w,w^2,0,0,w,w,0,0,w^2,w^2,1,w^2,w,0,w^2,w,w,1,1,w,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,1,1,0,w,w,w^2,w,1,w^2,w,0,w^2,0,1,0,w^2,w,w,1,w,w^2,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w^2,1,0,w^2,1,1,1,0,1,w,0,0,0,w,1,1,w^2,1,1,0,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w^2,1,0,w^2,1,1,1,0,1,w,0,0,0,w,1,1,w^2,1,1,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w^2,1,0,w^2,1,1,1,0,1,w,0,0,0,w,1,1,w^2,1,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,w,w^2,w,0,w^2,1,1,w,0,1,0,w^2,w,w,w^2,1,1,w^2,1,w,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,w^2,w,w^2,0,1,0,0,w^2,1,0,1,1,w^2,w^2,0,0,w^2,0,w^2,w,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,w^2,w,0,w,0,w,w^2,w,1,0,w^2,1,1,0,1,w^2,1,0,w,w^2,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,w,1,0,1,w^2,w^2,w^2,0,w^2,w^2,1,w,1,w^2,w^2,w,0,w,0,0,1,w,0,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w^2,0,1,w,0,1,w^2,w,1,1,w,w,w^2,0,w^2,w,w^2,w^2,0,w^2,0,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,w^2,w^2,w^2,w^2,0,w,0,1,w^2,0,w^2,1,1,0,w,1,w^2,w,1,1,w^2,1,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,w^2,w^2,w^2,w^2,0,w,0,1,w^2,0,w^2,1,1,0,w,1,w^2,w,1,1,w^2,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,0,w,1,w^2,w^2,w,w^2,0,w^2,0,1,0,w^2,w,1,w^2,w^2,w^2,w,1,1,w^2,1,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,0,1,1,w^2,1,w^2,0,1,1,w^2,1,0,w,w,0,1,0,1,w^2,1,w,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,0,1,1,w^2,1,w^2,0,1,1,w^2,1,0,w,w,0,1,0,1,w^2,1,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,0,1,1,w^2,1,w^2,0,1,1,w^2,1,0,w,w,0,1,0,1,w^2,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,0,1,1,w^2,1,w^2,0,1,1,w^2,1,0,w,w,0,1,0,1,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,w,1,w^2,1,w,w^2,0,0,1,0,1,w,w^2,w,1,0,w^2,w^2,1,w,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,w,1,w^2,1,w,w^2,0,0,1,0,1,w,w^2,w,1,0,w^2,w^2,1,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,w,1,w^2,1,w,w^2,0,0,1,0,1,w,w^2,w,1,0,w^2,w^2,1,w,w^2]);
U:=Matrix(F,31,1,[
w,
w,
0,
0,
0,
0,
w^2,
1,
0,
0,
1,
w^2,
1,
0,
w,
0,
1,
w^2,
w^2,
w,
w^2,
1,
w,
1,
w,
w,
w^2,
1,
1,
w^2,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B57_31_57_31") then
DatabaseCode:=BestKnownLinearCode(F,57,31);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 14;
InputDistanceCache["B57_31_57_31"]:=Cin;
else assert Cin eq InputDistanceCache["B57_31_57_31"];end if;
S:=HullSource("BS052","B57_31",Gin,U,14,16,14,"exact",Vector(F,[0,0,0,0,0,1,0,w^2,0,w^2,0,1,0,0,0,0,w^2,w,0,w,0,0,1,0,0,w,0,0,w,w^2,0,0,0,0,0,0,0,0,0,w,0,0,0,0,w,0,0,0,0,0,0,0,1,0,0,0,0,0]));
S`PaperRows:=[91,222];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS052";
end for;
HullIncreasingExamples["BS052"]:=S;X4Sources["BS052"]:=S;
print "VERIFIED SOURCE BS052";

// BS077: ingredient B57_31.
Gin:=Matrix(F,31,57,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,0,w,w^2,w,1,1,0,1,0,1,w^2,0,w^2,w^2,w,w,w,1,w^2,w^2,w,w^2,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,0,0,w,1,w^2,w,0,w,w,0,1,w,0,w,1,1,0,w^2,1,0,0,w^2,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,0,0,1,w^2,w,0,w^2,w^2,w,0,w^2,w,w,1,0,w,w,w^2,0,1,w,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,0,0,1,w^2,w,0,w^2,w^2,w,0,w^2,w,w,1,0,w,w,w^2,0,1,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w^2,0,w,1,w^2,w^2,0,w^2,w,w^2,w^2,1,0,0,w^2,0,0,w^2,w,0,1,w^2,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w^2,0,w,1,w^2,w^2,0,w^2,w,w^2,w^2,1,0,0,w^2,0,0,w^2,w,0,1,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,w,w^2,w,w^2,w,w,1,w^2,w^2,w,w,w^2,0,w,w^2,1,1,0,0,1,1,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,w^2,w,1,w^2,0,w^2,0,w,w^2,w^2,w^2,w,w,w,1,1,0,1,w^2,w^2,0,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,0,w^2,0,0,0,1,1,w^2,w,w^2,w,w^2,w^2,0,1,w^2,0,0,w,0,w,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,w^2,w^2,0,w,w^2,w,w^2,0,w^2,w^2,w,0,w,0,w,w,0,0,0,w,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w,w^2,w^2,w,w^2,0,w^2,1,w^2,w^2,w^2,w^2,0,w^2,w,1,0,1,0,w^2,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,0,w,w^2,0,0,w,w,0,0,w^2,w^2,1,w^2,w,0,w^2,w,w,1,1,w,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,1,1,0,w,w,w^2,w,1,w^2,w,0,w^2,0,1,0,w^2,w,w,1,w,w^2,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w^2,1,0,w^2,1,1,1,0,1,w,0,0,0,w,1,1,w^2,1,1,0,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w^2,1,0,w^2,1,1,1,0,1,w,0,0,0,w,1,1,w^2,1,1,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w^2,1,0,w^2,1,1,1,0,1,w,0,0,0,w,1,1,w^2,1,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,w,w^2,w,0,w^2,1,1,w,0,1,0,w^2,w,w,w^2,1,1,w^2,1,w,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,w^2,w,w^2,0,1,0,0,w^2,1,0,1,1,w^2,w^2,0,0,w^2,0,w^2,w,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,w^2,w,0,w,0,w,w^2,w,1,0,w^2,1,1,0,1,w^2,1,0,w,w^2,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,w,1,0,1,w^2,w^2,w^2,0,w^2,w^2,1,w,1,w^2,w^2,w,0,w,0,0,1,w,0,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w^2,0,1,w,0,1,w^2,w,1,1,w,w,w^2,0,w^2,w,w^2,w^2,0,w^2,0,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,w^2,w^2,w^2,w^2,0,w,0,1,w^2,0,w^2,1,1,0,w,1,w^2,w,1,1,w^2,1,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,w^2,w^2,w^2,w^2,0,w,0,1,w^2,0,w^2,1,1,0,w,1,w^2,w,1,1,w^2,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,0,w,1,w^2,w^2,w,w^2,0,w^2,0,1,0,w^2,w,1,w^2,w^2,w^2,w,1,1,w^2,1,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,0,1,1,w^2,1,w^2,0,1,1,w^2,1,0,w,w,0,1,0,1,w^2,1,w,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,0,1,1,w^2,1,w^2,0,1,1,w^2,1,0,w,w,0,1,0,1,w^2,1,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,0,1,1,w^2,1,w^2,0,1,1,w^2,1,0,w,w,0,1,0,1,w^2,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,0,1,1,w^2,1,w^2,0,1,1,w^2,1,0,w,w,0,1,0,1,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,w,1,w^2,1,w,w^2,0,0,1,0,1,w,w^2,w,1,0,w^2,w^2,1,w,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,w,1,w^2,1,w,w^2,0,0,1,0,1,w,w^2,w,1,0,w^2,w^2,1,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,w,1,w^2,1,w,w^2,0,0,1,0,1,w,w^2,w,1,0,w^2,w^2,1,w,w^2]);
U:=Matrix(F,31,2,[
1,w,
1,w,
0,0,
w,0,
0,0,
0,0,
1,w^2,
w,1,
w^2,0,
0,0,
w^2,1,
w^2,w^2,
0,1,
1,0,
1,w,
w^2,0,
0,1,
1,w^2,
w^2,w^2,
1,w,
w^2,w^2,
w,1,
w,w,
1,1,
w^2,w,
w^2,w,
w^2,w^2,
1,1,
1,1,
1,w^2,
w,0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B57_31_57_31") then
DatabaseCode:=BestKnownLinearCode(F,57,31);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 14;
InputDistanceCache["B57_31_57_31"]:=Cin;
else assert Cin eq InputDistanceCache["B57_31_57_31"];end if;
S:=HullSource("BS077","B57_31",Gin,U,14,17,14,"exact",Vector(F,[0,0,0,0,0,1,0,w^2,0,w^2,0,1,0,0,0,0,w^2,w,0,w,0,0,1,0,0,w,0,0,w,w^2,0,0,0,0,0,0,0,0,0,w,0,0,0,0,w,0,0,0,0,0,0,0,1,0,0,0,0,0,0]));
S`PaperRows:=[94,227];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS077";
end for;
HullIncreasingExamples["BS077"]:=S;X4Sources["BS077"]:=S;
print "VERIFIED SOURCE BS077";

// BS078: ingredient B57_31.
Gin:=Matrix(F,31,57,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,0,w,w^2,w,1,1,0,1,0,1,w^2,0,w^2,w^2,w,w,w,1,w^2,w^2,w,w^2,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,0,0,w,1,w^2,w,0,w,w,0,1,w,0,w,1,1,0,w^2,1,0,0,w^2,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,0,0,1,w^2,w,0,w^2,w^2,w,0,w^2,w,w,1,0,w,w,w^2,0,1,w,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,0,0,1,w^2,w,0,w^2,w^2,w,0,w^2,w,w,1,0,w,w,w^2,0,1,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w^2,0,w,1,w^2,w^2,0,w^2,w,w^2,w^2,1,0,0,w^2,0,0,w^2,w,0,1,w^2,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w^2,0,w,1,w^2,w^2,0,w^2,w,w^2,w^2,1,0,0,w^2,0,0,w^2,w,0,1,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,w,w^2,w,w^2,w,w,1,w^2,w^2,w,w,w^2,0,w,w^2,1,1,0,0,1,1,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,w^2,w,1,w^2,0,w^2,0,w,w^2,w^2,w^2,w,w,w,1,1,0,1,w^2,w^2,0,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,0,w^2,0,0,0,1,1,w^2,w,w^2,w,w^2,w^2,0,1,w^2,0,0,w,0,w,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,w^2,w^2,0,w,w^2,w,w^2,0,w^2,w^2,w,0,w,0,w,w,0,0,0,w,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w,w^2,w^2,w,w^2,0,w^2,1,w^2,w^2,w^2,w^2,0,w^2,w,1,0,1,0,w^2,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,0,w,w^2,0,0,w,w,0,0,w^2,w^2,1,w^2,w,0,w^2,w,w,1,1,w,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,1,1,0,w,w,w^2,w,1,w^2,w,0,w^2,0,1,0,w^2,w,w,1,w,w^2,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w^2,1,0,w^2,1,1,1,0,1,w,0,0,0,w,1,1,w^2,1,1,0,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w^2,1,0,w^2,1,1,1,0,1,w,0,0,0,w,1,1,w^2,1,1,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w^2,1,0,w^2,1,1,1,0,1,w,0,0,0,w,1,1,w^2,1,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,w,w^2,w,0,w^2,1,1,w,0,1,0,w^2,w,w,w^2,1,1,w^2,1,w,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,w^2,w,w^2,0,1,0,0,w^2,1,0,1,1,w^2,w^2,0,0,w^2,0,w^2,w,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,w^2,w,0,w,0,w,w^2,w,1,0,w^2,1,1,0,1,w^2,1,0,w,w^2,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,w,1,0,1,w^2,w^2,w^2,0,w^2,w^2,1,w,1,w^2,w^2,w,0,w,0,0,1,w,0,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w^2,0,1,w,0,1,w^2,w,1,1,w,w,w^2,0,w^2,w,w^2,w^2,0,w^2,0,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,w^2,w^2,w^2,w^2,0,w,0,1,w^2,0,w^2,1,1,0,w,1,w^2,w,1,1,w^2,1,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,w^2,w^2,w^2,w^2,0,w,0,1,w^2,0,w^2,1,1,0,w,1,w^2,w,1,1,w^2,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,0,w,1,w^2,w^2,w,w^2,0,w^2,0,1,0,w^2,w,1,w^2,w^2,w^2,w,1,1,w^2,1,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,0,1,1,w^2,1,w^2,0,1,1,w^2,1,0,w,w,0,1,0,1,w^2,1,w,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,0,1,1,w^2,1,w^2,0,1,1,w^2,1,0,w,w,0,1,0,1,w^2,1,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,0,1,1,w^2,1,w^2,0,1,1,w^2,1,0,w,w,0,1,0,1,w^2,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,0,1,1,w^2,1,w^2,0,1,1,w^2,1,0,w,w,0,1,0,1,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,w,1,w^2,1,w,w^2,0,0,1,0,1,w,w^2,w,1,0,w^2,w^2,1,w,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,w,1,w^2,1,w,w^2,0,0,1,0,1,w,w^2,w,1,0,w^2,w^2,1,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,w,1,w^2,1,w,w^2,0,0,1,0,1,w,w^2,w,1,0,w^2,w^2,1,w,w^2]);
U:=Matrix(F,31,3,[
w,1,w,
w,1,w,
0,0,0,
0,w,0,
0,0,0,
w,0,0,
w^2,1,w^2,
w,w,1,
0,w^2,0,
0,0,0,
1,w^2,1,
w^2,w^2,w^2,
1,0,1,
0,1,0,
w,1,w,
0,w^2,0,
w,0,1,
1,1,w^2,
w^2,w^2,w^2,
w^2,1,w,
w^2,w^2,w^2,
0,w,1,
0,w,w,
w^2,1,1,
1,w^2,w,
0,w^2,w,
w^2,w^2,w^2,
0,1,1,
w^2,1,1,
0,1,w^2,
w^2,w,0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B57_31_57_31") then
DatabaseCode:=BestKnownLinearCode(F,57,31);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 14;
InputDistanceCache["B57_31_57_31"]:=Cin;
else assert Cin eq InputDistanceCache["B57_31_57_31"];end if;
S:=HullSource("BS078","B57_31",Gin,U,14,18,14,"exact",Vector(F,[0,0,0,0,0,w,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,0,0,0,w,w^2,0,0,0,0,0,1,0,0,1,w,1,0,0,0,1,0,w,0,w,1,w,0,0,0,0,0,0,0,0,1,0,0,0]));
S`PaperRows:=[97,233];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS078";
end for;
HullIncreasingExamples["BS078"]:=S;X4Sources["BS078"]:=S;
print "VERIFIED SOURCE BS078";

// BS089: ingredient B59_32.
Gin:=Matrix(F,32,59,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,w,1,w^2,w^2,w,1,w^2,0,0,1,1,0,w,w,1,0,w^2,1,w^2,0,w^2,w,w^2,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,1,1,1,0,1,w,w,w^2,w^2,w^2,w^2,0,w^2,w,1,w,0,0,w^2,w,1,0,1,w,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,1,0,1,0,w^2,1,w^2,w,w,w,0,1,1,w^2,w^2,0,w,1,w^2,1,0,0,1,w^2,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,w^2,0,w^2,1,w^2,w^2,w^2,0,0,w^2,w^2,w^2,1,1,1,0,0,0,0,w,w,w,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,0,1,w^2,1,0,1,w,w^2,w,1,w^2,1,w,w^2,0,0,1,1,w^2,w,w,w^2,w^2,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,0,1,w^2,1,0,1,w,w^2,w,1,w^2,1,w,w^2,0,0,1,1,w^2,w,w,w^2,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,1,0,w^2,w,1,w,1,0,1,w^2,w,1,1,0,1,0,w,0,w,0,0,0,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,1,0,w^2,w,1,w,1,0,1,w^2,w,1,1,0,1,0,w,0,w,0,0,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,1,0,w^2,w,1,w,1,0,1,w^2,w,1,1,0,1,0,w,0,w,0,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,1,0,w^2,w,1,w,1,0,1,w^2,w,1,1,0,1,0,w,0,w,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,1,0,w^2,w,1,w,1,0,1,w^2,w,1,1,0,1,0,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w^2,1,1,0,w,w^2,0,0,w,w^2,w,0,0,0,0,w,w,0,w,w,w^2,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w,w,1,0,w^2,w,w,0,1,w^2,0,0,1,0,1,1,w,w^2,w^2,0,0,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,0,1,w,w,w,w^2,1,w,w^2,w,1,1,w^2,1,w^2,w,1,1,1,w,1,w^2,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,1,w^2,1,1,0,w,0,1,1,0,0,0,w,w^2,w,0,w,w,w^2,0,w^2,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,1,w^2,1,1,0,w,0,1,1,0,0,0,w,w^2,w,0,w,w,w^2,0,w^2,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,1,w^2,1,1,0,w,0,1,1,0,0,0,w,w^2,w,0,w,w,w^2,0,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,1,1,w,0,0,1,0,0,w^2,1,w,w^2,1,0,1,w^2,w^2,w^2,w^2,0,0,w,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w^2,w,1,1,w,0,w,0,w^2,0,w^2,w^2,0,1,w^2,w,w^2,0,1,w,1,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w^2,w,1,1,w,0,w,0,w^2,0,w^2,w^2,0,1,w^2,w,w^2,0,1,w,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,w,1,w^2,w^2,w^2,1,w^2,1,1,0,1,w^2,1,1,0,w^2,w^2,w,w^2,1,1,1,0,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w,w,w^2,w,w,w^2,0,1,1,0,0,w^2,0,0,w,w,w,w,w,w^2,w^2,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w,w,w^2,w,w,w^2,0,1,1,0,0,w^2,0,0,w,w,w,w,w,w^2,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w,w,w^2,w,w,w^2,0,1,1,0,0,w^2,0,0,w,w,w,w,w,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,w,w^2,1,w,w^2,1,0,w^2,1,w,0,w^2,w^2,0,w^2,0,0,w^2,0,1,0,w^2,w^2,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,1,w^2,0,0,w,w,w,0,w,1,w^2,1,0,1,1,w^2,1,1,w^2,1,w,w,1,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,0,0,0,1,0,w^2,1,w,1,w,0,w,w,w,0,1,w,0,1,w,w,0,0,0,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,0,1,w^2,1,1,1,0,1,w^2,1,w^2,1,1,0,w^2,0,0,w^2,0,0,1,0,w,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,1,w^2,w^2,0,1,w,w^2,0,w,w^2,w,0,w^2,0,w^2,w^2,w^2,w^2,w^2,w^2,w,0,1,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,1,w^2,w^2,0,1,w,w^2,0,w,w^2,w,0,w^2,0,w^2,w^2,w^2,w^2,w^2,w^2,w,0,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,w^2,w,w,w^2,1,w,w,w,0,w^2,w,1,w,w,0,w,w,w^2,w,0,1,0,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,1,w,0,w,1,0,w,0,w,w,1,w^2,w,0,w,w,0,w,1,w^2,w^2,w,w,w^2,w^2]);
U:=Matrix(F,32,1,[
0,
w^2,
w,
w^2,
w^2,
1,
w^2,
0,
w,
0,
w,
1,
0,
0,
0,
1,
w^2,
w^2,
1,
0,
0,
w,
w^2,
1,
0,
w,
0,
1,
w^2,
1,
0,
1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B59_32_59_32") then
DatabaseCode:=BestKnownLinearCode(F,59,32);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 14;
InputDistanceCache["B59_32_59_32"]:=Cin;
else assert Cin eq InputDistanceCache["B59_32_59_32"];end if;
S:=HullSource("BS089","B59_32",Gin,U,14,15,14,"exact",Vector(F,[0,0,0,0,0,0,0,w,0,0,0,0,0,w^2,0,0,w,w^2,1,w,w^2,w^2,w^2,0,w,0,0,0,0,0,0,1,0,0,0,w^2,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0]));
S`PaperRows:=[98,236];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS089";
end for;
HullIncreasingExamples["BS089"]:=S;X4Sources["BS089"]:=S;
print "VERIFIED SOURCE BS089";

// BS090: ingredient B60_32.
Gin:=Matrix(F,32,60,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,1,0,w^2,1,1,1,0,0,w,0,w^2,1,0,w^2,1,1,w,w^2,0,w^2,1,w^2,1,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,w,w,w,0,w^2,w^2,w,w^2,0,w,1,0,0,0,1,0,1,1,1,w^2,1,1,w,0,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,w,w,w,0,w^2,w^2,w,w^2,0,w,1,0,0,0,1,0,1,1,1,w^2,1,1,w,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,w,w,w,0,w^2,w^2,w,w^2,0,w,1,0,0,0,1,0,1,1,1,w^2,1,1,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,w,0,0,w,w,0,w^2,1,w^2,0,0,0,1,0,1,w^2,0,1,w^2,1,0,w^2,0,w,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,w,0,0,w,w,0,w^2,1,w^2,0,0,0,1,0,1,w^2,0,1,w^2,1,0,w^2,0,w,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,0,1,1,0,0,0,1,w,w^2,w^2,0,0,w^2,1,0,w^2,1,w^2,w^2,1,w,w^2,w^2,0,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,1,0,w^2,1,0,1,w,0,w,w,1,0,w,0,w,w,w^2,1,1,w^2,w,w^2,1,1,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,0,1,1,w^2,1,w^2,0,1,0,1,w^2,1,1,0,w,w^2,w,w^2,0,1,1,1,w,0,w^2,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,0,0,0,1,w^2,w,w,w^2,1,w^2,0,w^2,0,w^2,w,w^2,w^2,w,w,0,w^2,w,0,w^2,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w^2,0,w^2,0,1,1,1,0,w^2,w^2,0,0,0,1,w,1,w^2,w^2,1,w,1,1,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,1,w^2,w^2,w^2,w^2,0,w^2,w,w^2,0,1,0,0,w^2,1,0,1,1,w^2,0,1,w^2,w^2,w,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,0,w^2,0,w^2,w^2,w,0,0,w^2,w,w,0,w^2,w,0,w^2,1,1,0,0,0,1,0,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,w,0,w^2,0,w^2,w^2,0,0,w^2,w,1,1,0,1,w^2,1,0,0,w,w^2,0,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w,1,1,w,0,0,1,0,w^2,w^2,1,w^2,w^2,w^2,w^2,1,1,w^2,0,0,w,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,w,0,1,w,w^2,1,w,0,0,w,1,w,1,1,w,1,1,w,0,w,1,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w^2,1,w^2,0,1,1,w,w,w,w^2,1,w,0,0,w^2,0,w,1,0,w,w,1,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,0,w,w^2,w^2,w^2,0,0,w^2,w^2,w,w^2,1,1,0,w^2,w^2,1,0,w,w^2,0,1,w^2,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,1,w,0,w^2,w^2,w,w^2,1,w^2,0,0,1,w,1,w,0,1,0,1,w^2,1,w^2,0,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,w^2,0,w^2,0,w^2,0,1,0,1,0,0,0,w^2,w^2,0,1,1,1,1,w,w,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,1,w,w^2,0,1,w^2,1,0,w^2,w^2,1,w^2,1,1,0,w^2,0,w,1,0,w^2,1,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,1,w,w^2,0,1,w^2,1,0,w^2,w^2,1,w^2,1,1,0,w^2,0,w,1,0,w^2,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,w^2,0,w^2,0,w,1,w,w,w,0,w^2,0,w,w^2,1,w,0,w^2,1,0,1,0,1,0,w,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w^2,w,1,w^2,w^2,w,1,0,1,0,0,1,w^2,w,0,0,w^2,w^2,w^2,1,w^2,1,1,w^2,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w^2,w,1,w^2,w^2,w,1,0,1,0,0,1,w^2,w,0,0,w^2,w^2,w^2,1,w^2,1,1,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w^2,0,0,w,w^2,w^2,w^2,w^2,w^2,1,1,1,w,1,1,1,w^2,w,w^2,w^2,1,1,0,0,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w^2,0,0,w,w^2,w^2,w^2,w^2,w^2,1,1,1,w,1,1,1,w^2,w,w^2,w^2,1,1,0,0,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,w^2,1,0,0,w,w,w^2,w,1,w,w^2,0,w^2,1,0,w,w,w^2,w^2,w,1,w^2,w,0,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,w^2,1,0,0,w,w,w^2,w,1,w,w^2,0,w^2,1,0,w,w,w^2,w^2,w,1,w^2,w,0,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w^2,w,1,w^2,0,w,0,0,0,1,0,0,0,0,0,1,1,w,w^2,0,w,0,1,1,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,1,w,0,w^2,0,1,1,w^2,0,w,1,0,1,w,w,0,1,w,w,0,0,w^2,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,1,0,0,w^2,1,w^2,0,w^2,1,0,1,w,w,1,0,0,1,0,w,w^2,1,1,w,w^2]);
U:=Matrix(F,32,1,[
0,
w^2,
w^2,
1,
1,
1,
1,
1,
0,
1,
1,
w,
w,
w^2,
0,
w^2,
w^2,
w^2,
w,
w,
0,
1,
w^2,
1,
w^2,
0,
w,
1,
0,
w,
w,
w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B60_32_60_32") then
DatabaseCode:=BestKnownLinearCode(F,60,32);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 15;
InputDistanceCache["B60_32_60_32"]:=Cin;
else assert Cin eq InputDistanceCache["B60_32_60_32"];end if;
S:=HullSource("BS090","B60_32",Gin,U,15,16,15,"exact",Vector(F,[0,w^2,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,1,0,1,0,1,w^2,1,0,0,0,0,w^2,0,0,0,0,1,0,0,1,0,w,w^2,0]));
S`PaperRows:=[104,238,264];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS090";
end for;
HullIncreasingExamples["BS090"]:=S;X4Sources["BS090"]:=S;
print "VERIFIED SOURCE BS090";

// BS085: ingredient B58_35.
Gin:=Matrix(F,35,58,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,0,1,1,0,w,1,0,w^2,0,1,w,w^2,w,w,0,w^2,w^2,w,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,1,1,w^2,w,0,0,w,w,1,w,1,w,w^2,w,0,w,w,w,w,w,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,0,w,w,0,w^2,0,0,1,w^2,0,w^2,w,w^2,w,0,0,0,w^2,w^2,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,0,w^2,1,1,1,w^2,0,w^2,0,w,1,0,w^2,w,0,0,w,1,w,w^2,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,0,1,1,w,0,w^2,1,w^2,1,1,w,0,0,w,1,1,0,w^2,0,w^2,w,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,w,1,1,w^2,1,0,0,0,w^2,w^2,1,w^2,w^2,1,w,w,1,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,0,1,w^2,w^2,w^2,1,w^2,0,w,w,w,w,1,w^2,0,w^2,w,0,0,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,w^2,w,w^2,1,0,w^2,1,1,w^2,1,1,0,1,w,w,0,w,1,w^2,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,w^2,w,w^2,1,0,w^2,1,1,w^2,1,1,0,1,w,w,0,w,1,w^2,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,0,w^2,w,w,w^2,1,1,0,w,w^2,w^2,1,0,w^2,w,w,w,1,w,0,1,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,1,0,0,0,1,1,w,1,0,0,w^2,w^2,0,w^2,w,w^2,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,1,0,0,0,1,1,w,1,0,0,w^2,w^2,0,w^2,w,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,w^2,0,w,w^2,w^2,0,0,w^2,w,1,w,w,w^2,0,w,0,w,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w^2,w,0,w^2,1,w,w^2,0,w^2,w,w^2,0,1,w^2,w,w,w,w,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w^2,w,0,w^2,1,w,w^2,0,w^2,w,w^2,0,1,w^2,w,w,w,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w^2,w,0,w^2,1,w,w^2,0,w^2,w,w^2,0,1,w^2,w,w,w,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,1,0,w,w^2,w,w^2,1,w^2,1,w,1,w^2,1,w,w,w^2,1,0,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w,w^2,1,w,w,w^2,w,w,0,w^2,w,w,0,0,w,1,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w,w^2,1,w,w,w^2,w,w,0,w^2,w,w,0,0,w,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,0,0,w^2,1,0,0,1,w,0,0,1,1,w,0,1,w^2,0,1,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,0,0,w^2,1,0,0,1,w,0,0,1,1,w,0,1,w^2,0,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,1,w^2,w^2,0,0,0,0,w,w^2,1,1,w,0,w^2,w,1,1,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,1,w^2,1,1,w^2,0,0,w,1,0,w,w^2,1,w^2,w,w,0,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,1,w^2,1,1,w^2,0,0,w,1,0,w,w^2,1,w^2,w,w,0,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,w,1,0,0,w,0,0,1,w^2,w^2,1,w^2,0,w^2,w^2,w,w^2,w^2,0,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,w^2,0,1,w^2,w^2,1,1,0,1,0,w,0,w,w^2,w,w,0,w^2,1,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,0,w,0,w^2,1,1,w,1,0,w^2,w^2,1,w^2,0,0,1,w^2,0,w,w,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,w,w,w^2,0,w,0,w,1,w^2,w,w,0,0,1,1,w^2,w^2,w,w^2,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,w^2,w,1,0,w^2,w^2,0,w,w,w,w^2,w^2,w^2,1,0,w^2,w^2,1,w^2,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w,w,0,w^2,w^2,0,1,1,w^2,0,w^2,0,0,1,w,1,w^2,w^2,w^2,0,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,w^2,0,1,w^2,w^2,w,1,1,w,w^2,0,1,w^2,1,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,1,0,w,w,w,0,0,1,1,0,1,w,w^2,1,0,1,1,w,w,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,w,1,w^2,1,1,w^2,0,0,w,0,1,0,1,w,0,w,1,w^2,w^2,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w^2,w,w,0,w,0,w^2,0,w^2,w^2,1,0,w^2,0,w^2,w,w,w^2,w,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,0,w^2,w^2,w^2,1,0,0,w^2,1,1,1,w^2,1,1,w,0,w,1,1,0,w]);
U:=Matrix(F,35,3,[
w^2,w^2,0,
1,1,w^2,
0,0,0,
1,w^2,1,
1,0,w,
w,0,w,
w,w^2,0,
1,w^2,1,
w^2,1,1,
w^2,w^2,w^2,
0,w^2,w^2,
0,w^2,w,
w,0,0,
w,1,w,
w^2,w,0,
0,w^2,w,
w,w,1,
0,1,w^2,
w^2,w^2,1,
0,1,0,
1,w,w^2,
1,w^2,1,
1,1,w,
1,w^2,w,
w,w^2,1,
0,w,0,
0,0,0,
0,w,1,
1,w,0,
1,w^2,w,
w^2,w,w^2,
w,w^2,0,
0,1,w,
w^2,w^2,w,
0,w,0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B58_35_58_35") then
DatabaseCode:=BestKnownLinearCode(F,58,35);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B58_35_58_35"]:=Cin;
else assert Cin eq InputDistanceCache["B58_35_58_35"];end if;
S:=HullSource("BS085","B58_35",Gin,U,12,10,12,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,w,0,w,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,1,0,w^2,w^2,0,w,0,0,1,0,0,0,w,0,0,0]));
S`PaperRows:=[107,256];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS085";
end for;
HullIncreasingExamples["BS085"]:=S;X4Sources["BS085"]:=S;
print "VERIFIED SOURCE BS085";

// BS105: ingredient B61_32.
Gin:=Matrix(F,32,61,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,w,w^2,w^2,1,w^2,w,1,w^2,w^2,0,0,w,0,w^2,1,1,0,w,w^2,0,w^2,0,w^2,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,w^2,w^2,1,w^2,0,1,0,0,1,1,w^2,1,0,w^2,w^2,1,w^2,w^2,w,0,1,w^2,w^2,w,0,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,w^2,1,1,w,1,1,w,w,w,1,1,w,1,w,0,0,1,w,1,w,w,1,1,0,w,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,w^2,1,1,w,1,1,w,w,w,1,1,w,1,w,0,0,1,w,1,w,w,1,1,0,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,w,0,w,w^2,0,1,w^2,0,w^2,w,w,w,1,w^2,w^2,0,0,w^2,0,w,0,w,w^2,w^2,1,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,w,0,w,w^2,0,1,w^2,0,w^2,w,w,w,1,w^2,w^2,0,0,w^2,0,w,0,w,w^2,w^2,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,w^2,1,1,1,1,1,w,0,0,w^2,0,w,1,0,w,w^2,w,w^2,w^2,w^2,w,w^2,w^2,w^2,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,1,0,1,w,w^2,0,w,w^2,0,0,0,w,0,0,w,w^2,w,w,0,w^2,1,w^2,0,0,w^2,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,0,0,w^2,w,w,0,w,w^2,0,1,0,0,1,w,w,w^2,1,w^2,w^2,0,0,1,1,1,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,1,w,1,1,0,1,1,1,w,1,0,1,1,0,1,0,1,w,1,0,w,1,w^2,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,1,w,1,1,0,1,1,1,w,1,0,1,1,0,1,0,1,w,1,0,w,1,w^2,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w,0,w^2,1,w^2,0,w^2,w^2,w^2,1,w,0,0,w^2,w,w^2,1,1,w^2,w,w^2,0,0,w,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,1,w^2,1,1,0,0,w,w,w,w^2,1,1,0,1,1,0,w^2,w,0,w^2,w^2,w^2,1,w,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w,w,w^2,1,w,w^2,1,w^2,0,0,w,w^2,0,1,w,w,w,0,w,0,0,1,w^2,1,w,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,1,w^2,w,w^2,w^2,0,w^2,w,1,0,w,0,0,0,0,0,w,w^2,w^2,0,1,1,w,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,0,w,0,w,0,w,0,w,w,w^2,1,0,1,0,1,w,w,0,1,w,w^2,1,1,0,0,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,w^2,w^2,1,0,1,1,w,w^2,w^2,w^2,1,w^2,1,1,w^2,0,w,w^2,0,w,w,1,0,w,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,0,1,1,w,w,0,w,0,1,w^2,w^2,0,w^2,w^2,w,0,0,w^2,1,0,0,w,w^2,w^2,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,0,1,1,w,w,0,w,0,1,w^2,w^2,0,w^2,w^2,w,0,0,w^2,1,0,0,w,w^2,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,1,w,1,w^2,0,1,0,1,w^2,0,1,0,w^2,1,1,1,w,w^2,1,w^2,0,0,1,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,w,1,1,w^2,0,w,1,1,w,w,w^2,w^2,0,0,0,1,w,w,1,w^2,1,1,1,0,w,w,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,0,w^2,1,w^2,0,0,w,0,0,w^2,w^2,1,0,w,w,1,w,0,1,1,w^2,1,w,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,0,w^2,1,w^2,0,0,w,0,0,w^2,w^2,1,0,w,w,1,w,0,1,1,w^2,1,w,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,0,0,0,w,1,1,0,0,w,1,w^2,0,0,0,w^2,0,w,0,w,w,w^2,0,0,1,w,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,w,w,w,w^2,1,0,w,w,1,1,w,w^2,0,w,0,0,1,w^2,0,0,1,w^2,w^2,0,w,w^2,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,1,1,1,w^2,w,w^2,1,1,0,0,0,w,w^2,w^2,w,1,w,w^2,w^2,w^2,1,1,w,w^2,1,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w,0,0,w^2,1,1,1,0,w,w,w,0,w,w,w^2,0,w,1,w^2,w,1,1,w^2,w,1,w,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w^2,w^2,1,w,1,w,w^2,0,w^2,0,0,w,0,w^2,w,1,w^2,1,1,w,0,1,w^2,w^2,0,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w^2,w^2,1,w,1,w,w^2,0,w^2,0,0,w,0,w^2,w,1,w^2,1,1,w,0,1,w^2,w^2,0,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,0,0,0,w,0,0,0,1,1,1,w,0,0,1,0,w,0,w^2,w^2,w,0,w,1,1,w,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,w,w^2,w^2,1,w^2,w,1,w^2,w^2,0,0,w,0,w^2,1,1,0,w,w^2,0,w^2,0,w^2,1,0,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,w,w^2,w^2,1,w^2,w,1,w^2,w^2,0,0,w,0,w^2,1,1,0,w,w^2,0,w^2,0,w^2,1,0,0,1]);
U:=Matrix(F,32,1,[
0,
0,
1,
w^2,
w,
w,
0,
1,
0,
0,
w,
w^2,
w^2,
1,
1,
w,
w,
w^2,
1,
w,
0,
w^2,
0,
0,
w,
0,
w^2,
w^2,
1,
w^2,
0,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B61_32_61_32") then
DatabaseCode:=BestKnownLinearCode(F,61,32);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 15;
InputDistanceCache["B61_32_61_32"]:=Cin;
else assert Cin eq InputDistanceCache["B61_32_61_32"];end if;
S:=HullSource("BS105","B61_32",Gin,U,15,14,15,"exact",Vector(F,[0,0,0,0,0,0,0,w,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,w,0,1,0,0,0,0,0,0,0,w,0,0,w,w^2,0,0,w,0,0,0,0,0,w,0,1,w,w,w,1,0,0]));
S`PaperRows:=[111,250,253];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS105";
end for;
HullIncreasingExamples["BS105"]:=S;X4Sources["BS105"]:=S;
print "VERIFIED SOURCE BS105";

// BS092: ingredient B60_32.
Gin:=Matrix(F,32,60,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,1,0,w^2,1,1,1,0,0,w,0,w^2,1,0,w^2,1,1,w,w^2,0,w^2,1,w^2,1,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,w,w,w,0,w^2,w^2,w,w^2,0,w,1,0,0,0,1,0,1,1,1,w^2,1,1,w,0,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,w,w,w,0,w^2,w^2,w,w^2,0,w,1,0,0,0,1,0,1,1,1,w^2,1,1,w,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,w,w,w,0,w^2,w^2,w,w^2,0,w,1,0,0,0,1,0,1,1,1,w^2,1,1,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,w,0,0,w,w,0,w^2,1,w^2,0,0,0,1,0,1,w^2,0,1,w^2,1,0,w^2,0,w,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,w,0,0,w,w,0,w^2,1,w^2,0,0,0,1,0,1,w^2,0,1,w^2,1,0,w^2,0,w,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,0,1,1,0,0,0,1,w,w^2,w^2,0,0,w^2,1,0,w^2,1,w^2,w^2,1,w,w^2,w^2,0,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,1,0,w^2,1,0,1,w,0,w,w,1,0,w,0,w,w,w^2,1,1,w^2,w,w^2,1,1,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,0,1,1,w^2,1,w^2,0,1,0,1,w^2,1,1,0,w,w^2,w,w^2,0,1,1,1,w,0,w^2,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,0,0,0,1,w^2,w,w,w^2,1,w^2,0,w^2,0,w^2,w,w^2,w^2,w,w,0,w^2,w,0,w^2,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w^2,0,w^2,0,1,1,1,0,w^2,w^2,0,0,0,1,w,1,w^2,w^2,1,w,1,1,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,1,w^2,w^2,w^2,w^2,0,w^2,w,w^2,0,1,0,0,w^2,1,0,1,1,w^2,0,1,w^2,w^2,w,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,0,w^2,0,w^2,w^2,w,0,0,w^2,w,w,0,w^2,w,0,w^2,1,1,0,0,0,1,0,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,w,0,w^2,0,w^2,w^2,0,0,w^2,w,1,1,0,1,w^2,1,0,0,w,w^2,0,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w,1,1,w,0,0,1,0,w^2,w^2,1,w^2,w^2,w^2,w^2,1,1,w^2,0,0,w,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,w,0,1,w,w^2,1,w,0,0,w,1,w,1,1,w,1,1,w,0,w,1,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w^2,1,w^2,0,1,1,w,w,w,w^2,1,w,0,0,w^2,0,w,1,0,w,w,1,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,0,w,w^2,w^2,w^2,0,0,w^2,w^2,w,w^2,1,1,0,w^2,w^2,1,0,w,w^2,0,1,w^2,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,1,w,0,w^2,w^2,w,w^2,1,w^2,0,0,1,w,1,w,0,1,0,1,w^2,1,w^2,0,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,w^2,0,w^2,0,w^2,0,1,0,1,0,0,0,w^2,w^2,0,1,1,1,1,w,w,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,1,w,w^2,0,1,w^2,1,0,w^2,w^2,1,w^2,1,1,0,w^2,0,w,1,0,w^2,1,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,1,w,w^2,0,1,w^2,1,0,w^2,w^2,1,w^2,1,1,0,w^2,0,w,1,0,w^2,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,w^2,0,w^2,0,w,1,w,w,w,0,w^2,0,w,w^2,1,w,0,w^2,1,0,1,0,1,0,w,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w^2,w,1,w^2,w^2,w,1,0,1,0,0,1,w^2,w,0,0,w^2,w^2,w^2,1,w^2,1,1,w^2,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w^2,w,1,w^2,w^2,w,1,0,1,0,0,1,w^2,w,0,0,w^2,w^2,w^2,1,w^2,1,1,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w^2,0,0,w,w^2,w^2,w^2,w^2,w^2,1,1,1,w,1,1,1,w^2,w,w^2,w^2,1,1,0,0,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w^2,0,0,w,w^2,w^2,w^2,w^2,w^2,1,1,1,w,1,1,1,w^2,w,w^2,w^2,1,1,0,0,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,w^2,1,0,0,w,w,w^2,w,1,w,w^2,0,w^2,1,0,w,w,w^2,w^2,w,1,w^2,w,0,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,w^2,1,0,0,w,w,w^2,w,1,w,w^2,0,w^2,1,0,w,w,w^2,w^2,w,1,w^2,w,0,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w^2,w,1,w^2,0,w,0,0,0,1,0,0,0,0,0,1,1,w,w^2,0,w,0,1,1,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,1,w,0,w^2,0,1,1,w^2,0,w,1,0,1,w,w,0,1,w,w,0,0,w^2,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,1,0,0,w^2,1,w^2,0,w^2,1,0,1,w,w,1,0,0,1,0,w,w^2,1,1,w,w^2]);
U:=Matrix(F,32,3,[
0,0,0,
w^2,1,w^2,
0,w^2,w^2,
w,1,1,
w^2,1,1,
w,1,1,
1,w,1,
0,1,1,
1,1,0,
w,1,1,
w^2,0,1,
w^2,w,w,
w,w^2,w,
w^2,1,w^2,
0,0,0,
w^2,1,w^2,
w,0,w^2,
w^2,1,w^2,
1,w,w,
0,w,w,
0,1,0,
1,0,1,
1,w,w^2,
0,w,1,
w,w,w^2,
w,0,0,
0,0,w,
w^2,0,1,
1,w,0,
w,1,w,
w,w^2,w,
w^2,1,w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B60_32_60_32") then
DatabaseCode:=BestKnownLinearCode(F,60,32);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 15;
InputDistanceCache["B60_32_60_32"]:=Cin;
else assert Cin eq InputDistanceCache["B60_32_60_32"];end if;
S:=HullSource("BS092","B60_32",Gin,U,15,18,15,"exact",Vector(F,[0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,w^2,0,0,0,w,0,0,0,w^2,w^2,0,w^2,w,0,0,0,0,0,w,0,0,0,0,w^2,w^2,w^2,0,w,0,0,0,0,0,1,w,0,0,0,0]));
S`PaperRows:=[113,245,249,268];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS092";
end for;
HullIncreasingExamples["BS092"]:=S;X4Sources["BS092"]:=S;
print "VERIFIED SOURCE BS092";
assert #Keys(HullIncreasingExamples) eq 47;
print "VERIFIED HullIncreasing: 47 X4 CONSTRUCTIONS";
