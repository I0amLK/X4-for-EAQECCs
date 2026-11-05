// Decreasing the Hermitian hull by Construction X4.
// First run: load "X4.m";
// Each example records both ingredients and the direct X4 output.
// U selects the graph map. HullSource first changes Gin to Gstar,
// then appends the proof's unit block E=(0;I_lambda).
assert assigned X4Loaded;
HullDecreasingExamples:=AssociativeArray();

// B18_11_s0: ingredient B18_11.
Gin:=Matrix(F,11,18,[
1,0,0,0,0,0,0,0,0,w,0,0,w,0,w^2,w^2,w,w^2,
0,1,0,0,0,0,0,0,0,1,0,0,0,1,w,1,1,0,
0,0,1,0,0,0,0,0,0,w^2,0,0,0,w^2,0,1,1,1,
0,0,0,1,0,0,0,0,0,w^2,0,0,w,w,1,1,0,w,
0,0,0,0,1,0,0,0,0,w^2,0,0,w^2,1,w^2,w^2,w,0,
0,0,0,0,0,1,0,0,0,1,0,0,w,w,w,0,w,0,
0,0,0,0,0,0,1,0,0,1,0,0,0,w,1,w,1,w^2,
0,0,0,0,0,0,0,1,0,w^2,0,0,w,w^2,w,0,0,1,
0,0,0,0,0,0,0,0,1,1,0,0,0,w^2,w^2,1,w,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,w,w,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,w^2,w,w]);
U:=Matrix(F,11,1,[
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
w]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B18_11_18_11") then
DatabaseCode:=BestKnownLinearCode(F,18,11);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 6;
InputDistanceCache["B18_11_18_11"]:=Cin;
else assert Cin eq InputDistanceCache["B18_11_18_11"];end if;
S:=HullSource("B18_11_s0","B18_11",Gin,U,6,0,6,"exact",Vector(F,[0,0,0,0,0,w,0,0,0,w,0,0,w^2,w^2,w^2,0,w^2,0,0]));
S`PaperRows:=[2,149];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B18_11_s0";
end for;
HullDecreasingExamples["B18_11_s0"]:=S;X4Sources["B18_11_s0"]:=S;
print "VERIFIED SOURCE B18_11_s0";

// B19_12_s1: ingredient B19_12.
Gin:=Matrix(F,12,19,[
1,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w^2,w^2,0,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,w,0,1,w,w,w,
0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,0,1,
0,0,0,1,0,0,0,0,0,0,0,0,w,0,0,1,w,w^2,1,
0,0,0,0,1,0,0,0,0,0,0,0,w^2,w^2,w,w^2,0,1,1,
0,0,0,0,0,1,0,0,0,0,0,0,w,1,0,0,1,w,w,
0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,w,w,1,w,
0,0,0,0,0,0,0,1,0,0,0,0,w,1,w^2,0,w,0,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,1,1,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,w,0,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,w,w,1,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,w^2,w,w,0]);
U:=Matrix(F,12,1,[
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
1,
1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B19_12_19_12") then
DatabaseCode:=BestKnownLinearCode(F,19,12);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 6;
InputDistanceCache["B19_12_19_12"]:=Cin;
else assert Cin eq InputDistanceCache["B19_12_19_12"];end if;
S:=HullSource("B19_12_s1","B19_12",Gin,U,6,1,6,"exact",Vector(F,[0,0,w,0,0,0,0,0,0,0,0,0,0,w,w,w,1,0,w,0]));
S`PaperRows:=[3,150];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B19_12_s1";
end for;
HullDecreasingExamples["B19_12_s1"]:=S;X4Sources["B19_12_s1"]:=S;
print "VERIFIED SOURCE B19_12_s1";

// B20_13_s2: ingredient B20_13.
Gin:=Matrix(F,13,20,[
1,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,w^2,1,1,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,w,0,1,w,w,w,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,0,1,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,0,0,w,w,w^2,1,
0,0,0,0,1,0,0,0,0,0,0,0,0,w,w,1,0,w^2,w,w,
0,0,0,0,0,1,0,0,0,0,0,0,0,w,0,1,1,w^2,0,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,w,w,1,w,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,w,w^2,1,w,1,w^2,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,1,1,w,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,w,0,w^2,w,w,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,w,w,1,w^2,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,w,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,w^2,0,w^2,1,w^2]);
U:=Matrix(F,13,1,[
0,
0,
0,
0,
0,
0,
0,
0,
0,
w,
w^2,
0,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B20_13_20_13") then
DatabaseCode:=BestKnownLinearCode(F,20,13);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 6;
InputDistanceCache["B20_13_20_13"]:=Cin;
else assert Cin eq InputDistanceCache["B20_13_20_13"];end if;
S:=HullSource("B20_13_s2","B20_13",Gin,U,6,2,6,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,w^2,0,w^2,1,w^2,0]));
S`PaperRows:=[4];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B20_13_s2";
end for;
HullDecreasingExamples["B20_13_s2"]:=S;X4Sources["B20_13_s2"]:=S;
print "VERIFIED SOURCE B20_13_s2";

// Q11_puncture1_s0: ingredient Q11_puncture1.
Gin:=Matrix(F,10,23,[
1,0,0,0,0,0,0,0,0,w^2,w^2,0,0,1,0,1,1,w,0,1,w^2,0,0,
0,1,0,0,0,0,0,0,0,w^2,0,0,0,1,1,1,0,w^2,w,1,w,w^2,0,
0,0,1,0,0,0,0,0,0,1,w,0,0,w,1,w^2,w^2,w^2,w^2,0,0,w,w^2,
0,0,0,1,0,0,0,0,0,1,0,0,w^2,1,1,0,w,w^2,0,w,w,w^2,1,
0,0,0,0,1,0,0,0,0,0,1,0,1,w,0,0,1,w^2,w,1,w^2,w^2,w,
0,0,0,0,0,1,0,0,0,0,0,0,w,w^2,0,w,w,w^2,1,0,w^2,1,1,
0,0,0,0,0,0,1,0,0,w^2,w^2,0,1,w,w,0,w,1,w,1,w,w,0,
0,0,0,0,0,0,0,1,0,w^2,0,0,0,0,w,w^2,1,0,1,w^2,w,w,w,
0,0,0,0,0,0,0,0,1,1,w,0,w,0,w,w,w^2,0,w,1,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1]);
U:=Matrix(F,10,1,[
0,
0,
0,
0,
0,
0,
0,
0,
w^2,
0]);
Cin:=LinearCode(Gin);
ParentG:=Matrix(F,10,24,[
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
ParentCode:=LinearCode(ParentG);
assert MinimumWeight(ParentCode) ge 10;
PreprocessCoordinates:=[1];Keep:=[j:j in [1..Ncols(ParentG)]|not j in PreprocessCoordinates];
PreG:=ParentG;
assert Cin eq LinearCode(SelectColumns(PreG,Keep));
S:=HullSource("Q11_puncture1_s0","Q11_puncture1",Gin,U,9,0,9,"exact",Vector(F,[w,0,0,0,0,0,0,w,0,0,1,w^2,w^2,1,0,0,w^2,0,1,0,1,0,0,0]));
S`Preprocessing:=<"puncturing","Q11",ParentG,PreprocessCoordinates>;
S`PaperRows:=[5,151];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="Q11_puncture1_s0";
end for;
HullDecreasingExamples["Q11_puncture1_s0"]:=S;X4Sources["Q11_puncture1_s0"]:=S;
print "VERIFIED SOURCE Q11_puncture1_s0";

// H09: ingredient Q11.
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
0,
0,
0,
0,
0,
0,
0,
0,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"Q11_24_10") then
assert MinimumWeight(Cin) ge 10;
InputDistanceCache["Q11_24_10"]:=Cin;
else assert Cin eq InputDistanceCache["Q11_24_10"];end if;
S:=HullSource("H09","Q11",Gin,U,10,1,10,"exact",Vector(F,[0,0,0,0,0,0,0,0,1,1,w,w,w,0,w,w,w^2,0,w,1,0,0,0,0,0]));
S`PaperRows:=[8];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="H09";
end for;
HullDecreasingExamples["H09"]:=S;X4Sources["H09"]:=S;
print "VERIFIED SOURCE H09";

// B25_17_s0: ingredient B25_17.
Gin:=Matrix(F,17,25,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,0,1,0,w,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,w,w^2,1,w^2,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,0,1,1,w^2,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,w^2,w^2,0,w,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,0,1,w^2,w^2,1,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,w^2,w,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w,w,1,w^2,w,w^2,w^2,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,w,w^2,w^2,0,0,w^2,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,1,w,w,w^2,1,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,1,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,1,w,w,1,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w,1,1,0,w^2,w^2,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,w,0,w,w,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,w,w^2,w^2,0,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,w^2,0,w^2,1,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,0,1,1,1,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,w,0,w^2,1,0,w]);
U:=Matrix(F,17,1,[
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
1,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B25_17_25_17") then
DatabaseCode:=BestKnownLinearCode(F,25,17);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 6;
InputDistanceCache["B25_17_25_17"]:=Cin;
else assert Cin eq InputDistanceCache["B25_17_25_17"];end if;
S:=HullSource("B25_17_s0","B25_17",Gin,U,6,0,6,"exact",Vector(F,[w,0,0,0,0,0,0,w^2,0,0,1,0,0,0,0,0,1,0,0,0,0,0,w^2,0,w^2,0]));
S`PaperRows:=[10,156];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B25_17_s0";
end for;
HullDecreasingExamples["B25_17_s0"]:=S;X4Sources["B25_17_s0"]:=S;
print "VERIFIED SOURCE B25_17_s0";

// B27_9_puncture1_s0: ingredient B27_9_puncture1.
Gin:=Matrix(F,9,26,[
1,0,0,0,0,0,0,0,0,1,w,w^2,0,w,w,1,1,w,w^2,w,w,w^2,w,0,1,w,
0,1,0,0,0,0,0,0,0,w,w,w,1,w,w^2,w^2,1,1,0,1,1,0,w^2,w^2,w,w^2,
0,0,1,0,0,0,0,0,0,w^2,w^2,1,0,1,1,w^2,w,w,0,0,0,0,w,w,0,w,
0,0,0,1,0,0,0,0,0,w,0,0,w,1,1,w,w,1,w,1,w^2,0,w,0,0,1,
0,0,0,0,1,0,0,0,0,1,0,1,w^2,w,0,1,0,w^2,w^2,w,w^2,1,w^2,0,1,0,
0,0,0,0,0,1,0,0,0,w,w,1,1,0,1,w,w^2,w^2,w,0,1,w,w,w^2,w,w,
0,0,0,0,0,0,1,0,0,1,0,w,0,0,w^2,w,w,0,w,w^2,w,0,w,1,w,w^2,
0,0,0,0,0,0,0,1,0,0,1,w,1,w,w^2,w,1,w^2,1,0,w^2,w^2,1,0,1,0,
0,0,0,0,0,0,0,0,1,w,w^2,0,w,w,1,1,0,w^2,w,w,w^2,w,0,1,w,w]);
U:=Matrix(F,9,1,[
0,
0,
0,
0,
0,
0,
0,
0,
w^2]);
Cin:=LinearCode(Gin);
ParentG:=Matrix(F,9,27,[
1,0,0,0,0,0,0,0,0,1,w,w^2,0,w,w,1,1,0,w^2,w,w,w^2,w,0,1,w,w,
0,1,0,0,0,0,0,0,0,0,1,w,w^2,0,w,w,1,1,w,w^2,w,w,w^2,w,0,1,w,
0,0,1,0,0,0,0,0,0,1,0,1,w,w^2,0,w,w,1,w,w,w^2,w,w,w^2,w,0,1,
0,0,0,1,0,0,0,0,0,1,1,0,1,w,w^2,0,w,w,1,w,w,w^2,w,w,w^2,w,0,
0,0,0,0,1,0,0,0,0,w,1,1,0,1,w,w^2,0,w,0,1,w,w,w^2,w,w,w^2,w,
0,0,0,0,0,1,0,0,0,w,w,1,1,0,1,w,w^2,0,w,0,1,w,w,w^2,w,w,w^2,
0,0,0,0,0,0,1,0,0,0,w,w,1,1,0,1,w,w^2,w^2,w,0,1,w,w,w^2,w,w,
0,0,0,0,0,0,0,1,0,w^2,0,w,w,1,1,0,1,w,w,w^2,w,0,1,w,w,w^2,w,
0,0,0,0,0,0,0,0,1,w,w^2,0,w,w,1,1,0,1,w,w,w^2,w,0,1,w,w,w^2]);
ParentCode:=LinearCode(ParentG);
DatabaseCode:=BestKnownLinearCode(F,27,9);assert ParentCode eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 13;
PreprocessCoordinates:=[1];Keep:=[j:j in [1..Ncols(ParentG)]|not j in PreprocessCoordinates];
PreG:=ParentG;
assert Cin eq LinearCode(SelectColumns(PreG,Keep));
S:=HullSource("B27_9_puncture1_s0","B27_9_puncture1",Gin,U,12,0,12,"exact",Vector(F,[0,0,w,0,0,0,0,0,0,1,1,w,0,w,w,1,w^2,w^2,0,0,0,0,w^2,w^2,0,w^2,0]));
S`Preprocessing:=<"puncturing","B27_9",ParentG,PreprocessCoordinates>;
S`PaperRows:=[12,157];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B27_9_puncture1_s0";
end for;
HullDecreasingExamples["B27_9_puncture1_s0"]:=S;X4Sources["B27_9_puncture1_s0"]:=S;
print "VERIFIED SOURCE B27_9_puncture1_s0";

// B26_16_s2: ingredient B26_16.
Gin:=Matrix(F,16,26,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,0,w^2,0,1,0,w^2,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,w^2,w,0,1,w,0,w,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,0,w,1,0,w,1,1,1,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,0,w^2,w^2,0,1,0,1,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,0,1,w^2,0,w^2,0,0,1,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,1,w,1,w^2,1,w^2,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,w^2,0,0,w^2,0,w,w^2,0,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w,0,w^2,1,w^2,1,1,w^2,w,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,w,w^2,w,w,w^2,1,1,1,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,1,0,w,w,w^2,0,w,1,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w,1,w^2,0,0,w,w,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,w,w,w^2,1,1,1,w,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,0,1,0,w^2,w,w,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,w^2,w,w,1,w^2,0,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,w,w^2,1,1,1,w^2,w,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,1,0,1,1,1,w^2,1,w^2]);
U:=Matrix(F,16,1,[
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
w,
0,
w^2,
w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B26_16_26_16") then
DatabaseCode:=BestKnownLinearCode(F,26,16);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 7;
InputDistanceCache["B26_16_26_16"]:=Cin;
else assert Cin eq InputDistanceCache["B26_16_26_16"];end if;
S:=HullSource("B26_16_s2","B26_16",Gin,U,7,2,7,"exact",Vector(F,[1,0,0,0,0,0,0,0,0,w,0,0,0,w,0,0,w,0,0,0,w,0,1,w^2,0,0,0]));
S`PaperRows:=[13,153,155,159];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B26_16_s2";
end for;
HullDecreasingExamples["B26_16_s2"]:=S;X4Sources["B26_16_s2"]:=S;
print "VERIFIED SOURCE B26_16_s2";

// B26_18_s1: ingredient B26_18.
Gin:=Matrix(F,18,26,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w^2,w,w,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,w^2,1,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w,1,w,1,w,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,1,1,w,0,w^2,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,1,w,1,w,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,w^2,w,1,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,0,w,w^2,w^2,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,w,1,w,1,w^2,w,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,1,w,w,w^2,1,w,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,0,w,w,w,0,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,0,w^2,w^2,1,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,1,w,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,1,0,0,w,0,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,w^2,w^2,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,1,1,w^2,w^2,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,w^2,w^2,0,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,1,1,w,w,0,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,1,1,w^2,0,1,w]);
U:=Matrix(F,18,1,[
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
w,
0,
w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B26_18_26_18") then
DatabaseCode:=BestKnownLinearCode(F,26,18);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 6;
InputDistanceCache["B26_18_26_18"]:=Cin;
else assert Cin eq InputDistanceCache["B26_18_26_18"];end if;
S:=HullSource("B26_18_s1","B26_18",Gin,U,6,1,6,"exact",Vector(F,[0,w,w^2,0,0,0,w,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,w^2,w^2,0,0,0]));
S`PaperRows:=[14];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B26_18_s1";
end for;
HullDecreasingExamples["B26_18_s1"]:=S;X4Sources["B26_18_s1"]:=S;
print "VERIFIED SOURCE B26_18_s1";

// B27_19_s0: ingredient B27_19.
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
1,
0,
0,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B27_19_27_19") then
DatabaseCode:=BestKnownLinearCode(F,27,19);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 6;
InputDistanceCache["B27_19_27_19"]:=Cin;
else assert Cin eq InputDistanceCache["B27_19_27_19"];end if;
S:=HullSource("B27_19_s0","B27_19",Gin,U,6,0,6,"exact",Vector(F,[0,0,w^2,0,0,1,0,w^2,0,0,0,0,0,0,0,0,0,w,0,0,0,0,0,w^2,w^2,0,0,0]));
S`PaperRows:=[17];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B27_19_s0";
end for;
HullDecreasingExamples["B27_19_s0"]:=S;X4Sources["B27_19_s0"]:=S;
print "VERIFIED SOURCE B27_19_s0";

// B28_16_s3: ingredient B28_16.
Gin:=Matrix(F,16,28,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w,0,0,w^2,w^2,0,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,0,w^2,0,w^2,1,1,w,1,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,0,w^2,0,w^2,1,1,w,1,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,1,w^2,w^2,0,w^2,0,w,0,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,w,1,w^2,1,w,w,1,w,1,0,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,w,1,w^2,1,w,w,1,w,1,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,w,1,w^2,1,w,w,1,w,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,w,w,0,w,w,0,w,1,1,0,w,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,w,1,1,0,w^2,w^2,1,w^2,0,w^2,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,w,1,1,0,w^2,w^2,1,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,1,w^2,w^2,1,w^2,w,1,1,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,1,w^2,w^2,1,w^2,w,1,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,1,w^2,w^2,1,w^2,w,1,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,1,w,1,1,1,w^2,1,0,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,w^2,w,w,w,w,0,w,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,w^2,w^2,w^2,w^2,w^2,1,0,1]);
U:=Matrix(F,16,1,[
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
0,
w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B28_16_28_16") then
DatabaseCode:=BestKnownLinearCode(F,28,16);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 8;
InputDistanceCache["B28_16_28_16"]:=Cin;
else assert Cin eq InputDistanceCache["B28_16_28_16"];end if;
S:=HullSource("B28_16_s3","B28_16",Gin,U,8,3,8,"exact",Vector(F,[0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,w^2,w,0,0,1,0,0,w^2,w,0,0,0]));
S`PaperRows:=[19,158,162,168];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B28_16_s3";
end for;
HullDecreasingExamples["B28_16_s3"]:=S;X4Sources["B28_16_s3"]:=S;
print "VERIFIED SOURCE B28_16_s3";

// B29_17_s4: ingredient B29_17.
Gin:=Matrix(F,17,29,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w,0,0,w^2,w^2,0,w,0,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w,0,0,w^2,w^2,0,w,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,0,w^2,0,w^2,1,1,w,1,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,0,w^2,0,w^2,1,1,w,1,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,1,w^2,w^2,0,w^2,0,w,0,w,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,w,1,w^2,1,w,w,1,w,1,0,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,w,1,w^2,1,w,w,1,w,1,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,w,1,w^2,1,w,w,1,w,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,w,w,0,w,w,0,w,1,1,0,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,w,1,1,0,w^2,w^2,1,w^2,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,w,1,1,0,w^2,w^2,1,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,1,w^2,w^2,1,w^2,w,1,1,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,1,w^2,w^2,1,w^2,w,1,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,1,w^2,w^2,1,w^2,w,1,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,1,w,1,1,1,w^2,1,0,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,w^2,w,w,w,w,0,w,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,w^2,w^2,w^2,w^2,w^2,1,0,1]);
U:=Matrix(F,17,1,[
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
0,
0,
1,
w]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B29_17_29_17") then
DatabaseCode:=BestKnownLinearCode(F,29,17);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 8;
InputDistanceCache["B29_17_29_17"]:=Cin;
else assert Cin eq InputDistanceCache["B29_17_29_17"];end if;
S:=HullSource("B29_17_s4","B29_17",Gin,U,8,4,8,"exact",Vector(F,[0,0,0,0,1,0,0,0,w,0,0,0,0,0,0,0,0,w^2,1,w^2,1,0,0,0,0,w,0,0,1,0]));
S`PaperRows:=[21,170];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B29_17_s4";
end for;
HullDecreasingExamples["B29_17_s4"]:=S;X4Sources["B29_17_s4"]:=S;
print "VERIFIED SOURCE B29_17_s4";

// B29_21_s4: ingredient B29_21.
Gin:=Matrix(F,21,29,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,0,w,w^2,0,w^2,w,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,0,0,0,0,0,w^2,w^2,0,w,w,w^2,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,1,w,w^2,w^2,w,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,0,0,w,w,0,1,w^2,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,0,0,0,0,0,0,0,w,0,w,1,0,w,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,0,1,1,0,0,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,w^2,w,w^2,0,w,w^2,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,0,0,0,0,0,0,0,w,w^2,0,0,w,0,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,w^2,w,1,1,0,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,0,0,0,0,0,0,0,0,1,0,w,w,w^2,1,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,0,0,0,0,0,0,0,w^2,w^2,w^2,1,0,w,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,1,w^2,w,1,0,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,0,0,0,0,0,0,0,w,w,0,1,w,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,0,0,0,0,0,0,w^2,1,0,1,w^2,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,w,w,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,w,0,0,w,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w^2,w,1,0,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,1,w^2,w^2,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,1,w,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,w,1,w,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,w,0,w,w^2,w]);
U:=Matrix(F,21,1,[
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
1,
1,
w^2,
1,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B29_21_29_21") then
DatabaseCode:=BestKnownLinearCode(F,29,21);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 6;
InputDistanceCache["B29_21_29_21"]:=Cin;
else assert Cin eq InputDistanceCache["B29_21_29_21"];end if;
S:=HullSource("B29_21_s4","B29_21",Gin,U,6,4,6,"exact",Vector(F,[0,0,0,0,0,0,0,w,0,0,0,0,w,0,w,0,0,0,0,0,0,0,0,w,0,w,0,w,0,0]));
S`PaperRows:=[22,163];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B29_21_s4";
end for;
HullDecreasingExamples["B29_21_s4"]:=S;X4Sources["B29_21_s4"]:=S;
print "VERIFIED SOURCE B29_21_s4";

// B31_12_puncture4_s1: ingredient B31_12_puncture4.
Gin:=Matrix(F,12,30,[
1,0,0,0,0,0,0,0,0,0,0,0,1,w,w,1,w,0,1,w^2,1,w,1,1,0,w,0,1,w^2,0,
0,1,0,0,0,0,0,0,0,0,0,0,1,1,0,w,w^2,0,0,w,w^2,w,0,w,0,1,0,1,0,1,
0,0,1,0,0,0,0,0,0,0,0,0,w^2,1,w,0,w^2,w,0,w,w,1,w^2,w,1,w^2,0,w^2,w,1,
0,0,0,1,0,0,0,0,0,0,0,0,w,w,0,1,w^2,1,1,1,1,0,0,w^2,w^2,1,1,w,0,w^2,
0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w^2,w^2,1,w,w,1,w,w,w,1,0,1,0,1,w^2,w,
0,0,0,0,0,1,0,0,0,0,0,0,0,w,w,w,w^2,w^2,w^2,w,0,w^2,1,0,0,w^2,w^2,0,w^2,w,
0,0,0,0,0,0,1,0,0,0,0,0,w^2,w,0,w^2,w^2,0,w,1,w^2,w^2,1,1,w,0,0,0,1,1,
0,0,0,0,0,0,0,1,0,0,0,0,w,0,w,w,0,w^2,w,w^2,w^2,0,1,w^2,1,1,0,w,1,w,
0,0,0,0,0,0,0,0,1,0,0,0,1,w^2,1,1,0,w^2,0,1,0,w^2,0,w^2,1,w,w,1,w,1,
0,0,0,0,0,0,0,0,0,1,0,0,w,1,w^2,1,w,w^2,w^2,1,1,1,0,1,1,w^2,1,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,1,0,w,w^2,1,0,w,0,0,w,w,w^2,0,0,0,1,1,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w,w,1,w,w^2,w,1,w^2,0,w^2,0,1,1,w,1,w]);
U:=Matrix(F,12,1,[
0,
0,
0,
0,
0,
0,
0,
0,
0,
w,
0,
w]);
Cin:=LinearCode(Gin);
ParentG:=Matrix(F,12,31,[
1,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,w,0,w^2,0,0,w^2,w^2,1,0,0,0,w,w,1,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,w,w,w^2,0,w,1,0,1,0,0,1,w^2,1,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w^2,1,0,w^2,w,w^2,1,w^2,w^2,0,1,0,w^2,w,1,0,
0,0,0,1,0,0,0,0,0,0,0,0,1,w^2,w^2,w,w,1,w,w^2,w,1,w^2,0,w^2,0,1,1,w,1,w,
0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,w,w^2,w,w^2,w,w^2,0,w^2,0,0,w^2,0,0,0,1,1,
0,0,0,0,0,1,0,0,0,0,0,0,w,1,w,0,0,w^2,1,w^2,w,0,w^2,w,0,0,w^2,w,w,1,1,
0,0,0,0,0,0,1,0,0,0,0,0,w^2,w,0,w^2,w^2,0,w,1,w^2,w^2,1,1,w,0,0,0,1,0,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w,0,w^2,w^2,0,w,1,w^2,w^2,1,1,w,0,0,0,1,1,
0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,w,w^2,w^2,w^2,w,0,w,0,w,1,1,1,w,w^2,w^2,w,w^2,
0,0,0,0,0,0,0,0,0,1,0,0,w^2,w^2,1,0,0,w^2,w,w,0,w^2,1,0,1,1,1,1,0,1,0,
0,0,0,0,0,0,0,0,0,0,1,0,w,w^2,0,0,w,0,0,w,w,w^2,0,0,0,1,1,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,1,0,w,w^2,1,0,w,0,0,w,w,w^2,0,0,0,1,1,w^2,w^2,1]);
ParentCode:=LinearCode(ParentG);
DatabaseCode:=BestKnownLinearCode(F,31,12);assert ParentCode eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 13;
PreprocessCoordinates:=[4];Keep:=[j:j in [1..Ncols(ParentG)]|not j in PreprocessCoordinates];
PreG:=ParentG;
assert Cin eq LinearCode(SelectColumns(PreG,Keep));
S:=HullSource("B31_12_puncture4_s1","B31_12_puncture4",Gin,U,12,1,12,"exact",Vector(F,[0,0,0,0,0,0,w^2,0,1,0,w,0,0,w^2,w^2,w^2,1,w^2,1,1,1,0,w^2,0,0,0,0,0,0,0,0]));
S`Preprocessing:=<"puncturing","B31_12",ParentG,PreprocessCoordinates>;
S`PaperRows:=[24,167,173];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B31_12_puncture4_s1";
end for;
HullDecreasingExamples["B31_12_puncture4_s1"]:=S;X4Sources["B31_12_puncture4_s1"]:=S;
print "VERIFIED SOURCE B31_12_puncture4_s1";

// B30_18_s5: ingredient B30_18.
Gin:=Matrix(F,18,30,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w,0,0,w^2,w^2,0,w,0,0,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w,0,0,w^2,w^2,0,w,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w,0,0,w^2,w^2,0,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,0,w^2,0,w^2,1,1,w,1,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,0,w^2,0,w^2,1,1,w,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,1,w^2,w^2,0,w^2,0,w,0,w,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,w,1,w^2,1,w,w,1,w,1,0,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,w,1,w^2,1,w,w,1,w,1,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,w,1,w^2,1,w,w,1,w,1,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,w,w,0,w,w,0,w,1,1,0,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,w,1,1,0,w^2,w^2,1,w^2,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,w,1,1,0,w^2,w^2,1,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,1,w^2,w^2,1,w^2,w,1,1,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,1,w^2,w^2,1,w^2,w,1,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,1,w^2,w^2,1,w^2,w,1,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,1,w,1,1,1,w^2,1,0,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,w^2,w,w,w,w,0,w,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,w^2,w^2,w^2,w^2,w^2,1,0,1]);
U:=Matrix(F,18,1,[
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
1,
w,
w^2,
w^2,
w,
w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B30_18_30_18") then
DatabaseCode:=BestKnownLinearCode(F,30,18);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 8;
InputDistanceCache["B30_18_30_18"]:=Cin;
else assert Cin eq InputDistanceCache["B30_18_30_18"];end if;
S:=HullSource("B30_18_s5","B30_18",Gin,U,8,5,8,"exact",Vector(F,[0,1,0,0,0,0,0,w,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w^2,0,1,w^2,0,0,0]));
S`PaperRows:=[25];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B30_18_s5";
end for;
HullDecreasingExamples["B30_18_s5"]:=S;X4Sources["B30_18_s5"]:=S;
print "VERIFIED SOURCE B30_18_s5";

// B30_21_s0: ingredient B30_21.
Gin:=Matrix(F,21,30,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w,0,w^2,0,1,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,1,1,1,w,0,1,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,1,0,w,w^2,w^2,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,w^2,w^2,w^2,1,w^2,w,1,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,1,w^2,0,0,1,1,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,w^2,w^2,1,w,w^2,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,1,1,w,w,w,1,0,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,w^2,0,w,0,w,w,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,w,0,0,w,1,w,0,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w,0,0,w^2,0,0,1,0,1,1,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w^2,w^2,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,0,0,0,w^2,w,w^2,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,0,0,0,0,w^2,0,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,0,0,w^2,0,1,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,0,1,1,0,w,1,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,0,0,1,0,w,1,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,w,w,w^2,w,w,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,0,1,0,w,1,0,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,w^2,w,w,w^2,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,w,0,1,w,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,1,w^2,w,w,0]);
U:=Matrix(F,21,1,[
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
1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B30_21_30_21") then
DatabaseCode:=BestKnownLinearCode(F,30,21);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 6;
InputDistanceCache["B30_21_30_21"]:=Cin;
else assert Cin eq InputDistanceCache["B30_21_30_21"];end if;
S:=HullSource("B30_21_s0","B30_21",Gin,U,6,0,6,"exact",Vector(F,[0,0,0,w^2,0,0,0,0,0,0,w^2,w,0,0,0,0,0,w^2,0,0,w^2,0,0,w^2,0,0,0,0,0,0,0]));
S`PaperRows:=[26,175];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B30_21_s0";
end for;
HullDecreasingExamples["B30_21_s0"]:=S;X4Sources["B30_21_s0"]:=S;
print "VERIFIED SOURCE B30_21_s0";

// BS003: ingredient B30_7.
Gin:=Matrix(F,7,30,[
1,0,0,0,0,0,0,1,0,w,1,0,0,w,0,1,w^2,w^2,0,0,1,w,0,w^2,1,w,w^2,w^2,w,w,
0,1,0,0,0,0,0,1,1,w,w^2,1,0,w,w,1,0,0,w^2,0,1,w^2,w,w^2,w^2,w^2,1,0,1,0,
0,0,1,0,0,0,0,1,1,w^2,w^2,w^2,1,w,w,w^2,0,w^2,0,w^2,1,w^2,w^2,1,w,1,0,w,w,w^2,
0,0,0,1,0,0,0,1,w^2,w^2,w,w^2,w^2,w^2,w,w^2,w,w^2,w^2,0,w,w^2,w^2,0,0,0,w,w^2,0,0,
0,0,0,0,1,0,0,1,w^2,1,w,w,w^2,1,w^2,w^2,w^2,1,w^2,w^2,1,0,w^2,0,w,w,w^2,1,1,w,
0,0,0,0,0,1,0,1,w^2,1,0,w,w,1,1,w,w^2,0,1,w^2,w,w^2,0,0,1,0,1,0,w^2,w^2,
0,0,0,0,0,0,1,1,w,1,0,0,w,0,1,0,w^2,0,0,1,w,0,w^2,w^2,w,w^2,w^2,w,w,1]);
U:=Matrix(F,7,2,[
0,0,
0,0,
0,0,
w,1,
w^2,0,
0,0,
0,0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B30_7_30_7") then
DatabaseCode:=BestKnownLinearCode(F,30,7);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 17;
InputDistanceCache["B30_7_30_7"]:=Cin;
else assert Cin eq InputDistanceCache["B30_7_30_7"];end if;
S:=HullSource("BS003","B30_7",Gin,U,17,2,17,"exact",Vector(F,[w,w^2,w,0,0,0,w,1,w,1,1,w,1,1,0,0,0,0,w,w^2,0,0,1,0,0,w,w^2,1,0,0,0,0]));
S`PaperRows:=[27,176];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS003";
end for;
HullDecreasingExamples["BS003"]:=S;X4Sources["BS003"]:=S;
print "VERIFIED SOURCE BS003";

// B30_11_s1: ingredient B30_11.
Gin:=Matrix(F,11,30,[
1,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,w,0,0,0,w^2,w,0,1,1,1,w^2,0,0,w,w,w^2,
0,1,0,0,0,0,0,0,0,0,0,1,w,w,0,w^2,0,0,1,0,w,w,w^2,w^2,0,w^2,0,w^2,1,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,1,w,w,w^2,w^2,0,0,1,0,w,w,w^2,w^2,0,w^2,0,w^2,1,
0,0,0,1,0,0,0,0,0,0,0,1,1,0,1,1,w^2,w^2,1,w^2,1,w,0,0,w,w^2,0,0,w^2,w,
0,0,0,0,1,0,0,0,0,0,0,w^2,w,w,w,w,1,w^2,0,w^2,w^2,0,w^2,1,w^2,w,w^2,w,w,0,
0,0,0,0,0,1,0,0,0,0,0,1,w,w^2,1,0,w,1,w,w^2,w^2,1,w,1,0,w^2,w,0,1,w^2,
0,0,0,0,0,0,1,0,0,0,0,w^2,w,1,1,w^2,0,w,w,0,w^2,w,0,w^2,w,0,w^2,0,w,w,
0,0,0,0,0,0,0,1,0,0,0,w^2,0,1,w^2,w,w^2,0,1,0,0,w,w^2,1,0,w,0,1,w,1,
0,0,0,0,0,0,0,0,1,0,0,w,1,w,0,1,w,w^2,w,0,0,w^2,1,0,w^2,0,w,1,0,0,
0,0,0,0,0,0,0,0,0,1,0,0,w,1,w,0,1,w,w^2,w,0,0,w^2,1,0,w^2,0,w,1,0,
0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,w,0,0,1,w^2,0,w,w,w,1,0,0,w^2,w^2,1,0]);
U:=Matrix(F,11,2,[
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
1,w,
w,0,
0,0,
w^2,0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B30_11_30_11") then
DatabaseCode:=BestKnownLinearCode(F,30,11);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 13;
InputDistanceCache["B30_11_30_11"]:=Cin;
else assert Cin eq InputDistanceCache["B30_11_30_11"];end if;
S:=HullSource("B30_11_s1","B30_11",Gin,U,13,1,13,"exact",Vector(F,[1,w^2,w,w^2,w^2,w^2,w^2,0,0,1,0,0,0,0,1,w^2,0,0,0,0,0,0,0,1,0,0,0,w^2,0,1,0,0]));
S`PaperRows:=[29,179];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B30_11_s1";
end for;
HullDecreasingExamples["B30_11_s1"]:=S;X4Sources["B30_11_s1"]:=S;
print "VERIFIED SOURCE B30_11_s1";

// BS017: ingredient B31_16.
Gin:=Matrix(F,16,31,[
1,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,0,0,0,w^2,w^2,w^2,0,1,0,w^2,0,1,w,0,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,0,0,0,w^2,w^2,w^2,0,1,0,w^2,0,1,w,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,w,1,w,0,0,0,0,0,0,0,w,0,w,1,w,1,w,w,w^2,
0,0,0,1,0,0,0,0,0,0,0,0,w^2,0,1,0,0,0,0,w,w,1,1,w,w,0,w^2,w^2,w,1,1,
0,0,0,0,1,0,0,0,0,0,0,0,w,w,0,0,0,0,0,1,w^2,1,w,1,w^2,w^2,1,0,1,0,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,w,w,0,0,0,0,0,1,w^2,1,w,1,w^2,w^2,1,0,1,0,
0,0,0,0,0,0,1,0,0,0,0,0,w^2,w,w,0,0,0,0,w^2,w^2,0,0,w,w^2,w,w,w^2,w,w,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,w^2,1,w,0,0,0,0,w,1,w,1,0,0,1,0,w^2,0,1,1,
0,0,0,0,0,0,0,0,1,0,0,0,w^2,1,1,0,0,0,0,w^2,1,0,1,w,1,w^2,0,0,0,w,w,
0,0,0,0,0,0,0,0,0,1,0,0,w,w,1,0,0,0,0,0,w^2,w,1,w,0,1,1,w,w,w^2,w,
0,0,0,0,0,0,0,0,0,0,1,0,w,w^2,w,0,0,0,0,w,w,0,0,w^2,1,w,w,1,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,w^2,0,0,0,0,0,w,w^2,w,1,0,1,1,1,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,w,0,w^2,1,1,w,1,w,0,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,1,1,w^2,w,0,w,w,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,1,0,w,w,w,1,1,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,w,w^2,w^2,1,w^2,1,0,1,w^2,1]);
U:=Matrix(F,16,1,[
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
1,
0,
0,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B31_16_31_16") then
DatabaseCode:=BestKnownLinearCode(F,31,16);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 10;
InputDistanceCache["B31_16_31_16"]:=Cin;
else assert Cin eq InputDistanceCache["B31_16_31_16"];end if;
S:=HullSource("BS017","B31_16",Gin,U,10,4,10,"exact",Vector(F,[1,0,w,w^2,w^2,1,w^2,1,0,1,w^2,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]));
S`PaperRows:=[30,174];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS017";
end for;
HullDecreasingExamples["BS017"]:=S;X4Sources["BS017"]:=S;
print "VERIFIED SOURCE BS017";

// B32_16_s5: ingredient B32_16.
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
0,
0,
0,
0,
0,
1,
1,
1,
1,
0,
1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B32_16_32_16") then
DatabaseCode:=BestKnownLinearCode(F,32,16);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 11;
InputDistanceCache["B32_16_32_16"]:=Cin;
else assert Cin eq InputDistanceCache["B32_16_32_16"];end if;
S:=HullSource("B32_16_s5","B32_16",Gin,U,11,5,11,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,w^2,w,w,0,w,0,1,0,w,1,w^2,0,0]));
S`PaperRows:=[34,166,185];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B32_16_s5";
end for;
HullDecreasingExamples["B32_16_s5"]:=S;X4Sources["B32_16_s5"]:=S;
print "VERIFIED SOURCE B32_16_s5";

// B32_23_s0: ingredient B32_23.
Gin:=Matrix(F,23,32,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,0,w^2,1,w,w,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,w^2,w^2,w,w^2,w^2,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,1,0,w^2,w^2,w,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,1,w,0,w^2,0,1,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w,w,w^2,0,1,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w^2,w^2,1,1,1,1,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,0,w^2,1,w,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,w^2,w^2,w^2,1,w,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,0,1,w^2,0,w^2,1,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,w^2,0,1,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,0,1,w,0,w,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,w^2,w^2,0,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1,0,w^2,0,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w,0,w,1,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,1,w,0,0,1,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,0,w^2,1,w,w^2,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,w,w,w^2,w,1,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,1,1,w^2,w,w^2,w^2,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,1,0,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,w^2,0,1,0,w,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,0,w^2,0,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,w^2,w,w,0,w^2,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,1,w^2,0,1,w,w,1]);
U:=Matrix(F,23,1,[
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
w,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B32_23_32_23") then
DatabaseCode:=BestKnownLinearCode(F,32,23);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 6;
InputDistanceCache["B32_23_32_23"]:=Cin;
else assert Cin eq InputDistanceCache["B32_23_32_23"];end if;
S:=HullSource("B32_23_s0","B32_23",Gin,U,6,0,6,"exact",Vector(F,[0,0,0,1,0,0,0,0,0,1,0,1,0,0,w^2,0,0,0,0,0,0,0,w^2,w^2,0,0,0,0,0,0,0,0,0]));
S`PaperRows:=[37];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B32_23_s0";
end for;
HullDecreasingExamples["B32_23_s0"]:=S;X4Sources["B32_23_s0"]:=S;
print "VERIFIED SOURCE B32_23_s0";

// H18: ingredient Q23.
Gin:=Matrix(F,11,33,[
1,0,0,0,0,0,0,0,0,0,1,0,1,1,0,w^2,w,1,w,1,w,w,w^2,0,0,0,0,w,w,0,w,w,w,
0,1,0,0,0,0,0,0,0,0,1,0,w^2,w,w^2,1,w^2,1,1,1,1,w,w,0,w^2,w^2,w^2,1,w^2,1,1,w^2,w^2,
0,0,1,0,0,0,0,0,0,0,1,0,w^2,0,0,w,1,0,1,w,1,1,w^2,1,w^2,0,0,w,0,0,0,0,w,
0,0,0,1,0,0,0,0,0,0,1,0,0,w^2,1,w,1,1,w^2,1,1,w,w^2,1,w^2,1,w,0,w,w,0,0,0,
0,0,0,0,1,0,0,0,0,0,1,0,w^2,w^2,1,0,w,w,1,0,1,1,0,0,w,0,w,w^2,1,1,w^2,1,1,
0,0,0,0,0,1,0,0,0,0,1,0,0,w^2,w,w^2,w^2,w,1,1,w^2,w,0,w,w,0,w,w,w^2,w^2,1,w^2,1,
0,0,0,0,0,0,1,0,0,0,1,0,w^2,w^2,1,w^2,w^2,0,w,w,1,w^2,1,w^2,1,1,w^2,w^2,w^2,0,w,0,w,
0,0,0,0,0,0,0,1,0,0,1,0,w,1,0,1,w,1,1,0,w^2,0,0,0,w,0,0,0,0,w,w^2,1,w^2,
0,0,0,0,0,0,0,0,1,0,1,0,1,w^2,1,w^2,w^2,w^2,w^2,0,w,1,0,0,0,w,0,w,w,0,0,1,w^2,
0,0,0,0,0,0,0,0,0,1,1,0,0,1,w,w^2,0,w^2,0,w^2,w^2,1,w,w,w,w,0,0,w,0,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,w,w,w,w,w,w,w,w,w,w,w]);
U:=Matrix(F,11,1,[
1,
w^2,
1,
w,
0,
w^2,
1,
1,
0,
w^2,
w]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"Q23_33_11") then
assert MinimumWeight(Cin) ge 14;
InputDistanceCache["Q23_33_11"]:=Cin;
else assert Cin eq InputDistanceCache["Q23_33_11"];end if;
S:=HullSource("H18","Q23",Gin,U,14,5,15,"exact",Vector(F,[0,0,0,0,0,0,0,1,0,0,1,0,w,1,0,1,w,1,1,0,w^2,0,0,0,w,0,0,0,0,w,w^2,1,w^2,1]));
S`PaperRows:=[38];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="H18";
end for;
HullDecreasingExamples["H18"]:=S;X4Sources["H18"]:=S;
print "VERIFIED SOURCE H18";

// H20: ingredient Q25.
Gin:=Matrix(F,8,32,[
1,0,0,0,0,0,0,0,w^2,0,1,w^2,0,w,0,w,0,w^2,w^2,w,w,1,0,w,1,1,w,w,w^2,0,0,0,
0,1,0,0,0,0,0,0,w,w^2,0,1,w^2,0,w,0,w,0,w^2,w^2,w,w,1,0,0,1,1,w,w,w^2,0,0,
0,0,1,0,0,0,0,0,0,w,w^2,0,1,w^2,0,w,0,w,0,w^2,w^2,w,w,1,0,0,1,1,w,w,w^2,0,
0,0,0,1,0,0,0,0,w,0,w,w^2,0,1,w^2,0,1,0,w,0,w^2,w^2,w,w,0,0,0,1,1,w,w,w^2,
0,0,0,0,1,0,0,0,0,w,0,w,w^2,0,1,w^2,w,1,0,w,0,w^2,w^2,w,w^2,0,0,0,1,1,w,w,
0,0,0,0,0,1,0,0,w^2,0,w,0,w,w^2,0,1,w,w,1,0,w,0,w^2,w^2,w,w^2,0,0,0,1,1,w,
0,0,0,0,0,0,1,0,1,w^2,0,w,0,w,w^2,0,w^2,w,w,1,0,w,0,w^2,w,w,w^2,0,0,0,1,1,
0,0,0,0,0,0,0,1,0,1,w^2,0,w,0,w,w^2,w^2,w^2,w,w,1,0,w,0,1,w,w,w^2,0,0,0,1]);
U:=Matrix(F,8,3,[
0,0,0,
0,0,0,
0,0,0,
0,0,0,
1,0,0,
0,1,0,
0,0,1,
0,0,0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"Q25_32_8") then
assert MinimumWeight(Cin) ge 17;
InputDistanceCache["Q25_32_8"]:=Cin;
else assert Cin eq InputDistanceCache["Q25_32_8"];end if;
S:=HullSource("H20","Q25",Gin,U,17,4,17,"lower_bound",Vector(F,[]));
S`PaperRows:=[41];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="H20";
end for;
HullDecreasingExamples["H20"]:=S;X4Sources["H20"]:=S;
print "VERIFIED SOURCE H20";

// BS006: ingredient B34_14.
Gin:=Matrix(F,14,34,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w^2,1,w^2,w^2,1,1,w^2,w^2,1,w^2,w^2,w,0,0,0,w,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,w,1,0,w,1,w^2,0,w,1,0,w,0,1,w,w^2,1,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,w,1,0,w,1,w^2,0,w,1,0,w,w,w^2,0,1,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,w^2,1,w^2,0,w,0,0,w,w,w^2,0,w^2,0,w^2,1,0,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,w^2,1,1,0,w^2,1,w^2,1,w,w,1,0,1,1,1,w,0,0,w,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,0,w,0,w^2,0,0,w,w,1,w^2,w,w^2,w^2,w^2,w,1,w^2,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,0,w^2,w,1,w,1,w^2,w^2,0,0,w,1,0,w,w,0,w,0,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,0,1,w,0,0,w^2,w^2,1,w,1,w,w^2,0,w^2,w^2,w,w,0,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w,w^2,1,w,w,0,0,w^2,0,w,0,1,1,w^2,1,0,w^2,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,0,1,w,w,1,w^2,1,w^2,0,1,1,w^2,w^2,w^2,0,1,w,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,w^2,w,w,0,0,w,0,w^2,1,w^2,w^2,w^2,w,w^2,w^2,w,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,0,1,w,0,w^2,1,w,0,1,w,w^2,w,w,0,w^2,w^2,0,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,0,1,w,0,w^2,1,w,0,1,w,w^2,w,w,1,0,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w^2,1,w^2,w^2,1,1,w^2,w^2,1,w^2,w^2,w,1,w,0,w,0,1]);
U:=Matrix(F,14,1,[
0,
0,
0,
0,
0,
0,
0,
0,
1,
0,
0,
0,
0,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B34_14_34_14") then
DatabaseCode:=BestKnownLinearCode(F,34,14);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 13;
InputDistanceCache["B34_14_34_14"]:=Cin;
else assert Cin eq InputDistanceCache["B34_14_34_14"];end if;
S:=HullSource("BS006","B34_14",Gin,U,13,8,13,"exact",Vector(F,[1,0,0,0,0,0,0,w^2,0,1,w,0,0,0,0,w^2,1,0,0,1,0,w^2,w^2,0,w,0,1,1,0,0,0,w^2,0,0,0]));
S`PaperRows:=[42,177];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS006";
end for;
HullDecreasingExamples["BS006"]:=S;X4Sources["BS006"]:=S;
print "VERIFIED SOURCE BS006";

// B34_19_s6: ingredient B34_19.
Gin:=Matrix(F,19,34,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,w^2,w,w,0,w,0,w,0,1,1,0,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,w^2,w,w,0,w,0,w,0,1,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w^2,w^2,w,0,0,1,w,1,w,w^2,1,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,w^2,w,w,w,0,w,1,1,w^2,1,1,w^2,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,w,1,1,w^2,1,1,1,w,w^2,w^2,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,0,0,w^2,0,w^2,1,0,1,0,w,0,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,0,0,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,0,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,w^2,w,1,w^2,w,w^2,w,1,0,w^2,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,w^2,w,1,w^2,w,w^2,w,1,0,w^2,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,0,w,w,1,w,w,w^2,0,w,w,0,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,w^2,1,w,1,0,w^2,1,1,1,0,0,w,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,1,0,0,0,1,1,w^2,0,1,1,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,0,0,w,1,1,w^2,w^2,w,0,0,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,w,1,w,w^2,0,w^2,1,w,w,1,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,1,1,1,0,1,0,1,w,w,w,1,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w^2,w,w^2,w,w,w^2,w^2,w,0,w,0,1,0,w]);
U:=Matrix(F,19,1,[
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
w,
1,
0,
0,
w,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B34_19_34_19") then
DatabaseCode:=BestKnownLinearCode(F,34,19);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 9;
InputDistanceCache["B34_19_34_19"]:=Cin;
else assert Cin eq InputDistanceCache["B34_19_34_19"];end if;
S:=HullSource("B34_19_s6","B34_19",Gin,U,9,6,9,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,0,w^2,w,0,0,0,0,0,0,0,w^2,1,0,0,0,0,0,1,0,0,w,w,0,1,1,0]));
S`PaperRows:=[44,193];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B34_19_s6";
end for;
HullDecreasingExamples["B34_19_s6"]:=S;X4Sources["B34_19_s6"]:=S;
print "VERIFIED SOURCE B34_19_s6";

// B32_16_s3: ingredient B32_16.
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
U:=Matrix(F,16,3,[
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,1,0,
0,0,0,
0,1,1,
1,1,1,
1,0,1,
1,0,1,
0,0,0,
0,0,1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B32_16_32_16") then
DatabaseCode:=BestKnownLinearCode(F,32,16);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 11;
InputDistanceCache["B32_16_32_16"]:=Cin;
else assert Cin eq InputDistanceCache["B32_16_32_16"];end if;
S:=HullSource("B32_16_s3","B32_16",Gin,U,11,3,11,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,w^2,w,w,0,w,0,1,0,w,1,w^2,0,0,0,0]));
S`PaperRows:=[45,186,189,194];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B32_16_s3";
end for;
HullDecreasingExamples["B32_16_s3"]:=S;X4Sources["B32_16_s3"]:=S;
print "VERIFIED SOURCE B32_16_s3";

// B35_19_puncture4_s0: ingredient B35_19_puncture4.
Gin:=Matrix(F,19,34,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,w^2,0,w^2,0,0,w,0,0,w,0,w^2,0,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,1,0,w^2,w,1,1,0,w,w,1,0,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w,0,0,w^2,0,1,w,1,1,1,w,1,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,1,1,1,w,w,w,w^2,w^2,w^2,1,0,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,w,w,0,w^2,w^2,0,1,1,0,1,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,1,w,w,0,1,w^2,0,w,1,0,w^2,0,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,w,0,w^2,1,0,0,1,1,w^2,w,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,0,w^2,w^2,w,0,w^2,1,0,0,w,1,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w,w,w,w^2,0,1,0,w,w^2,w^2,w,0,w^2,w^2,w^2,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,1,1,1,0,w,w,1,1,1,w^2,0,1,0,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w^2,w,1,1,w^2,w^2,w,0,1,0,w^2,1,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,0,0,1,w,w^2,0,w,1,w,1,w,w,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,w^2,w^2,0,1,1,w,0,w^2,1,w^2,1,w^2,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w,w,w,1,w,0,0,1,0,1,0,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,0,w,w^2,w^2,w^2,1,w,w^2,w,w,w,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,w^2,0,1,w^2,w^2,w,w,w,0,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,1,w,w,w,0,w^2,w^2,1,1,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,0,1,0,0,w^2,0,w^2,1,w,1,w^2,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,0,0,1,w,0,w,0,w,0,w,w^2,1,w^2]);
U:=Matrix(F,19,1,[
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
w^2]);
Cin:=LinearCode(Gin);
ParentG:=Matrix(F,19,35,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,w,w^2,1,1,0,w,w,w,0,0,w^2,w,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,w^2,1,w^2,w,w,0,1,1,w,w^2,w^2,w^2,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,w,1,w,w^2,w,1,0,1,w^2,w,w^2,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w,0,0,w,w^2,0,w^2,0,w^2,0,w^2,1,w,1,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,1,0,w^2,w,0,w,1,w^2,1,w,1,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,0,0,1,w^2,0,w,w^2,1,1,0,w,w,w,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,w,0,w^2,1,0,0,1,1,w^2,w,w,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,w,0,w^2,1,0,0,1,1,w^2,w,w,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w,w,w,w^2,0,1,0,w,w^2,w^2,w,0,w^2,w^2,w^2,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w,w,w,w^2,0,1,0,w,w^2,w^2,w,0,w^2,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w^2,w,1,1,w^2,w^2,w,0,1,0,w^2,1,w^2,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w^2,w,1,1,w^2,w^2,w,0,1,0,w^2,1,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,w^2,w^2,0,1,1,w,0,w^2,1,w^2,1,w^2,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,w^2,w^2,0,1,1,w,0,w^2,1,w^2,1,w^2,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,w^2,w,w,0,0,0,w,1,w,1,w,0,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,w,w^2,w,1,1,0,w^2,0,w,0,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,w^2,0,w^2,0,w^2,0,w^2,1,w,1,0,0,w,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,0,w^2,w,1,0,1,w,w^2,w^2,0,1,w,w,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1]);
ParentCode:=LinearCode(ParentG);
DatabaseCode:=BestKnownLinearCode(F,35,19);assert ParentCode eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 10;
PreprocessCoordinates:=[4];Keep:=[j:j in [1..Ncols(ParentG)]|not j in PreprocessCoordinates];
PreG:=ParentG;
assert Cin eq LinearCode(SelectColumns(PreG,Keep));
S:=HullSource("B35_19_puncture4_s0","B35_19_puncture4",Gin,U,9,0,9,"exact",Vector(F,[0,0,0,w^2,w,1,0,1,0,0,w,0,0,w,0,1,0,w^2,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0]));
S`Preprocessing:=<"puncturing","B35_19",ParentG,PreprocessCoordinates>;
S`PaperRows:=[46,196];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B35_19_puncture4_s0";
end for;
HullDecreasingExamples["B35_19_puncture4_s0"]:=S;X4Sources["B35_19_puncture4_s0"]:=S;
print "VERIFIED SOURCE B35_19_puncture4_s0";

// BS007: ingredient B35_10.
Gin:=Matrix(F,10,35,[
1,0,0,0,0,0,0,0,0,0,w,0,w^2,w^2,0,0,w,w,1,0,w^2,0,w^2,w^2,1,0,0,1,w^2,w,1,w^2,w,w,w,
0,1,0,0,0,0,0,0,0,0,0,w,w^2,w^2,w^2,0,0,w,w,1,0,w^2,0,w^2,1,1,0,0,1,w^2,w,1,w^2,w,w,
0,0,1,0,0,0,0,0,0,0,w^2,0,w,w,w^2,w^2,w^2,w^2,0,w,0,0,w,1,0,1,1,w,1,w,1,w^2,w,0,1,
0,0,0,1,0,0,0,0,0,0,0,w^2,1,w,w,w^2,w^2,w^2,w^2,0,w,0,0,w,0,0,1,1,w,1,w,1,w^2,w,0,
0,0,0,0,1,0,0,0,0,0,1,0,0,w^2,w,w,w,w,0,w^2,w,w,w,w,w,0,0,w,w^2,w^2,w,0,0,w,w^2,
0,0,0,0,0,1,0,0,0,0,0,1,w,0,w^2,w,w,w,w,0,w^2,w,w,w,w^2,w,0,0,w,w^2,w^2,w,0,0,w,
0,0,0,0,0,0,1,0,0,0,w,0,1,1,0,w^2,0,0,w^2,w,w^2,w^2,1,1,w,w^2,w,1,w^2,0,w,0,0,w,w,
0,0,0,0,0,0,0,1,0,0,0,w,1,1,1,0,w^2,0,0,w^2,w,w^2,w^2,1,w^2,w,w^2,w,1,w^2,0,w,0,0,w,
0,0,0,0,0,0,0,0,1,0,w^2,0,0,0,1,1,w^2,0,w,0,w,w,w,w,0,w^2,w,1,w^2,w,1,1,1,w^2,w^2,
0,0,0,0,0,0,0,0,0,1,0,w^2,w,0,0,1,1,w^2,0,w,0,w,w,w,0,0,w^2,w,1,w^2,w,1,1,1,w^2]);
U:=Matrix(F,10,1,[
0,
0,
0,
0,
0,
1,
w^2,
0,
0,
w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B35_10_35_10") then
DatabaseCode:=BestKnownLinearCode(F,35,10);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 17;
InputDistanceCache["B35_10_35_10"]:=Cin;
else assert Cin eq InputDistanceCache["B35_10_35_10"];end if;
S:=HullSource("BS007","B35_10",Gin,U,17,4,17,"exact",Vector(F,[w^2,0,1,0,1,w^2,w^2,1,0,w,w,0,0,1,w,0,0,0,0,0,w,1,0,1,1,0,w,1,0,0,0,0,1,0,0,0]));
S`PaperRows:=[47,188];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS007";
end for;
HullDecreasingExamples["BS007"]:=S;X4Sources["BS007"]:=S;
print "VERIFIED SOURCE BS007";

// B35_20_s7: ingredient B35_20.
Gin:=Matrix(F,20,35,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,w^2,w,w,0,w,0,w,0,1,1,0,0,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,w^2,w,w,0,w,0,w,0,1,1,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,w^2,w,w,0,w,0,w,0,1,1,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w^2,w^2,w,0,0,1,w,1,w,w^2,1,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,w^2,w,w,w,0,w,1,1,w^2,1,1,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,w,1,1,w^2,1,1,1,w,w^2,w^2,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,0,0,w^2,0,w^2,1,0,1,0,w,0,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,0,0,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,0,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,w^2,w,1,w^2,w,w^2,w,1,0,w^2,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,w^2,w,1,w^2,w,w^2,w,1,0,w^2,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,0,w,w,1,w,w,w^2,0,w,w,0,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,w^2,1,w,1,0,w^2,1,1,1,0,0,w,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,1,0,0,0,1,1,w^2,0,1,1,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,0,0,w,1,1,w^2,w^2,w,0,0,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,w,1,w,w^2,0,w^2,1,w,w,1,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,1,1,1,0,1,0,1,w,w,w,1,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w^2,w,w^2,w,w,w^2,w^2,w,0,w,0,1,0,w]);
U:=Matrix(F,20,1,[
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
1,
w,
0,
1,
w^2,
w,
1,
w]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B35_20_35_20") then
DatabaseCode:=BestKnownLinearCode(F,35,20);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 9;
InputDistanceCache["B35_20_35_20"]:=Cin;
else assert Cin eq InputDistanceCache["B35_20_35_20"];end if;
S:=HullSource("B35_20_s7","B35_20",Gin,U,9,7,9,"exact",Vector(F,[0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,0,w^2,w,0,w^2,1,1,0,1,0,0,0,0]));
S`PaperRows:=[48,198];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B35_20_s7";
end for;
HullDecreasingExamples["B35_20_s7"]:=S;X4Sources["B35_20_s7"]:=S;
print "VERIFIED SOURCE B35_20_s7";

// B35_19_s1: ingredient B35_19.
Gin:=Matrix(F,19,35,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,w,w^2,1,1,0,w,w,w,0,0,w^2,w,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,w^2,1,w^2,w,w,0,1,1,w,w^2,w^2,w^2,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,w,1,w,w^2,w,1,0,1,w^2,w,w^2,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w,0,0,w,w^2,0,w^2,0,w^2,0,w^2,1,w,1,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,1,0,w^2,w,0,w,1,w^2,1,w,1,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,0,0,1,w^2,0,w,w^2,1,1,0,w,w,w,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,w,0,w^2,1,0,0,1,1,w^2,w,w,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,w,0,w^2,1,0,0,1,1,w^2,w,w,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w,w,w,w^2,0,1,0,w,w^2,w^2,w,0,w^2,w^2,w^2,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w,w,w,w^2,0,1,0,w,w^2,w^2,w,0,w^2,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w^2,w,1,1,w^2,w^2,w,0,1,0,w^2,1,w^2,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w^2,w,1,1,w^2,w^2,w,0,1,0,w^2,1,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,w^2,w^2,0,1,1,w,0,w^2,1,w^2,1,w^2,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,w^2,w^2,0,1,1,w,0,w^2,1,w^2,1,w^2,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,w^2,w,w,0,0,0,w,1,w,1,w,0,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,w,w^2,w,1,1,0,w^2,0,w,0,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,w^2,0,w^2,0,w^2,0,w^2,1,w,1,0,0,w,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,0,w^2,w,1,0,1,w,w^2,w^2,0,1,w,w,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1]);
U:=Matrix(F,19,1,[
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
w,
1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B35_19_35_19") then
DatabaseCode:=BestKnownLinearCode(F,35,19);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 10;
InputDistanceCache["B35_19_35_19"]:=Cin;
else assert Cin eq InputDistanceCache["B35_19_35_19"];end if;
S:=HullSource("B35_19_s1","B35_19",Gin,U,10,1,10,"exact",Vector(F,[0,0,0,w^2,w^2,w,1,0,1,0,0,w,0,0,w,0,1,0,w^2,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0]));
S`PaperRows:=[49,191,195];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B35_19_s1";
end for;
HullDecreasingExamples["B35_19_s1"]:=S;X4Sources["B35_19_s1"]:=S;
print "VERIFIED SOURCE B35_19_s1";

// B36_21_s8: ingredient B36_21.
Gin:=Matrix(F,21,36,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,w,1,w^2,0,0,w^2,1,1,0,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,w^2,w,w,0,w,0,w,0,1,1,0,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,w^2,w,w,0,w,0,w,0,1,1,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,w^2,w,w,0,w,0,w,0,1,1,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w^2,w^2,w,0,0,1,w,1,w,w^2,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,w^2,w,w,w,0,w,1,1,w^2,1,1,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,w,1,1,w^2,1,1,1,w,w^2,w^2,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,0,0,w^2,0,w^2,1,0,1,0,w,0,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,0,0,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,0,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,w^2,w,1,w^2,w,w^2,w,1,0,w^2,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,w^2,w,1,w^2,w,w^2,w,1,0,w^2,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,0,w,w,1,w,w,w^2,0,w,w,0,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,w^2,1,w,1,0,w^2,1,1,1,0,0,w,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,1,0,0,0,1,1,w^2,0,1,1,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,0,0,w,1,1,w^2,w^2,w,0,0,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,w,1,w,w^2,0,w^2,1,w,w,1,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,1,1,1,0,1,0,1,w,w,w,1,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w^2,w,w^2,w,w,w^2,w^2,w,0,w,0,1,0,w]);
U:=Matrix(F,21,1,[
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
w^2,
1,
w^2,
1,
1,
w,
w,
w^2,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B36_21_36_21") then
DatabaseCode:=BestKnownLinearCode(F,36,21);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 9;
InputDistanceCache["B36_21_36_21"]:=Cin;
else assert Cin eq InputDistanceCache["B36_21_36_21"];end if;
S:=HullSource("B36_21_s8","B36_21",Gin,U,9,8,9,"exact",Vector(F,[0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,0,w^2,w,0,w^2,1,1,0,1,0,0,0,0,0]));
S`PaperRows:=[52];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B36_21_s8";
end for;
HullDecreasingExamples["B36_21_s8"]:=S;X4Sources["B36_21_s8"]:=S;
print "VERIFIED SOURCE B36_21_s8";

// B36_20_s2: ingredient B36_20.
Gin:=Matrix(F,20,36,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,w,1,0,1,w,w^2,w^2,0,1,w,w,w,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,w,w^2,1,1,0,w,w,w,0,0,w^2,w,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,w^2,1,w^2,w,w,0,1,1,w,w^2,w^2,w^2,1,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,w,1,w,w^2,w,1,0,1,w^2,w,w^2,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w,0,0,w,w^2,0,w^2,0,w^2,0,w^2,1,w,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,1,0,w^2,w,0,w,1,w^2,1,w,1,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,0,0,1,w^2,0,w,w^2,1,1,0,w,w,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,w,0,w^2,1,0,0,1,1,w^2,w,w,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,w,0,w^2,1,0,0,1,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w,w,w,w^2,0,1,0,w,w^2,w^2,w,0,w^2,w^2,w^2,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w,w,w,w^2,0,1,0,w,w^2,w^2,w,0,w^2,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w^2,w,1,1,w^2,w^2,w,0,1,0,w^2,1,w^2,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w^2,w,1,1,w^2,w^2,w,0,1,0,w^2,1,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,w^2,w^2,0,1,1,w,0,w^2,1,w^2,1,w^2,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,w^2,w^2,0,1,1,w,0,w^2,1,w^2,1,w^2,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,w^2,w,w,0,0,0,w,1,w,1,w,0,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,w,w^2,w,1,1,0,w^2,0,w,0,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,w^2,0,w^2,0,w^2,0,w^2,1,w,1,0,0,w,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1]);
U:=Matrix(F,20,1,[
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
1,
0,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B36_20_36_20") then
DatabaseCode:=BestKnownLinearCode(F,36,20);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 10;
InputDistanceCache["B36_20_36_20"]:=Cin;
else assert Cin eq InputDistanceCache["B36_20_36_20"];end if;
S:=HullSource("B36_20_s2","B36_20",Gin,U,10,2,10,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,0,w^2,0,0,w,0,0,0,0,0,0,1,0,0,1,0,w,0,0,0,0,w^2,w^2,1,w,0,w,0]));
S`PaperRows:=[53];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B36_20_s2";
end for;
HullDecreasingExamples["B36_20_s2"]:=S;X4Sources["B36_20_s2"]:=S;
print "VERIFIED SOURCE B36_20_s2";

// H26: ingredient Q2.
Gin:=Matrix(F,20,36,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,w,1,0,1,w,w^2,w^2,0,1,w,w,w,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,w,w^2,1,1,0,w,w,w,0,0,w^2,w,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,w^2,1,w^2,w,w,0,1,1,w,w^2,w^2,w^2,1,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,w,1,w,w^2,w,1,0,1,w^2,w,w^2,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w,0,0,w,w^2,0,w^2,0,w^2,0,w^2,1,w,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,1,0,w^2,w,0,w,1,w^2,1,w,1,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,0,0,1,w^2,0,w,w^2,1,1,0,w,w,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,w,0,w^2,1,0,0,1,1,w^2,w,w,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,w,0,w^2,1,0,0,1,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w,w,w,w^2,0,1,0,w,w^2,w^2,w,0,w^2,w^2,w^2,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w,w,w,w^2,0,1,0,w,w^2,w^2,w,0,w^2,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w^2,w,1,1,w^2,w^2,w,0,1,0,w^2,1,w^2,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w^2,w,1,1,w^2,w^2,w,0,1,0,w^2,1,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,w^2,w^2,0,1,1,w,0,w^2,1,w^2,1,w^2,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,w^2,w^2,0,1,1,w,0,w^2,1,w^2,1,w^2,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,w^2,w,w,0,0,0,w,1,w,1,w,0,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,w,w^2,w,1,1,0,w^2,0,w,0,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,w^2,0,w^2,0,w^2,0,w^2,1,w,1,0,0,w,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1,0,1,1]);
U:=Matrix(F,20,2,[
0,0,
1,0,
0,1,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"Q2_36_20") then
assert MinimumWeight(Cin) ge 10;
InputDistanceCache["Q2_36_20"]:=Cin;
else assert Cin eq InputDistanceCache["Q2_36_20"];end if;
S:=HullSource("H26","Q2",Gin,U,10,1,10,"lower_bound",Vector(F,[]));
S`PaperRows:=[56];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="H26";
end for;
HullDecreasingExamples["H26"]:=S;X4Sources["H26"]:=S;
print "VERIFIED SOURCE H26";

// B38_14_s2: ingredient B38_14.
Gin:=Matrix(F,14,38,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,1,1,1,w^2,w^2,0,1,w,w,w^2,0,1,w,1,w^2,1,w^2,1,w,w,0,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,1,w,w^2,w,w^2,0,1,w^2,w,1,1,w^2,1,1,w,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w^2,w,w^2,w^2,w^2,w,1,0,1,w,w,w^2,0,1,1,0,0,w,1,w,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,w,w^2,1,1,w^2,w,1,1,0,1,w^2,0,w,0,1,w,w,1,w,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w,1,w,w,w^2,w^2,1,w^2,0,0,w,1,w,w,w^2,w^2,1,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w,w^2,w^2,w^2,1,1,1,0,0,0,w,1,1,w^2,0,0,1,w,0,w^2,0,w,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,w,w^2,w,w,0,w^2,1,0,w,w,w^2,w,0,w^2,w,w^2,1,w,w^2,w,1,0,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,w,w^2,w,w,0,w^2,1,0,w,w,w^2,w,0,w^2,w,w^2,1,w,w^2,w,1,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,0,0,0,1,w^2,1,0,1,w,w^2,w^2,w,1,1,w,w,0,w,w^2,1,0,w,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,1,1,0,1,w^2,0,1,w,w,w,1,0,w,0,w^2,0,0,1,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,1,1,0,1,w^2,0,1,w,w,w,1,0,w,0,w^2,0,0,1,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,w,w^2,w^2,w^2,w,w^2,1,w^2,0,w^2,0,w^2,0,0,w^2,0,0,0,w^2,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,1,1,0,1,w^2,0,w^2,w,w^2,1,0,0,w^2,w,w^2,w,1,w^2,0,w^2,w^2,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,1,0,w,w^2,w^2,1,1,0,w,w,w^2,w,1,1,w,0,w,0,1,w,w^2]);
U:=Matrix(F,14,1,[
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
1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B38_14_38_14") then
DatabaseCode:=BestKnownLinearCode(F,38,14);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 15;
InputDistanceCache["B38_14_38_14"]:=Cin;
else assert Cin eq InputDistanceCache["B38_14_38_14"];end if;
S:=HullSource("B38_14_s2","B38_14",Gin,U,15,2,15,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,w,w,w,1,0,w,w,w,1,0,0,1,1,1,0,0,1,0,w^2,0,0,0,0,w,0,0,0,1,0,0]));
S`PaperRows:=[57,197,203,205];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B38_14_s2";
end for;
HullDecreasingExamples["B38_14_s2"]:=S;X4Sources["B38_14_s2"]:=S;
print "VERIFIED SOURCE B38_14_s2";

// B38_23_s10: ingredient B38_23.
Gin:=Matrix(F,23,38,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,w^2,1,w^2,w^2,1,1,w^2,0,w^2,0,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,w,1,w^2,0,0,w^2,1,1,0,w,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,w,1,w^2,0,0,w^2,1,1,0,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,w^2,w,w,0,w,0,w,0,1,1,0,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,w^2,w,w,0,w,0,w,0,1,1,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,w^2,w,w,0,w,0,w,0,1,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w^2,w^2,w,0,0,1,w,1,w,w^2,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,w^2,w,w,w,0,w,1,1,w^2,1,1,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,w,1,1,w^2,1,1,1,w,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,0,0,w^2,0,w^2,1,0,1,0,w,0,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,w^2,w,1,w^2,w,w^2,w,1,0,w^2,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,w^2,w,1,w^2,w,w^2,w,1,0,w^2,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,0,w,w,1,w,w,w^2,0,w,w,0,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,w^2,1,w,1,0,w^2,1,1,1,0,0,w,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,1,0,0,0,1,1,w^2,0,1,1,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,0,0,w,1,1,w^2,w^2,w,0,0,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,w,1,w,w^2,0,w^2,1,w,w,1,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,1,1,1,0,1,0,1,w,w,w,1,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w^2,w,w^2,w,w,w^2,w^2,w,0,w,0,1,0,w]);
U:=Matrix(F,23,1,[
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
0,
0,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B38_23_38_23") then
DatabaseCode:=BestKnownLinearCode(F,38,23);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 9;
InputDistanceCache["B38_23_38_23"]:=Cin;
else assert Cin eq InputDistanceCache["B38_23_38_23"];end if;
S:=HullSource("B38_23_s10","B38_23",Gin,U,9,10,9,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,0,0,0,0,0,1,0,w,0,0,w^2,1,0,w^2,0,w^2,0,0,0,w^2,0]));
S`PaperRows:=[58];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B38_23_s10";
end for;
HullDecreasingExamples["B38_23_s10"]:=S;X4Sources["B38_23_s10"]:=S;
print "VERIFIED SOURCE B38_23_s10";

// B38_22_s9: ingredient B38_22.
Gin:=Matrix(F,22,38,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,w^2,1,w^2,w^2,1,1,w^2,0,w^2,0,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,w,1,w^2,0,0,w^2,1,1,0,w,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,w,1,w^2,0,0,w^2,1,1,0,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,w^2,w,w,0,w,0,w,0,1,1,0,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,w^2,w,w,0,w,0,w,0,1,1,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,w^2,w,w,0,w,0,w,0,1,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w^2,w^2,w,0,0,1,w,1,w,w^2,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,w^2,w,w,w,0,w,1,1,w^2,1,1,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,w,1,1,w^2,1,1,1,w,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,0,0,w^2,0,w^2,1,0,1,0,w,0,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,1,w^2,0,1,w,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,w^2,w,1,w^2,w,w^2,w,1,0,w^2,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,w^2,w,1,w^2,w,w^2,w,1,0,w^2,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,0,w,w,1,w,w,w^2,0,w,w,0,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,w^2,1,w,1,0,w^2,1,1,1,0,0,w,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,1,0,0,0,1,1,w^2,0,1,1,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,0,0,w,1,1,w^2,w^2,w,0,0,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,w,1,w,w^2,0,w^2,1,w,w,1,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,1,1,1,0,1,0,1,w,w,w,1,1,w,w]);
U:=Matrix(F,22,1,[
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
w,
0,
w^2,
w,
1,
1,
w,
w^2,
w,
1,
1,
w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B38_22_38_22") then
DatabaseCode:=BestKnownLinearCode(F,38,22);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 9;
InputDistanceCache["B38_22_38_22"]:=Cin;
else assert Cin eq InputDistanceCache["B38_22_38_22"];end if;
S:=HullSource("B38_22_s9","B38_22",Gin,U,9,9,9,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,0,0,0,0,0,1,0,w,0,0,w^2,1,0,w^2,0,w^2,0,0,0,w^2,0]));
S`PaperRows:=[59];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B38_22_s9";
end for;
HullDecreasingExamples["B38_22_s9"]:=S;X4Sources["B38_22_s9"]:=S;
print "VERIFIED SOURCE B38_22_s9";

// B38_5_s1: ingredient B38_5.
Gin:=Matrix(F,5,38,[
1,0,0,0,0,w^2,w,w^2,w,w^2,w^2,w^2,w^2,0,1,0,0,1,w,1,0,w^2,0,1,w,0,1,1,1,w,0,w,1,0,w^2,1,1,w^2,
0,1,0,0,0,w^2,w^2,w,w^2,w,1,w^2,w^2,w^2,0,1,0,0,1,w,w,0,w^2,0,1,w,0,1,1,1,w^2,0,w,1,0,1,1,1,
0,0,1,0,0,w,w^2,w^2,w,w^2,0,1,w^2,w^2,w^2,w,1,0,0,1,1,w,0,w^2,0,1,w,0,1,1,0,w^2,0,w,1,w^2,1,1,
0,0,0,1,0,w^2,w,w^2,w^2,w,w^2,0,1,w^2,w^2,1,w,1,0,0,0,1,w,0,w^2,1,1,w,0,1,1,0,w^2,0,w,w^2,w^2,1,
0,0,0,0,1,w,w^2,w,w^2,w^2,w^2,w^2,0,1,w^2,0,1,w,1,0,w^2,0,1,w,0,1,1,1,w,0,w,1,0,w^2,0,1,w^2,w^2]);
U:=Matrix(F,5,2,[
0,0,
0,0,
w^2,0,
w,1,
w,0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B38_5_38_5") then
DatabaseCode:=BestKnownLinearCode(F,38,5);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 26;
InputDistanceCache["B38_5_38_5"]:=Cin;
else assert Cin eq InputDistanceCache["B38_5_38_5"];end if;
S:=HullSource("B38_5_s1","B38_5",Gin,U,26,1,26,"exact",Vector(F,[1,0,0,0,0,w^2,w,w^2,w,w^2,w^2,w^2,w^2,0,1,0,0,1,w,1,0,w^2,0,1,w,0,1,1,1,w,0,w,1,0,w^2,1,1,w^2,0,0]));
S`PaperRows:=[60];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B38_5_s1";
end for;
HullDecreasingExamples["B38_5_s1"]:=S;X4Sources["B38_5_s1"]:=S;
print "VERIFIED SOURCE B38_5_s1";

// B39_15_s3: ingredient B39_15.
Gin:=Matrix(F,15,39,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w,w,w,w,w^2,0,0,0,w,w,1,w,1,w^2,w,0,w^2,w^2,1,1,w^2,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,1,w,w^2,w,w^2,0,1,w^2,w,1,1,w^2,1,1,w,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,1,w,w^2,w,w^2,0,1,w^2,w,1,1,w^2,1,1,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,w,w^2,1,1,w^2,w,1,1,0,1,w^2,0,w,0,1,w,w,1,w,0,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w,w,w,w,w^2,1,w^2,1,w^2,w,0,0,w^2,0,0,w,w^2,0,w^2,0,1,w,0,w,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w,1,w,w,w^2,w^2,1,w^2,0,0,w,1,w,w,w^2,w^2,1,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,1,1,1,w,w,1,0,0,w,0,0,w^2,w,w^2,w,1,1,w^2,w,1,1,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,w,w^2,w,w,0,w^2,1,0,w,w,w^2,w,0,w^2,w,w^2,1,w,w^2,w,1,0,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,0,1,w^2,1,w^2,1,0,1,1,1,1,w,w,1,w^2,0,w^2,1,0,0,1,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,1,1,0,1,w^2,0,1,w,w,w,1,0,w,0,w^2,0,0,1,w,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,1,1,0,1,w^2,0,1,w,w,w,1,0,w,0,w^2,0,0,1,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,w,w^2,w^2,w^2,w,w^2,1,w^2,0,w^2,0,w^2,0,0,w^2,0,0,0,w^2,1,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w,w,w^2,w,w,1,0,w^2,1,w^2,1,w,w^2,w,w^2,w,w,0,w,w,0,w,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,1,w,w^2,w,w^2,0,1,w^2,w,1,1,w^2,1,1,w,0,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,w,w^2,w^2,w,w^2,1,1,w^2,1,0,0,0,0,w,w,1,w^2,w,w^2,w^2,w]);
U:=Matrix(F,15,1,[
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
1,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B39_15_39_15") then
DatabaseCode:=BestKnownLinearCode(F,39,15);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 15;
InputDistanceCache["B39_15_39_15"]:=Cin;
else assert Cin eq InputDistanceCache["B39_15_39_15"];end if;
S:=HullSource("B39_15_s3","B39_15",Gin,U,15,3,15,"exact",Vector(F,[0,0,0,0,w,0,0,0,0,0,0,w,0,0,0,w,0,w,w,0,1,0,0,0,w^2,1,0,0,0,0,w,1,0,1,1,0,w^2,w,w^2,0]));
S`PaperRows:=[61];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B39_15_s3";
end for;
HullDecreasingExamples["B39_15_s3"]:=S;X4Sources["B39_15_s3"]:=S;
print "VERIFIED SOURCE B39_15_s3";

// B39_26_s9: ingredient B39_26.
Gin:=Matrix(F,26,39,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w,1,w^2,1,0,w^2,1,0,0,1,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,0,0,0,w,0,w,w^2,w,1,1,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,w^2,w^2,w,w^2,w,0,w^2,1,1,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,1,w,w,w^2,w^2,w^2,w,1,w,w^2,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w,w^2,0,0,w,w,w,w,1,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,w^2,1,w,1,1,1,1,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,0,0,w,w,w,0,1,w^2,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,1,w,w^2,w^2,1,w^2,w,w^2,0,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,0,1,w,w^2,w,w,0,0,w,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,1,w,w^2,0,0,w,w^2,w,w,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,0,1,w,w,1,1,0,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,w,w,0,w^2,w,0,w,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,0,1,0,w^2,w^2,1,1,0,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,w,w^2,w,1,1,w,1,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,w,w,w^2,0,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,w,1,w^2,w,1,w,1,0,w,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,w^2,1,0,1,w^2,w,0,w,0,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,0,w,0,0,0,1,w,0,1,w,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,0,1,1,0,w,w^2,0,1,1,w^2,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,0,0,1,w,1,0,w,w,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,w,0,w^2,0,w,w^2,w,0,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,w^2,w^2,w,0,1,w^2,0,w,1,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,1,w,w,w,1,w^2,w^2,0,0,w,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,1,w,0,w,w,0,0,w^2,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,1,w,0,w,1,w^2,w,1,w^2,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,1,w,w^2,0,0,w,w,w^2,1,0,1]);
U:=Matrix(F,26,1,[
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
w,
1,
w,
w,
1,
w,
w^2,
1,
1,
w]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B39_26_39_26") then
DatabaseCode:=BestKnownLinearCode(F,39,26);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 8;
InputDistanceCache["B39_26_39_26"]:=Cin;
else assert Cin eq InputDistanceCache["B39_26_39_26"];end if;
S:=HullSource("B39_26_s9","B39_26",Gin,U,8,9,8,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,w,w^2,0,1,0,0,0,0,w^2,0,0,0,0,w,0,0,0,0,w^2,1,0,0,0,0,0]));
S`PaperRows:=[62,190,199];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="B39_26_s9";
end for;
HullDecreasingExamples["B39_26_s9"]:=S;X4Sources["B39_26_s9"]:=S;
print "VERIFIED SOURCE B39_26_s9";

// DV04: ingredient B40_26.
Gin:=Matrix(F,26,40,[
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
U:=Matrix(F,26,1,[
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
0,
0,
0,
0,
1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B40_26_40_26") then
DatabaseCode:=BestKnownLinearCode(F,40,26);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 8;
InputDistanceCache["B40_26_40_26"]:=Cin;
else assert Cin eq InputDistanceCache["B40_26_40_26"];end if;
S:=HullSource("DV04","B40_26",Gin,U,8,1,8,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,w^2,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,0,w^2,0,w^2,w^2,0,0,0]));
S`PaperRows:=[67,209];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV04";
end for;
HullDecreasingExamples["DV04"]:=S;X4Sources["DV04"]:=S;
print "VERIFIED SOURCE DV04";

// DV02: ingredient B41_13.
Gin:=Matrix(F,13,41,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,1,1,0,w,w^2,0,w^2,0,1,1,w,w,w,1,w,w,0,1,0,w,1,w,0,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,w,w^2,w^2,w^2,w^2,w,1,0,1,w,w^2,1,0,w^2,0,w,0,1,w^2,w,w^2,w,w,w,1,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,w,0,w^2,0,w^2,1,0,w,1,0,1,w^2,w,w,1,0,w,1,w,w^2,w^2,1,1,w,w^2,1,w^2,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,1,1,w^2,1,1,1,1,1,0,1,w,w^2,0,w,1,w^2,1,1,w,0,0,1,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w,1,0,w^2,1,0,w^2,w,w^2,w^2,w,1,w^2,0,1,0,1,0,w^2,w,0,0,w^2,0,1,w,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,1,w,w^2,0,w,0,w^2,0,w,1,1,w,0,0,0,w^2,1,1,w,1,w,1,w,0,w,1,w,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,w,w^2,0,w,0,w^2,0,w,1,1,w,0,0,0,w^2,1,1,w,1,w,1,w,0,w,1,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w,0,1,w^2,w^2,w^2,w,w,w,0,w,1,0,0,0,w,1,1,0,1,w,w^2,w^2,0,1,0,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,1,w^2,1,1,w,1,1,1,1,1,w^2,1,1,1,1,1,w,w,0,w,1,w^2,0,1,w^2,w^2,w,1,
0,0,0,0,0,0,0,0,0,1,0,0,0,w,w^2,1,w^2,w,w^2,w,1,w^2,0,w,1,w,w^2,0,0,1,0,w^2,w,0,0,0,0,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,1,0,0,w,0,1,w^2,0,w^2,0,w,w^2,w,w^2,0,w,0,w,1,0,w^2,1,1,0,1,w^2,0,w,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,w,w^2,w^2,w^2,w^2,w,0,1,1,w,w^2,1,0,w^2,0,w,0,1,w^2,w,w^2,w,w,w,1,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,1,1,0,w,1,0,w^2,0,1,1,w,w,w,1,w,w,0,1,0,w,1,w,0,w^2,0,w^2]);
U:=Matrix(F,13,1,[
0,
0,
0,
0,
0,
0,
1,
0,
0,
0,
0,
0,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B41_13_41_13") then
DatabaseCode:=BestKnownLinearCode(F,41,13);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 18;
InputDistanceCache["B41_13_41_13"]:=Cin;
else assert Cin eq InputDistanceCache["B41_13_41_13"];end if;
S:=HullSource("DV02","B41_13",Gin,U,18,6,18,"exact",Vector(F,[0,1,0,w,0,0,0,0,0,0,0,0,w^2,0,0,0,1,0,0,w,w^2,1,w,0,w^2,0,0,w^2,w^2,0,w^2,w^2,0,w,1,w,0,w,0,w^2,0,0]));
S`PaperRows:=[68,210,213];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV02";
end for;
HullDecreasingExamples["DV02"]:=S;X4Sources["DV02"]:=S;
print "VERIFIED SOURCE DV02";

// DV05: ingredient B46_16.
Gin:=Matrix(F,16,46,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w^2,w,w,0,w^2,w,w^2,w^2,0,w^2,w,w^2,1,1,w,0,1,1,1,w^2,w,w^2,w,w^2,0,0,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,w^2,1,0,w^2,w^2,0,0,w,w^2,w,0,0,w^2,0,w^2,w^2,w,w,w^2,w^2,1,1,0,0,0,w^2,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w^2,w^2,w,w^2,w^2,0,w^2,1,w,0,w,w^2,w^2,w^2,0,0,1,w^2,0,0,w^2,1,w,w^2,w,w,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,0,w^2,w^2,w,1,1,1,w^2,0,w^2,w,w^2,w^2,1,w^2,w^2,0,1,0,w^2,0,w^2,0,1,w^2,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,w,w^2,1,0,w,1,w^2,0,w,1,w,w^2,1,0,0,w,w,1,0,1,w,w,1,w,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,1,0,1,1,w,0,1,0,w^2,w,0,w,1,w,w,w^2,0,0,w,1,w^2,w^2,w^2,w,0,0,0,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,0,0,w^2,w,w,w^2,w^2,w^2,0,w^2,0,w^2,w,w,1,1,w^2,w^2,w^2,w^2,w^2,1,0,1,1,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,w,0,0,1,0,w^2,0,w^2,w,1,w^2,w^2,w^2,w^2,w,w,0,1,w,1,0,w^2,1,0,w,1,w,w^2,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,0,1,w,1,w,0,1,1,1,0,1,1,w,1,0,1,w^2,0,w,1,w,w,w,w^2,1,0,1,w,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,w,w,w,0,1,0,w,w,0,0,w,w^2,1,w,0,1,0,w,w^2,w^2,1,w,w,0,w,w,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w,0,1,1,1,w^2,0,0,1,w^2,w,0,w,0,0,w^2,0,0,w,1,w,w^2,1,1,1,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,w,0,1,1,w,w,w,1,0,w^2,0,1,1,w,1,1,0,w,0,1,0,1,0,w,w,w,0,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,0,0,0,w,0,0,1,1,1,w^2,0,w,1,w^2,w,0,w,0,0,w^2,0,0,w,1,w,w^2,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,1,w^2,w,1,w,w^2,w,w,w,1,0,w^2,1,0,w,0,0,w^2,1,1,0,w,w^2,0,w,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,w,0,w^2,w,0,w,w,w^2,0,w,0,w,w,0,0,w,1,w^2,1,w,0,0,w,w,1,1,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,w,w^2,w^2,w^2,1,0,w,0,0,w,0,w,1,w,w^2,w^2,0,w^2,0,w,w^2,1,0,w,w,w,1]);
U:=Matrix(F,16,1,[
0,
0,
0,
0,
0,
0,
0,
0,
1,
0,
0,
0,
0,
0,
0,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B46_16_46_16") then
DatabaseCode:=BestKnownLinearCode(F,46,16);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 18;
InputDistanceCache["B46_16_46_16"]:=Cin;
else assert Cin eq InputDistanceCache["B46_16_46_16"];end if;
S:=HullSource("DV05","B46_16",Gin,U,18,8,18,"exact",Vector(F,[0,0,0,0,w,0,w^2,1,0,1,0,0,w^2,1,0,w,1,w^2,1,0,0,w^2,0,1,w^2,0,1,0,w^2,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w,0,0]));
S`PaperRows:=[70,214,216];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV05";
end for;
HullDecreasingExamples["DV05"]:=S;X4Sources["DV05"]:=S;
print "VERIFIED SOURCE DV05";

// H30: ingredient Q5.
Gin:=Matrix(F,18,48,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,0,1,1,1,0,1,w,w^2,0,0,0,1,1,w^2,0,1,w^2,1,1,w^2,w,w^2,w^2,1,0,w,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,w^2,1,0,w,1,1,w^2,1,w^2,0,0,1,0,w,w^2,1,w,w,0,w,1,1,0,w,1,w,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,w^2,1,1,w,1,1,w^2,1,w^2,0,0,1,0,w,w^2,1,w,w,0,w,1,1,0,w,1,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,0,0,1,w,w^2,1,w^2,w^2,w,w^2,1,w^2,1,1,w,0,w^2,0,0,w^2,1,w,1,w,0,0,0,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,0,w,w^2,0,w^2,w^2,0,w,w,w^2,1,1,w^2,0,w,w,w,w,w,w,w,w^2,0,0,0,w^2,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,0,w,w^2,1,w,0,0,w,w,w,w,w^2,w,w,1,0,1,0,1,1,0,w^2,0,1,w^2,0,1,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,1,0,0,w^2,w,0,w,1,w,1,w,w,w,w,w^2,1,1,1,w,1,0,w,w,0,w^2,0,w^2,w,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,w,0,0,w,1,0,0,0,w,w^2,1,w,w,0,0,w,1,w^2,0,0,w^2,1,1,w^2,1,1,0,0,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,w,1,0,1,w^2,w,0,1,w,1,w^2,1,w,w^2,1,w^2,w,0,0,1,1,0,w^2,w,0,0,1,w,w^2,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,1,0,1,w^2,w,0,w,w^2,0,0,1,w^2,1,1,0,w^2,w^2,1,w,w^2,w,w^2,1,1,0,w^2,0,0,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,w^2,0,0,w^2,1,w,0,0,0,1,0,1,w^2,w^2,w^2,1,w^2,1,0,0,1,w^2,0,0,0,w,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,w,0,0,1,w,0,w,1,w,w^2,1,0,1,w,w,0,1,w,w,1,1,w,1,w^2,w^2,1,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,w,w^2,0,w,w^2,w,0,0,w,w^2,w^2,1,0,w^2,0,w^2,0,w^2,w^2,0,w^2,0,1,0,w,1,1,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,w^2,0,w^2,w^2,1,w^2,w,w^2,1,0,w^2,w^2,1,w^2,0,w,w^2,w^2,1,0,w^2,1,1,w^2,w,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,1,0,0,w,w,w,w^2,w^2,1,w,0,w^2,w^2,0,w,w^2,w,w,0,0,1,0,w^2,w,0,w^2,1,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,w,0,0,w,0,1,w,1,0,0,w,0,w^2,1,w,w^2,w^2,0,w^2,w,w,0,w^2,w,w^2,w,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,w,0,0,w,w,1,w,1,0,0,w,0,w^2,1,w,w^2,w^2,0,w^2,w,w,0,w^2,w,w^2,w,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,w,w,w,0,w,w^2,1,0,0,0,w,w,1,0,w,1,w,w,1,w^2,1,1,w,0,w^2,1,w]);
U:=Matrix(F,18,1,[
0,
0,
0,
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
0,
0,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"Q5_48_18") then
assert MinimumWeight(Cin) ge 18;
InputDistanceCache["Q5_48_18"]:=Cin;
else assert Cin eq InputDistanceCache["Q5_48_18"];end if;
S:=HullSource("H30","Q5",Gin,U,18,5,18,"lower_bound",Vector(F,[]));
S`PaperRows:=[72,218,221];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="H30";
end for;
HullDecreasingExamples["H30"]:=S;X4Sources["H30"]:=S;
print "VERIFIED SOURCE H30";

// DV09: ingredient B48_28.
Gin:=Matrix(F,28,48,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,0,0,1,w,1,0,1,w^2,w,w,0,1,1,w^2,w^2,1,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w,1,w,1,1,0,w,w^2,w^2,w,1,w,w^2,1,0,w,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w,1,0,w^2,1,w,1,0,1,w,w^2,0,w^2,1,1,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,w,w,w^2,w^2,w,w^2,0,w^2,1,1,0,0,w^2,w^2,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,0,1,1,w^2,0,w^2,w,w^2,w^2,w,w,0,0,1,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,w^2,0,w^2,w,1,0,1,w,1,w^2,0,1,w,0,w,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,1,w^2,w,1,w,w^2,w^2,w,0,1,1,w,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,w^2,1,1,0,w,w,w^2,1,0,1,w,1,0,0,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,w^2,w^2,0,0,0,w^2,0,1,0,0,0,w^2,1,0,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,0,w,0,w^2,w,w^2,1,1,w^2,0,w,w^2,w,w^2,w^2,w^2,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,w^2,w,w,w,1,1,1,w,0,w,w^2,w^2,w^2,1,1,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w^2,w,w,w,0,w^2,1,w^2,1,w^2,0,w^2,1,1,1,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,w^2,w,w,0,0,0,0,0,0,w,w,w^2,w,1,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,0,w^2,w,1,w^2,0,w^2,1,1,w^2,w,1,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,0,w^2,w^2,0,w^2,1,1,w^2,0,w^2,w^2,0,0,w,w,w]);
U:=Matrix(F,28,1,[
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
0,
0,
0,
1,
0,
w,
0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B48_28_48_28") then
DatabaseCode:=BestKnownLinearCode(F,48,28);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 11;
InputDistanceCache["B48_28_48_28"]:=Cin;
else assert Cin eq InputDistanceCache["B48_28_48_28"];end if;
S:=HullSource("DV09","B48_28",Gin,U,11,2,11,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,w,0,0,0,0,w,1,w^2,0,0,0,w^2,0,0,w,0,0,0,1,w^2,w,0]));
S`PaperRows:=[74,226];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV09";
end for;
HullDecreasingExamples["DV09"]:=S;X4Sources["DV09"]:=S;
print "VERIFIED SOURCE DV09";

// DV13: ingredient B49_28.
Gin:=Matrix(F,28,49,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,0,0,1,w,1,0,1,w^2,w,w,0,1,1,w^2,w^2,1,w^2,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w,1,w,1,1,0,w,w^2,w^2,w,1,w,w^2,1,0,w,0,w^2,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w,1,0,w^2,1,w,1,0,1,w,w^2,0,w^2,1,1,w^2,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,w,w,w^2,w^2,w,w^2,0,w^2,1,1,0,0,w^2,w^2,w^2,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,0,1,1,w^2,0,w^2,w,w^2,w^2,w,w,0,0,1,1,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,w^2,0,w^2,w,1,0,1,w,1,w^2,0,1,w,0,w,w^2,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,1,w^2,w,1,w,w^2,w^2,w,0,1,1,w,1,w,1,w^2,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,w^2,1,1,0,w,w,w^2,1,0,1,w,1,0,0,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,w^2,w^2,0,0,0,w^2,0,1,0,0,0,w^2,1,0,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,0,w,0,w^2,w,w^2,1,1,w^2,0,w,w^2,w,w^2,w^2,w^2,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,w^2,w,w,w,1,1,1,w,0,w,w^2,w^2,w^2,1,1,w^2,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w^2,w,w,w,0,w^2,1,w^2,1,w^2,0,w^2,1,1,1,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,w^2,w,w,0,0,0,0,0,0,w,w,w^2,w,1,w^2,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,0,w^2,w,1,w^2,0,w^2,1,1,w^2,w,1,0,w,1,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,0,w^2,w^2,0,w^2,1,1,w^2,0,w^2,w^2,0,0,w,w,w,1]);
U:=Matrix(F,28,1,[
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
0,
0,
0,
1,
w^2,
w,
w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B49_28_49_28") then
DatabaseCode:=BestKnownLinearCode(F,49,28);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B49_28_49_28"]:=Cin;
else assert Cin eq InputDistanceCache["B49_28_49_28"];end if;
S:=HullSource("DV13","B49_28",Gin,U,12,3,12,"exact",Vector(F,[0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,0,0,w^2,0,0,0,0,0,0,0,w^2,w^2,w,0,0,1,0,0,w^2,0,w,0,0,w^2,0,w,0,0,w^2,0,0]));
S`PaperRows:=[78,225,232];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV13";
end for;
HullDecreasingExamples["DV13"]:=S;X4Sources["DV13"]:=S;
print "VERIFIED SOURCE DV13";

// DV15: ingredient B51_30.
Gin:=Matrix(F,30,51,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w^2,w^2,w^2,0,w,1,w,w^2,0,w^2,0,w^2,w,w,w^2,0,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,1,w^2,0,0,0,1,0,w^2,0,0,0,w^2,w^2,w,0,1,w,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,0,0,1,w,1,0,1,w^2,w,w,0,1,1,w^2,w^2,1,w^2,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w,1,w,1,1,0,w,w^2,w^2,w,1,w,w^2,1,0,w,0,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w,1,0,w^2,1,w,1,0,1,w,w^2,0,w^2,1,1,w^2,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,w,w,w^2,w^2,w,w^2,0,w^2,1,1,0,0,w^2,w^2,w^2,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,0,1,1,w^2,0,w^2,w,w^2,w^2,w,w,0,0,1,1,1,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,w^2,0,w^2,w,1,0,1,w,1,w^2,0,1,w,0,w,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,1,w^2,w,1,w,w^2,w^2,w,0,1,1,w,1,w,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,w^2,1,1,0,w,w,w^2,1,0,1,w,1,0,0,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,w^2,w^2,0,0,0,w^2,0,1,0,0,0,w^2,1,0,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,0,w,0,w^2,w,w^2,1,1,w^2,0,w,w^2,w,w^2,w^2,w^2,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,w^2,w,w,w,1,1,1,w,0,w,w^2,w^2,w^2,1,1,w^2,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w^2,w,w,w,0,w^2,1,w^2,1,w^2,0,w^2,1,1,1,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,w^2,w,w,0,0,0,0,0,0,w,w,w^2,w,1,w^2,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,0,w^2,w,1,w^2,0,w^2,1,1,w^2,w,1,0,w,1,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,0,w^2,w^2,0,w^2,1,1,w^2,0,w^2,w^2,0,0,w,w,w,1]);
U:=Matrix(F,30,2,[
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
1,w^2,
w^2,1,
1,0,
1,0,
1,w,
1,w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B51_30_51_30") then
DatabaseCode:=BestKnownLinearCode(F,51,30);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B51_30_51_30"]:=Cin;
else assert Cin eq InputDistanceCache["B51_30_51_30"];end if;
S:=HullSource("DV15","B51_30",Gin,U,12,4,12,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,1,0,0,0,w,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,1,0,0,w,1,0,0,1,0,1,w,1,0,0,0,0,w,0,0]));
S`PaperRows:=[83,235,237];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV15";
end for;
HullDecreasingExamples["DV15"]:=S;X4Sources["DV15"]:=S;
print "VERIFIED SOURCE DV15";

// DV17: ingredient B53_30.
Gin:=Matrix(F,30,53,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,0,1,0,0,1,0,0,1,0,0,w^2,1,w,w^2,w^2,0,w,w,0,1,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,1,0,0,0,1,0,1,w,0,0,1,1,1,w^2,1,0,w^2,w^2,w^2,w,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,0,w,0,0,0,w,1,0,0,w,1,1,w^2,w,w^2,0,0,w,w,1,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,0,0,1,w,1,0,1,w^2,w,w,0,1,1,w^2,w^2,1,w^2,w,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,0,0,0,w^2,0,1,w,w,0,0,w,w,w^2,1,w^2,w,0,w,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,w,0,0,1,1,0,w^2,1,1,w^2,1,w,w^2,w^2,1,w,1,0,w,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,1,w^2,w,0,0,1,0,w^2,0,0,0,0,0,w,w^2,0,w,w,w,1,w,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,w^2,1,1,0,w,w^2,w^2,w^2,0,0,w,w,w,w,0,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,w,w,w^2,w^2,w,w^2,0,w^2,1,1,0,0,w^2,w^2,w^2,1,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,w^2,1,1,0,w,w^2,w^2,w^2,0,0,w,w,w,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,w^2,0,0,w,0,w^2,1,1,w^2,0,0,1,w^2,w^2,0,1,w,0,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,1,w,w^2,0,0,0,0,0,w,w,1,0,1,w,w^2,w,w,0,w^2,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,0,0,1,0,1,1,1,w,w,1,0,w,w,w,1,0,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,w^2,w,0,0,w^2,w,w,w^2,1,w^2,1,1,0,w^2,1,w^2,0,0,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,1,0,0,w^2,1,w,w,0,0,w,w,w^2,w,0,w,1,w^2,w^2,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,w,1,0,0,1,w,0,0,w^2,0,1,0,w,w,0,w^2,1,0,w,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,1,w^2,0,0,w,0,w,0,w,0,w^2,w^2,1,w^2,0,w,w,w^2,w,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,1,1,0,0,w^2,1,w^2,w^2,w^2,w,w^2,w,w^2,w,w,w,0,1,0,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w,0,0,0,w^2,0,0,0,1,w,1,w^2,w^2,0,1,w,w,w^2,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,0,1,1,w^2,0,0,w,0,w,0,w^2,1,0,1,0,w^2,0,w,0,w^2,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,0,0,1,w,1,0,0,0,1,0,w^2,w,w^2,w,0,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,w,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,1,w,0,0,w^2,1,0,1,w,w,1,1,w^2,1,0,w^2,w^2,0,w,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,0,w^2,1,1,0,0,1,0,0,w^2,w^2,w,0,w,w^2,0,w,w,0,0,w^2,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,0,0,w^2,w^2,0,0,w^2,1,0,1,w^2,w,0,w,w,w^2,w,0,0,1,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,1,w,w^2,0,0,w^2,0,w,1,w,w^2,1,1,w,1,w,0,w,w^2,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,1,w^2,w,0,0,w^2,0,w^2,w^2,w,w,0,0,1,1,0,0,w,1,0,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,0,w,w,w,0,0,w^2,w,1,w,w,1,w,w^2,0,0,w,w,w,0,w^2,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,w,1,w^2,0,0,w^2,w,w^2,0,w^2,1,1,1,w^2,1,w^2,0,0,0,w,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,0,w^2,w^2,0,w^2,1,1,w^2,0,w^2,w^2,0,0,w,w,w,1,0]);
U:=Matrix(F,30,1,[
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
0,
0,
0,
w,
w,
0,
0,
1,
1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B53_30_53_30") then
DatabaseCode:=BestKnownLinearCode(F,53,30);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B53_30_53_30"]:=Cin;
else assert Cin eq InputDistanceCache["B53_30_53_30"];end if;
S:=HullSource("DV17","B53_30",Gin,U,12,5,12,"exact",Vector(F,[0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,w,0,1,0,w,w,1,1,0,w^2,w^2,0,0,0,w,0]));
S`PaperRows:=[85,240,244];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV17";
end for;
HullDecreasingExamples["DV17"]:=S;X4Sources["DV17"]:=S;
print "VERIFIED SOURCE DV17";

// DV20: ingredient B54_37.
Gin:=Matrix(F,37,54,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,w^2,0,w,0,w,w,1,w^2,1,0,w,w,0,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,w^2,0,w,0,w,w,1,w^2,1,0,w,w,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,0,w,0,w^2,w,w^2,w,0,1,w,1,0,0,w^2,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,0,w^2,0,w^2,0,0,0,0,1,1,0,1,w^2,0,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w,w,w^2,w^2,w^2,w,1,w,w,w,w,w,0,w^2,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w^2,w,1,w^2,w,1,0,w^2,0,0,w^2,1,0,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w^2,w,1,w^2,w,1,0,w^2,0,0,w^2,1,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w^2,w,1,w^2,w,1,0,w^2,0,0,w^2,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,1,w^2,w^2,w,w,w^2,w^2,w,w,w^2,0,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,1,w^2,w^2,w,w,w^2,w^2,w,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,1,w^2,w^2,w,w,w^2,w^2,w,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,w,0,1,0,1,w^2,0,0,w^2,w^2,0,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,w,0,1,0,1,w^2,0,0,w^2,w^2,0,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,w,0,1,0,w^2,1,w^2,1,w^2,w^2,1,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,w,0,1,0,w^2,1,w^2,1,w^2,w^2,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,w,0,1,0,w^2,1,w^2,1,w^2,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,0,0,0,w,w,0,w,1,w,0,w^2,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,0,0,0,w,w,0,w,1,w,0,w^2,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w^2,0,1,0,w^2,0,1,w^2,w^2,0,1,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w^2,0,1,0,w^2,0,1,w^2,w^2,0,1,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,w^2,w,w,0,w,w,0,w^2,0,w,0,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,w^2,w,w,0,w,w,0,w^2,0,w,0,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,1,w^2,1,w,w^2,w^2,w^2,w^2,w,1,1,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,w,1,1,1,w^2,0,w,w,1,0,0,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,w^2,w,0,1,w,1,w^2,1,w^2,0,w^2,w,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w,w^2,w^2,0,w,0,w,0,0,w,w^2,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w,w^2,w^2,0,w,0,w,0,0,w,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,0,w^2,1,1,1,w^2,1,1,0,w,1,w^2,w,w^2,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,0,w^2,1,1,1,w^2,1,1,0,w,1,w^2,w,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,0,w,w^2,w^2,0,1,w,1,w,w,1,w^2,w,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,0,w^2,w^2,1,0,0,1,0,w^2,0,w^2,w,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,w^2,1,w^2,1,1,1,w^2,0,1,1,w,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,1,1,1,1,0,1,w^2,0,1,w,w,w,0,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,1,1,1,1,0,1,w^2,0,1,w,w,w,0,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,w,0,1,w^2,1,1,w,w,1,w^2,0,w^2,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,w,0,1,w^2,1,1,w,w,1,w^2,0,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,w,0,1,w^2,1,1,w,w,1,w^2,0,w^2,1]);
U:=Matrix(F,37,1,[
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
0,
0,
0,
0,
0,
w,
w,
0,
0,
0,
0,
0,
0,
w^2,
w,
1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B54_37_54_37") then
DatabaseCode:=BestKnownLinearCode(F,54,37);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 9;
InputDistanceCache["B54_37_54_37"]:=Cin;
else assert Cin eq InputDistanceCache["B54_37_54_37"];end if;
S:=HullSource("DV20","B54_37",Gin,U,9,5,9,"exact",Vector(F,[w,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,0,0,0,0,1,0,0,w,0,w,0,w,0,0]));
S`PaperRows:=[87];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV20";
end for;
HullDecreasingExamples["DV20"]:=S;X4Sources["DV20"]:=S;
print "VERIFIED SOURCE DV20";

// DV21: ingredient B54_40.
Gin:=Matrix(F,40,54,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,1,w,0,w,w^2,1,0,0,w,w^2,0,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,1,w,0,w,w^2,1,0,0,w,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,1,w,0,w,w,w^2,w^2,0,w,w^2,1,w^2,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,1,w,w^2,w,1,w,0,w^2,1,w,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,1,w,w^2,w,1,w,0,w^2,1,w,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,1,w,w^2,w,1,1,w^2,0,w,0,w,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,1,0,w^2,0,w,w^2,1,w,1,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,1,w^2,w,0,0,1,1,0,w,w^2,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,1,w^2,w,0,0,1,1,0,w,w^2,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,0,w^2,w,w^2,1,1,w^2,w,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,w^2,0,0,w,0,0,w,0,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,w^2,0,0,w,0,0,w,0,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,1,w,0,0,w^2,w^2,w^2,w^2,1,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,1,w,0,0,w^2,w^2,w^2,w^2,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w,w^2,0,w,1,w,w,w,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,w^2,w,0,0,1,0,1,1,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,w^2,w,0,0,1,0,1,1,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,w^2,w^2,0,w,w^2,1,w,w^2,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,w^2,w^2,0,w,w^2,1,w,w^2,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,w^2,w^2,0,w,w^2,1,w,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w^2,w,1,w^2,1,w^2,0,1,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w^2,w,1,w^2,1,w^2,0,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,1,0,w,w,0,1,0,w,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,1,1,w,w^2,w,0,1,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w^2,w,0,1,w^2,1,w^2,1,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,w^2,w^2,0,0,1,0,w,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w,w,0,w^2,w^2,1,w,w^2,1,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w,w,1,0,0,w,w,1,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w,w,1,0,0,w,w,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w,w,1,0,0,w,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w,w,1,0,0,w,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,w^2,0,0,w^2,0,w^2,w^2,0,0,1,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,w^2,0,0,w^2,0,w^2,w^2,0,0,1,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,w^2,0,0,w^2,0,w^2,w^2,0,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,w^2,0,1,w^2,1,0,w,w,w,w,1,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w^2,w^2,0,1,0,1,w^2,w^2,1,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,1,w^2,w^2,0,w,0,w,w,0,w,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,1,w^2,w^2,1,w,1,0,w^2,1,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,0,0,1,w^2,1,1,0,w,w,1,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,0,0,1,0,1,w,1,1,1,w,w,1]);
U:=Matrix(F,40,1,[
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
0,
w^2,
1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B54_40_54_40") then
DatabaseCode:=BestKnownLinearCode(F,54,40);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 8;
InputDistanceCache["B54_40_54_40"]:=Cin;
else assert Cin eq InputDistanceCache["B54_40_54_40"];end if;
S:=HullSource("DV21","B54_40",Gin,U,8,2,8,"exact",Vector(F,[w^2,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,0,0,1,1,1,0,0]));
S`PaperRows:=[88,248];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV21";
end for;
HullDecreasingExamples["DV21"]:=S;X4Sources["DV21"]:=S;
print "VERIFIED SOURCE DV21";

// DV23: ingredient B55_31.
Gin:=Matrix(F,31,55,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,0,0,w^2,0,w^2,0,w,w,w,1,1,w^2,w^2,w^2,w^2,0,w,w^2,w^2,w,0,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,1,w^2,1,1,w,1,0,0,w,w^2,1,1,w^2,0,w,1,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,0,0,w^2,w,0,w,w^2,1,w^2,1,w,w,w^2,1,w,1,1,w,w,w^2,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,0,0,w,w,0,0,0,w,1,w,w^2,0,0,w^2,w,1,0,w,0,1,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,0,0,1,w^2,w,1,0,0,1,0,w^2,0,1,1,1,w,1,w,1,w,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,0,0,0,1,w,0,0,0,0,1,0,w^2,w^2,w^2,1,0,1,w^2,0,1,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,w,1,1,w^2,0,w,1,w,w^2,w,1,w^2,1,w^2,1,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,0,0,1,w^2,w^2,w,1,w^2,0,w^2,1,0,0,0,1,w^2,w^2,1,w^2,1,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,0,0,0,w,0,w^2,1,0,w,w^2,w^2,w,w^2,0,0,w^2,1,1,0,w^2,1,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,w^2,1,1,0,w,w^2,w^2,w^2,0,0,w,w,w,w,0,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,1,0,w,0,1,w^2,0,0,w^2,1,1,w^2,w,0,w^2,w,w,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,w^2,1,1,0,w,w^2,w^2,w^2,0,0,w,w,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,w^2,0,w,1,w,1,0,1,w,1,1,w,w,0,1,1,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,w,1,1,0,w,w,1,0,1,w^2,w,0,w^2,w^2,1,0,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,1,0,0,w^2,1,w,w^2,1,1,1,w,w,1,w^2,1,w^2,1,w^2,1,w^2,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,0,0,0,w,w,1,0,w^2,w^2,0,w,w^2,1,0,1,w,w^2,w^2,0,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,0,0,1,0,w^2,w^2,0,w,w,w^2,1,0,w^2,0,w,w,1,w,w,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,1,w,0,1,0,w,w,w^2,1,1,0,0,0,w^2,w,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,0,0,0,w^2,0,1,1,0,1,1,w,0,w^2,w,0,0,w^2,w,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,0,1,0,w^2,w^2,1,w^2,1,1,0,0,w^2,0,0,w,0,0,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,0,1,0,0,w^2,1,w^2,0,0,0,0,1,w,1,0,0,1,w,0,w^2,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,0,0,0,0,0,w^2,0,1,1,0,0,0,1,w,w,w,0,0,1,w,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,0,1,0,0,1,1,w^2,1,1,1,w^2,1,1,w,w^2,w^2,0,0,0,w^2,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,w,0,1,0,1,0,1,w,w^2,w^2,1,0,0,1,0,0,w,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,0,w^2,0,0,w^2,1,0,w,0,1,w,w,1,1,0,w,1,0,1,1,w,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,0,0,0,0,1,0,1,w,w,w^2,1,1,w^2,0,w^2,w,0,w,0,1,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,0,w,0,0,w^2,0,w^2,0,1,1,w,0,w,w^2,w,w,w^2,0,0,w,w,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,1,w,w,1,w,1,w,w^2,1,1,w^2,0,0,1,1,1,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,0,0,0,w,w,w^2,1,w^2,0,1,w^2,w,0,w,0,1,1,w,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,0,w^2,0,0,w,0,w^2,1,w,w,1,0,w^2,0,0,w^2,1,w,w,w,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,w^2,0,0,0,w^2,1,w^2,0,0,0,0,0,w,1,0,w^2,w,1,1,0,1,w]);
U:=Matrix(F,31,1,[
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
0,
0,
0,
w,
0,
w^2,
w^2,
w,
1,
w]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B55_31_55_31") then
DatabaseCode:=BestKnownLinearCode(F,55,31);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B55_31_55_31"]:=Cin;
else assert Cin eq InputDistanceCache["B55_31_55_31"];end if;
S:=HullSource("DV23","B55_31",Gin,U,12,6,12,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,0,w,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,0,0,w^2,1,0,0,0,0,1,0,w,0,0,1,0,w^2,0,0,0,1,1,0]));
S`PaperRows:=[89,247,252];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV23";
end for;
HullDecreasingExamples["DV23"]:=S;X4Sources["DV23"]:=S;
print "VERIFIED SOURCE DV23";

// DV19: ingredient B54_34.
Gin:=Matrix(F,34,54,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,1,w^2,w^2,w,w^2,w^2,w^2,w,1,0,1,w,w^2,w^2,0,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w^2,w^2,1,1,1,w,1,0,0,0,1,w,w^2,w,w^2,w,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w^2,w^2,1,1,1,w,1,0,0,0,1,w,w^2,w,w^2,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w^2,w^2,w^2,0,w,1,w,w^2,0,w^2,0,w^2,w,w,w^2,0,1,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w^2,w^2,w^2,0,w,1,w,w^2,0,w^2,0,w^2,w,w,w^2,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,1,w^2,0,0,0,1,0,w^2,0,0,0,w^2,w^2,w,0,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,0,0,1,w,1,0,1,w^2,w,w,0,1,1,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w,1,w,1,1,0,w,w^2,w^2,w,1,w,w^2,1,0,w,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w,1,0,w^2,1,w,1,0,1,w,w^2,0,w^2,1,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,w,w,w^2,w^2,w,w^2,0,w^2,1,1,0,0,w^2,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,0,1,1,w^2,0,w^2,w,w^2,w^2,w,w,0,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,w^2,0,w^2,w,1,0,1,w,1,w^2,0,1,w,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,1,w^2,w,1,w,w^2,w^2,w,0,1,1,w,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,w^2,1,1,0,w,w,w^2,1,0,1,w,1,0,0,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,w^2,w^2,0,0,0,w^2,0,1,0,0,0,w^2,1,0,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,0,w,0,w^2,w,w^2,1,1,w^2,0,w,w^2,w,w^2,w^2,w^2,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,w^2,w,w,w,1,1,1,w,0,w,w^2,w^2,w^2,1,1,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w^2,w,w,w,0,w^2,1,w^2,1,w^2,0,w^2,1,1,1,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,w^2,w,w,0,0,0,0,0,0,w,w,w^2,w,1,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,0,w^2,w,1,w^2,0,w^2,1,1,w^2,w,1,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,0,w^2,w^2,0,w^2,1,1,w^2,0,w^2,w^2,0,0,w,w,w]);
U:=Matrix(F,34,3,[
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
w,w^2,w,
1,1,0,
1,w^2,w^2,
0,w,0,
w,0,1,
w,w,w,
1,0,w,
1,0,w,
w,w^2,1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B54_34_54_34") then
DatabaseCode:=BestKnownLinearCode(F,54,34);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 11;
InputDistanceCache["B54_34_54_34"]:=Cin;
else assert Cin eq InputDistanceCache["B54_34_54_34"];end if;
S:=HullSource("DV19","B54_34",Gin,U,11,6,11,"exact",Vector(F,[0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w^2,1,0,0,0,w^2,0,0,0,0,0,1,0,w,w,0,0,0,0]));
S`PaperRows:=[90,257];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV19";
end for;
HullDecreasingExamples["DV19"]:=S;X4Sources["DV19"]:=S;
print "VERIFIED SOURCE DV19";

// BS076: ingredient B57_31.
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
w,
w,
0,
w^2,
w^2,
w^2,
w,
w^2,
w,
1,
w^2,
1,
w,
w^2,
w]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B57_31_57_31") then
DatabaseCode:=BestKnownLinearCode(F,57,31);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 14;
InputDistanceCache["B57_31_57_31"]:=Cin;
else assert Cin eq InputDistanceCache["B57_31_57_31"];end if;
S:=HullSource("BS076","B57_31",Gin,U,14,14,14,"exact",Vector(F,[0,0,0,0,1,0,0,0,0,0,0,0,0,w,0,0,0,0,0,0,0,0,0,0,1,w,0,0,0,0,0,w^2,0,0,w^2,1,w^2,0,0,0,w^2,0,1,0,1,w^2,1,0,0,0,0,0,0,0,0,w^2,0,0]));
S`PaperRows:=[92,228];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS076";
end for;
HullDecreasingExamples["BS076"]:=S;X4Sources["BS076"]:=S;
print "VERIFIED SOURCE BS076";

// DV24: ingredient B55_34.
Gin:=Matrix(F,34,55,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,1,w^2,w^2,w,w^2,w^2,w^2,w,1,0,1,w,w^2,w^2,0,1,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w^2,w^2,1,1,1,w,1,0,0,0,1,w,w^2,w,w^2,w,1,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w^2,w^2,1,1,1,w,1,0,0,0,1,w,w^2,w,w^2,w,1,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w^2,w^2,w^2,0,w,1,w,w^2,0,w^2,0,w^2,w,w,w^2,0,1,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w^2,w^2,w^2,0,w,1,w,w^2,0,w^2,0,w^2,w,w,w^2,0,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,1,w^2,0,0,0,1,0,w^2,0,0,0,w^2,w^2,w,0,1,w,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,0,0,1,w,1,0,1,w^2,w,w,0,1,1,w^2,w^2,1,w^2,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w,1,w,1,1,0,w,w^2,w^2,w,1,w,w^2,1,0,w,0,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w,1,0,w^2,1,w,1,0,1,w,w^2,0,w^2,1,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,w,w,w^2,w^2,w,w^2,0,w^2,1,1,0,0,w^2,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,0,1,1,w^2,0,w^2,w,w^2,w^2,w,w,0,0,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,w^2,0,w^2,w,1,0,1,w,1,w^2,0,1,w,0,w,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,1,w^2,w,1,w,w^2,w^2,w,0,1,1,w,1,w,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,w^2,1,1,0,w,w,w^2,1,0,1,w,1,0,0,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,w^2,w^2,0,0,0,w^2,0,1,0,0,0,w^2,1,0,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,0,w,0,w^2,w,w^2,1,1,w^2,0,w,w^2,w,w^2,w^2,w^2,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,w^2,w,w,w,1,1,1,w,0,w,w^2,w^2,w^2,1,1,w^2,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w^2,w,w,w,0,w^2,1,w^2,1,w^2,0,w^2,1,1,1,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,w^2,w,w,0,0,0,0,0,0,w,w,w^2,w,1,w^2,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,0,w^2,w,1,w^2,0,w^2,1,1,w^2,w,1,0,w,1,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,0,w^2,w^2,0,w^2,1,1,w^2,0,w^2,w^2,0,0,w,w,w,1]);
U:=Matrix(F,34,3,[
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
1,w,w^2,
0,w^2,w,
w^2,w^2,0,
0,w,0,
w^2,w,w^2,
w^2,0,0,
w^2,0,w^2,
0,w,1,
w^2,w^2,w^2,
w^2,1,w]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B55_34_55_34") then
DatabaseCode:=BestKnownLinearCode(F,55,34);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B55_34_55_34"]:=Cin;
else assert Cin eq InputDistanceCache["B55_34_55_34"];end if;
S:=HullSource("DV24","B55_34",Gin,U,12,7,12,"exact",Vector(F,[0,0,0,0,w,0,0,0,0,0,0,0,0,w,0,0,w,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,1,1,w,1,w,0,0,0,0,0,0,1,0,w^2,0,0,0,w^2,0,0,0,0]));
S`PaperRows:=[93,260];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV24";
end for;
HullDecreasingExamples["DV24"]:=S;X4Sources["DV24"]:=S;
print "VERIFIED SOURCE DV24";

// DV22: ingredient B55_30.
Gin:=Matrix(F,30,55,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,1,w^2,w^2,w,w,0,0,0,w^2,1,w,0,w,1,w^2,w^2,w,w,w,w,w,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,0,w^2,w,w^2,0,w^2,w^2,w,w^2,0,w^2,w,0,1,1,1,w^2,1,w,0,w,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,1,0,0,1,0,0,1,w,0,w,1,w,0,1,0,w,w,w^2,w,1,1,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,1,0,0,1,0,0,1,w,0,w,1,w,0,1,0,w,w,w^2,w,1,1,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,w^2,w,1,1,1,w^2,w^2,w^2,w^2,w,1,w^2,w^2,0,0,w^2,w,w^2,1,w^2,0,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,1,w,w,0,0,w^2,0,0,1,w^2,w^2,0,1,1,0,w,1,w^2,0,1,1,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,1,w,w,0,0,w^2,0,0,1,w^2,w^2,0,1,1,0,w,1,w^2,0,1,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,1,1,w^2,w^2,w,w^2,0,w,0,0,w,1,w,1,w^2,w,w^2,w,w^2,w,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,w,w^2,1,0,w,1,1,0,w,w,1,1,0,w^2,w,w^2,1,w^2,0,w,1,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,0,w,0,w^2,w^2,w,1,0,0,w^2,w,0,w^2,w,w^2,w^2,1,0,w^2,w,0,1,1,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,w^2,0,w,w,0,w,w^2,w,w^2,w^2,1,1,0,w^2,1,w^2,1,0,w,w,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,1,0,w^2,1,w^2,0,w^2,1,1,w,w,w,w^2,w^2,0,1,w^2,w,w,0,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,0,0,w^2,0,1,w^2,0,1,w,w,1,0,0,1,0,w^2,w^2,w,1,w^2,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,0,0,w^2,0,1,w^2,0,1,w,w,1,0,0,1,0,w^2,w^2,w,1,w^2,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,1,w^2,0,0,w^2,0,1,w,0,w,1,w,1,1,1,1,w,0,0,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,1,w^2,w^2,w,w,0,1,0,1,0,0,w^2,1,w,1,w,w,0,1,0,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,0,w^2,w^2,1,0,1,1,0,w^2,1,w,w,0,w,w,w,1,0,1,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,w,w^2,1,w^2,w^2,0,0,w^2,w^2,w^2,0,1,w^2,w,1,1,w^2,1,1,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,0,1,w,w,0,w,w,1,w,1,w^2,0,0,1,0,w^2,w^2,0,w,1,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w,0,0,w,w^2,w,0,w,1,w^2,0,1,1,1,w,w^2,w,0,0,0,w,w^2,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w,0,0,w,w^2,w,0,w,1,w^2,0,1,1,1,w,w^2,w,0,0,0,w,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,1,w,w,w,1,0,w^2,w^2,0,0,0,w^2,w^2,w,1,w^2,1,w^2,w,1,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,0,w^2,w,w^2,0,w,0,0,w,0,1,w,1,0,1,1,w^2,w,1,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,0,w^2,w,w^2,0,w,0,0,w,0,1,w,1,0,1,1,w^2,w,1,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,0,w^2,w,w^2,0,w,0,0,w,0,1,w,1,0,1,1,w^2,w,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,w,w,0,1,1,1,w,0,0,w^2,0,0,1,w^2,w,w^2,w,w^2,w,0,w,w^2,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,w^2,0,w^2,1,1,0,0,0,w^2,w^2,1,0,1,0,1,0,w^2,0,1,w^2,w^2,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,w^2,0,w^2,1,1,0,0,0,w^2,w^2,1,0,1,0,1,0,w^2,0,1,w^2,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w,w^2,w,1,w^2,0,0,w,w^2,w^2,1,w^2,0,1,w^2,w,1,w,1,1,w,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,1,1,0,1,1,w,w^2,w^2,w,0,1,1,w,w,0,w,w,1,w^2,0,w,0,1]);
U:=Matrix(F,30,4,[
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,w^2,w^2,1,
0,1,1,0,
w,w,1,1,
w,w,w^2,w^2,
1,w^2,w^2,1,
w,w^2,w^2,w^2,
w,w^2,w^2,w^2,
0,w^2,w,1,
0,0,w^2,w,
0,1,1,1,
1,w^2,1,1,
1,w^2,1,w,
w^2,w^2,1,w]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B55_30_55_30") then
DatabaseCode:=BestKnownLinearCode(F,55,30);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 13;
InputDistanceCache["B55_30_55_30"]:=Cin;
else assert Cin eq InputDistanceCache["B55_30_55_30"];end if;
S:=HullSource("DV22","B55_30",Gin,U,13,9,13,"exact",Vector(F,[0,0,0,0,0,1,w,w^2,0,1,1,0,0,0,w,0,1,0,0,0,0,0,1,1,0,0,0,0,0,0,w^2,0,0,0,1,w^2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,0,0,0,0]));
S`PaperRows:=[95];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV22";
end for;
HullDecreasingExamples["DV22"]:=S;X4Sources["DV22"]:=S;
print "VERIFIED SOURCE DV22";

// DV27: ingredient B57_34.
Gin:=Matrix(F,34,57,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,w^2,w^2,w^2,w,w^2,w,0,w^2,1,1,w^2,w,w^2,0,w,0,w^2,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,1,w^2,w^2,w,w^2,w^2,w^2,w,1,0,1,w,w^2,w^2,0,1,w^2,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,1,w^2,w^2,w,w^2,w^2,w^2,w,1,0,1,w,w^2,w^2,0,1,w^2,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w^2,w^2,1,1,1,w,1,0,0,0,1,w,w^2,w,w^2,w,1,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w^2,w^2,1,1,1,w,1,0,0,0,1,w,w^2,w,w^2,w,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w^2,w^2,w^2,0,w,1,w,w^2,0,w^2,0,w^2,w,w,w^2,0,1,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w^2,w^2,w^2,0,w,1,w,w^2,0,w^2,0,w^2,w,w,w^2,0,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,1,w^2,0,0,0,1,0,w^2,0,0,0,w^2,w^2,w,0,1,w,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,0,0,1,w,1,0,1,w^2,w,w,0,1,1,w^2,w^2,1,w^2,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w,1,w,1,1,0,w,w^2,w^2,w,1,w,w^2,1,0,w,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w,1,0,w^2,1,w,1,0,1,w,w^2,0,w^2,1,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,w,w,w^2,w^2,w,w^2,0,w^2,1,1,0,0,w^2,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,0,1,1,w^2,0,w^2,w,w^2,w^2,w,w,0,0,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,w^2,0,w^2,w,1,0,1,w,1,w^2,0,1,w,0,w,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,1,w^2,w,1,w,w^2,w^2,w,0,1,1,w,1,w,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,w^2,1,1,0,w,w,w^2,1,0,1,w,1,0,0,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,w^2,w^2,0,0,0,w^2,0,1,0,0,0,w^2,1,0,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,0,w,0,w^2,w,w^2,1,1,w^2,0,w,w^2,w,w^2,w^2,w^2,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,w^2,w,w,w,1,1,1,w,0,w,w^2,w^2,w^2,1,1,w^2,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w^2,w,w,w,0,w^2,1,w^2,1,w^2,0,w^2,1,1,1,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,w^2,w,w,0,0,0,0,0,0,w,w,w^2,w,1,w^2,0,0,1]);
U:=Matrix(F,34,2,[
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
w^2,0,
w,w^2,
1,w,
1,1,
w^2,1,
w,w^2,
w,w,
1,w,
1,1,
0,1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B57_34_57_34") then
DatabaseCode:=BestKnownLinearCode(F,57,34);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B57_34_57_34"]:=Cin;
else assert Cin eq InputDistanceCache["B57_34_57_34"];end if;
S:=HullSource("DV27","B57_34",Gin,U,12,8,12,"exact",Vector(F,[0,0,0,0,0,0,0,w,0,0,0,0,0,0,0,0,w,0,0,w,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,1,1,w,1,w,0,0,0,0,0,0,1,0,w^2,0,0,0,w^2,0,0]));
S`PaperRows:=[96,259,262];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV27";
end for;
HullDecreasingExamples["DV27"]:=S;X4Sources["DV27"]:=S;
print "VERIFIED SOURCE DV27";

// DV29: ingredient B58_32.
Gin:=Matrix(F,32,58,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,0,w,w^2,w,1,1,0,1,0,1,w^2,0,w^2,w^2,w,w,w,1,w^2,w^2,w,w^2,w^2,0,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,0,w,w^2,w,1,1,0,1,0,1,w^2,0,w^2,w^2,w,w,w,1,w^2,w^2,w,w^2,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,0,0,w,1,w^2,w,0,w,w,0,1,w,0,w,1,1,0,w^2,1,0,0,w^2,1,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,0,0,1,w^2,w,0,w^2,w^2,w,0,w^2,w,w,1,0,w,w,w^2,0,1,w,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,0,0,1,w^2,w,0,w^2,w^2,w,0,w^2,w,w,1,0,w,w,w^2,0,1,w,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w^2,0,w,1,w^2,w^2,0,w^2,w,w^2,w^2,1,0,0,w^2,0,0,w^2,w,0,1,w^2,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w^2,0,w,1,w^2,w^2,0,w^2,w,w^2,w^2,1,0,0,w^2,0,0,w^2,w,0,1,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,w,w^2,w,w^2,w,w,1,w^2,w^2,w,w,w^2,0,w,w^2,1,1,0,0,1,1,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,w^2,w,1,w^2,0,w^2,0,w,w^2,w^2,w^2,w,w,w,1,1,0,1,w^2,w^2,0,w^2,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,0,w^2,0,0,0,1,1,w^2,w,w^2,w,w^2,w^2,0,1,w^2,0,0,w,0,w,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,w^2,w^2,0,w,w^2,w,w^2,0,w^2,w^2,w,0,w,0,w,w,0,0,0,w,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w,w^2,w^2,w,w^2,0,w^2,1,w^2,w^2,w^2,w^2,0,w^2,w,1,0,1,0,w^2,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,0,w,w^2,0,0,w,w,0,0,w^2,w^2,1,w^2,w,0,w^2,w,w,1,1,w,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,1,1,0,w,w,w^2,w,1,w^2,w,0,w^2,0,1,0,w^2,w,w,1,w,w^2,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w^2,1,0,w^2,1,1,1,0,1,w,0,0,0,w,1,1,w^2,1,1,0,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w^2,1,0,w^2,1,1,1,0,1,w,0,0,0,w,1,1,w^2,1,1,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w^2,1,0,w^2,1,1,1,0,1,w,0,0,0,w,1,1,w^2,1,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,w,w^2,w,0,w^2,1,1,w,0,1,0,w^2,w,w,w^2,1,1,w^2,1,w,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,w^2,w,w^2,0,1,0,0,w^2,1,0,1,1,w^2,w^2,0,0,w^2,0,w^2,w,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,1,w^2,w,0,w,0,w,w^2,w,1,0,w^2,1,1,0,1,w^2,1,0,w,w^2,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,w,1,0,1,w^2,w^2,w^2,0,w^2,w^2,1,w,1,w^2,w^2,w,0,w,0,0,1,w,0,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,w^2,0,1,w,0,1,w^2,w,1,1,w,w,w^2,0,w^2,w,w^2,w^2,0,w^2,0,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,w^2,w^2,w^2,w^2,0,w,0,1,w^2,0,w^2,1,1,0,w,1,w^2,w,1,1,w^2,1,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,w^2,w^2,w^2,w^2,0,w,0,1,w^2,0,w^2,1,1,0,w,1,w^2,w,1,1,w^2,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w^2,0,w,1,w^2,w^2,w,w^2,0,w^2,0,1,0,w^2,w,1,w^2,w^2,w^2,w,1,1,w^2,1,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,0,1,1,w^2,1,w^2,0,1,1,w^2,1,0,w,w,0,1,0,1,w^2,1,w,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,0,1,1,w^2,1,w^2,0,1,1,w^2,1,0,w,w,0,1,0,1,w^2,1,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,0,1,1,w^2,1,w^2,0,1,1,w^2,1,0,w,w,0,1,0,1,w^2,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,0,1,1,w^2,1,w^2,0,1,1,w^2,1,0,w,w,0,1,0,1,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,w,1,w^2,1,w,w^2,0,0,1,0,1,w,w^2,w,1,0,w^2,w^2,1,w,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,w,1,w^2,1,w,w^2,0,0,1,0,1,w,w^2,w,1,0,w^2,w^2,1,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,0,0,w,1,w^2,1,w,w^2,0,0,1,0,1,w,w^2,w,1,0,w^2,w^2,1,w,w^2]);
U:=Matrix(F,32,2,[
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
w,0,
w,w,
0,w,
w^2,0,
w^2,w^2,
w^2,w^2,
w,w^2,
w^2,w,
w,w^2,
1,w,
w^2,1,
1,w^2,
w,1,
w^2,w,
w,w^2,
0,w]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B58_32_58_32") then
DatabaseCode:=BestKnownLinearCode(F,58,32);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 14;
InputDistanceCache["B58_32_58_32"]:=Cin;
else assert Cin eq InputDistanceCache["B58_32_58_32"];end if;
S:=HullSource("DV29","B58_32",Gin,U,14,14,14,"exact",Vector(F,[w,0,0,0,0,w,0,0,0,0,0,0,w,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,0,1,0,0,0,w^2,0,0,1,0,w,1,0,0,0,w^2,0,0,1,0,0,0,w^2,0,0]));
S`PaperRows:=[99,239,265];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV29";
end for;
HullDecreasingExamples["DV29"]:=S;X4Sources["DV29"]:=S;
print "VERIFIED SOURCE DV29";

// BS074: ingredient B57_31.
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
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
w^2,w,w,
w^2,w^2,w,
1,1,0,
1,0,w^2,
w^2,w^2,w^2,
w,w,w^2,
w,0,w,
w^2,1,w^2,
w^2,w,w,
0,0,1,
0,w,w^2,
w^2,0,1,
w,0,w,
w^2,0,w^2,
0,w^2,w]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B57_31_57_31") then
DatabaseCode:=BestKnownLinearCode(F,57,31);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 14;
InputDistanceCache["B57_31_57_31"]:=Cin;
else assert Cin eq InputDistanceCache["B57_31_57_31"];end if;
S:=HullSource("BS074","B57_31",Gin,U,14,12,14,"exact",Vector(F,[0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,w,0,w^2,0,0,0,0,w,1,0,1,0,0,w^2,0,0,1,0,0,1,w,0,0,0,0]));
S`PaperRows:=[100,251];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS074";
end for;
HullDecreasingExamples["BS074"]:=S;X4Sources["BS074"]:=S;
print "VERIFIED SOURCE BS074";

// DV28: ingredient B57_35.
Gin:=Matrix(F,35,57,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,w^2,w^2,w^2,w,w^2,w,0,w^2,1,1,w^2,w,w^2,0,w,0,w^2,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,1,w^2,w^2,w,w^2,w^2,w^2,w,1,0,1,w,w^2,w^2,0,1,w^2,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,1,w^2,w^2,w,w^2,w^2,w^2,w,1,0,1,w,w^2,w^2,0,1,w^2,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w^2,w^2,1,1,1,w,1,0,0,0,1,w,w^2,w,w^2,w,1,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w^2,w^2,1,1,1,w,1,0,0,0,1,w,w^2,w,w^2,w,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w^2,w^2,w^2,0,w,1,w,w^2,0,w^2,0,w^2,w,w,w^2,0,1,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w^2,w^2,w^2,0,w,1,w,w^2,0,w^2,0,w^2,w,w,w^2,0,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,1,w^2,0,0,0,1,0,w^2,0,0,0,w^2,w^2,w,0,1,w,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,0,0,1,w,1,0,1,w^2,w,w,0,1,1,w^2,w^2,1,w^2,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w,1,w,1,1,0,w,w^2,w^2,w,1,w,w^2,1,0,w,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w,1,0,w^2,1,w,1,0,1,w,w^2,0,w^2,1,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,w,w,w^2,w^2,w,w^2,0,w^2,1,1,0,0,w^2,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,0,1,1,w^2,0,w^2,w,w^2,w^2,w,w,0,0,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,w^2,0,w^2,w,1,0,1,w,1,w^2,0,1,w,0,w,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,1,w^2,w,1,w,w^2,w^2,w,0,1,1,w,1,w,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,w^2,1,1,0,w,w,w^2,1,0,1,w,1,0,0,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,w^2,w^2,0,0,0,w^2,0,1,0,0,0,w^2,1,0,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,0,w,0,w^2,w,w^2,1,1,w^2,0,w,w^2,w,w^2,w^2,w^2,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,w^2,w,w,w,1,1,1,w,0,w,w^2,w^2,w^2,1,1,w^2,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w^2,w,w,w,0,w^2,1,w^2,1,w^2,0,w^2,1,1,1,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,w^2,w,w,0,0,0,0,0,0,w,w,w^2,w,1,w^2,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,0,w^2,w,1,w^2,0,w^2,1,1,w^2,w,1,0,w,1,1,w,w]);
U:=Matrix(F,35,3,[
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
0,0,0,
w^2,0,w^2,
w,w^2,0,
1,w,w^2,
1,1,w,
w^2,1,w^2,
w,w^2,w,
w,w,1,
1,w,1,
1,1,0,
0,1,0,
w,0,w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B57_35_57_35") then
DatabaseCode:=BestKnownLinearCode(F,57,35);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B57_35_57_35"]:=Cin;
else assert Cin eq InputDistanceCache["B57_35_57_35"];end if;
S:=HullSource("DV28","B57_35",Gin,U,12,8,12,"exact",Vector(F,[0,0,0,0,0,0,0,w,0,0,0,0,0,0,0,0,w,0,0,w,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,1,1,w,1,w,0,0,0,0,0,0,1,0,w^2,0,0,0,w^2,0,0,0]));
S`PaperRows:=[101];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV28";
end for;
HullDecreasingExamples["DV28"]:=S;X4Sources["DV28"]:=S;
print "VERIFIED SOURCE DV28";

// BS064: ingredient B59_36.
Gin:=Matrix(F,36,59,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,0,1,1,0,w,1,0,w^2,0,1,w,w^2,w,w,0,w^2,w^2,w,w,0,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,0,1,1,0,w,1,0,w^2,0,1,w,w^2,w,w,0,w^2,w^2,w,w,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,1,1,w^2,w,0,0,w,w,1,w,1,w,w^2,w,0,w,w,w,w,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,0,w,w,0,w^2,0,0,1,w^2,0,w^2,w,w^2,w,0,0,0,w^2,w^2,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,0,w^2,1,1,1,w^2,0,w^2,0,w,1,0,w^2,w,0,0,w,1,w,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,0,1,1,w,0,w^2,1,w^2,1,1,w,0,0,w,1,1,0,w^2,0,w^2,w,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,w,1,1,w^2,1,0,0,0,w^2,w^2,1,w^2,w^2,1,w,w,1,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,0,1,w^2,w^2,w^2,1,w^2,0,w,w,w,w,1,w^2,0,w^2,w,0,0,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,w^2,w,w^2,1,0,w^2,1,1,w^2,1,1,0,1,w,w,0,w,1,w^2,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,w^2,w,w^2,1,0,w^2,1,1,w^2,1,1,0,1,w,w,0,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,0,w^2,w,w,w^2,1,1,0,w,w^2,w^2,1,0,w^2,w,w,w,1,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,1,0,0,0,1,1,w,1,0,0,w^2,w^2,0,w^2,w,w^2,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,1,0,0,0,1,1,w,1,0,0,w^2,w^2,0,w^2,w,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,w^2,0,w,w^2,w^2,0,0,w^2,w,1,w,w,w^2,0,w,0,w,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w^2,w,0,w^2,1,w,w^2,0,w^2,w,w^2,0,1,w^2,w,w,w,w,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w^2,w,0,w^2,1,w,w^2,0,w^2,w,w^2,0,1,w^2,w,w,w,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w^2,w,0,w^2,1,w,w^2,0,w^2,w,w^2,0,1,w^2,w,w,w,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,1,0,w,w^2,w,w^2,1,w^2,1,w,1,w^2,1,w,w,w^2,1,0,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w,w^2,1,w,w,w^2,w,w,0,w^2,w,w,0,0,w,1,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w,w^2,1,w,w,w^2,w,w,0,w^2,w,w,0,0,w,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,0,0,w^2,1,0,0,1,w,0,0,1,1,w,0,1,w^2,0,1,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,0,0,w^2,1,0,0,1,w,0,0,1,1,w,0,1,w^2,0,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,1,w^2,w^2,0,0,0,0,w,w^2,1,1,w,0,w^2,w,1,1,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,1,w^2,1,1,w^2,0,0,w,1,0,w,w^2,1,w^2,w,w,0,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,1,w^2,1,1,w^2,0,0,w,1,0,w,w^2,1,w^2,w,w,0,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,w,1,0,0,w,0,0,1,w^2,w^2,1,w^2,0,w^2,w^2,w,w^2,w^2,0,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,w^2,0,1,w^2,w^2,1,1,0,1,0,w,0,w,w^2,w,w,0,w^2,1,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,0,w,0,w^2,1,1,w,1,0,w^2,w^2,1,w^2,0,0,1,w^2,0,w,w,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,w,w,w^2,0,w,0,w,1,w^2,w,w,0,0,1,1,w^2,w^2,w,w^2,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,w^2,w,1,0,w^2,w^2,0,w,w,w,w^2,w^2,w^2,1,0,w^2,w^2,1,w^2,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w,w,0,w^2,w^2,0,1,1,w^2,0,w^2,0,0,1,w,1,w^2,w^2,w^2,0,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,w^2,0,1,w^2,w^2,w,1,1,w,w^2,0,1,w^2,1,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,1,0,w,w,w,0,0,1,1,0,1,w,w^2,1,0,1,1,w,w,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,w,1,w^2,1,1,w^2,0,0,w,0,1,0,1,w,0,w,1,w^2,w^2,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w^2,w,w,0,w,0,w^2,0,w^2,w^2,1,0,w^2,0,w^2,w,w,w^2,w,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,0,w^2,w^2,w^2,1,0,0,w^2,1,1,1,w^2,1,1,w,0,w,1,1,0,w]);
U:=Matrix(F,36,1,[
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
0,
0,
0,
0,
0,
0,
0,
0,
1,
0,
w^2,
1,
w^2,
w^2,
w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B59_36_59_36") then
DatabaseCode:=BestKnownLinearCode(F,59,36);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B59_36_59_36"]:=Cin;
else assert Cin eq InputDistanceCache["B59_36_59_36"];end if;
S:=HullSource("BS064","B59_36",Gin,U,12,7,12,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,0,0,w^2,0,0,0,0,0,0,0,w,0,0,0,0,0,0,0,0,0,0,w,0,0,0,0,0,w^2,0,0,w^2,w^2,0,w^2,0,0,0,1,w^2,0,w,0,0]));
S`PaperRows:=[102,263];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS064";
end for;
HullDecreasingExamples["BS064"]:=S;X4Sources["BS064"]:=S;
print "VERIFIED SOURCE BS064";

// DV26: ingredient B56_23.
Gin:=Matrix(F,23,56,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,1,0,1,w,0,0,w^2,0,0,w,w^2,0,w^2,0,w^2,w,w,w,0,w,w^2,w^2,w^2,w^2,1,w^2,1,1,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,1,0,w,0,1,w^2,0,0,w^2,1,w,0,0,0,0,w,w^2,w^2,1,1,w,w^2,w^2,w^2,1,1,1,w^2,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,1,1,0,1,1,1,0,w^2,w^2,w,1,w,w^2,1,0,w,w,w^2,0,1,1,w^2,w^2,1,1,1,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,1,1,0,0,1,0,0,0,1,w,w,w^2,0,w^2,w,0,1,w^2,w^2,w,1,0,0,w,w,0,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,0,0,1,w^2,1,0,w^2,1,0,w,w^2,1,1,w,0,w,1,0,0,w^2,0,0,1,w,1,w^2,w^2,w^2,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,0,w^2,w,0,w,w^2,0,w,w^2,1,0,w,w,1,w^2,1,w,w^2,w^2,0,w^2,w^2,w,1,w,0,0,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,1,1,0,1,1,w,0,1,w^2,0,0,0,1,w^2,w,1,w^2,1,w^2,w,1,0,w^2,0,0,w^2,w,w^2,1,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,0,0,w,0,w,1,0,w,0,1,0,w^2,1,0,w,0,w,0,0,w^2,1,0,w^2,0,w,w^2,0,1,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,0,1,w^2,1,w^2,0,1,w^2,1,0,1,w,0,1,w^2,1,w^2,1,1,w,0,1,w,1,w^2,w,1,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,w^2,w^2,1,0,0,1,1,w,0,w,w,w^2,w^2,1,w^2,w^2,w^2,w,1,w^2,w,w^2,w,w,w^2,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,0,w^2,1,1,1,0,w,w,1,0,0,1,0,w^2,w^2,w^2,1,1,w^2,w,w^2,0,w,1,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,1,0,w^2,w^2,w^2,w^2,0,w,0,w,0,w,1,w^2,1,w^2,w^2,w^2,w^2,1,w,w^2,w,1,1,0,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,1,0,1,1,0,1,1,w^2,w^2,0,0,w,w,1,0,1,1,0,w^2,1,1,w^2,1,w,1,0,1,0,w,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,w,0,w,1,1,1,1,0,0,w,0,w^2,w^2,0,w,0,0,w^2,0,w^2,w,1,w,w,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,w,w,0,w,0,w^2,w^2,w^2,w^2,w,w,0,w,1,1,w,0,w,w,1,w,1,0,w^2,0,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,0,0,w^2,1,1,w^2,1,w^2,0,0,0,0,1,1,w^2,1,w,w,1,w^2,1,1,w,1,w,w^2,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,0,w^2,0,w,w,0,w,0,w^2,w^2,w^2,w^2,w,w,0,w,1,1,w,0,w,w,1,w,1,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,1,0,0,1,1,0,w,1,0,w,w,0,w^2,0,w^2,1,0,w,0,1,w^2,1,w^2,1,1,0,1,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,1,0,0,1,1,0,w,1,0,w,w,0,w^2,0,w^2,1,0,w,0,1,w^2,1,w^2,1,1,0,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,1,1,0,0,0,0,w^2,0,0,w,w^2,0,w^2,0,w^2,w,w,w,0,w,w^2,w^2,w^2,w^2,1,w^2,1,1,w^2,0,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,1,1,0,0,w,w,1,w,w,0,1,w,1,w,1,0,0,0,w,0,1,1,1,1,w^2,1,w^2,w^2,1,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,1,1,0,w^2,1,1,w,1,1,w^2,w,1,w,1,w,w^2,w^2,w^2,1,w^2,w,w,w,w,0,w,0,0,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]);
U:=Matrix(F,23,5,[
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
1,0,0,0,0,
0,1,0,0,0,
0,0,1,0,0,
0,0,0,1,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,0,
0,0,0,0,1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B56_23_56_23") then
DatabaseCode:=BestKnownLinearCode(F,56,23);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 19;
InputDistanceCache["B56_23_56_23"]:=Cin;
else assert Cin eq InputDistanceCache["B56_23_56_23"];end if;
S:=HullSource("DV26","B56_23",Gin,U,19,12,19,"exact",Vector(F,[0,1,1,0,0,w^2,w,w,0,0,0,w^2,0,0,0,0,1,1,w,w,0,w,0,0,0,0,0,w,0,0,0,0,1,w,1,0,0,0,w^2,0,0,w^2,w^2,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0]));
S`PaperRows:=[103,267];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV26";
end for;
HullDecreasingExamples["DV26"]:=S;X4Sources["DV26"]:=S;
print "VERIFIED SOURCE DV26";

// DV34: ingredient B60_33.
Gin:=Matrix(F,33,60,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,w,w^2,0,0,1,0,0,w^2,w,w^2,1,1,w,w,w^2,w^2,w,1,1,w,1,0,0,1,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,w,1,w^2,w^2,w,1,w^2,0,0,1,1,0,w,w,1,0,w^2,1,w^2,0,w^2,w,w^2,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,1,1,1,0,1,w,w,w^2,w^2,w^2,w^2,0,w^2,w,1,w,0,0,w^2,w,1,0,1,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,1,0,1,0,w^2,1,w^2,w,w,w,0,1,1,w^2,w^2,0,w,1,w^2,1,0,0,1,w^2,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,w^2,0,w^2,1,w^2,w^2,w^2,0,0,w^2,w^2,w^2,1,1,1,0,0,0,0,w,w,w,w,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,0,1,w^2,1,0,1,w,w^2,w,1,w^2,1,w,w^2,0,0,1,1,w^2,w,w,w^2,w^2,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,0,1,w^2,1,0,1,w,w^2,w,1,w^2,1,w,w^2,0,0,1,1,w^2,w,w,w^2,w^2,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,1,0,w^2,w,1,w,1,0,1,w^2,w,1,1,0,1,0,w,0,w,0,0,0,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,1,0,w^2,w,1,w,1,0,1,w^2,w,1,1,0,1,0,w,0,w,0,0,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,1,0,w^2,w,1,w,1,0,1,w^2,w,1,1,0,1,0,w,0,w,0,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,1,0,w^2,w,1,w,1,0,1,w^2,w,1,1,0,1,0,w,0,w,0,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,w^2,1,0,w^2,w,1,w,1,0,1,w^2,w,1,1,0,1,0,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,w^2,1,1,0,w,w^2,0,0,w,w^2,w,0,0,0,0,w,w,0,w,w,w^2,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w,w,1,0,w^2,w,w,0,1,w^2,0,0,1,0,1,1,w,w^2,w^2,0,0,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w^2,0,1,w,w,w,w^2,1,w,w^2,w,1,1,w^2,1,w^2,w,1,1,1,w,1,w^2,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,1,w^2,1,1,0,w,0,1,1,0,0,0,w,w^2,w,0,w,w,w^2,0,w^2,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,1,w^2,1,1,0,w,0,1,1,0,0,0,w,w^2,w,0,w,w,w^2,0,w^2,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,1,w^2,1,1,0,w,0,1,1,0,0,0,w,w^2,w,0,w,w,w^2,0,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,1,1,1,w,0,0,1,0,0,w^2,1,w,w^2,1,0,1,w^2,w^2,w^2,w^2,0,0,w,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w^2,w,1,1,w,0,w,0,w^2,0,w^2,w^2,0,1,w^2,w,w^2,0,1,w,1,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w^2,w,1,1,w,0,w,0,w^2,0,w^2,w^2,0,1,w^2,w,w^2,0,1,w,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,w,1,w^2,w^2,w^2,1,w^2,1,1,0,1,w^2,1,1,0,w^2,w^2,w,w^2,1,1,1,0,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w,w,w^2,w,w,w^2,0,1,1,0,0,w^2,0,0,w,w,w,w,w,w^2,w^2,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w,w,w^2,w,w,w^2,0,1,1,0,0,w^2,0,0,w,w,w,w,w,w^2,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w,w,w^2,w,w,w^2,0,1,1,0,0,w^2,0,0,w,w,w,w,w,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,w,w,w^2,1,w,w^2,1,0,w^2,1,w,0,w^2,w^2,0,w^2,0,0,w^2,0,1,0,w^2,w^2,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w^2,1,w^2,0,0,w,w,w,0,w,1,w^2,1,0,1,1,w^2,1,1,w^2,1,w,w,1,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,0,0,0,1,0,w^2,1,w,1,w,0,w,w,w,0,1,w,0,1,w,w,0,0,0,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,0,1,w^2,1,1,1,0,1,w^2,1,w^2,1,1,0,w^2,0,0,w^2,0,0,1,0,w,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,1,w^2,w^2,0,1,w,w^2,0,w,w^2,w,0,w^2,0,w^2,w^2,w^2,w^2,w^2,w^2,w,0,1,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,1,w^2,w^2,0,1,w,w^2,0,w,w^2,w,0,w^2,0,w^2,w^2,w^2,w^2,w^2,w^2,w,0,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w^2,w^2,w,w,w^2,1,w,w,w,0,w^2,w,1,w,w,0,w,w,w^2,w,0,1,0,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w,1,w,0,w,1,0,w,0,w,w,1,w^2,w,0,w,w,0,w,1,w^2,w^2,w,w,w^2,w^2]);
U:=Matrix(F,33,1,[
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
1,
0,
w^2,
w^2,
w^2,
w,
w^2,
w^2,
1,
w,
0,
1,
1,
w^2,
w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B60_33_60_33") then
DatabaseCode:=BestKnownLinearCode(F,60,33);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 14;
InputDistanceCache["B60_33_60_33"]:=Cin;
else assert Cin eq InputDistanceCache["B60_33_60_33"];end if;
S:=HullSource("DV34","B60_33",Gin,U,14,14,14,"exact",Vector(F,[0,0,0,0,0,0,w,0,0,0,0,0,w^2,0,0,w,w^2,1,w,w^2,w^2,w^2,0,w,0,0,0,0,0,0,1,0,0,0,w^2,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0]));
S`PaperRows:=[105,243,261];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV34";
end for;
HullDecreasingExamples["DV34"]:=S;X4Sources["DV34"]:=S;
print "VERIFIED SOURCE DV34";

// DV30: ingredient B59_32.
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
U:=Matrix(F,32,2,[
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,1,
w^2,1,
w,w^2,
1,w^2,
w^2,1,
1,0,
0,0,
1,1,
w,0,
1,1,
w,1,
w^2,w,
0,w,
0,w]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B59_32_59_32") then
DatabaseCode:=BestKnownLinearCode(F,59,32);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 14;
InputDistanceCache["B59_32_59_32"]:=Cin;
else assert Cin eq InputDistanceCache["B59_32_59_32"];end if;
S:=HullSource("DV30","B59_32",Gin,U,14,12,14,"exact",Vector(F,[0,0,w,0,0,0,w^2,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,1,w,0,w,0,0,0,0,0,1,0,0,0,w,0,0,0,0,w,w^2,0,w,w^2,0,0,0]));
S`PaperRows:=[106,255];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV30";
end for;
HullDecreasingExamples["DV30"]:=S;X4Sources["DV30"]:=S;
print "VERIFIED SOURCE DV30";

// DV31: ingredient B59_35.
Gin:=Matrix(F,35,59,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,w,0,w^2,w^2,w^2,w^2,w^2,w,0,w,w^2,w^2,w,0,w^2,1,w^2,w,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,w^2,0,1,w,0,0,w,w^2,w,0,w,w,0,w,1,1,0,1,0,w,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,0,w,1,w,0,0,w,w^2,w,0,w^2,1,w,0,w^2,0,w,w^2,0,w^2,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,1,w,w^2,w,w,w,w^2,w^2,w^2,w,1,1,0,0,w,0,w,1,w^2,w^2,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,1,w^2,w^2,w,w^2,w^2,w^2,w,1,0,1,w,w^2,w^2,0,1,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,1,w^2,1,1,w,1,0,0,w,w^2,1,1,w^2,0,w,1,1,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w^2,w^2,1,1,1,w,1,0,0,0,1,w,w^2,w,w^2,w,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,0,0,w,w,0,0,0,w,1,w,w^2,0,0,w^2,w,1,0,w,0,1,w,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w^2,w^2,w^2,0,w,1,w,w^2,0,w^2,0,w^2,w,w,w^2,0,1,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,0,0,0,1,w,0,0,0,0,1,0,w^2,w^2,w^2,1,0,1,w^2,0,1,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,1,0,w,1,0,w,1,0,1,w^2,w,w^2,1,w^2,0,0,1,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,w,0,0,1,1,0,w^2,1,1,w^2,1,w,w^2,w^2,1,w,1,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,0,0,w^2,1,1,0,w,w^2,w^2,w^2,0,0,w,w,w,w,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,0,w^2,0,w^2,0,w^2,1,w,1,0,w^2,0,0,w,w,w,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,0,w^2,w,1,w^2,1,w,w^2,w^2,w,w^2,0,0,w,0,w^2,w,w,w^2,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,0,1,0,w,w^2,w^2,1,1,w^2,0,w^2,w,0,0,w^2,1,w,1,1,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,0,0,1,w,0,0,w^2,w^2,w,1,0,1,w,w,0,1,w,0,1,w,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,w^2,w^2,1,w,1,w,w^2,w^2,w,w,w^2,w,0,0,1,1,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,w^2,w,w^2,1,0,w,w^2,1,w^2,1,1,w,1,w,1,1,w^2,1,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,0,0,1,w,0,1,0,w,w,w^2,1,1,0,0,0,w^2,w,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,w,1,0,w,w,0,0,0,w^2,0,1,1,1,w,w,w,w,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w,0,0,0,w,0,w^2,1,0,0,w^2,0,w^2,w,1,1,w^2,w,0,1,0,w,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,0,0,0,0,0,w^2,0,1,1,0,0,0,1,w,w,w,0,0,1,w,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,w,0,1,0,1,0,1,w,w^2,w^2,1,0,0,1,0,0,w,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,0,0,0,0,1,0,1,w,w,w^2,1,1,w^2,0,w^2,w,0,w,0,1,w,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,0,0,0,w,w,w^2,1,w^2,0,1,w^2,w,0,w,0,1,1,w,1,w,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,0,0,1,w,0,w^2,w^2,1,1,1,w,0,w,w,w,1,0,w,1,0,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,w,1,1,0,0,0,w^2,1,w^2,1,w^2,w,1,w,w^2,0,w,w,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,w^2,0,1,0,0,0,w,w^2,w^2,0,w,w^2,w,w,1,0,w,0,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2]);
U:=Matrix(F,35,2,[
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
1,1,
0,0,
0,w^2,
w,w,
w^2,0,
w,0,
1,1,
w^2,0,
1,1,
w^2,w,
0,1,
1,1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B59_35_59_35") then
DatabaseCode:=BestKnownLinearCode(F,59,35);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B59_35_59_35"]:=Cin;
else assert Cin eq InputDistanceCache["B59_35_59_35"];end if;
S:=HullSource("DV31","B59_35",Gin,U,12,9,12,"exact",Vector(F,[0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,w^2,0,w^2,0,0,0,0,w,0,w,1,w^2,0,0,1,1,0,0,0,0,0,0]));
S`PaperRows:=[108,270];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV31";
end for;
HullDecreasingExamples["DV31"]:=S;X4Sources["DV31"]:=S;
print "VERIFIED SOURCE DV31";

// DV25: ingredient B57_36.
Gin:=Matrix(F,36,57,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,w^2,w^2,w^2,w,w^2,w,0,w^2,1,1,w^2,w,w^2,0,w,0,w^2,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,1,w^2,w^2,w,w^2,w^2,w^2,w,1,0,1,w,w^2,w^2,0,1,w^2,0,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,1,w^2,w^2,w,w^2,w^2,w^2,w,1,0,1,w,w^2,w^2,0,1,w^2,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w^2,w^2,1,1,1,w,1,0,0,0,1,w,w^2,w,w^2,w,1,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w^2,w^2,1,1,1,w,1,0,0,0,1,w,w^2,w,w^2,w,1,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w^2,w^2,w^2,0,w,1,w,w^2,0,w^2,0,w^2,w,w,w^2,0,1,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w^2,w^2,w^2,0,w,1,w,w^2,0,w^2,0,w^2,w,w,w^2,0,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,1,w^2,0,0,0,1,0,w^2,0,0,0,w^2,w^2,w,0,1,w,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,0,0,1,w,1,0,1,w^2,w,w,0,1,1,w^2,w^2,1,w^2,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,0,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w,1,w,1,1,0,w,w^2,w^2,w,1,w,w^2,1,0,w,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w,1,0,w^2,1,w,1,0,1,w,w^2,0,w^2,1,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,w,w,w^2,w^2,w,w^2,0,w^2,1,1,0,0,w^2,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,0,1,1,w^2,0,w^2,w,w^2,w^2,w,w,0,0,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,w^2,0,w^2,w,1,0,1,w,1,w^2,0,1,w,0,w,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,1,w^2,w,1,w,w^2,w^2,w,0,1,1,w,1,w,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,w^2,1,1,0,w,w,w^2,1,0,1,w,1,0,0,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,w^2,w^2,0,0,0,w^2,0,1,0,0,0,w^2,1,0,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,0,w,0,w^2,w,w^2,1,1,w^2,0,w,w^2,w,w^2,w^2,w^2,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,w^2,w,w,w,1,1,1,w,0,w,w^2,w^2,w^2,1,1,w^2,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w^2,w,w,w,0,w^2,1,w^2,1,w^2,0,w^2,1,1,1,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,w^2,w,w,0,0,0,0,0,0,w,w,w^2,w,1,w^2,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,0,w^2,w,1,w^2,0,w^2,1,1,w^2,w,1,0,w,1,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,0,w^2,w^2,0,w^2,1,1,w^2,0,w^2,w^2,0,0,w,w,w,1]);
U:=Matrix(F,36,4,[
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
w^2,0,w^2,0,
w,w^2,0,w,
1,w,w^2,1,
1,1,w,1,
w^2,1,w^2,1,
w,w^2,w,w,
w,w,1,0,
1,w,1,w^2,
1,1,0,w,
0,1,0,w,
w,0,w^2,1,
0,w,0,1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B57_36_57_36") then
DatabaseCode:=BestKnownLinearCode(F,57,36);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B57_36_57_36"]:=Cin;
else assert Cin eq InputDistanceCache["B57_36_57_36"];end if;
S:=HullSource("DV25","B57_36",Gin,U,12,8,12,"exact",Vector(F,[0,0,0,0,0,0,0,w,0,0,0,0,0,0,0,0,w,0,0,w,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,1,1,w,1,w,0,0,0,0,0,0,1,0,w^2,0,0,0,w^2,0,0,0,0]));
S`PaperRows:=[109,266,271];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV25";
end for;
HullDecreasingExamples["DV25"]:=S;X4Sources["DV25"]:=S;
print "VERIFIED SOURCE DV25";

// DV36: ingredient B61_33.
Gin:=Matrix(F,33,61,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,1,w,0,w^2,0,1,1,w^2,0,w,1,0,1,w,w,0,1,w,w,0,0,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,1,0,w^2,1,1,1,0,0,w,0,w^2,1,0,w^2,1,1,w,w^2,0,w^2,1,w^2,1,w,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,w,w,w,0,w^2,w^2,w,w^2,0,w,1,0,0,0,1,0,1,1,1,w^2,1,1,w,0,0,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,w,w,w,0,w^2,w^2,w,w^2,0,w,1,0,0,0,1,0,1,1,1,w^2,1,1,w,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,w,w,w,0,w^2,w^2,w,w^2,0,w,1,0,0,0,1,0,1,1,1,w^2,1,1,w,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,w,0,0,w,w,0,w^2,1,w^2,0,0,0,1,0,1,w^2,0,1,w^2,1,0,w^2,0,w,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,w,0,0,w,w,0,w^2,1,w^2,0,0,0,1,0,1,w^2,0,1,w^2,1,0,w^2,0,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,0,1,1,0,0,0,1,w,w^2,w^2,0,0,w^2,1,0,w^2,1,w^2,w^2,1,w,w^2,w^2,0,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w,1,0,w^2,1,0,1,w,0,w,w,1,0,w,0,w,w,w^2,1,1,w^2,w,w^2,1,1,w^2,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,0,1,1,w^2,1,w^2,0,1,0,1,w^2,1,1,0,w,w^2,w,w^2,0,1,1,1,w,0,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w,0,0,0,1,w^2,w,w,w^2,1,w^2,0,w^2,0,w^2,w,w^2,w^2,w,w,0,w^2,w,0,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,w^2,0,w^2,0,1,1,1,0,w^2,w^2,0,0,0,1,w,1,w^2,w^2,1,w,1,1,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,1,w^2,w^2,w^2,w^2,0,w^2,w,w^2,0,1,0,0,w^2,1,0,1,1,w^2,0,1,w^2,w^2,w,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,w^2,0,w^2,0,w^2,w^2,w,0,0,w^2,w,w,0,w^2,w,0,w^2,1,1,0,0,0,1,0,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,w,0,w^2,0,w^2,w^2,0,0,w^2,w,1,1,0,1,w^2,1,0,0,w,w^2,0,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w,1,1,w,0,0,1,0,w^2,w^2,1,w^2,w^2,w^2,w^2,1,1,w^2,0,0,w,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,w,0,1,w,w^2,1,w,0,0,w,1,w,1,1,w,1,1,w,0,w,1,0,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,w^2,1,w^2,0,1,1,w,w,w,w^2,1,w,0,0,w^2,0,w,1,0,w,w,1,0,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,0,w,w^2,w^2,w^2,0,0,w^2,w^2,w,w^2,1,1,0,w^2,w^2,1,0,w,w^2,0,1,w^2,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,1,w,0,w^2,w^2,w,w^2,1,w^2,0,0,1,w,1,w,0,1,0,1,w^2,1,w^2,0,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,w^2,0,w^2,0,w^2,0,1,0,1,0,0,0,w^2,w^2,0,1,1,1,1,w,w,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,1,w,w^2,0,1,w^2,1,0,w^2,w^2,1,w^2,1,1,0,w^2,0,w,1,0,w^2,1,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,w^2,0,0,0,1,w,w^2,0,1,w^2,1,0,w^2,w^2,1,w^2,1,1,0,w^2,0,w,1,0,w^2,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,w,w^2,0,w^2,0,w,1,w,w,w,0,w^2,0,w,w^2,1,w,0,w^2,1,0,1,0,1,0,w,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w^2,w,1,w^2,w^2,w,1,0,1,0,0,1,w^2,w,0,0,w^2,w^2,w^2,1,w^2,1,1,w^2,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,w^2,w,1,w^2,w^2,w,1,0,1,0,0,1,w^2,w,0,0,w^2,w^2,w^2,1,w^2,1,1,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w^2,0,0,w,w^2,w^2,w^2,w^2,w^2,1,1,1,w,1,1,1,w^2,w,w^2,w^2,1,1,0,0,w^2,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w^2,0,0,w,w^2,w^2,w^2,w^2,w^2,1,1,1,w,1,1,1,w^2,w,w^2,w^2,1,1,0,0,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,w^2,1,0,0,w,w,w^2,w,1,w,w^2,0,w^2,1,0,w,w,w^2,w^2,w,1,w^2,w,0,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w,w^2,1,0,0,w,w,w^2,w,1,w,w^2,0,w^2,1,0,w,w,w^2,w^2,w,1,w^2,w,0,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w^2,w,1,w^2,0,w,0,0,0,1,0,0,0,0,0,1,1,w,w^2,0,w,0,1,1,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,1,w,0,w^2,0,1,1,w^2,0,w,1,0,1,w,w,0,1,w,w,0,0,w^2,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,1,0,0,w^2,1,w^2,0,w^2,1,0,1,w,w,1,0,0,1,0,w,w^2,1,1,w,w^2]);
U:=Matrix(F,33,1,[
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
0,
w,
1,
1,
w^2,
0,
w,
0,
w^2,
w,
1,
0,
w^2,
w,
1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B61_33_61_33") then
DatabaseCode:=BestKnownLinearCode(F,61,33);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 15;
InputDistanceCache["B61_33_61_33"]:=Cin;
else assert Cin eq InputDistanceCache["B61_33_61_33"];end if;
S:=HullSource("DV36","B61_33",Gin,U,15,15,15,"exact",Vector(F,[0,0,w,0,0,0,w,0,0,0,0,1,0,w,0,w^2,0,0,0,0,w,0,1,0,1,1,0,w^2,w^2,0,1,0,w,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]));
S`PaperRows:=[110,242,246,269];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV36";
end for;
HullDecreasingExamples["DV36"]:=S;X4Sources["DV36"]:=S;
print "VERIFIED SOURCE DV36";

// DV33: ingredient B60_32.
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
U:=Matrix(F,32,2,[
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
0,0,
w^2,w^2,
0,0,
1,w,
w,1,
1,1,
w,w^2,
0,0,
w,w,
0,0,
w^2,w^2,
1,w,
w^2,1,
1,0,
1,w^2,
1,w,
w^2,1]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B60_32_60_32") then
DatabaseCode:=BestKnownLinearCode(F,60,32);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 15;
InputDistanceCache["B60_32_60_32"]:=Cin;
else assert Cin eq InputDistanceCache["B60_32_60_32"];end if;
S:=HullSource("DV33","B60_32",Gin,U,15,13,15,"exact",Vector(F,[w,0,0,w^2,0,0,0,0,0,0,w,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,0,w,0,0,0,1,0,w,w,0,0,0,0,1,w,w,0,0,w,0,0,0,w,0,0,1,0,0]));
S`PaperRows:=[112,254,258];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV33";
end for;
HullDecreasingExamples["DV33"]:=S;X4Sources["DV33"]:=S;
print "VERIFIED SOURCE DV33";

// BS096: ingredient B59_37.
Gin:=Matrix(F,37,59,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,0,w^2,1,1,w^2,w^2,w^2,w,0,w,1,1,1,w,w,w,w^2,w,w,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,1,w^2,w^2,1,0,w,w^2,w,0,w,w^2,1,0,0,w,w,1,0,1,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,w^2,w^2,w^2,w,w^2,w,0,w^2,1,1,w^2,w,w^2,0,w,0,w^2,w,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,1,w^2,w^2,w,w^2,w^2,w^2,w,1,0,1,w,w^2,w^2,0,1,w^2,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,1,w^2,w^2,w,w^2,w^2,w^2,w,1,0,1,w,w^2,w^2,0,1,w^2,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w^2,w^2,1,1,1,w,1,0,0,0,1,w,w^2,w,w^2,w,1,0,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w^2,w^2,1,1,1,w,1,0,0,0,1,w,w^2,w,w^2,w,1,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w^2,w^2,w^2,0,w,1,w,w^2,0,w^2,0,w^2,w,w,w^2,0,1,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w^2,w^2,w^2,0,w,1,w,w^2,0,w^2,0,w^2,w,w,w^2,0,1,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,1,w^2,0,0,0,1,0,w^2,0,0,0,w^2,w^2,w,0,1,w,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,0,0,1,w,1,0,1,w^2,w,w,0,1,1,w^2,w^2,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w,1,w,1,1,0,w,w^2,w^2,w,1,w,w^2,1,0,w,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w,1,0,w^2,1,w,1,0,1,w,w^2,0,w^2,1,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,w,w,w^2,w^2,w,w^2,0,w^2,1,1,0,0,w^2,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,0,1,1,w^2,0,w^2,w,w^2,w^2,w,w,0,0,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,w^2,0,w^2,w,1,0,1,w,1,w^2,0,1,w,0,w,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,1,w^2,w,1,w,w^2,w^2,w,0,1,1,w,1,w,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,w^2,1,1,0,w,w,w^2,1,0,1,w,1,0,0,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,w^2,w^2,0,0,0,w^2,0,1,0,0,0,w^2,1,0,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,0,w,0,w^2,w,w^2,1,1,w^2,0,w,w^2,w,w^2,w^2,w^2,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,w^2,w,w,w,1,1,1,w,0,w,w^2,w^2,w^2,1,1,w^2,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w^2,w,w,w,0,w^2,1,w^2,1,w^2,0,w^2,1,1,1,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,w^2,w,w,0,0,0,0,0,0,w,w,w^2,w,1,w^2,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,0,w^2,w,1,w^2,0,w^2,1,1,w^2,w,1,0,w,1,1,w,w]);
U:=Matrix(F,37,4,[
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
1,0,1,1,
1,w,w^2,0,
0,0,1,w^2,
w,1,w^2,1,
w^2,0,1,w,
0,w,w^2,1,
w,w,w^2,w^2,
0,w,w^2,w,
w^2,1,0,w,
0,w,w,0,
1,w^2,w^2,1,
1,w,w,0,
w^2,w^2,w,w^2]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B59_37_59_37") then
DatabaseCode:=BestKnownLinearCode(F,59,37);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B59_37_59_37"]:=Cin;
else assert Cin eq InputDistanceCache["B59_37_59_37"];end if;
S:=HullSource("BS096","B59_37",Gin,U,12,9,12,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,1,0,0,0,0,0,w,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,0,0,w,1,w^2,0,0,0,0,0,w,0,w^2,0,w^2,w^2,0,0,0,0,0,0,0]));
S`PaperRows:=[114,272];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="BS096";
end for;
HullDecreasingExamples["BS096"]:=S;X4Sources["BS096"]:=S;
print "VERIFIED SOURCE BS096";

// DV32: ingredient B62_39.
Gin:=Matrix(F,39,62,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,1,0,w,w,w,w^2,0,0,w,w^2,w^2,w^2,w,w^2,w^2,1,0,1,w^2,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,0,1,0,1,w^2,0,w,w^2,1,w,0,1,w,1,0,0,w^2,w,w,w^2,w^2,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,0,1,0,1,0,w,w,w^2,0,w,0,0,w^2,w^2,0,0,0,0,w^2,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,0,1,1,0,w,1,0,w^2,0,1,w,w^2,w,w,0,w^2,w^2,w,w,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,w,0,1,1,0,w,1,0,w^2,0,1,w,w^2,w,w,0,w^2,w^2,w,w,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,0,1,1,w^2,w,0,0,w,w,1,w,1,w,w^2,w,0,w,w,w,w,w,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,0,w,w,0,w^2,0,0,1,w^2,0,w^2,w,w^2,w,0,0,0,w^2,w^2,w,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,0,w^2,1,1,1,w^2,0,w^2,0,w,1,0,w^2,w,0,0,w,1,w,w^2,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,0,1,1,w,0,w^2,1,w^2,1,1,w,0,0,w,1,1,0,w^2,0,w^2,w,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w,w,1,1,w^2,1,0,0,0,w^2,w^2,1,w^2,w^2,1,w,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,0,1,w^2,w^2,w^2,1,w^2,0,w,w,w,w,1,w^2,0,w^2,w,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,w^2,w,w^2,1,0,w^2,1,1,w^2,1,1,0,1,w,w,0,w,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w^2,w^2,w,w^2,1,0,w^2,1,1,w^2,1,1,0,1,w,w,0,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,0,w^2,w,w,w^2,1,1,0,w,w^2,w^2,1,0,w^2,w,w,w,1,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,1,0,0,0,1,1,w,1,0,0,w^2,w^2,0,w^2,w,w^2,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,1,0,0,0,1,1,w,1,0,0,w^2,w^2,0,w^2,w,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,w^2,0,w,w^2,w^2,0,0,w^2,w,1,w,w,w^2,0,w,0,w,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w^2,w,0,w^2,1,w,w^2,0,w^2,w,w^2,0,1,w^2,w,w,w,w,w^2,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w^2,w,0,w^2,1,w,w^2,0,w^2,w,w^2,0,1,w^2,w,w,w,w,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,w^2,w,0,w^2,1,w,w^2,0,w^2,w,w^2,0,1,w^2,w,w,w,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,w^2,1,0,w,w^2,w,w^2,1,w^2,1,w,1,w^2,1,w,w,w^2,1,0,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w,w^2,1,w,w,w^2,w,w,0,w^2,w,w,0,0,w,1,0,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w,w^2,1,w,w,w^2,w,w,0,w^2,w,w,0,0,w,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,0,0,w^2,1,0,0,1,w,0,0,1,1,w,0,1,w^2,0,1,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,0,0,w^2,1,0,0,1,w,0,0,1,1,w,0,1,w^2,0,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,1,w^2,w^2,0,0,0,0,w,w^2,1,1,w,0,w^2,w,1,1,1,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,1,w^2,1,1,w^2,0,0,w,1,0,w,w^2,1,w^2,w,w,0,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w^2,1,w^2,1,1,w^2,0,0,w,1,0,w,w^2,1,w^2,w,w,0,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,w,1,0,0,w,0,0,1,w^2,w^2,1,w^2,0,w^2,w^2,w,w^2,w^2,0,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,w^2,0,1,w^2,w^2,1,1,0,1,0,w,0,w,w^2,w,w,0,w^2,1,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w^2,0,w,0,w^2,1,1,w,1,0,w^2,w^2,1,w^2,0,0,1,w^2,0,w,w,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,w,w,w^2,0,w,0,w,1,w^2,w,w,0,0,1,1,w^2,w^2,w,w^2,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,w^2,w^2,w,1,0,w^2,w^2,0,w,w,w,w^2,w^2,w^2,1,0,w^2,w^2,1,w^2,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w,w,0,w^2,w^2,0,1,1,w^2,0,w^2,0,0,1,w,1,w^2,w^2,w^2,0,w^2,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,w^2,0,1,w^2,w^2,w,1,1,w,w^2,0,1,w^2,1,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,w^2,0,1,0,w,w,w,0,0,1,1,0,1,w,w^2,1,0,1,1,w,w,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,w,1,w^2,1,1,w^2,0,0,w,0,1,0,1,w,0,w,1,w^2,w^2,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,w^2,w^2,w,w,0,w,0,w^2,0,w^2,w^2,1,0,w^2,0,w^2,w,w,w^2,w,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,0,w^2,w^2,w^2,1,0,0,w^2,1,1,1,w^2,1,1,w,0,w,1,1,0,w]);
U:=Matrix(F,39,1,[
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
0,
0,
0,
0,
0,
0,
0,
1,
1,
w,
w,
w,
0,
w,
1,
w,
1,
w]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B62_39_62_39") then
DatabaseCode:=BestKnownLinearCode(F,62,39);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B62_39_62_39"]:=Cin;
else assert Cin eq InputDistanceCache["B62_39_62_39"];end if;
S:=HullSource("DV32","B62_39",Gin,U,12,10,12,"exact",Vector(F,[w^2,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,0,0,1,0,1,0,w,w,w^2,0,w,0,0,w^2,w^2,0,0,0,0]));
S`PaperRows:=[115,273,275];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV32";
end for;
HullDecreasingExamples["DV32"]:=S;X4Sources["DV32"]:=S;
print "VERIFIED SOURCE DV32";

// DV35: ingredient B60_39.
Gin:=Matrix(F,39,60,[
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w,1,1,1,1,w^2,0,w^2,1,w^2,1,w^2,0,w,w,w,w^2,w^2,w^2,
0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w,0,w^2,1,1,w^2,w^2,w^2,w,0,w,1,1,1,w,w,w,w^2,w,w,
0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,1,w^2,w^2,1,0,w,w^2,w,0,w,w^2,1,0,0,w,w,1,0,1,
0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,w^2,w^2,w^2,w,w^2,w,0,w^2,1,1,w^2,w,w^2,0,w,0,w^2,w,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,1,w^2,w^2,w,w^2,w^2,w^2,w,1,0,1,w,w^2,w^2,0,1,w^2,0,
0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,w^2,1,w^2,w^2,w,w^2,w^2,w^2,w,1,0,1,w,w^2,w^2,0,1,w^2,
0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w^2,w^2,1,1,1,w,1,0,0,0,1,w,w^2,w,w^2,w,1,0,
0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,1,w^2,w^2,w^2,1,1,1,w,1,0,0,0,1,w,w^2,w,w^2,w,1,
0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w^2,w^2,w^2,0,w,1,w,w^2,0,w^2,0,w^2,w,w,w^2,0,1,0,
0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,1,w^2,w^2,w^2,0,w,1,w,w^2,0,w^2,0,w^2,w,w,w^2,0,1,
0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,0,1,w^2,0,0,0,1,0,w^2,0,0,0,w^2,w^2,w,0,1,w,
0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w,1,0,0,1,w,1,0,1,w^2,w,w,0,1,1,w^2,w^2,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,1,w,0,0,0,w^2,1,1,w^2,1,w^2,w,1,0,1,w^2,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w,1,w,1,1,0,w,w^2,w^2,w,1,w,w^2,1,0,w,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,w^2,w,0,w,1,0,w^2,1,w,1,0,1,w,w^2,0,w^2,1,1,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,w,w,w^2,w^2,w,w^2,0,w^2,1,1,0,0,w^2,w^2,w^2,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,w^2,w^2,0,0,1,1,w^2,0,w^2,w,w^2,w^2,w,w,0,0,1,1,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,1,1,w^2,0,w^2,w,1,0,1,w,1,w^2,0,1,w,0,w,w^2,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w^2,0,w,0,1,w^2,w,1,w,w^2,w^2,w,0,1,1,w,1,w,1,w^2,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,0,w^2,1,0,1,w,w^2,1,w^2,1,1,w^2,0,0,0,w,1,1,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,w^2,1,w^2,w^2,1,1,0,w,w,w^2,1,0,1,w,1,0,0,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,w,1,0,w,w^2,w^2,0,0,0,w^2,0,1,0,0,0,w^2,1,0,w^2,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w^2,w,w,w^2,0,w^2,0,w^2,w,1,w,0,w^2,w^2,w^2,1,w,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w^2,w,w^2,w,1,0,0,0,1,w,1,1,1,w^2,w^2,w^2,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,w^2,1,0,w^2,w^2,w,1,0,1,w,w^2,w^2,w^2,w,w^2,w^2,1,w^2,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,w,w^2,0,w,0,w^2,w,w^2,1,1,w^2,0,w,w^2,w,w^2,w^2,w^2,w,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,w,w,0,0,1,w^2,w,0,w,w^2,w,0,1,w^2,w^2,1,0,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,w,w,w^2,w,w,w,1,1,1,w,0,w,w^2,w^2,w^2,1,1,w^2,0,w,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,w^2,w^2,w^2,w,w,w,0,w^2,1,w^2,1,w^2,0,w^2,1,1,1,1,w,1,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,w^2,w,w,w,w,w,0,w,w^2,w^2,0,w,1,0,1,w^2,1,1,0,w^2,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,w^2,1,w,w^2,w,w,0,0,0,0,0,0,w,w,w^2,w,1,w^2,0,0,1,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,w^2,0,w^2,w,1,w^2,0,w^2,1,1,w^2,w,1,0,w,1,1,w,w,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w,w,w,0,0,w^2,w^2,0,w^2,1,1,w^2,0,w^2,w^2,0,0,w,w,w,1]);
U:=Matrix(F,39,4,[
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
0,0,0,0,
w^2,w,w^2,1,
0,1,1,1,
w^2,0,1,0,
1,w,w,1,
0,0,0,w,
1,w,w^2,w^2,
0,w,w^2,w,
1,1,0,1,
0,w,0,1,
0,w^2,w^2,w,
w^2,1,1,w^2,
w,0,0,w^2,
w^2,1,1,w,
w^2,w,w^2,0,
w,w^2,w,0]);
Cin:=LinearCode(Gin);
if not IsDefined(InputDistanceCache,"B60_39_60_39") then
DatabaseCode:=BestKnownLinearCode(F,60,39);assert Cin eq DatabaseCode;
assert MinimumWeight(DatabaseCode) ge 12;
InputDistanceCache["B60_39_60_39"]:=Cin;
else assert Cin eq InputDistanceCache["B60_39_60_39"];end if;
S:=HullSource("DV35","B60_39",Gin,U,12,11,12,"exact",Vector(F,[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,w,0,0,0,0,0,w^2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,w^2,0,0,w^2,w,1,0,0,0,0,0,w^2,0,1,0,1,1,0,0,0,0,0,0]));
S`PaperRows:=[116,274];
for PaperNo in S`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="DV35";
end for;
HullDecreasingExamples["DV35"]:=S;X4Sources["DV35"]:=S;
print "VERIFIED SOURCE DV35";
assert #Keys(HullDecreasingExamples) eq 69;
print "VERIFIED HullDecreasing: 69 X4 CONSTRUCTIONS";
