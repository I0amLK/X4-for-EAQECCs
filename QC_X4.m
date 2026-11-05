// Direct QC-X4 examples from the manuscript.
// Each block specifies both ingredients, lambda, and phi on a cyclic module generator.
// Phi(x^t*g) = x^t*Phi(g); the induced field-linear map is stored explicitly.
// First run: load "X4.m";
assert assigned X4Loaded;
P<x>:=PolynomialRing(F);

// SX01: D1_1, D1_2; lambda=3.
InputPolys1:=[[P!(1)]];
InputPolys2:=[[P!(1),P!(0),P!(w^2+w^2*x+w^2*x^2)],[P!(0),P!(1),P!(1+x+x^2)],[P!(0),P!(0),P!(x+x^2)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 3 and Dimension(D1) eq 3;
assert MinimumWeight(D1) eq 1 and Dimension(D1 meet HermitianDual(D1)) eq 0;
assert Length(D2) eq 9 and Dimension(D2) eq 8;
assert MinimumWeight(D2) eq 2 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(1)];
ImagePolys:=[P!(1+x+w^2*x^2),P!(1+x+w^2*x^2),P!(x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,3);W2:=ZeroMatrix(F,0,9);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,1)) eq QCShift(phi(u),3);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,8,12,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,w^2,F!1,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,F!0,w,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!1,w^2,w^2,F!0,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w^2,F!0,w,w,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w^2,F!1,w^2,w,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!1,w,w^2,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w^2,F!1,F!0,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,F!0,F!1,w^2]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 12 and Dimension(Hout) eq 3;
assert Dimension(Cout)-Dimension(Hout) eq 5 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 1;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SX01",lo,hi;
assert lo eq 4 and hi eq 4;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 4};
QCExamples["SX01"]:=rec<QCFormat|Id:="SX01",Ingredients:=<D1,D2>,
IngredientLabels:=<"D1_1","D1_2">,
IngredientParameters:=<[3,3,1,0],[9,8,2,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[12,5,4,1],OutputHull:=3,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[117]>;
for PaperNo in QCExamples["SX01"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SX01";
end for;
print "VERIFIED QC-X4 SX01";

// SX02: D2_1, D2_2; lambda=3.
InputPolys1:=[[P!(1)]];
InputPolys2:=[[P!(1),P!(0),P!(0),P!(w+w^2*x+w*x^2)],[P!(0),P!(1),P!(w+w*x+w*x^2),P!(w)],[P!(0),P!(0),P!(x+x^2),P!(w^2+w^2*x)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 3 and Dimension(D1) eq 3;
assert MinimumWeight(D1) eq 1 and Dimension(D1 meet HermitianDual(D1)) eq 0;
assert Length(D2) eq 12 and Dimension(D2) eq 8;
assert MinimumWeight(D2) eq 3 and Dimension(D2 meet HermitianDual(D2)) eq 2;
DomainPolys:=[P!(1)];
ImagePolys:=[P!(1+x),P!(w^2+x),P!(1+w*x^2),P!(w^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,3);W2:=ZeroMatrix(F,0,12);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,1)) eq QCShift(phi(u),4);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,8,15,[
F!1,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!1,w,F!1,F!0,F!0,F!1,
F!0,F!1,F!0,F!0,F!0,w,F!0,F!0,F!0,F!1,F!0,F!1,F!0,w^2,w^2,
F!0,F!0,F!1,F!0,F!0,F!1,F!0,F!0,F!0,w,w^2,w^2,w^2,w,F!0,
F!0,F!0,F!0,F!1,F!0,w,F!0,F!0,F!0,F!0,w,F!0,w,F!1,w,
F!0,F!0,F!0,F!0,F!1,w^2,F!0,F!0,F!0,F!0,F!1,w,w,w,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w,F!1,w,w^2,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w,F!1,F!1,F!0,w,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,w^2,w,w,w,w^2]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 15 and Dimension(Hout) eq 5;
assert Dimension(Cout)-Dimension(Hout) eq 3 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 2;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SX02",lo,hi;
assert lo eq 6 and hi eq 6;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 6};
QCExamples["SX02"]:=rec<QCFormat|Id:="SX02",Ingredients:=<D1,D2>,
IngredientLabels:=<"D2_1","D2_2">,
IngredientParameters:=<[3,3,1,0],[12,8,3,2]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[15,3,6,2],OutputHull:=5,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[118]>;
for PaperNo in QCExamples["SX02"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SX02";
end for;
print "VERIFIED QC-X4 SX02";

// SX03: D3_1, D3_2; lambda=3.
InputPolys1:=[[P!(1)]];
InputPolys2:=[[P!(1),P!(0),P!(w^2+x+w*x^2),P!(w^2+x)],[P!(0),P!(1),P!(w^2+x+w*x^2),P!(w+w*x+w*x^2)],[P!(0),P!(0),P!(w*x+w^2*x^2),P!(w+w^2*x+w^2*x^2)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 3 and Dimension(D1) eq 3;
assert MinimumWeight(D1) eq 1 and Dimension(D1 meet HermitianDual(D1)) eq 0;
assert Length(D2) eq 12 and Dimension(D2) eq 9;
assert MinimumWeight(D2) eq 3 and Dimension(D2 meet HermitianDual(D2)) eq 1;
DomainPolys:=[P!(1)];
ImagePolys:=[P!(w+x+x^2),P!(w^2+w*x+x^2),P!(w^2+w*x),P!(x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,3);W2:=ZeroMatrix(F,0,12);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,1)) eq QCShift(phi(u),4);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,9,15,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,w,w^2,w^2,w^2,F!0,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!0,w^2,w^2,F!1,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,F!1,w,w^2,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w,F!0,F!1,w,w^2,F!1,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w,w,F!0,F!1,w,w,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!1,w,F!1,w,w^2,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w,F!1,F!1,w^2,w,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w^2,w^2,w,w,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,w^2,F!0,w^2,w,w]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 15 and Dimension(Hout) eq 4;
assert Dimension(Cout)-Dimension(Hout) eq 5 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 2;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SX03",lo,hi;
assert lo eq 5 and hi eq 5;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 5};
QCExamples["SX03"]:=rec<QCFormat|Id:="SX03",Ingredients:=<D1,D2>,
IngredientLabels:=<"D3_1","D3_2">,
IngredientParameters:=<[3,3,1,0],[12,9,3,1]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[15,5,5,2],OutputHull:=4,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[119]>;
for PaperNo in QCExamples["SX03"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SX03";
end for;
print "VERIFIED QC-X4 SX03";

// SX04: D4_1, D4_2; lambda=3.
InputPolys1:=[[P!(1)]];
InputPolys2:=[[P!(1),P!(0),P!(0),P!(w+w*x),P!(w^2*x+w^2*x^2)],[P!(0),P!(1),P!(0),P!(w^2+w*x+x^2),P!(w^2+w^2*x+x^2)],[P!(0),P!(0),P!(1),P!(x+x^2),P!(1)],[P!(0),P!(0),P!(0),P!(1+x+x^2),P!(1+x+x^2)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 3 and Dimension(D1) eq 3;
assert MinimumWeight(D1) eq 1 and Dimension(D1 meet HermitianDual(D1)) eq 0;
assert Length(D2) eq 15 and Dimension(D2) eq 10;
assert MinimumWeight(D2) eq 3 and Dimension(D2 meet HermitianDual(D2)) eq 4;
DomainPolys:=[P!(1)];
ImagePolys:=[P!(1+w*x+w*x^2),P!(w*x^2),P!(w+x^2),P!(1+w*x+x^2),P!(1+w*x)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,3);W2:=ZeroMatrix(F,0,15);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,1)) eq QCShift(phi(u),5);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,10,18,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,w,w^2,w^2,F!0,F!0,F!0,w,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!1,F!1,F!1,w,F!1,w^2,w,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,w^2,F!1,w,w^2,F!1,F!0,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w,w^2,F!1,w^2,F!0,w^2,F!1,w,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w,w,F!0,F!1,F!1,w,w^2,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w^2,w,F!0,w,F!1,F!1,F!1,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w^2,w^2,F!1,F!1,F!1,w,w,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w,w,F!1,w,F!1,F!0,F!1,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w^2,w^2,F!0,F!1,F!0,F!1,w^2,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,F!0,w^2,F!1,F!1,w^2,F!1,w]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 18 and Dimension(Hout) eq 7;
assert Dimension(Cout)-Dimension(Hout) eq 3 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 1;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SX04",lo,hi;
assert lo eq 6 and hi eq 6;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 6};
QCExamples["SX04"]:=rec<QCFormat|Id:="SX04",Ingredients:=<D1,D2>,
IngredientLabels:=<"D4_1","D4_2">,
IngredientParameters:=<[3,3,1,0],[15,10,3,4]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[18,3,6,1],OutputHull:=7,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[120]>;
for PaperNo in QCExamples["SX04"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SX04";
end for;
print "VERIFIED QC-X4 SX04";

// SX05: D5_1, D5_2; lambda=3.
InputPolys1:=[[P!(1)]];
InputPolys2:=[[P!(1),P!(0),P!(w+w*x+w*x^2),P!(w+w^2*x+w^2*x^2),P!(w^2+x)],[P!(0),P!(1),P!(w^2+w^2*x+w^2*x^2),P!(1+w^2*x+x^2),P!(w+w^2*x^2)],[P!(0),P!(0),P!(x+x^2),P!(w^2+w*x+x^2),P!(w^2+w^2*x^2)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 3 and Dimension(D1) eq 3;
assert MinimumWeight(D1) eq 1 and Dimension(D1 meet HermitianDual(D1)) eq 0;
assert Length(D2) eq 15 and Dimension(D2) eq 8;
assert MinimumWeight(D2) eq 4 and Dimension(D2 meet HermitianDual(D2)) eq 1;
DomainPolys:=[P!(1)];
ImagePolys:=[P!(w*x+w^2*x^2),P!(w^2+x+x^2),P!(w^2+x+w*x^2),P!(w+w^2*x+x^2),P!(w*x+w^2*x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,3);W2:=ZeroMatrix(F,0,15);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,1)) eq QCShift(phi(u),5);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,8,18,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!1,w,w,w,w,w^2,w^2,w^2,F!0,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!1,w^2,F!0,F!1,F!1,F!1,F!0,w^2,w,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,w^2,w,F!1,w^2,w,w^2,w^2,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!1,F!1,w,F!1,w^2,F!1,F!0,w^2,F!0,F!0,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w^2,F!0,F!0,w,F!1,w,F!0,F!1,w^2,w,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w,w^2,w,F!1,F!0,w,w,w,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,w^2,w^2,w^2,F!0,F!0,w,w,w^2,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,w,F!1,F!1,F!0,w^2,w,F!1,F!1,F!1]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 18 and Dimension(Hout) eq 4;
assert Dimension(Cout)-Dimension(Hout) eq 4 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 6;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SX05",lo,hi;
assert lo eq 7 and hi eq 7;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 7};
QCExamples["SX05"]:=rec<QCFormat|Id:="SX05",Ingredients:=<D1,D2>,
IngredientLabels:=<"D5_1","D5_2">,
IngredientParameters:=<[3,3,1,0],[15,8,4,1]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[18,4,7,6],OutputHull:=4,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[121]>;
for PaperNo in QCExamples["SX05"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SX05";
end for;
print "VERIFIED QC-X4 SX05";

// GQ01: SX06_m3_s0, aux_m3_ell1_l2; lambda=2.
InputPolys1:=[[P!(1+x^2),P!(w*x^2),P!(w*x^2),P!(x+w^2*x^2),P!(w^2*x^2)],[P!(0),P!(1+w*x),P!(x+w*x^2),P!(x+w*x^2),P!(w*x+w^2*x^2)],[P!(w^2*x^2),P!(w^2*x+w*x^2),P!(1+w^2*x+x^2),P!(x),P!(w^2*x)],[P!(w^2*x^2),P!(x+w*x^2),P!(x),P!(1+w^2*x+x^2),P!(w^2*x+w^2*x^2)]];
InputPolys2:=[[P!(1+x+x^2)],[P!(1+w^2*x+w*x^2)]];
m:=3;lambda:=2;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 15 and Dimension(D1) eq 6;
assert MinimumWeight(D1) eq 7 and Dimension(D1 meet HermitianDual(D1)) eq 0;
assert Length(D2) eq 3 and Dimension(D2) eq 2;
assert MinimumWeight(D2) eq 2 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(w*x+w^2*x^2),P!(w^2+x),P!(1+x+x^2),P!(1+w^2*x^2),P!(1+x+x^2)];
ImagePolys:=[P!(w*x+w^2*x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,15);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,5)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,6,18,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,w,w,w^2,w^2,w,w^2,F!0,
F!0,F!1,F!0,F!0,F!0,F!0,w,F!1,F!1,w,F!0,F!0,w,w,w^2,F!1,F!0,w^2,
F!0,F!0,F!1,F!0,F!0,F!0,w^2,w^2,F!1,w^2,w^2,w,F!1,F!0,F!0,w,F!0,F!1,
F!0,F!0,F!0,F!1,F!0,F!0,F!1,F!1,w^2,w^2,w^2,w,F!0,F!1,w^2,w,w,w,
F!0,F!0,F!0,F!0,F!1,F!0,w^2,F!1,F!1,F!0,F!0,w^2,F!1,F!1,F!1,F!1,w^2,w,
F!0,F!0,F!0,F!0,F!0,F!1,w^2,w^2,F!0,F!0,w,w,F!0,F!1,w^2,F!1,w,F!0]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 18 and Dimension(Hout) eq 2;
assert Dimension(Cout)-Dimension(Hout) eq 4 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 10;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE GQ01",lo,hi;
assert lo eq 9 and hi eq 9;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 9};
QCExamples["GQ01"]:=rec<QCFormat|Id:="GQ01",Ingredients:=<D1,D2>,
IngredientLabels:=<"SX06_m3_s0","aux_m3_ell1_l2">,
IngredientParameters:=<[15,6,7,0],[3,2,2,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[18,4,9,10],OutputHull:=2,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[122]>;
for PaperNo in QCExamples["GQ01"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="GQ01";
end for;
print "VERIFIED QC-X4 GQ01";

// SX07: D7_1, D7_2; lambda=3.
InputPolys1:=[[P!(1)]];
InputPolys2:=[[P!(1),P!(0),P!(w+w*x^2),P!(w^2+x+w*x^2),P!(w^2*x+w^2*x^2)],[P!(0),P!(1),P!(w+w^2*x+x^2),P!(0),P!(w+x+w^2*x^2)],[P!(0),P!(0),P!(1+x+x^2),P!(1+w^2*x+w*x^2),P!(w^2+w*x+x^2)],[P!(0),P!(0),P!(0),P!(1+x+x^2),P!(0)],[P!(0),P!(0),P!(0),P!(0),P!(1+x+x^2)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 3 and Dimension(D1) eq 3;
assert MinimumWeight(D1) eq 1 and Dimension(D1 meet HermitianDual(D1)) eq 0;
assert Length(D2) eq 15 and Dimension(D2) eq 10;
assert MinimumWeight(D2) eq 3 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(1)];
ImagePolys:=[P!(w*x+x^2),P!(w+x+x^2),P!(w^2+w*x),P!(w+w*x+w^2*x^2),P!(x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,3);W2:=ZeroMatrix(F,0,15);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,1)) eq QCShift(phi(u),5);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,10,18,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!1,w,w,F!1,w,w^2,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!1,F!1,F!1,w^2,F!0,F!1,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!1,F!0,F!0,w,w,w,F!0,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w,F!0,w,w,w,F!1,w^2,F!0,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w^2,w^2,w^2,w^2,w,F!0,w^2,w^2,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w,F!1,F!0,w^2,F!1,F!1,F!0,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!1,w^2,F!0,F!1,w,F!0,F!1,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w^2,F!1,F!1,w^2,F!1,F!0,F!0,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w^2,w,w,w,F!0,F!1,w^2,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,F!0,w^2,F!1,F!0,F!0,w^2,w]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 18 and Dimension(Hout) eq 3;
assert Dimension(Cout)-Dimension(Hout) eq 7 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 5;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SX07",lo,hi;
assert lo eq 6 and hi eq 6;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 6};
QCExamples["SX07"]:=rec<QCFormat|Id:="SX07",Ingredients:=<D1,D2>,
IngredientLabels:=<"D7_1","D7_2">,
IngredientParameters:=<[3,3,1,0],[15,10,3,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[18,7,6,5],OutputHull:=3,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[123]>;
for PaperNo in QCExamples["SX07"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SX07";
end for;
print "VERIFIED QC-X4 SX07";

// GQ02: I0_m3_snone, aux_m3_ell1_l2; lambda=2.
InputPolys1:=[[P!(1+w*x^2),P!(x^2),P!(w^2*x+x^2),P!(0),P!(w*x+x^2),P!(w*x)],[P!(x^2),P!(1+w^2*x^2),P!(w^2*x),P!(w*x^2),P!(w*x+x^2),P!(x^2)],[P!(w*x^2),P!(w^2*x^2),P!(1+w^2*x+w^2*x^2),P!(w^2*x+w^2*x^2),P!(w*x),P!(w^2*x+w*x^2)],[P!(x^2),P!(w*x^2),P!(w^2*x),P!(1+w^2*x+w^2*x^2),P!(w*x+w*x^2),P!(x+w^2*x^2)]];
InputPolys2:=[[P!(1+w^2*x+w*x^2)],[P!(1+w*x+w^2*x^2)]];
m:=3;lambda:=2;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 18 and Dimension(D1) eq 8;
assert MinimumWeight(D1) eq 8 and Dimension(D1 meet HermitianDual(D1)) eq 1;
assert Length(D2) eq 3 and Dimension(D2) eq 2;
assert MinimumWeight(D2) eq 2 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(1+w^2*x+w*x^2),P!(x+x^2),P!(w+x+w^2*x^2),P!(w*x+w*x^2),P!(w+w^2*x+x^2),P!(1+w^2*x+w*x^2)];
ImagePolys:=[P!(x+x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,18);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,6)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,8,21,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,w,w,w,F!1,F!1,F!0,F!1,F!0,F!1,w^2,w,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,w,F!0,F!1,w^2,F!0,w,F!1,F!1,w^2,w,F!1,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w^2,w^2,w,w^2,w,w^2,w^2,w^2,F!0,w,F!0,F!0,F!0,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w^2,w^2,w,F!1,F!1,w,F!0,w^2,w,w^2,w^2,F!1,w,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w,w,w,F!1,F!0,F!0,w,w^2,w,F!0,w,w^2,F!1,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!1,F!0,F!1,F!1,F!1,w,w,F!1,F!1,w,F!1,w,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w^2,F!1,F!1,F!1,F!0,w,F!0,w,w^2,F!1,F!1,F!1,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,w^2,w^2,F!0,w,w,w,w,F!0,F!0,F!0,w,w]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 21 and Dimension(Hout) eq 3;
assert Dimension(Cout)-Dimension(Hout) eq 5 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 10;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE GQ02",lo,hi;
assert lo eq 9 and hi eq 9;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 9};
QCExamples["GQ02"]:=rec<QCFormat|Id:="GQ02",Ingredients:=<D1,D2>,
IngredientLabels:=<"I0_m3_snone","aux_m3_ell1_l2">,
IngredientParameters:=<[18,8,8,1],[3,2,2,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[21,5,9,10],OutputHull:=3,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[124]>;
for PaperNo in QCExamples["GQ02"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="GQ02";
end for;
print "VERIFIED QC-X4 GQ02";

// SX08: D8_1, D8_2; lambda=3.
InputPolys1:=[[P!(1)]];
InputPolys2:=[[P!(1),P!(0),P!(0),P!(0),P!(1+w*x^2),P!(w^2*x+w^2*x^2)],[P!(0),P!(1),P!(0),P!(0),P!(x+w^2*x^2),P!(w+x+w^2*x^2)],[P!(0),P!(0),P!(1),P!(0),P!(w^2*x+w*x^2),P!(w^2+w^2*x)],[P!(0),P!(0),P!(0),P!(1),P!(w^2+x+w*x^2),P!(x+x^2)],[P!(0),P!(0),P!(0),P!(0),P!(1+w^2*x+w*x^2),P!(w^2+w*x^2)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 3 and Dimension(D1) eq 3;
assert MinimumWeight(D1) eq 1 and Dimension(D1 meet HermitianDual(D1)) eq 0;
assert Length(D2) eq 18 and Dimension(D2) eq 14;
assert MinimumWeight(D2) eq 3 and Dimension(D2 meet HermitianDual(D2)) eq 2;
DomainPolys:=[P!(1)];
ImagePolys:=[P!(1+w^2*x^2),P!(w^2+w^2*x^2),P!(w^2),P!(1+w^2*x+w^2*x^2),P!(w^2+x^2),P!(w*x)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,3);W2:=ZeroMatrix(F,0,18);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,1)) eq QCShift(phi(u),6);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,14,21,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,w,w^2,w^2,w^2,w^2,w,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,w^2,F!0,w^2,F!0,F!0,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,F!0,w,F!1,F!0,w^2,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,F!0,w,F!1,w,F!0,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,w^2,w^2,w,F!0,w^2,w^2,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,F!0,F!0,w,w^2,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!1,w^2,F!0,F!1,w,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,F!1,w^2,w,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w,F!0,w^2,w^2,w,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w,F!1,F!1,F!0,w,w,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w^2,F!1,F!1,F!1,F!0,w,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!1,w^2,w,F!1,F!0,F!1,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,w,w^2,F!1,F!1,F!1,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,w^2,w^2,F!0,F!0,w,w^2]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 21 and Dimension(Hout) eq 5;
assert Dimension(Cout)-Dimension(Hout) eq 9 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 2;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SX08",lo,hi;
assert lo eq 5 and hi eq 5;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 5};
QCExamples["SX08"]:=rec<QCFormat|Id:="SX08",Ingredients:=<D1,D2>,
IngredientLabels:=<"D8_1","D8_2">,
IngredientParameters:=<[3,3,1,0],[18,14,3,2]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[21,9,5,2],OutputHull:=5,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[125]>;
for PaperNo in QCExamples["SX08"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SX08";
end for;
print "VERIFIED QC-X4 SX08";

// SQ01: I55_m3_p0_1, aux_m3_ell1_l3; lambda=3.
InputPolys1:=[[P!(1+w*x^2),P!(w^2*x^2),P!(x+x^2),P!(x+w*x^2),P!(w*x),P!(x),P!(x+w*x^2)],[P!(w*x^2),P!(1+w*x^2),P!(x^2),P!(w^2*x+x^2),P!(w*x+w*x^2),P!(x+x^2),P!(0)],[P!(x^2),P!(0),P!(1+w*x),P!(w^2*x),P!(x+x^2),P!(w*x),P!(w*x+x^2)],[P!(x^2),P!(x^2),P!(x),P!(1+x^2),P!(w*x^2),P!(x+x^2),P!(w*x+w^2*x^2)]];
InputPolys2:=[[P!(1+x+x^2)],[P!(1+w^2*x+w*x^2)],[P!(w+w^2*x+x^2)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 21 and Dimension(D1) eq 9;
assert MinimumWeight(D1) eq 8 and Dimension(D1 meet HermitianDual(D1)) eq 2;
assert Length(D2) eq 3 and Dimension(D2) eq 3;
assert MinimumWeight(D2) eq 1 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(w*x+w^2*x^2),P!(1+x+x^2),P!(w^2*x+w*x^2),P!(w^2+w^2*x^2),P!(x+w^2*x^2),P!(w^2*x+w^2*x^2),P!(w^2+w*x)];
ImagePolys:=[P!(w+x+w*x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,21);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,7)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,9,24,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,w,F!1,F!1,w,w^2,F!1,w,F!0,F!0,w,w^2,F!0,F!1,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,w,F!1,F!0,w,w,F!1,F!1,w,F!1,F!0,w^2,F!0,w^2,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w,w^2,F!1,w,w,F!1,F!0,F!0,F!0,F!1,F!0,F!1,F!1,w,w,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!1,w,F!1,F!1,F!0,F!1,w,F!1,w^2,F!0,F!0,F!1,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w^2,w^2,w^2,w^2,F!0,F!0,w^2,F!0,w^2,F!1,F!1,F!1,F!0,w,F!1,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w^2,w^2,w,F!1,F!0,F!0,F!1,w^2,w,w,F!1,w,w,F!1,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w^2,w,F!1,w,F!1,w,F!0,w^2,w,F!0,w^2,F!1,F!1,w^2,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w^2,F!0,F!1,w,F!1,w,w,F!1,F!0,F!1,F!1,F!0,F!1,F!0,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,w,w,w^2,w,F!0,w^2,w^2,F!0,w,F!1,F!1,F!0,w^2,w]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 24 and Dimension(Hout) eq 5;
assert Dimension(Cout)-Dimension(Hout) eq 4 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 10;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SQ01",lo,hi;
assert lo eq 10 and hi eq 10;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 10};
QCExamples["SQ01"]:=rec<QCFormat|Id:="SQ01",Ingredients:=<D1,D2>,
IngredientLabels:=<"I55_m3_p0_1","aux_m3_ell1_l3">,
IngredientParameters:=<[21,9,8,2],[3,3,1,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[24,4,10,10],OutputHull:=5,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[126]>;
for PaperNo in QCExamples["SQ01"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SQ01";
end for;
print "VERIFIED QC-X4 SQ01";

// SQ02: I3_m3_p4, aux_m3_ell1_l3; lambda=3.
InputPolys1:=[[P!(1),P!(w^2*x^2),P!(w^2*x+w^2*x^2),P!(w*x^2),P!(w*x^2),P!(x+x^2),P!(w*x+w*x^2)],[P!(x^2),P!(1),P!(x+w*x^2),P!(w^2*x^2),P!(w^2*x+w*x^2),P!(w*x+x^2),P!(w*x^2)],[P!(0),P!(w^2*x^2),P!(1+w^2*x),P!(x^2),P!(w^2*x+w^2*x^2),P!(w^2*x),P!(w^2*x)],[P!(x^2),P!(w*x^2),P!(w^2*x),P!(1+x^2),P!(x+w^2*x^2),P!(w*x+w^2*x^2),P!(w^2*x+w*x^2)]];
InputPolys2:=[[P!(1+x+x^2)],[P!(1+w^2*x+w*x^2)],[P!(1+w*x+w^2*x^2)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 21 and Dimension(D1) eq 10;
assert MinimumWeight(D1) eq 7 and Dimension(D1 meet HermitianDual(D1)) eq 2;
assert Length(D2) eq 3 and Dimension(D2) eq 3;
assert MinimumWeight(D2) eq 1 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(w^2+w*x+x^2),P!(w^2*x+w*x^2),P!(w+w^2*x+x^2),P!(1+x+x^2),P!(w^2+w*x^2),P!(w^2*x),P!(1+x+x^2)];
ImagePolys:=[P!(1)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,21);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,7)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,10,24,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!0,F!1,w,F!0,w^2,w^2,w,w,F!1,w,w^2,w^2,w^2,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w^2,w,F!0,F!1,F!0,w,w^2,w,F!1,w,w,w,F!0,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,w^2,w^2,w^2,F!0,w^2,F!0,F!1,w^2,F!0,F!0,F!1,F!1,F!0,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!1,w,w^2,F!1,w,F!0,F!1,w^2,w^2,w,F!1,F!0,w,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w,F!0,F!1,F!1,F!1,w^2,w^2,w^2,F!1,w,F!1,F!0,F!0,F!0,F!1,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w^2,F!0,w,F!0,w,w^2,w^2,F!0,w^2,w^2,F!0,w^2,F!0,F!0,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w^2,F!0,w^2,w,F!0,w^2,w,w^2,F!1,w,w,F!1,w^2,F!1,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,F!0,w^2,F!1,w^2,w,F!0,w,F!0,F!1,w,F!1,w,w^2,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,F!0,w^2,F!0,F!1,F!0,w,w,F!0,F!1,F!0,w,w^2,F!1,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,F!0,w^2,w,w,F!0,F!1,w^2,w,F!0,w,w^2,w^2]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 24 and Dimension(Hout) eq 5;
assert Dimension(Cout)-Dimension(Hout) eq 5 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 9;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SQ02",lo,hi;
assert lo eq 9 and hi eq 9;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 9};
QCExamples["SQ02"]:=rec<QCFormat|Id:="SQ02",Ingredients:=<D1,D2>,
IngredientLabels:=<"I3_m3_p4","aux_m3_ell1_l3">,
IngredientParameters:=<[21,10,7,2],[3,3,1,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[24,5,9,9],OutputHull:=5,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[127]>;
for PaperNo in QCExamples["SQ02"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SQ02";
end for;
print "VERIFIED QC-X4 SQ02";

// SQ03: I3_m3_p0, aux_m3_ell1_l3; lambda=3.
InputPolys1:=[[P!(1),P!(0),P!(w^2*x^2),P!(w^2*x^2),P!(w^2*x^2),P!(w^2*x+w^2*x^2),P!(w^2*x+w^2*x^2)],[P!(0),P!(1+w^2*x^2),P!(w^2*x^2),P!(w*x),P!(w^2*x+x^2),P!(w*x+x^2),P!(x+w*x^2)],[P!(w^2*x^2),P!(w*x^2),P!(1+w*x^2),P!(w^2*x+w^2*x^2),P!(w*x^2),P!(w*x+w*x^2),P!(x+w^2*x^2)],[P!(w*x^2),P!(x^2),P!(x^2),P!(1+w*x+w^2*x^2),P!(x+w^2*x^2),P!(x),P!(w^2*x^2)]];
InputPolys2:=[[P!(1+x+x^2)],[P!(1+w^2*x+w*x^2)],[P!(w^2+x+w*x^2)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 21 and Dimension(D1) eq 10;
assert MinimumWeight(D1) eq 7 and Dimension(D1 meet HermitianDual(D1)) eq 1;
assert Length(D2) eq 3 and Dimension(D2) eq 3;
assert MinimumWeight(D2) eq 1 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(1+w^2*x+w*x^2),P!(1+x+x^2),P!(w^2+w^2*x),P!(w^2+x+w^2*x^2),P!(x+w*x^2),P!(w+w^2*x^2),P!(x+w*x^2)];
ImagePolys:=[P!(w^2+w^2*x+x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,21);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,7)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,10,24,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,w^2,F!0,F!0,w^2,w^2,w^2,w^2,w^2,F!0,F!0,w,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,w^2,w,F!1,F!0,w^2,w^2,F!0,F!1,F!1,w,F!0,F!1,F!0,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,w,F!1,w^2,w,w,w^2,w,w,w^2,w,w^2,w^2,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w,F!1,F!1,F!0,w,F!1,F!1,w^2,w^2,F!0,w^2,w^2,F!0,F!1,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,F!0,F!1,F!1,F!0,w,w^2,w,F!1,w,F!1,w^2,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w,F!1,w,F!0,F!1,F!0,w,F!1,w^2,F!1,w^2,w,w,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w,F!1,F!1,w,w,w,F!1,F!1,F!1,w^2,w,F!0,w^2,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w^2,F!0,F!1,w,w,F!0,F!0,F!1,F!0,w,w^2,F!1,w,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w,F!0,w,w^2,F!1,F!1,w^2,F!1,w^2,w,w^2,F!1,w^2,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,F!1,w,w^2,F!1,w,w^2,F!0,w,w,F!1,w,w,F!1]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 24 and Dimension(Hout) eq 4;
assert Dimension(Cout)-Dimension(Hout) eq 6 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 10;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SQ03",lo,hi;
assert lo eq 9 and hi eq 9;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 9};
QCExamples["SQ03"]:=rec<QCFormat|Id:="SQ03",Ingredients:=<D1,D2>,
IngredientLabels:=<"I3_m3_p0","aux_m3_ell1_l3">,
IngredientParameters:=<[21,10,7,1],[3,3,1,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[24,6,9,10],OutputHull:=4,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[128]>;
for PaperNo in QCExamples["SQ03"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SQ03";
end for;
print "VERIFIED QC-X4 SQ03";

// SQ04: I8_m3_p0_6, aux_m3_ell1_l3; lambda=3.
InputPolys1:=[[P!(1+w^2*x^2),P!(w*x^2),P!(x^2),P!(0),P!(w*x^2),P!(w*x+x^2),P!(w^2*x+w*x^2),P!(w*x)],[P!(w^2*x^2),P!(1+w^2*x^2),P!(0),P!(w*x),P!(w^2*x^2),P!(x+w*x^2),P!(w*x^2),P!(w*x+w^2*x^2)],[P!(w*x^2),P!(x^2),P!(1+x^2),P!(w^2*x+w*x^2),P!(0),P!(w^2*x+w^2*x^2),P!(x+x^2),P!(w^2*x+x^2)],[P!(w*x^2),P!(w^2*x^2),P!(w^2*x^2),P!(1+x+w*x^2),P!(w*x^2),P!(0),P!(0),P!(w*x)],[P!(0),P!(w*x^2),P!(w^2*x^2),P!(w*x+x^2),P!(w^2*x^2),P!(1+x+w*x^2),P!(x+x^2),P!(w^2*x+x^2)]];
InputPolys2:=[[P!(1+x+x^2)],[P!(1+w^2*x+w*x^2)],[P!(1+w*x+w^2*x^2)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 24 and Dimension(D1) eq 12;
assert MinimumWeight(D1) eq 6 and Dimension(D1 meet HermitianDual(D1)) eq 3;
assert Length(D2) eq 3 and Dimension(D2) eq 3;
assert MinimumWeight(D2) eq 1 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(w^2+x),P!(w^2+w*x+x^2),P!(w+w^2*x+w^2*x^2),P!(w^2+w*x+w*x^2),P!(1+x^2),P!(1+x^2),P!(w+w*x+w*x^2),P!(w^2*x)];
ImagePolys:=[P!(1)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,24);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,8)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,12,27,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,w^2,w,w^2,w,F!1,F!0,w,F!1,w,F!0,F!1,F!1,w,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!0,F!1,F!0,w,w^2,w^2,F!0,F!0,w^2,w,w,w^2,w^2,w,w^2,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,w^2,F!1,w^2,w,F!1,F!1,w,F!0,w^2,F!1,F!1,F!1,F!0,F!1,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w,w,w^2,w^2,w,w,F!0,F!0,F!0,w^2,F!1,F!1,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,w,w^2,w,F!0,w,F!1,w^2,w^2,w,w,F!1,w^2,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w,F!0,F!1,F!1,w^2,F!0,w,w^2,F!1,w^2,w,F!1,F!1,F!0,w,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!1,F!0,F!0,F!1,w,w^2,w,w,w^2,F!0,F!1,w,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w,F!0,F!0,w^2,w^2,F!0,w,w^2,F!1,w^2,w^2,w,w,w^2,F!0,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w^2,w,F!1,F!0,w,w,F!1,w,F!1,F!1,F!0,F!0,w,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,F!0,w^2,w^2,w,w,w,w^2,w^2,F!0,w^2,F!0,w,w^2,w,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,F!0,w,F!1,F!0,w^2,w,F!1,w^2,F!0,F!0,w^2,F!0,w,F!0,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,w,F!0,w^2,w,F!0,w,F!0,w^2,w,F!1,F!0,F!1,w]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 27 and Dimension(Hout) eq 6;
assert Dimension(Cout)-Dimension(Hout) eq 6 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 9;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SQ04",lo,hi;
assert lo eq 9 and hi eq 9;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 9};
QCExamples["SQ04"]:=rec<QCFormat|Id:="SQ04",Ingredients:=<D1,D2>,
IngredientLabels:=<"I8_m3_p0_6","aux_m3_ell1_l3">,
IngredientParameters:=<[24,12,6,3],[3,3,1,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[27,6,9,9],OutputHull:=6,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[129]>;
for PaperNo in QCExamples["SQ04"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SQ04";
end for;
print "VERIFIED QC-X4 SQ04";

// SQ05: I96_m3_p0_2, aux_m3_ell1_l2; lambda=2.
InputPolys1:=[[P!(1),P!(0),P!(w^2*x+x^2),P!(x^2),P!(w*x),P!(x+x^2),P!(w*x),P!(w^2*x+w*x^2)],[P!(x^2),P!(1+x^2),P!(x+w^2*x^2),P!(x^2),P!(w*x^2),P!(x+x^2),P!(w*x^2),P!(x^2)],[P!(x^2),P!(w^2*x^2),P!(1+w*x+w^2*x^2),P!(x^2),P!(w*x^2),P!(w*x^2),P!(w*x+w^2*x^2),P!(w^2*x+w^2*x^2)],[P!(0),P!(x^2),P!(w^2*x+w*x^2),P!(1+x^2),P!(w*x^2),P!(w*x+w^2*x^2),P!(w^2*x+w*x^2),P!(x+w^2*x^2)],[P!(w*x^2),P!(0),P!(x+w^2*x^2),P!(x^2),P!(x+w*x^2),P!(x^2),P!(1+w^2*x+w^2*x^2),P!(w*x^2)]];
InputPolys2:=[[P!(1+x+x^2)],[P!(1+w^2*x+w*x^2)]];
m:=3;lambda:=2;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 24 and Dimension(D1) eq 11;
assert MinimumWeight(D1) eq 8 and Dimension(D1 meet HermitianDual(D1)) eq 1;
assert Length(D2) eq 3 and Dimension(D2) eq 2;
assert MinimumWeight(D2) eq 2 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(w^2+w^2*x+w^2*x^2),P!(1+w^2*x+w*x^2),P!(1+w^2*x+w*x^2),P!(w+w^2*x),P!(1+w*x),P!(w+w^2*x),P!(w^2+w*x+x^2),P!(x+w*x^2)];
ImagePolys:=[P!(w*x+w^2*x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,24);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,8)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,11,27,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,w,F!1,w,w^2,F!0,F!0,F!1,F!1,F!0,F!1,F!0,w,F!0,w^2,F!1,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!1,F!0,F!0,F!1,F!1,w^2,F!1,w,F!1,w,F!1,w^2,F!1,F!0,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!0,F!0,F!0,w,w^2,F!1,w^2,w^2,F!1,w,w,w^2,w^2,w^2,F!1,F!0,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!0,w,w^2,F!1,F!0,F!1,w,F!1,w,w^2,w,w^2,F!0,w,w^2,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,w^2,w,F!1,F!1,w,w,w,w^2,w^2,F!0,F!0,F!0,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w^2,F!0,F!0,F!1,w^2,F!0,w^2,w,w^2,w^2,F!1,F!1,F!0,F!0,F!0,w,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!1,F!0,F!1,F!0,w^2,F!0,w,F!0,w^2,F!1,w,F!1,w^2,w,w,w^2,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w,F!0,F!1,w^2,w,w,F!1,w,F!0,w,w^2,w^2,F!0,F!1,w,F!1,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,F!0,w,w,F!1,F!1,F!0,w^2,F!1,F!0,w,F!0,w^2,F!1,F!1,w^2,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,F!0,w^2,F!0,w,w^2,F!0,F!0,w^2,w,w^2,F!0,w,F!1,F!0,w,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,w,F!0,F!0,w,w^2,w,F!0,w,w^2,w,w^2,w^2,w,F!1]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 27 and Dimension(Hout) eq 3;
assert Dimension(Cout)-Dimension(Hout) eq 8 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 13;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SQ05",lo,hi;
assert lo eq 9 and hi eq 9;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 9};
QCExamples["SQ05"]:=rec<QCFormat|Id:="SQ05",Ingredients:=<D1,D2>,
IngredientLabels:=<"I96_m3_p0_2","aux_m3_ell1_l2">,
IngredientParameters:=<[24,11,8,1],[3,2,2,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[27,8,9,13],OutputHull:=3,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[130]>;
for PaperNo in QCExamples["SQ05"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SQ05";
end for;
print "VERIFIED QC-X4 SQ05";

// RQ02: I66_m3_s0_1, aux_m3_ell1_l1; lambda=1.
InputPolys1:=[[P!(1+x^2),P!(x^2),P!(w*x^2),P!(w^2*x+w^2*x^2),P!(w^2*x^2),P!(x+w^2*x^2),P!(w^2*x+x^2),P!(w*x)],[P!(0),P!(1+x^2),P!(w*x+w^2*x^2),P!(x+w^2*x^2),P!(x+w*x^2),P!(w*x^2),P!(w*x+w^2*x^2),P!(w^2*x+w^2*x^2)],[P!(w^2*x^2),P!(w^2*x^2),P!(1+x+w^2*x^2),P!(x+x^2),P!(w*x^2),P!(x+x^2),P!(w*x+w*x^2),P!(w*x+w^2*x^2)],[P!(w^2*x^2),P!(w*x^2),P!(x+w*x^2),P!(1+w*x+x^2),P!(w^2*x+w*x^2),P!(w^2*x+w^2*x^2),P!(w^2*x+w*x^2),P!(x+w^2*x^2)]];
InputPolys2:=[[P!(1+x+x^2)]];
m:=3;lambda:=1;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 24 and Dimension(D1) eq 10;
assert MinimumWeight(D1) eq 9 and Dimension(D1 meet HermitianDual(D1)) eq 1;
assert Length(D2) eq 3 and Dimension(D2) eq 1;
assert MinimumWeight(D2) eq 3 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(1+x+x^2),P!(0),P!(0),P!(1+x+x^2),P!(w+w*x+w*x^2),P!(w^2+w^2*x+w^2*x^2),P!(1+x+x^2),P!(0)];
ImagePolys:=[P!(1+x+x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,24);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,8)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,10,27,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!1,w^2,w,F!1,F!1,w,w^2,w^2,w^2,F!1,F!0,w^2,w^2,w^2,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!1,F!1,F!0,w,w^2,F!0,F!1,w^2,w^2,w,w,w^2,w^2,w,w,w,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,F!0,F!1,w,w,w^2,w^2,w^2,F!1,w,F!1,w,w^2,w,w,w,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,w^2,w^2,w^2,F!1,w^2,w,w,F!1,w,w^2,w,w^2,w^2,w^2,w^2,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w,F!1,w,F!0,F!1,w,F!1,w^2,F!1,F!1,F!0,w^2,F!1,F!1,w,w,w,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!1,w^2,w^2,w^2,F!0,w^2,w,F!1,F!0,w^2,w,w^2,F!0,w,w^2,w^2,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!1,w,w,w^2,F!1,F!0,w,F!0,w,w^2,F!1,F!1,w^2,w,F!1,F!1,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w^2,w^2,F!1,w,w,F!1,w,F!0,F!1,F!1,F!0,w^2,F!1,w^2,w,w,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w,w,F!0,w,w,w,F!1,F!0,F!0,w^2,F!1,w^2,w,F!1,F!1,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,w^2,w^2,w^2,F!1,F!0,F!1,F!1,w,F!0,w^2,w,w,w,w^2,w^2,w^2]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 27 and Dimension(Hout) eq 2;
assert Dimension(Cout)-Dimension(Hout) eq 8 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 15;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE RQ02",lo,hi;
assert lo eq 9 and hi eq 9;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 9};
QCExamples["RQ02"]:=rec<QCFormat|Id:="RQ02",Ingredients:=<D1,D2>,
IngredientLabels:=<"I66_m3_s0_1","aux_m3_ell1_l1">,
IngredientParameters:=<[24,10,9,1],[3,1,3,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[27,8,9,15],OutputHull:=2,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[131]>;
for PaperNo in QCExamples["RQ02"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="RQ02";
end for;
print "VERIFIED QC-X4 RQ02";

// SQ06: I96_m3_p0_2, aux_m3_ell1_l1; lambda=1.
InputPolys1:=[[P!(1),P!(0),P!(w^2*x+x^2),P!(x^2),P!(w*x),P!(x+x^2),P!(w*x),P!(w^2*x+w*x^2)],[P!(x^2),P!(1+x^2),P!(x+w^2*x^2),P!(x^2),P!(w*x^2),P!(x+x^2),P!(w*x^2),P!(x^2)],[P!(x^2),P!(w^2*x^2),P!(1+w*x+w^2*x^2),P!(x^2),P!(w*x^2),P!(w*x^2),P!(w*x+w^2*x^2),P!(w^2*x+w^2*x^2)],[P!(0),P!(x^2),P!(w^2*x+w*x^2),P!(1+x^2),P!(w*x^2),P!(w*x+w^2*x^2),P!(w^2*x+w*x^2),P!(x+w^2*x^2)],[P!(w*x^2),P!(0),P!(x+w^2*x^2),P!(x^2),P!(x+w*x^2),P!(x^2),P!(1+w^2*x+w^2*x^2),P!(w*x^2)]];
InputPolys2:=[[P!(1+w*x+w^2*x^2)]];
m:=3;lambda:=1;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 24 and Dimension(D1) eq 11;
assert MinimumWeight(D1) eq 8 and Dimension(D1 meet HermitianDual(D1)) eq 1;
assert Length(D2) eq 3 and Dimension(D2) eq 1;
assert MinimumWeight(D2) eq 3 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(1+w*x+w^2*x^2),P!(w+w^2*x+x^2),P!(w+w^2*x+x^2),P!(0),P!(w^2+x+w*x^2),P!(w^2+x+w*x^2),P!(w+w^2*x+x^2),P!(w^2+x+w*x^2)];
ImagePolys:=[P!(1+w*x+w^2*x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,24);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,8)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,11,27,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,w,F!1,w,w^2,F!0,F!0,F!1,F!1,F!0,F!1,F!0,w,F!0,F!0,F!0,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!1,F!0,F!0,F!1,F!1,w^2,F!1,w,F!1,w,F!1,w^2,F!1,w,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!0,F!0,F!0,w,w^2,F!1,w^2,w^2,F!1,w,w,w^2,w^2,w^2,F!1,w,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!0,w,w^2,F!1,F!0,F!1,w,F!1,w,w^2,w,w^2,w^2,F!1,w,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,w^2,w,F!1,F!1,w,w,w,w^2,w^2,F!0,F!0,F!0,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w^2,F!0,F!0,F!1,w^2,F!0,w^2,w,w^2,w^2,F!1,F!1,F!0,F!0,w^2,F!1,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!1,F!0,F!1,F!0,w^2,F!0,w,F!0,w^2,F!1,w,F!1,w^2,w,F!1,w,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w,F!0,F!1,w^2,w,w,F!1,w,F!0,w,w^2,w^2,F!0,F!1,F!1,w,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,F!0,w,w,F!1,F!1,F!0,w^2,F!1,F!0,w,F!0,w^2,F!1,F!1,w,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,F!0,w^2,F!0,w,w^2,F!0,F!0,w^2,w,w^2,F!0,w,F!1,F!0,F!0,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,w,F!0,F!0,w,w^2,w,F!0,w,w^2,w,w^2,F!0,F!0,F!0]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 27 and Dimension(Hout) eq 2;
assert Dimension(Cout)-Dimension(Hout) eq 9 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 14;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SQ06",lo,hi;
assert lo eq 9 and hi eq 9;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 9};
QCExamples["SQ06"]:=rec<QCFormat|Id:="SQ06",Ingredients:=<D1,D2>,
IngredientLabels:=<"I96_m3_p0_2","aux_m3_ell1_l1">,
IngredientParameters:=<[24,11,8,1],[3,1,3,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[27,9,9,14],OutputHull:=2,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[132]>;
for PaperNo in QCExamples["SQ06"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SQ06";
end for;
print "VERIFIED QC-X4 SQ06";

// SQ07: I8_m3_p0, aux_m3_ell1_l1; lambda=1.
InputPolys1:=[[P!(1+w*x^2),P!(x^2),P!(w*x+w^2*x^2),P!(w*x+x^2),P!(w*x^2),P!(w^2*x+x^2),P!(x+x^2),P!(x+w^2*x^2),P!(w*x)],[P!(x^2),P!(1+w*x^2),P!(w^2*x+w^2*x^2),P!(x+w*x^2),P!(w^2*x^2),P!(x+w*x^2),P!(w*x^2),P!(w^2*x),P!(w*x+w^2*x^2)],[P!(x^2),P!(w^2*x^2),P!(1+x),P!(w*x+x^2),P!(0),P!(x+w^2*x^2),P!(x+w^2*x^2),P!(w*x^2),P!(w^2*x+x^2)],[P!(w*x^2),P!(w^2*x^2),P!(w^2*x^2),P!(1+x+w*x^2),P!(w*x^2),P!(x+x^2),P!(0),P!(0),P!(w*x)],[P!(w^2*x^2),P!(w*x^2),P!(0),P!(w*x^2),P!(1+x^2),P!(x+x^2),P!(x+w^2*x^2),P!(x+w^2*x^2),P!(w*x+w*x^2)]];
InputPolys2:=[[P!(1+x+x^2)]];
m:=3;lambda:=1;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 27 and Dimension(D1) eq 12;
assert MinimumWeight(D1) eq 9 and Dimension(D1 meet HermitianDual(D1)) eq 3;
assert Length(D2) eq 3 and Dimension(D2) eq 1;
assert MinimumWeight(D2) eq 3 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(w+w*x+w*x^2),P!(0),P!(w+w*x+w*x^2),P!(w^2+w^2*x+w^2*x^2),P!(w+w*x+w*x^2),P!(w^2+w^2*x+w^2*x^2),P!(w^2+w^2*x+w^2*x^2),P!(w+w*x+w*x^2),P!(0)];
ImagePolys:=[P!(1+x+x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,27);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,9)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,12,30,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,w,F!0,w^2,F!1,F!1,w,w,F!1,w^2,F!1,w,F!1,F!1,w^2,F!0,w^2,w^2,w^2,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!1,F!0,F!1,F!0,w^2,w,F!1,w,w^2,w,w^2,w,w,F!0,w^2,F!0,F!0,F!0,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,F!0,F!1,F!1,F!0,w^2,F!1,w^2,F!0,F!1,F!0,w^2,w^2,w,F!1,w^2,w^2,w^2,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,F!0,F!0,w,w,w^2,w^2,w,w,F!1,F!0,F!0,F!0,F!1,F!1,F!1,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,F!1,w,w^2,w,F!0,w,F!1,F!1,w^2,w^2,w,w^2,w^2,w^2,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w,w,F!0,F!1,w^2,w,F!0,F!1,w^2,w,F!1,F!0,F!0,F!0,F!1,F!0,F!1,F!1,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!1,w^2,F!0,w,w^2,F!0,w^2,w^2,F!0,w,w,w^2,F!1,w,w,F!1,F!0,F!0,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w,w^2,F!0,w,w^2,w^2,F!0,F!1,w,F!0,w,w,F!1,w,w,F!0,w,w,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w,F!0,F!0,F!0,w^2,w^2,F!0,w,w^2,F!1,w^2,F!1,w^2,w,w,F!1,F!1,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,F!1,F!0,w,F!1,w^2,F!1,w^2,F!0,w^2,w,w,F!0,F!1,w,F!0,F!0,F!0,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,F!0,F!0,w,F!1,w,w,F!1,F!0,w,F!0,F!0,F!1,w^2,w^2,w,F!0,F!0,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,F!1,w,F!0,w^2,w,F!0,w,F!0,F!0,w^2,w,F!1,w,w,w]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 30 and Dimension(Hout) eq 4;
assert Dimension(Cout)-Dimension(Hout) eq 8 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 14;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SQ07",lo,hi;
assert lo eq 9 and hi eq 9;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 9};
QCExamples["SQ07"]:=rec<QCFormat|Id:="SQ07",Ingredients:=<D1,D2>,
IngredientLabels:=<"I8_m3_p0","aux_m3_ell1_l1">,
IngredientParameters:=<[27,12,9,3],[3,1,3,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[30,8,9,14],OutputHull:=4,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[133]>;
for PaperNo in QCExamples["SQ07"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SQ07";
end for;
print "VERIFIED QC-X4 SQ07";

// SQ08: I12_m3_p0_3, aux_m3_ell1_l2; lambda=2.
InputPolys1:=[[P!(1+w*x),P!(w^2*x+x^2),P!(x+w^2*x^2),P!(w^2*x+x^2),P!(w^2*x),P!(w*x^2),P!(w*x+w^2*x^2),P!(x+w^2*x^2),P!(w^2*x+w*x^2),P!(w+w^2*x+w^2*x^2)],[P!(w^2*x+w^2*x^2),P!(1+x+w*x^2),P!(w*x^2),P!(w*x^2),P!(x),P!(w^2*x),P!(w^2*x+x^2),P!(w*x+w*x^2),P!(x),P!(w*x+w*x^2)],[P!(w*x+w^2*x^2),P!(x+w*x^2),P!(1+x+x^2),P!(w*x+w^2*x^2),P!(x+w*x^2),P!(w^2*x+x^2),P!(w*x+w^2*x^2),P!(x+w*x^2),P!(w^2*x+x^2),P!(w^2*x+x^2)],[P!(w^2*x+x^2),P!(x+w^2*x^2),P!(w^2*x+x^2),P!(1+w*x+x^2),P!(x+x^2),P!(0),P!(x+x^2),P!(x^2),P!(x^2),P!(1)]];
InputPolys2:=[[P!(1+x+x^2)],[P!(1+w^2*x+w*x^2)]];
m:=3;lambda:=2;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 30 and Dimension(D1) eq 9;
assert MinimumWeight(D1) eq 13 and Dimension(D1 meet HermitianDual(D1)) eq 2;
assert Length(D2) eq 3 and Dimension(D2) eq 2;
assert MinimumWeight(D2) eq 2 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(1+w^2*x+w*x^2),P!(w+w^2*x),P!(w^2+x),P!(1+w^2*x^2),P!(w^2+w*x+x^2),P!(w+x+w^2*x^2),P!(0),P!(w^2+w*x+x^2),P!(w+x^2),P!(w^2+x)];
ImagePolys:=[P!(w*x+w^2*x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,30);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,10)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,9,33,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,w,w^2,F!1,w^2,w^2,F!0,w,F!1,w^2,w^2,F!0,F!1,w^2,F!1,F!0,w,w^2,w^2,w,w^2,w^2,F!0,w,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!1,F!0,F!0,F!1,w^2,w^2,w,F!1,w,w^2,w,w,w,F!0,F!0,F!1,w,F!0,w,F!0,F!0,F!0,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!1,F!1,w,F!1,w^2,w,F!1,w^2,w^2,w^2,w,F!1,w^2,w,F!1,w^2,w,F!1,F!1,w,w^2,F!0,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!1,w^2,F!1,w^2,w,F!1,F!0,F!1,F!0,F!0,F!0,F!1,w^2,F!1,F!1,F!1,F!0,F!1,F!1,F!1,F!0,F!0,F!1,w,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w,F!1,w,w,w^2,F!1,F!0,F!1,w,w,w,w,w^2,F!0,F!1,w,F!1,w,F!0,F!1,F!0,F!0,F!0,F!0,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w^2,F!1,F!1,w^2,w,F!1,w^2,w^2,w,w^2,w^2,w^2,w,F!1,F!0,w^2,w^2,F!0,w^2,F!1,w,F!1,F!1,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!1,w,w^2,w,w,w,F!1,F!1,F!1,w,F!0,F!1,w,F!1,F!1,F!1,w^2,F!1,w^2,F!1,w,w,w,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!1,F!1,F!0,F!1,w^2,F!0,w,w,F!0,F!0,w^2,F!0,F!1,w^2,w,w^2,w^2,w^2,w,w,w^2,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w,F!0,w,w^2,w,w^2,w^2,F!0,F!1,w,F!0,w,F!0,F!1,w,w^2,w^2,F!1,F!1,w^2,w^2,w^2,w^2]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 33 and Dimension(Hout) eq 4;
assert Dimension(Cout)-Dimension(Hout) eq 5 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 20;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SQ08",lo,hi;
assert lo eq 14 and hi eq 14;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 14};
QCExamples["SQ08"]:=rec<QCFormat|Id:="SQ08",Ingredients:=<D1,D2>,
IngredientLabels:=<"I12_m3_p0_3","aux_m3_ell1_l2">,
IngredientParameters:=<[30,9,13,2],[3,2,2,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[33,5,14,20],OutputHull:=4,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[134]>;
for PaperNo in QCExamples["SQ08"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SQ08";
end for;
print "VERIFIED QC-X4 SQ08";

// SQ09: I12_m3_p0_3, aux_m3_ell1_l1; lambda=1.
InputPolys1:=[[P!(1+w*x),P!(w^2*x+x^2),P!(x+w^2*x^2),P!(w^2*x+x^2),P!(w^2*x),P!(w*x^2),P!(w*x+w^2*x^2),P!(x+w^2*x^2),P!(w^2*x+w*x^2),P!(w+w^2*x+w^2*x^2)],[P!(w^2*x+w^2*x^2),P!(1+x+w*x^2),P!(w*x^2),P!(w*x^2),P!(x),P!(w^2*x),P!(w^2*x+x^2),P!(w*x+w*x^2),P!(x),P!(w*x+w*x^2)],[P!(w*x+w^2*x^2),P!(x+w*x^2),P!(1+x+x^2),P!(w*x+w^2*x^2),P!(x+w*x^2),P!(w^2*x+x^2),P!(w*x+w^2*x^2),P!(x+w*x^2),P!(w^2*x+x^2),P!(w^2*x+x^2)],[P!(w^2*x+x^2),P!(x+w^2*x^2),P!(w^2*x+x^2),P!(1+w*x+x^2),P!(x+x^2),P!(0),P!(x+x^2),P!(x^2),P!(x^2),P!(1)]];
InputPolys2:=[[P!(1+w^2*x+w*x^2)]];
m:=3;lambda:=1;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 30 and Dimension(D1) eq 9;
assert MinimumWeight(D1) eq 13 and Dimension(D1 meet HermitianDual(D1)) eq 2;
assert Length(D2) eq 3 and Dimension(D2) eq 1;
assert MinimumWeight(D2) eq 3 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(1+w^2*x+w*x^2),P!(w^2+w*x+x^2),P!(1+w^2*x+w*x^2),P!(w^2+w*x+x^2),P!(w^2+w*x+x^2),P!(w+x+w^2*x^2),P!(0),P!(w^2+w*x+x^2),P!(1+w^2*x+w*x^2),P!(1+w^2*x+w*x^2)];
ImagePolys:=[P!(1+w^2*x+w*x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,30);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,10)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,9,33,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,w,w^2,F!1,w^2,w^2,F!0,w,F!1,w^2,w^2,F!0,F!1,w^2,F!1,F!0,w,w^2,w^2,w,w^2,w,F!1,w^2,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!1,F!0,F!0,F!1,w^2,w^2,w,F!1,w,w^2,w,w,w,F!0,F!0,F!1,w,F!0,w,F!0,F!0,F!0,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!1,F!1,w,F!1,w^2,w,F!1,w^2,w^2,w^2,w,F!1,w^2,w,F!1,w^2,w,F!1,F!1,w^2,w,F!1,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!1,w^2,F!1,w^2,w,F!1,F!0,F!1,F!0,F!0,F!0,F!1,w^2,F!1,F!1,F!1,F!0,F!1,F!1,F!1,F!0,w^2,w,F!1,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w,F!1,w,w,w^2,F!1,F!0,F!1,w,w,w,w,w^2,F!0,F!1,w,F!1,w,F!0,F!1,F!0,F!0,F!0,F!0,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w^2,F!1,F!1,w^2,w,F!1,w^2,w^2,w,w^2,w^2,w^2,w,F!1,F!0,w^2,w^2,F!0,w^2,F!1,w,F!0,F!0,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!1,w,w^2,w,w,w,F!1,F!1,F!1,w,F!0,F!1,w,F!1,F!1,F!1,w^2,F!1,w^2,F!1,w,F!0,F!0,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!1,F!1,F!0,F!1,w^2,F!0,w,w,F!0,F!0,w^2,F!0,F!1,w^2,w,w^2,w^2,w^2,w,w^2,w,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w,F!0,w,w^2,w,w^2,w^2,F!0,F!1,w,F!0,w,F!0,F!1,w,w^2,w^2,F!1,F!1,w^2,F!0,F!0,F!0]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 33 and Dimension(Hout) eq 3;
assert Dimension(Cout)-Dimension(Hout) eq 6 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 21;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SQ09",lo,hi;
assert lo eq 14 and hi eq 14;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 14};
QCExamples["SQ09"]:=rec<QCFormat|Id:="SQ09",Ingredients:=<D1,D2>,
IngredientLabels:=<"I12_m3_p0_3","aux_m3_ell1_l1">,
IngredientParameters:=<[30,9,13,2],[3,1,3,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[33,6,14,21],OutputHull:=3,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[135]>;
for PaperNo in QCExamples["SQ09"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SQ09";
end for;
print "VERIFIED QC-X4 SQ09";

// SQ10: BKLC_B36_8_m3_p0_1, aux_m3_ell1_l2; lambda=2.
InputPolys1:=[[P!(1+w*x^2),P!(x^2),P!(w*x^2),P!(x+w*x^2),P!(w*x),P!(w^2*x^2),P!(w*x+w^2*x^2),P!(w+w*x+w^2*x^2),P!(w^2+w*x),P!(1+x+w*x^2)],[P!(w^2*x^2),P!(1+w^2*x+w^2*x^2),P!(x+w^2*x^2),P!(w*x+x^2),P!(x+w^2*x^2),P!(w*x+x^2),P!(x^2),P!(1+x+w^2*x^2),P!(w*x+w^2*x^2),P!(w^2*x+x^2)],[P!(w^2*x^2),P!(w^2*x),P!(1+w^2*x+w*x^2),P!(x+w*x^2),P!(x^2),P!(w*x+w*x^2),P!(x),P!(1+w*x),P!(w^2*x),P!(w+w^2*x+x^2)],[P!(0),P!(w^2*x+w*x^2),P!(w^2*x+w*x^2),P!(1+x^2),P!(x+w^2*x^2),P!(w*x^2),P!(0),P!(w^2+w^2*x),P!(1+w*x+w*x^2),P!(w*x+w^2*x^2)]];
InputPolys2:=[[P!(1+x+x^2)],[P!(1+w^2*x+w*x^2)]];
m:=3;lambda:=2;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 30 and Dimension(D1) eq 8;
assert MinimumWeight(D1) eq 14 and Dimension(D1 meet HermitianDual(D1)) eq 0;
assert Length(D2) eq 3 and Dimension(D2) eq 2;
assert MinimumWeight(D2) eq 2 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(1+x+x^2),P!(0),P!(1+x+x^2),P!(w*x+w^2*x^2),P!(0),P!(1+w^2*x^2),P!(w+w*x+w*x^2),P!(w*x+w^2*x^2),P!(w+x+w^2*x^2),P!(w+w^2*x)];
ImagePolys:=[P!(w*x+w^2*x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,30);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,10)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,8,33,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,w,w^2,F!1,F!0,F!0,F!0,F!1,w,F!0,w,w,w,F!1,w,F!1,w,w,F!0,w^2,w^2,w^2,F!0,w,w,w,w,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w^2,F!1,w,F!1,w,F!0,F!1,w,w^2,w^2,w^2,w^2,F!1,w^2,F!1,F!1,w^2,w^2,F!1,w^2,F!1,F!0,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!1,F!0,w,F!0,w^2,w^2,F!1,F!0,w,F!1,w,w^2,w^2,w^2,F!0,w,w,F!1,w,F!0,F!0,F!0,F!1,F!1,w^2,w,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,w^2,F!1,F!0,F!0,w^2,w^2,F!0,F!1,F!0,F!0,w^2,w,w,F!0,w,w,F!1,w^2,w,F!0,F!0,w,w^2,w^2,F!0,w,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,w^2,w,w^2,F!0,w,w^2,w^2,F!0,w,w^2,w,F!1,w^2,F!0,w,w^2,w^2,F!1,w,w^2,F!1,w^2,F!0,F!1,w^2,w,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,w^2,F!1,F!1,F!0,F!1,F!1,F!1,w,w^2,F!0,F!0,F!1,F!0,F!0,w^2,w^2,F!1,F!1,F!1,F!0,w^2,w,w^2,w^2,F!1,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w,F!1,w,F!1,w,F!0,F!0,w,w^2,F!1,w,F!0,w^2,F!1,F!0,w^2,F!1,w,w,w^2,F!0,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,F!1,F!0,w,w,F!1,w,w,F!0,w,F!1,w,w^2,w,w^2,F!0,F!1,w,w^2,F!1,w,F!0]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 33 and Dimension(Hout) eq 2;
assert Dimension(Cout)-Dimension(Hout) eq 6 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 23;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SQ10",lo,hi;
assert lo eq 17 and hi eq 17;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 17};
QCExamples["SQ10"]:=rec<QCFormat|Id:="SQ10",Ingredients:=<D1,D2>,
IngredientLabels:=<"BKLC_B36_8_m3_p0_1","aux_m3_ell1_l2">,
IngredientParameters:=<[30,8,14,0],[3,2,2,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[33,6,17,23],OutputHull:=2,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[136]>;
for PaperNo in QCExamples["SQ10"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SQ10";
end for;
print "VERIFIED QC-X4 SQ10";

// GQ03: I15_m3_s0_3, aux_m3_ell1_l3; lambda=3.
InputPolys1:=[[P!(1+w^2*x^2),P!(x^2),P!(w^2*x^2),P!(x+w*x^2),P!(w^2*x+w^2*x^2),P!(w*x^2),P!(x+w*x^2),P!(w*x+w*x^2),P!(w*x+w^2*x^2),P!(w*x)],[P!(0),P!(1+w^2*x^2),P!(0),P!(w^2*x+w^2*x^2),P!(w*x+x^2),P!(w*x^2),P!(w^2*x+w^2*x^2),P!(w*x^2),P!(w^2*x+w^2*x^2),P!(x+w^2*x^2)],[P!(x^2),P!(w^2*x^2),P!(1+x^2),P!(x+w*x^2),P!(w^2*x+x^2),P!(w*x^2),P!(w*x^2),P!(w^2*x),P!(w*x+x^2),P!(w*x+w^2*x^2)],[P!(w^2*x^2),P!(w^2*x^2),P!(w*x^2),P!(1+w^2*x+w*x^2),P!(w*x^2),P!(w^2*x^2),P!(x+w^2*x^2),P!(x),P!(x^2),P!(w*x)],[P!(w^2*x^2),P!(0),P!(0),P!(x),P!(1+w^2*x+w^2*x^2),P!(0),P!(w^2*x+w*x^2),P!(w^2*x+w*x^2),P!(w*x),P!(w^2*x+x^2)],[P!(w^2*x^2),P!(0),P!(0),P!(w*x+x^2),P!(x+w^2*x^2),P!(1+w^2*x^2),P!(x+x^2),P!(w^2*x^2),P!(w*x),P!(w*x+w^2*x^2)],[P!(0),P!(w^2*x^2),P!(w^2*x^2),P!(w^2*x),P!(x+w^2*x^2),P!(x^2),P!(1+w*x),P!(w^2*x+w*x^2),P!(w*x^2),P!(w^2*x+w*x^2)]];
InputPolys2:=[[P!(1+x+x^2)],[P!(1+w^2*x+w*x^2)],[P!(1+w*x+w^2*x^2)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 30 and Dimension(D1) eq 14;
assert MinimumWeight(D1) eq 10 and Dimension(D1 meet HermitianDual(D1)) eq 4;
assert Length(D2) eq 3 and Dimension(D2) eq 3;
assert MinimumWeight(D2) eq 1 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(w+w^2*x^2),P!(x+w*x^2),P!(w+x+w^2*x^2),P!(w+x^2),P!(w+w*x),P!(w^2+w^2*x+w*x^2),P!(1+w*x+w^2*x^2),P!(w^2+x+w^2*x^2),P!(w+x),P!(w^2*x^2)];
ImagePolys:=[P!(1)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,30);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,10)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,14,33,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,F!0,F!1,w,w,w,w^2,F!1,w^2,w,w^2,w,w,w,w^2,F!0,w,w^2,F!0,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,w,F!0,w^2,F!0,w^2,F!1,F!0,w^2,F!0,w^2,F!1,w,w^2,w,w^2,w^2,w^2,F!1,F!1,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,F!0,F!0,w^2,w,w,F!1,w^2,F!1,w,F!1,w,w,F!0,F!1,w^2,w^2,F!1,w,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!0,F!1,F!1,F!0,w,w^2,w^2,w,w,w,w^2,w^2,F!0,F!1,F!0,F!0,w,w,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,F!0,w^2,w^2,w,w^2,w^2,F!0,F!0,F!0,w^2,F!0,w,w,F!0,F!1,F!1,w^2,w,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!1,F!0,F!1,F!0,w,w,w^2,F!0,F!0,F!1,w^2,w^2,F!1,w^2,F!0,w^2,F!0,w,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!1,F!0,w,w^2,F!0,w^2,F!0,w^2,w^2,F!0,w^2,F!1,F!0,w,w,w,F!0,F!0,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w^2,F!1,w^2,F!1,F!1,w,F!0,F!0,F!1,w^2,F!0,w,w,w,w^2,w,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w,w^2,F!0,F!0,F!1,w,F!0,w,w^2,F!1,w^2,F!1,w^2,F!0,F!1,F!1,F!0,w,F!0,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w^2,w^2,F!0,w^2,F!0,F!1,F!0,w,F!1,w^2,F!0,F!0,w,w^2,w^2,F!0,F!0,F!1,w,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w,F!0,F!0,w^2,F!1,F!0,F!0,w^2,F!0,F!1,w^2,w^2,F!0,w,F!1,F!1,w^2,w^2,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,w^2,F!0,w,w^2,F!0,w,w,F!0,w,F!0,F!1,w^2,F!1,F!1,w^2,F!1,F!1,w^2,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w^2,F!0,F!1,F!0,w,F!1,w,F!0,w^2,F!1,w^2,F!1,F!1,w^2,w,F!0,F!1,F!0,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,w,F!0,F!0,w^2,F!1,F!1,w,F!1,w,w^2,w^2,w,F!0,F!0,w^2,F!1]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 33 and Dimension(Hout) eq 7;
assert Dimension(Cout)-Dimension(Hout) eq 7 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 12;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE GQ03",lo,hi;
assert lo eq 11 and hi eq 11;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 11};
QCExamples["GQ03"]:=rec<QCFormat|Id:="GQ03",Ingredients:=<D1,D2>,
IngredientLabels:=<"I15_m3_s0_3","aux_m3_ell1_l3">,
IngredientParameters:=<[30,14,10,4],[3,3,1,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[33,7,11,12],OutputHull:=7,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[137]>;
for PaperNo in QCExamples["GQ03"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="GQ03";
end for;
print "VERIFIED QC-X4 GQ03";

// RQ01: I15_m3_s0_1, aux_m3_ell1_l3; lambda=3.
InputPolys1:=[[P!(1+w^2*x^2),P!(w*x^2),P!(0),P!(w^2*x^2),P!(w*x+w*x^2),P!(w*x+w*x^2),P!(x+w^2*x^2),P!(x),P!(0),P!(x^2)],[P!(0),P!(1+w*x^2),P!(w^2*x^2),P!(0),P!(w^2*x+w^2*x^2),P!(w*x^2),P!(x),P!(0),P!(x+w*x^2),P!(x+x^2)],[P!(x^2),P!(w^2*x^2),P!(1+w^2*x^2),P!(x^2),P!(w^2*x+w*x^2),P!(x+x^2),P!(x+w^2*x^2),P!(w*x+w*x^2),P!(w^2*x+w^2*x^2),P!(0)],[P!(w*x^2),P!(w*x^2),P!(w^2*x^2),P!(1),P!(0),P!(w^2*x+x^2),P!(w*x),P!(w*x+x^2),P!(w^2*x),P!(w^2*x+w*x^2)],[P!(x^2),P!(w^2*x^2),P!(x^2),P!(w*x^2),P!(1+w^2*x+w^2*x^2),P!(w*x+w*x^2),P!(x+x^2),P!(w^2*x+w*x^2),P!(w^2*x+w^2*x^2),P!(x+w*x^2)],[P!(w^2*x^2),P!(w*x^2),P!(w^2*x^2),P!(0),P!(x),P!(w*x+x^2),P!(1),P!(w*x),P!(w^2*x+x^2),P!(w*x)]];
InputPolys2:=[[P!(1+x+x^2)],[P!(1+w^2*x+w*x^2)],[P!(1+w*x+w^2*x^2)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 30 and Dimension(D1) eq 14;
assert MinimumWeight(D1) eq 10 and Dimension(D1 meet HermitianDual(D1)) eq 3;
assert Length(D2) eq 3 and Dimension(D2) eq 3;
assert MinimumWeight(D2) eq 1 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(w*x+w^2*x^2),P!(1+w*x+w^2*x^2),P!(w+x+w^2*x^2),P!(0),P!(w^2+w^2*x),P!(w^2+w*x+w*x^2),P!(1+w*x+w^2*x^2),P!(w^2),P!(w),P!(x^2)];
ImagePolys:=[P!(1)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,30);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,10)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,14,33,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,w,F!1,F!1,F!0,F!0,w^2,w,F!0,w^2,w,w,w^2,F!0,F!0,F!1,w,w,F!1,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!1,F!0,F!1,F!1,F!0,w,w^2,F!0,w^2,w,F!0,F!0,w,F!1,F!1,w^2,w^2,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!1,F!1,w,w^2,F!0,F!1,w^2,w^2,F!1,w,F!1,w^2,w,w^2,F!0,w,F!1,w,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,w,w,w^2,w^2,w,w,w^2,F!0,F!0,F!1,F!0,F!1,F!0,w,w^2,w,w,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,w,F!1,w^2,w^2,F!1,F!1,w^2,F!1,w,w^2,w,F!1,w,w^2,w,F!1,w^2,w,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,F!1,F!0,F!1,F!1,F!1,F!1,w^2,F!0,F!1,w,F!1,F!0,w,w^2,F!1,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,F!0,w,w^2,w,w^2,w,w^2,F!0,F!0,F!1,F!0,F!0,F!1,F!0,w,F!1,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,F!0,w,w^2,F!0,w^2,w,w^2,w,F!0,F!1,F!0,F!0,F!1,F!1,F!1,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w^2,w,w,w^2,F!0,w^2,F!0,F!1,w,w,F!0,w,w,w,w,F!1,F!0,F!0,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w^2,F!1,w,F!0,w,F!1,w,w,F!0,F!1,F!0,w^2,F!1,w^2,w,w,F!1,F!0,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w^2,F!0,w,F!0,F!1,F!0,w^2,w^2,F!1,F!1,w^2,w,w^2,F!0,w^2,w,w^2,w^2,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!1,F!0,F!1,F!0,F!0,w^2,F!0,F!1,F!1,F!1,F!1,w^2,F!1,w,w^2,F!1,w^2,w^2,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w^2,w^2,w,F!1,w,F!1,w^2,F!0,F!0,F!0,F!0,F!0,w^2,F!1,w^2,F!0,w^2,w,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w^2,w^2,w,F!1,w,F!0,w^2,F!0,F!0,F!1,F!0,F!0,w^2,F!1,w^2,w,w,w]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 33 and Dimension(Hout) eq 6;
assert Dimension(Cout)-Dimension(Hout) eq 8 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 13;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE RQ01",lo,hi;
assert lo eq 10 and hi eq 10;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 10};
QCExamples["RQ01"]:=rec<QCFormat|Id:="RQ01",Ingredients:=<D1,D2>,
IngredientLabels:=<"I15_m3_s0_1","aux_m3_ell1_l3">,
IngredientParameters:=<[30,14,10,3],[3,3,1,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[33,8,10,13],OutputHull:=6,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[138]>;
for PaperNo in QCExamples["RQ01"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="RQ01";
end for;
print "VERIFIED QC-X4 RQ01";

// GQ04: I15_m3_s0_6, aux_m3_ell1_l3; lambda=3.
InputPolys1:=[[P!(1+w*x^2),P!(0),P!(w^2*x^2),P!(x+x^2),P!(x^2),P!(w*x+x^2),P!(w*x),P!(w*x+x^2),P!(x+w*x^2),P!(x+w^2*x^2)],[P!(x^2),P!(1+w^2*x^2),P!(w*x^2),P!(w^2*x+w*x^2),P!(0),P!(w*x+x^2),P!(w*x),P!(x+w*x^2),P!(x+x^2),P!(w^2*x+x^2)],[P!(w*x^2),P!(0),P!(1+w*x^2),P!(x),P!(x^2),P!(w^2*x^2),P!(x^2),P!(w^2*x^2),P!(w^2*x),P!(x^2)],[P!(x^2),P!(0),P!(w^2*x^2),P!(1+x+x^2),P!(w*x^2),P!(w*x^2),P!(x+x^2),P!(w*x^2),P!(x+w^2*x^2),P!(x)],[P!(0),P!(w*x^2),P!(w*x^2),P!(w^2*x^2),P!(1),P!(w^2*x+x^2),P!(w*x),P!(w*x+x^2),P!(w^2*x),P!(w^2*x+w*x^2)],[P!(0),P!(0),P!(x^2),P!(w*x+x^2),P!(w^2*x^2),P!(1+x+x^2),P!(w*x+w^2*x^2),P!(w^2*x+w^2*x^2),P!(w^2*x+x^2),P!(w^2*x+w*x^2)]];
InputPolys2:=[[P!(1+x+x^2)],[P!(1+w^2*x+w*x^2)],[P!(1+w*x+w^2*x^2)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 30 and Dimension(D1) eq 14;
assert MinimumWeight(D1) eq 10 and Dimension(D1 meet HermitianDual(D1)) eq 1;
assert Length(D2) eq 3 and Dimension(D2) eq 3;
assert MinimumWeight(D2) eq 1 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(x),P!(1+w*x+x^2),P!(w+w^2*x+x^2),P!(w+x+x^2),P!(0),P!(x+x^2),P!(1+w*x+w^2*x^2),P!(w^2+x),P!(1+w*x+w*x^2),P!(1+w^2*x+w*x^2)];
ImagePolys:=[P!(1)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,30);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,10)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,14,33,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w,w,w,F!1,F!1,w,F!0,w^2,F!1,F!1,F!1,F!0,F!1,w,w^2,F!1,F!0,w^2,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,w,w,F!1,F!1,w^2,F!1,w^2,w,w,F!0,F!1,F!0,w,F!1,F!1,F!0,F!1,F!0,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w^2,F!0,w,F!0,w,F!0,F!1,w^2,F!1,w^2,F!0,F!1,F!0,F!1,F!1,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!1,F!0,F!1,F!1,F!1,F!0,w^2,F!1,w,w,F!1,w,w^2,F!0,F!0,w^2,w,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,w,w,w^2,w^2,F!0,w,w,w^2,F!0,F!1,F!0,F!1,F!0,w,F!0,w^2,F!1,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!0,F!1,w,w^2,w^2,w^2,F!0,F!0,F!1,F!1,w^2,F!1,w^2,w^2,F!1,w,F!0,F!0,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w,F!0,w^2,w^2,F!0,F!0,F!0,F!0,w,w,w^2,F!0,F!1,F!1,w,F!0,F!0,w,F!1,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,w^2,w,w^2,F!1,w,w^2,F!0,F!0,w^2,F!0,F!1,w^2,F!1,F!1,w^2,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!1,F!0,F!1,F!0,w,w,w,F!0,w^2,F!1,w,w,w,F!1,w^2,F!1,F!1,F!1,w,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!1,F!0,w,F!0,F!1,F!0,F!0,F!0,F!1,w,F!0,F!1,w^2,w,w,F!1,w,w,w,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w^2,F!0,F!1,w,F!1,F!0,w^2,w,w,F!0,w^2,F!0,w,F!0,w^2,w,F!1,w^2,w^2,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,F!0,F!0,w^2,F!0,w^2,F!1,w,w^2,w^2,w,F!0,w^2,w,w^2,F!1,w,F!0,F!1,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,F!0,F!0,w^2,F!0,w^2,F!1,w^2,F!0,F!1,F!0,w^2,F!1,w^2,w^2,F!0,F!1,F!0,F!0,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,w,F!0,F!1,w,w^2,F!1,w^2,F!1,w,w,w^2,F!0,w^2,w^2,w^2,w,F!0]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 33 and Dimension(Hout) eq 4;
assert Dimension(Cout)-Dimension(Hout) eq 10 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 15;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE GQ04",lo,hi;
assert lo eq 11 and hi eq 11;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 11};
QCExamples["GQ04"]:=rec<QCFormat|Id:="GQ04",Ingredients:=<D1,D2>,
IngredientLabels:=<"I15_m3_s0_6","aux_m3_ell1_l3">,
IngredientParameters:=<[30,14,10,1],[3,3,1,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[33,10,11,15],OutputHull:=4,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[139]>;
for PaperNo in QCExamples["GQ04"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="GQ04";
end for;
print "VERIFIED QC-X4 GQ04";

// GQ05: I63_m3_s0, aux_m3_ell1_l3; lambda=3.
InputPolys1:=[[P!(1+w*x^2),P!(x^2),P!(x+w^2*x^2),P!(w*x+w^2*x^2),P!(x),P!(w*x+w*x^2),P!(x+x^2),P!(w*x+x^2),P!(w^2*x+x^2),P!(w^2*x),P!(w^2+x)],[P!(w*x+x^2),P!(1+w^2*x),P!(x^2),P!(w^2*x^2),P!(w*x+w^2*x^2),P!(x),P!(w^2*x^2),P!(w^2*x^2),P!(w^2*x+w*x^2),P!(1+w*x),P!(w+x+w*x^2)],[P!(x^2),P!(w^2*x^2),P!(1+w*x),P!(w^2*x+w*x^2),P!(w^2*x+w*x^2),P!(w*x+w^2*x^2),P!(x+x^2),P!(x+w*x^2),P!(0),P!(w^2+w^2*x+w*x^2),P!(w+w^2*x^2)]];
InputPolys2:=[[P!(1+x+x^2)],[P!(1+w^2*x+w*x^2)],[P!(1+w*x+w^2*x^2)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 33 and Dimension(D1) eq 9;
assert MinimumWeight(D1) eq 16 and Dimension(D1 meet HermitianDual(D1)) eq 3;
assert Length(D2) eq 3 and Dimension(D2) eq 3;
assert MinimumWeight(D2) eq 1 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(1+x+x^2),P!(w*x+w^2*x^2),P!(w+w*x^2),P!(1+w*x+w^2*x^2),P!(1+x+w*x^2),P!(w*x+w^2*x^2),P!(w*x+x^2),P!(w^2+w*x^2),P!(w+w*x^2),P!(w+w^2*x^2),P!(1+x)];
ImagePolys:=[P!(1)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,33);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,11)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,9,36,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!0,F!1,w,F!1,w,F!1,w,w^2,w^2,F!1,w,F!1,w^2,w^2,F!0,w,F!1,F!1,F!1,F!0,F!0,F!0,w,w^2,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,w,w^2,F!0,F!0,w,F!1,F!0,F!0,w^2,w,F!1,F!1,F!0,F!1,w^2,w^2,F!0,w^2,w^2,w,F!0,w,F!0,w,F!0,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w^2,w,F!0,F!0,w,w^2,w^2,w,F!1,F!1,F!0,w^2,F!0,F!1,w^2,F!0,w,w,w^2,F!1,w,F!0,w,w^2,F!0,F!1,F!0,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w,F!1,F!1,F!1,w,F!1,F!1,w^2,F!1,w^2,F!0,F!1,F!1,w^2,F!0,w,w,F!0,w,F!0,F!0,w,w^2,F!1,w^2,F!0,w^2,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w^2,w^2,F!1,w,w,w^2,F!1,F!0,w,F!1,w,w^2,F!1,F!1,F!0,w^2,F!1,F!0,w^2,F!0,w^2,F!0,w,F!0,w^2,w^2,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w,w,F!1,w,w^2,F!1,w^2,w,F!0,F!0,F!0,F!1,F!1,w,F!0,w,w,w,w,w^2,w^2,F!1,F!0,w,w^2,w,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!1,w,w^2,F!1,w,w,F!0,F!0,F!1,w,w^2,w^2,F!0,F!1,F!0,w,F!0,F!1,F!1,F!1,F!1,F!1,w,w^2,F!0,w^2,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,w^2,F!1,F!1,F!0,F!1,w^2,w,F!1,F!1,F!0,F!0,F!0,F!1,w,F!1,w^2,w,w,F!0,w^2,F!0,F!0,F!1,w,F!0,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,w^2,F!0,w^2,F!1,w^2,w^2,F!0,w,F!1,F!1,w^2,F!1,F!0,w,F!0,F!0,w^2,w,w^2,F!1,F!1,w,w^2,w,w,F!1]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 36 and Dimension(Hout) eq 6;
assert Dimension(Cout)-Dimension(Hout) eq 3 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 21;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE GQ05",lo,hi;
assert lo eq 17 and hi eq 17;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 17};
QCExamples["GQ05"]:=rec<QCFormat|Id:="GQ05",Ingredients:=<D1,D2>,
IngredientLabels:=<"I63_m3_s0","aux_m3_ell1_l3">,
IngredientParameters:=<[33,9,16,3],[3,3,1,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[36,3,17,21],OutputHull:=6,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[140]>;
for PaperNo in QCExamples["GQ05"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="GQ05";
end for;
print "VERIFIED QC-X4 GQ05";

// GQ06: I119_m3_s0, aux_m3_ell1_l3; lambda=3.
InputPolys1:=[[P!(1+w*x+w*x^2),P!(x+w^2*x^2),P!(w^2*x),P!(w*x+w^2*x^2),P!(w*x+w^2*x^2),P!(w^2*x+x^2),P!(w^2*x^2),P!(w*x),P!(w+x+w*x^2),P!(w^2+x),P!(w^2+w*x+w^2*x^2)],[P!(x+w*x^2),P!(1+x+x^2),P!(w*x^2),P!(x+x^2),P!(x+x^2),P!(w^2*x+x^2),P!(x),P!(x+w*x^2),P!(w*x+w^2*x^2),P!(w^2+w*x+w*x^2),P!(w^2*x^2)],[P!(x+x^2),P!(x^2),P!(1+x+x^2),P!(w*x+x^2),P!(w^2*x^2),P!(w^2*x^2),P!(w*x+w*x^2),P!(x+w^2*x^2),P!(w^2*x^2),P!(w^2),P!(1+w^2*x+w*x^2)]];
InputPolys2:=[[P!(1+x+x^2)],[P!(1+w^2*x+w*x^2)],[P!(1+w*x+w^2*x^2)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 33 and Dimension(D1) eq 8;
assert MinimumWeight(D1) eq 17 and Dimension(D1 meet HermitianDual(D1)) eq 2;
assert Length(D2) eq 3 and Dimension(D2) eq 3;
assert MinimumWeight(D2) eq 1 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(w*x+w^2*x^2),P!(x+x^2),P!(w+x+w*x^2),P!(1),P!(x),P!(w+w^2*x+w^2*x^2),P!(w+w^2*x+w^2*x^2),P!(1+w^2*x^2),P!(w^2+x+x^2),P!(1+w*x+w^2*x^2),P!(w+w^2*x^2)];
ImagePolys:=[P!(1)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,33);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,11)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,8,36,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,w^2,w^2,w,F!1,w^2,w,w,w^2,F!0,w,F!1,F!1,w,w,w^2,F!0,w^2,w^2,F!1,w^2,F!0,w,F!0,w^2,F!0,w,w,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!1,F!1,F!0,F!1,F!1,w^2,F!1,F!1,w,w,F!0,w,F!1,w,F!1,F!1,F!1,F!0,w,w^2,w,w^2,w^2,w^2,F!0,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!1,F!1,F!0,F!1,w,F!0,F!0,w,F!1,F!0,F!0,w^2,F!1,F!1,F!1,F!1,w^2,w^2,w,w^2,w^2,F!0,w,F!1,w,F!0,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w,w^2,F!1,F!1,F!0,F!1,w,F!0,w,w,F!1,F!1,w,F!1,F!0,F!1,F!0,w,F!0,F!1,w,F!0,w,w^2,w,F!1,F!0,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!1,F!0,w,w,F!1,w,F!1,F!1,w^2,w,F!1,w,F!0,w^2,F!1,w,w,F!0,F!1,F!0,w^2,F!1,w^2,w,w,F!1,F!0,F!0,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w^2,w^2,w,w^2,F!1,F!0,w^2,w^2,w,w^2,w,F!0,F!0,w,w^2,w^2,w,F!0,F!0,F!0,F!1,F!0,w^2,w^2,F!1,w^2,F!0,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w,w,F!1,F!0,F!0,F!0,F!1,w,F!1,F!0,F!0,F!1,F!1,w,F!1,w,w^2,F!0,w^2,w^2,w,w,w,F!1,F!1,w,w^2,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,F!0,w,F!0,w,w^2,F!1,F!1,w,w^2,w^2,w,F!1,w^2,w^2,F!1,w^2,w,w,w^2,F!0,w^2,w,w,w^2,w^2,w^2,F!1]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 36 and Dimension(Hout) eq 5;
assert Dimension(Cout)-Dimension(Hout) eq 3 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 23;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE GQ06",lo,hi;
assert lo eq 18 and hi eq 18;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 18};
QCExamples["GQ06"]:=rec<QCFormat|Id:="GQ06",Ingredients:=<D1,D2>,
IngredientLabels:=<"I119_m3_s0","aux_m3_ell1_l3">,
IngredientParameters:=<[33,8,17,2],[3,3,1,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[36,3,18,23],OutputHull:=5,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[141]>;
for PaperNo in QCExamples["GQ06"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="GQ06";
end for;
print "VERIFIED QC-X4 GQ06";

// GQ07: I63_m3_s0, aux_m3_ell1_l2; lambda=2.
InputPolys1:=[[P!(1+w*x^2),P!(x^2),P!(x+w^2*x^2),P!(w*x+w^2*x^2),P!(x),P!(w*x+w*x^2),P!(x+x^2),P!(w*x+x^2),P!(w^2*x+x^2),P!(w^2*x),P!(w^2+x)],[P!(w*x+x^2),P!(1+w^2*x),P!(x^2),P!(w^2*x^2),P!(w*x+w^2*x^2),P!(x),P!(w^2*x^2),P!(w^2*x^2),P!(w^2*x+w*x^2),P!(1+w*x),P!(w+x+w*x^2)],[P!(x^2),P!(w^2*x^2),P!(1+w*x),P!(w^2*x+w*x^2),P!(w^2*x+w*x^2),P!(w*x+w^2*x^2),P!(x+x^2),P!(x+w*x^2),P!(0),P!(w^2+w^2*x+w*x^2),P!(w+w^2*x^2)]];
InputPolys2:=[[P!(1+x+x^2)],[P!(1+w^2*x+w*x^2)]];
m:=3;lambda:=2;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 33 and Dimension(D1) eq 9;
assert MinimumWeight(D1) eq 16 and Dimension(D1 meet HermitianDual(D1)) eq 3;
assert Length(D2) eq 3 and Dimension(D2) eq 2;
assert MinimumWeight(D2) eq 2 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(1+x+x^2),P!(w*x+w^2*x^2),P!(w+x+w^2*x^2),P!(w^2+w*x+x^2),P!(w+w*x+w*x^2),P!(w^2+w*x^2),P!(x+w*x^2),P!(w*x+w^2*x^2),P!(w^2+w*x+x^2),P!(w+w^2*x),P!(1+w^2*x+w*x^2)];
ImagePolys:=[P!(w*x+w^2*x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,33);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,11)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,9,36,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!0,F!1,w,F!1,w,F!1,w,w^2,w^2,F!1,w,F!1,w^2,w^2,F!0,w,F!1,F!1,F!1,F!0,F!0,w^2,F!0,w,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,w,w^2,F!0,F!0,w,F!1,F!0,F!0,w^2,w,F!1,F!1,F!0,F!1,w^2,w^2,F!0,w^2,w^2,w,F!0,w,F!1,F!0,w^2,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w^2,w,F!0,F!0,w,w^2,w^2,w,F!1,F!1,F!0,w^2,F!0,F!1,w^2,F!0,w,w,w^2,F!1,w,F!0,w,w^2,F!1,F!1,F!1,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w,F!1,F!1,F!1,w,F!1,F!1,w^2,F!1,w^2,F!0,F!1,F!1,w^2,F!0,w,w,F!0,w,F!0,F!0,w,w^2,F!1,w^2,w,F!1,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w^2,w^2,F!1,w,w,w^2,F!1,F!0,w,F!1,w,w^2,F!1,F!1,F!0,w^2,F!1,F!0,w^2,F!0,w^2,F!0,w,w,F!1,w^2,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w,w,F!1,w,w^2,F!1,w^2,w,F!0,F!0,F!0,F!1,F!1,w,F!0,w,w,w,w,w^2,w^2,F!1,F!0,w,w^2,F!1,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!1,w,w^2,F!1,w,w,F!0,F!0,F!1,w,w^2,w^2,F!0,F!1,F!0,w,F!0,F!1,F!1,F!1,F!1,F!1,w,w^2,F!1,w^2,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,w^2,F!1,F!1,F!0,F!1,w^2,w,F!1,F!1,F!0,F!0,F!0,F!1,w,F!1,w^2,w,w,F!0,w^2,F!0,F!0,F!1,F!0,F!0,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,w^2,F!0,w^2,F!1,w^2,w^2,F!0,w,F!1,F!1,w^2,F!1,F!0,w,F!0,F!0,w^2,w,w^2,F!1,F!1,w,w^2,w^2,F!0,w]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 36 and Dimension(Hout) eq 5;
assert Dimension(Cout)-Dimension(Hout) eq 4 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 22;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE GQ07",lo,hi;
assert lo eq 17 and hi eq 17;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 17};
QCExamples["GQ07"]:=rec<QCFormat|Id:="GQ07",Ingredients:=<D1,D2>,
IngredientLabels:=<"I63_m3_s0","aux_m3_ell1_l2">,
IngredientParameters:=<[33,9,16,3],[3,2,2,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[36,4,17,22],OutputHull:=5,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[142]>;
for PaperNo in QCExamples["GQ07"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="GQ07";
end for;
print "VERIFIED QC-X4 GQ07";

// GQ08: I15_m3_s0, aux_m3_ell1_l3; lambda=3.
InputPolys1:=[[P!(1+x^2),P!(w*x^2),P!(w^2*x^2),P!(0),P!(w^2*x^2),P!(w^2*x+x^2),P!(w^2*x^2),P!(x),P!(x+w^2*x^2),P!(w^2*x+w^2*x^2),P!(w^2*x^2)],[P!(x^2),P!(1+x^2),P!(w*x^2),P!(w*x^2),P!(0),P!(w*x),P!(x^2),P!(w^2*x+w*x^2),P!(w*x+x^2),P!(w^2*x^2),P!(x^2)],[P!(0),P!(0),P!(1+w*x^2),P!(w^2*x^2),P!(0),P!(w^2*x+w^2*x^2),P!(w*x^2),P!(x),P!(0),P!(x+w*x^2),P!(x+x^2)],[P!(w^2*x^2),P!(0),P!(w^2*x^2),P!(1+w*x^2),P!(w^2*x^2),P!(w^2*x+w^2*x^2),P!(w^2*x^2),P!(0),P!(x^2),P!(w^2*x+x^2),P!(0)],[P!(w*x^2),P!(x^2),P!(w*x^2),P!(0),P!(1+x^2),P!(w^2*x^2),P!(0),P!(x+w*x^2),P!(w^2*x+w^2*x^2),P!(w^2*x+x^2),P!(w^2*x+w*x^2)],[P!(x^2),P!(w^2*x^2),P!(w^2*x^2),P!(w^2*x^2),P!(x^2),P!(1+w^2*x+x^2),P!(x^2),P!(w^2*x),P!(w^2*x^2),P!(w^2*x),P!(x+w*x^2)],[P!(0),P!(x^2),P!(x^2),P!(x^2),P!(w^2*x^2),P!(x),P!(1+x^2),P!(x+w*x^2),P!(x+x^2),P!(0),P!(x+w*x^2)]];
InputPolys2:=[[P!(1+x+x^2)],[P!(1+w^2*x+w*x^2)],[P!(1+w*x+w^2*x^2)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 33 and Dimension(D1) eq 17;
assert MinimumWeight(D1) eq 10 and Dimension(D1 meet HermitianDual(D1)) eq 3;
assert Length(D2) eq 3 and Dimension(D2) eq 3;
assert MinimumWeight(D2) eq 1 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(w^2*x^2),P!(1+w^2*x^2),P!(w^2*x^2),P!(w+w*x+w^2*x^2),P!(w^2+w^2*x),P!(w^2+w^2*x+x^2),P!(w+x),P!(w+x+w^2*x^2),P!(w^2*x),P!(w^2+w^2*x+w^2*x^2),P!(w+w^2*x)];
ImagePolys:=[P!(1)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,33);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,11)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,17,36,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!1,F!1,w^2,F!0,F!1,w,w^2,F!0,w^2,F!1,w^2,F!0,w^2,w^2,w^2,w^2,F!0,F!0,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!0,w^2,w,F!0,F!0,F!1,F!1,w,w,F!0,F!0,F!1,w,F!1,w^2,F!1,F!0,F!0,w^2,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!1,F!0,F!1,F!1,F!0,F!0,w,w^2,F!0,w^2,w,F!0,F!0,w,F!1,w,F!1,F!1,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!0,F!0,w^2,F!0,w^2,F!0,w^2,w,w^2,w^2,w^2,F!0,F!1,F!1,F!0,F!1,F!0,F!0,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,w^2,w^2,w,F!1,w,F!0,F!1,w^2,F!0,w,w^2,F!1,w,w,F!1,F!1,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,w^2,F!0,w^2,F!1,F!1,w^2,w^2,w^2,F!1,F!1,F!1,F!0,w^2,F!0,w,F!1,F!1,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,F!1,F!0,F!1,F!0,F!1,F!1,F!1,w^2,F!0,F!1,w,F!1,F!0,w,F!1,w,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w,F!1,w^2,w,F!1,F!1,w,F!1,w^2,w,w,F!1,F!1,w,F!0,F!1,w,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,w,w,w^2,w^2,F!1,w^2,w^2,F!1,w^2,w,w,w^2,w,F!1,w,w,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!0,F!0,F!0,w^2,F!1,w,F!1,F!0,F!1,w,F!1,w^2,w^2,F!1,F!1,F!0,w^2,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w^2,F!0,w^2,w,w,F!1,w^2,w^2,w,F!1,w^2,F!1,F!1,w,F!0,F!0,w,F!0,w^2,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w,F!0,F!0,w^2,F!1,F!0,F!0,w^2,F!0,F!0,F!1,w^2,w^2,F!0,w,F!1,F!1,F!0,w,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w^2,F!0,w,F!0,F!1,F!0,F!0,w^2,w^2,F!1,F!1,w^2,w,w^2,F!0,w^2,w,F!0,F!0,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!1,F!0,F!1,F!0,F!0,w^2,F!0,F!0,F!1,F!1,F!1,F!1,w^2,F!1,w,w^2,F!1,F!0,w,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w^2,F!0,F!1,F!0,w,F!1,w,F!0,F!0,w^2,F!1,w^2,F!1,F!1,w^2,w,F!0,w,w,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w^2,F!1,w,w,w^2,w^2,w^2,F!1,w,F!1,w,F!1,F!0,w^2,F!1,w,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,w,F!0,F!0,w^2,F!1,F!0,F!1,w,F!1,w,w^2,w^2,w,F!0,F!1,F!1,F!1]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 36 and Dimension(Hout) eq 6;
assert Dimension(Cout)-Dimension(Hout) eq 11 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 13;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE GQ08",lo,hi;
assert lo eq 11 and hi eq 11;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 11};
QCExamples["GQ08"]:=rec<QCFormat|Id:="GQ08",Ingredients:=<D1,D2>,
IngredientLabels:=<"I15_m3_s0","aux_m3_ell1_l3">,
IngredientParameters:=<[33,17,10,3],[3,3,1,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[36,11,11,13],OutputHull:=6,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[143]>;
for PaperNo in QCExamples["GQ08"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="GQ08";
end for;
print "VERIFIED QC-X4 GQ08";

// GQ09: I119_m3_snone, aux_m3_ell1_l3; lambda=3.
InputPolys1:=[[P!(1+w*x),P!(w*x^2),P!(w^2*x+x^2),P!(w^2*x),P!(x),P!(x+w*x^2),P!(x+w^2*x^2),P!(x+w*x^2),P!(w^2*x+w*x^2),P!(x+x^2),P!(w*x^2),P!(w^2+w^2*x+x^2)],[P!(w^2*x+x^2),P!(1+w^2*x^2),P!(w*x+x^2),P!(x+w*x^2),P!(w^2*x+w*x^2),P!(0),P!(x),P!(w^2*x),P!(w*x+w^2*x^2),P!(w^2*x^2),P!(x+x^2),P!(1+w^2*x+w*x^2)],[P!(w^2*x+w^2*x^2),P!(w*x+x^2),P!(1+x+w^2*x^2),P!(0),P!(w^2*x),P!(w^2*x^2),P!(x),P!(x+w*x^2),P!(w*x+w^2*x^2),P!(w*x+w^2*x^2),P!(w^2*x^2),P!(w)],[P!(w^2*x+w^2*x^2),P!(w*x+w*x^2),P!(w^2*x^2),P!(1+x+w^2*x^2),P!(0),P!(x+x^2),P!(w*x+w*x^2),P!(w*x),P!(w*x+w*x^2),P!(w^2*x^2),P!(w*x+x^2),P!(w^2+w^2*x+x^2)],[P!(w*x+w*x^2),P!(w^2*x+w^2*x^2),P!(x+x^2),P!(0),P!(1+w^2*x^2),P!(x+w^2*x^2),P!(x+w^2*x^2),P!(w*x),P!(x^2),P!(x),P!(x^2),P!(w+w*x+x^2)]];
InputPolys2:=[[P!(1+x+x^2)],[P!(1+w^2*x+w*x^2)],[P!(1+w*x+w^2*x^2)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 36 and Dimension(D1) eq 11;
assert MinimumWeight(D1) eq 17 and Dimension(D1 meet HermitianDual(D1)) eq 2;
assert Length(D2) eq 3 and Dimension(D2) eq 3;
assert MinimumWeight(D2) eq 1 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(w*x+x^2),P!(w+w^2*x+w^2*x^2),P!(w+w^2*x+w^2*x^2),P!(1+x+w^2*x^2),P!(1+w^2*x+w*x^2),P!(w),P!(w+x^2),P!(w*x^2),P!(w+x+x^2),P!(1+w*x),P!(w+w^2*x^2),P!(1+w^2*x)];
ImagePolys:=[P!(1)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,36);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,12)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,11,39,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,w,F!0,w^2,w^2,F!1,F!1,F!1,F!1,w^2,F!1,F!0,w^2,F!0,w,F!1,F!0,F!0,w,w^2,w,w,F!1,w,F!1,F!1,w^2,w^2,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,F!0,w,F!1,w^2,F!0,F!1,w^2,w,F!0,F!1,w^2,F!1,w^2,F!1,w,w,F!0,F!0,F!0,w^2,w^2,F!1,w,F!1,F!0,w,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,w^2,w,F!1,F!0,w^2,F!0,F!1,F!1,w,w,F!0,F!0,w^2,F!1,w^2,F!0,F!0,w^2,F!0,w,w^2,w^2,w^2,F!0,w^2,w^2,F!1,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,w^2,w,F!0,F!1,F!0,F!1,w,w,w,F!0,w,w^2,w^2,w,w^2,w^2,F!0,F!1,w,F!0,w,w^2,F!1,F!1,w^2,w,w,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w,w,w^2,F!1,F!0,F!0,F!1,F!1,w,F!0,F!1,F!0,w,w,w^2,F!1,F!0,w^2,w^2,w^2,F!0,F!1,F!0,F!1,F!1,w,F!1,w^2,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w,F!0,F!1,w^2,w^2,w^2,w^2,w^2,F!0,w^2,F!1,F!1,F!0,F!1,F!0,w,w,F!0,w,F!0,F!0,F!0,F!0,w,w^2,w,w,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w^2,w,F!0,w^2,F!0,w^2,F!0,w,F!0,w,F!1,F!0,F!0,w^2,F!1,F!0,F!1,F!0,F!1,F!1,w,F!1,w,F!1,w^2,w,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w,w^2,w^2,w,w^2,w,F!0,w^2,F!1,F!0,w,w^2,F!0,F!1,w^2,w,w^2,w^2,F!0,w,w^2,w^2,w,F!1,F!1,F!1,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w,F!0,w^2,F!0,w,w^2,w^2,w,F!1,F!1,F!1,F!0,F!0,F!1,w,F!1,w^2,w,F!1,w^2,w^2,w,F!1,w,w,F!1,w^2,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w^2,w,F!1,w,w,F!0,w,w,w^2,F!1,w^2,F!1,F!1,F!0,F!0,F!0,w^2,F!0,w^2,F!1,w^2,F!0,F!1,F!0,w^2,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,F!1,F!1,F!0,F!0,w^2,w,w^2,F!0,F!1,F!0,w^2,F!0,F!1,F!1,w^2,w^2,w,w^2,w,w^2,w,F!0,w,F!1,w,F!0,F!1]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 39 and Dimension(Hout) eq 5;
assert Dimension(Cout)-Dimension(Hout) eq 6 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 23;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE GQ09",lo,hi;
assert lo eq 18 and hi eq 18;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 18};
QCExamples["GQ09"]:=rec<QCFormat|Id:="GQ09",Ingredients:=<D1,D2>,
IngredientLabels:=<"I119_m3_snone","aux_m3_ell1_l3">,
IngredientParameters:=<[36,11,17,2],[3,3,1,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[39,6,18,23],OutputHull:=5,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[144]>;
for PaperNo in QCExamples["GQ09"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="GQ09";
end for;
print "VERIFIED QC-X4 GQ09";

// NQ01: I63_m3_snone_u0, aux_m3_ell1_l1; lambda=1.
InputPolys1:=[[P!(1),P!(x+x^2),P!(w^2*x+x^2),P!(w^2*x^2),P!(w*x+w*x^2),P!(x+w*x^2),P!(x+w*x^2),P!(x+x^2),P!(w^2*x+w*x^2),P!(w*x^2),P!(w^2*x+w*x^2),P!(1+x+w*x^2)],[P!(0),P!(1+w*x^2),P!(x^2),P!(x+w^2*x^2),P!(w*x+w^2*x^2),P!(x),P!(w*x+w*x^2),P!(x+x^2),P!(w*x+x^2),P!(w^2*x+x^2),P!(w^2*x),P!(w^2+x)],[P!(w*x^2),P!(w*x+w^2*x^2),P!(1+w^2*x+w*x^2),P!(w^2*x+x^2),P!(x^2),P!(x+x^2),P!(x+x^2),P!(0),P!(w^2*x+w*x^2),P!(x+w*x^2),P!(x+x^2),P!(w+x+x^2)],[P!(x^2),P!(0),P!(w*x^2),P!(1),P!(w^2*x+w^2*x^2),P!(x+w^2*x^2),P!(w*x),P!(x+w^2*x^2),P!(w^2*x+x^2),P!(x),P!(x+x^2),P!(w+x^2)],[P!(w^2*x^2),P!(x),P!(x+w^2*x^2),P!(w^2*x+w*x^2),P!(1+x+x^2),P!(w^2*x^2),P!(w^2*x),P!(x+x^2),P!(w*x+w*x^2),P!(w^2*x+w*x^2),P!(x^2),P!(1+x)]];
InputPolys2:=[[P!(1+x+x^2)]];
m:=3;lambda:=1;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 36 and Dimension(D1) eq 12;
assert MinimumWeight(D1) eq 16 and Dimension(D1 meet HermitianDual(D1)) eq 4;
assert Length(D2) eq 3 and Dimension(D2) eq 1;
assert MinimumWeight(D2) eq 3 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(1+x+x^2),P!(w+w*x+w*x^2),P!(0),P!(w+w*x+w*x^2),P!(0),P!(w^2+w^2*x+w^2*x^2),P!(w+w*x+w*x^2),P!(0),P!(1+x+x^2),P!(0),P!(0),P!(1+x+x^2)];
ImagePolys:=[P!(1+x+x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,36);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,12)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,12,39,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,w^2,F!0,w,F!1,F!1,F!1,w^2,F!0,w^2,F!1,F!0,F!1,F!1,w^2,w,w,w,F!1,w,w,w,w,w^2,w^2,w^2,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!0,F!0,F!1,w,F!1,w,F!1,w,w^2,w^2,F!1,F!0,w,F!1,w^2,w^2,F!0,w,F!1,F!1,F!1,F!0,F!0,F!0,F!0,F!0,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!0,w,w^2,w^2,F!0,F!1,F!1,F!0,w^2,F!1,F!1,F!1,w,w^2,w,F!1,F!1,F!1,F!1,F!0,w,w,F!1,F!1,w^2,w^2,w^2,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!0,F!0,F!0,F!0,w^2,F!1,w,F!1,w^2,F!1,F!1,F!0,F!1,F!0,w,F!0,w^2,w^2,F!0,w^2,F!1,F!0,F!1,F!1,F!1,F!1,F!1,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,F!1,w^2,F!1,F!0,w^2,F!1,w,w^2,F!0,F!1,w^2,F!0,w^2,w,F!1,w^2,F!0,F!1,w,w,F!1,F!0,F!0,F!0,F!0,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w^2,F!0,w^2,F!1,w,w,w^2,F!1,F!0,w,F!1,w,w^2,F!0,F!1,F!1,F!0,w^2,F!1,F!0,w^2,F!0,w^2,F!0,w,w,w,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w,F!0,F!1,w,w,F!1,w,w,F!0,F!1,w^2,F!0,F!1,w^2,F!1,w^2,w,F!1,F!1,F!0,w,F!1,F!1,w,w^2,F!0,F!0,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,w,F!0,w^2,F!1,F!1,w,w^2,F!0,F!1,F!1,F!1,F!0,F!0,w,w^2,w,w,w,w^2,F!0,w,F!0,F!1,w^2,F!0,w^2,w^2,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w^2,F!0,F!1,F!1,w^2,F!1,F!0,w,F!1,w,w,w^2,F!0,w,w^2,F!0,F!1,F!1,F!0,w^2,w^2,w,F!0,F!1,w,F!1,F!1,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w^2,F!0,F!0,w^2,w,w^2,F!0,F!0,w,w,w^2,F!0,F!1,w,w,F!0,F!0,w,F!1,w^2,F!0,F!0,F!1,w^2,F!0,w,w,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w^2,F!0,w^2,F!0,F!0,w^2,w,w^2,F!0,w,w,w,F!0,w,w,F!1,w^2,F!1,F!0,F!1,w^2,F!1,F!1,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,w,F!1,w,w^2,F!1,F!0,F!1,w^2,w,w,F!0,w,w,w,w^2,F!1,F!0,F!0,w^2,F!0,w,w^2,F!0,F!0,F!0]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 39 and Dimension(Hout) eq 5;
assert Dimension(Cout)-Dimension(Hout) eq 7 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 22;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE NQ01",lo,hi;
assert lo eq 16 and hi eq 16;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 16};
QCExamples["NQ01"]:=rec<QCFormat|Id:="NQ01",Ingredients:=<D1,D2>,
IngredientLabels:=<"I63_m3_snone_u0","aux_m3_ell1_l1">,
IngredientParameters:=<[36,12,16,4],[3,1,3,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[39,7,16,22],OutputHull:=5,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[145]>;
for PaperNo in QCExamples["NQ01"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="NQ01";
end for;
print "VERIFIED QC-X4 NQ01";

// SQ11: I17_m3_p0_1, aux_m3_ell1_l3; lambda=3.
InputPolys1:=[[P!(1+w*x+w*x^2),P!(0),P!(w^2*x+x^2),P!(x^2),P!(w^2*x^2),P!(x+w^2*x^2),P!(x+w*x^2),P!(w*x+x^2),P!(w^2*x),P!(w*x+w^2*x^2),P!(w*x+w^2*x^2),P!(w*x+w^2*x^2),P!(w*x)],[P!(w^2*x^2),P!(1+w*x^2),P!(w^2*x+x^2),P!(w*x+x^2),P!(w*x^2),P!(w^2*x+w^2*x^2),P!(w*x),P!(w^2*x),P!(w*x),P!(0),P!(w*x^2),P!(w*x+x^2),P!(w*x+x^2)],[P!(w^2*x^2),P!(x^2),P!(1+w^2*x+w*x^2),P!(w^2*x^2),P!(0),P!(w^2*x^2),P!(w*x^2),P!(w^2*x+x^2),P!(x+w^2*x^2),P!(x^2),P!(x^2),P!(w*x),P!(x+x^2)],[P!(w^2*x+w*x^2),P!(w*x^2),P!(w^2*x^2),P!(1+w*x^2),P!(0),P!(w*x+x^2),P!(w^2*x+w^2*x^2),P!(x+w^2*x^2),P!(w*x^2),P!(w*x+w*x^2),P!(w^2*x+w^2*x^2),P!(x),P!(x)],[P!(w*x+x^2),P!(0),P!(x^2),P!(w^2*x),P!(1+w*x^2),P!(x),P!(w*x),P!(w*x+x^2),P!(w*x),P!(x^2),P!(x+w*x^2),P!(x+x^2),P!(w^2*x+w^2*x^2)],[P!(w*x),P!(w^2*x^2),P!(0),P!(w*x+w^2*x^2),P!(0),P!(1+w*x+w^2*x^2),P!(w^2*x),P!(w*x+w*x^2),P!(w*x),P!(x^2),P!(w*x^2),P!(w*x),P!(w*x+w^2*x^2)]];
InputPolys2:=[[P!(1+x+x^2)],[P!(1+w^2*x+w*x^2)],[P!(w+w^2*x+x^2)]];
m:=3;lambda:=3;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 39 and Dimension(D1) eq 15;
assert MinimumWeight(D1) eq 13 and Dimension(D1 meet HermitianDual(D1)) eq 5;
assert Length(D2) eq 3 and Dimension(D2) eq 3;
assert MinimumWeight(D2) eq 1 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(w^2*x+x^2),P!(x+w^2*x^2),P!(1+w^2*x),P!(x^2),P!(w+w^2*x^2),P!(w+w^2*x^2),P!(1+x+x^2),P!(1+x+x^2),P!(w+w*x+x^2),P!(1+w^2*x+w^2*x^2),P!(w+w^2*x),P!(w^2+w^2*x+x^2),P!(w+w*x+x^2)];
ImagePolys:=[P!(w+x+w*x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,39);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,13)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,15,42,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!0,w^2,F!0,F!0,F!1,F!1,w,w^2,w,w,w,w,w,F!0,F!1,F!1,w^2,w^2,w,F!1,F!0,w^2,w^2,w^2,F!0,F!1,F!1,w,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,w,F!0,w^2,w,w^2,w,F!0,F!0,w,w,w^2,w,F!1,F!1,w,w^2,F!0,F!0,F!0,F!0,w,F!1,F!1,F!0,w,w^2,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!0,F!0,F!0,w^2,F!1,F!0,F!0,w,F!1,w^2,F!1,w,w^2,F!0,w^2,w,F!1,w^2,F!1,F!1,F!0,F!1,F!0,w,w^2,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!0,F!0,F!0,w,w^2,F!1,F!0,w,w^2,F!1,F!1,w,w,w^2,w,F!0,F!1,w^2,w^2,w,w,w^2,F!0,F!0,F!0,F!0,F!0,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!0,F!0,w^2,F!0,F!1,w,w,w,F!0,F!1,F!1,w^2,F!1,F!0,F!1,F!0,w,F!0,F!0,F!1,F!0,F!1,w,F!1,w^2,w^2,w,F!0,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!0,F!0,w,F!0,w,w^2,w,w,F!0,F!0,w,w,F!0,w^2,F!0,w^2,F!0,w^2,F!0,w,F!0,F!1,w,F!0,w^2,F!0,F!0,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!0,w,F!0,F!1,F!1,F!1,w^2,w^2,F!1,w^2,w^2,F!1,F!1,w^2,w,F!0,F!0,w^2,w^2,F!1,w,F!0,F!0,w,w,w,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,w^2,F!0,w^2,w^2,w^2,F!1,w,w^2,w^2,F!1,w^2,w,F!0,F!0,w^2,F!0,F!1,F!0,F!1,w,F!0,F!1,w^2,F!1,F!0,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w,F!0,F!1,F!0,F!0,F!0,F!1,w,F!1,F!0,F!0,w,F!0,w,F!1,F!0,w^2,w,F!0,w^2,w^2,w^2,F!0,w^2,F!0,F!0,F!0,F!1,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w^2,w,F!0,F!0,w,F!1,w,F!1,w^2,w,F!0,w,F!1,F!1,w,F!0,F!0,w,F!0,F!1,F!0,F!0,F!1,w,F!0,F!1,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w^2,F!0,w^2,F!0,F!0,F!1,F!1,F!0,F!1,w,w^2,w,w^2,w,w^2,F!0,w,F!1,w,F!1,F!0,w^2,w^2,F!0,F!1,F!1,F!0,w,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,F!0,F!1,w^2,F!0,F!0,w,F!1,w^2,F!0,w^2,F!0,w^2,w^2,F!0,w,w^2,F!0,w,w,w,F!0,F!1,w,w,w,F!0,w,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w^2,F!1,F!0,F!0,F!0,F!0,w^2,F!0,w,F!1,F!0,w,w,F!0,F!1,w^2,w^2,F!1,w,w,F!0,w^2,F!0,w^2,w,F!1,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,F!1,F!0,F!1,w,F!1,F!0,F!0,F!0,F!0,F!0,F!1,F!1,w^2,F!1,w^2,w,w^2,F!1,F!0,F!0,F!0,F!0,F!1,w^2,F!1,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,w^2,F!1,F!1,w,w^2,w^2,F!1,F!1,w,w,F!0,w^2,w,w,w^2,F!1,w,F!0,F!0,F!0,F!0,F!0,w^2]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 42 and Dimension(Hout) eq 8;
assert Dimension(Cout)-Dimension(Hout) eq 7 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 19;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SQ11",lo,hi;
assert lo eq 14 and hi eq 14;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 14};
QCExamples["SQ11"]:=rec<QCFormat|Id:="SQ11",Ingredients:=<D1,D2>,
IngredientLabels:=<"I17_m3_p0_1","aux_m3_ell1_l3">,
IngredientParameters:=<[39,15,13,5],[3,3,1,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[42,7,14,19],OutputHull:=8,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[146]>;
for PaperNo in QCExamples["SQ11"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SQ11";
end for;
print "VERIFIED QC-X4 SQ11";

// SQ12: I17_m3_p0_1, aux_m3_ell1_l2; lambda=2.
InputPolys1:=[[P!(1+w*x+w*x^2),P!(0),P!(w^2*x+x^2),P!(x^2),P!(w^2*x^2),P!(x+w^2*x^2),P!(x+w*x^2),P!(w*x+x^2),P!(w^2*x),P!(w*x+w^2*x^2),P!(w*x+w^2*x^2),P!(w*x+w^2*x^2),P!(w*x)],[P!(w^2*x^2),P!(1+w*x^2),P!(w^2*x+x^2),P!(w*x+x^2),P!(w*x^2),P!(w^2*x+w^2*x^2),P!(w*x),P!(w^2*x),P!(w*x),P!(0),P!(w*x^2),P!(w*x+x^2),P!(w*x+x^2)],[P!(w^2*x^2),P!(x^2),P!(1+w^2*x+w*x^2),P!(w^2*x^2),P!(0),P!(w^2*x^2),P!(w*x^2),P!(w^2*x+x^2),P!(x+w^2*x^2),P!(x^2),P!(x^2),P!(w*x),P!(x+x^2)],[P!(w^2*x+w*x^2),P!(w*x^2),P!(w^2*x^2),P!(1+w*x^2),P!(0),P!(w*x+x^2),P!(w^2*x+w^2*x^2),P!(x+w^2*x^2),P!(w*x^2),P!(w*x+w*x^2),P!(w^2*x+w^2*x^2),P!(x),P!(x)],[P!(w*x+x^2),P!(0),P!(x^2),P!(w^2*x),P!(1+w*x^2),P!(x),P!(w*x),P!(w*x+x^2),P!(w*x),P!(x^2),P!(x+w*x^2),P!(x+x^2),P!(w^2*x+w^2*x^2)],[P!(w*x),P!(w^2*x^2),P!(0),P!(w*x+w^2*x^2),P!(0),P!(1+w*x+w^2*x^2),P!(w^2*x),P!(w*x+w*x^2),P!(w*x),P!(x^2),P!(w*x^2),P!(w*x),P!(w*x+w^2*x^2)]];
InputPolys2:=[[P!(1+w^2*x+w*x^2)],[P!(1+w*x+w^2*x^2)]];
m:=3;lambda:=2;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 39 and Dimension(D1) eq 15;
assert MinimumWeight(D1) eq 13 and Dimension(D1 meet HermitianDual(D1)) eq 5;
assert Length(D2) eq 3 and Dimension(D2) eq 2;
assert MinimumWeight(D2) eq 2 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(w+x+w^2*x^2),P!(w^2+w^2*x^2),P!(w+w*x),P!(w+w^2*x+x^2),P!(w^2+x+w*x^2),P!(w+w*x),P!(1+w^2*x+w*x^2),P!(w^2+w*x+x^2),P!(w^2+w^2*x),P!(1+x),P!(0),P!(w^2*x+w^2*x^2),P!(1+w*x+w^2*x^2)];
ImagePolys:=[P!(x+x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,39);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,13)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,15,42,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!0,w^2,F!0,F!0,F!1,F!1,w,w^2,w,w,w,w,w,F!0,F!1,F!1,w^2,w^2,w,F!1,F!0,w^2,w^2,w^2,F!0,w^2,F!1,w,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,w,F!0,w^2,w,w^2,w,F!0,F!0,w,w,w^2,w,F!1,F!1,w,w^2,F!0,F!0,F!0,F!0,w,F!1,F!1,w^2,w,F!1,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!0,F!0,F!0,w^2,F!1,F!0,F!0,w,F!1,w^2,F!1,w,w^2,F!0,w^2,w,F!1,w^2,F!1,F!1,F!0,F!1,w^2,w,F!1,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!0,F!0,F!0,w,w^2,F!1,F!0,w,w^2,F!1,F!1,w,w,w^2,w,F!0,F!1,w^2,w^2,w,w,w^2,F!0,F!0,w^2,w,F!1,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!0,F!0,w^2,F!0,F!1,w,w,w,F!0,F!1,F!1,w^2,F!1,F!0,F!1,F!0,w,F!0,F!0,F!1,F!0,F!1,w,F!1,w^2,w,F!0,w,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!0,F!0,w,F!0,w,w^2,w,w,F!0,F!0,w,w,F!0,w^2,F!0,w^2,F!0,w^2,F!0,w,F!0,F!1,w,F!0,w^2,w^2,F!1,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,F!0,w,F!0,F!1,F!1,F!1,w^2,w^2,F!1,w^2,w^2,F!1,F!1,w^2,w,F!0,F!0,w^2,w^2,F!1,w,F!0,F!0,w,w,w^2,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,w^2,F!0,w^2,w^2,w^2,F!1,w,w^2,w^2,F!1,w^2,w,F!0,F!0,w^2,F!0,F!1,F!0,F!1,w,F!0,F!1,w^2,w,F!0,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w,F!0,F!1,F!0,F!0,F!0,F!1,w,F!1,F!0,F!0,w,F!0,w,F!1,F!0,w^2,w,F!0,w^2,w^2,w^2,F!0,w^2,F!0,F!0,w^2,F!1,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,w^2,w,F!0,F!0,w,F!1,w,F!1,w^2,w,F!0,w,F!1,F!1,w,F!0,F!0,w,F!0,F!1,F!0,F!0,F!1,w,w,F!1,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w^2,F!0,w^2,F!0,F!0,F!1,F!1,F!0,F!1,w,w^2,w,w^2,w,w^2,F!0,w,F!1,w,F!1,F!0,w^2,w^2,F!0,F!1,F!1,F!1,F!1,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!1,F!0,F!1,w^2,F!0,F!0,w,F!1,w^2,F!0,w^2,F!0,w^2,w^2,F!0,w,w^2,F!0,w,w,w,F!0,F!1,w,w,w,F!1,F!1,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w^2,F!1,F!0,F!0,F!0,F!0,w^2,F!0,w,F!1,F!0,w,w,F!0,F!1,w^2,w^2,F!1,w,w,F!0,w^2,F!0,w^2,F!1,F!1,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,F!1,F!0,F!1,w,F!1,F!0,F!0,F!0,F!0,F!0,F!1,F!1,w^2,F!1,w^2,w,w^2,F!1,F!0,F!0,F!0,F!0,F!1,F!1,w,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,w^2,F!1,F!1,w,w^2,w^2,F!1,F!1,w,w,F!0,w^2,w,w,w^2,F!1,w,F!0,F!0,F!0,F!1,F!0,F!1]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 42 and Dimension(Hout) eq 7;
assert Dimension(Cout)-Dimension(Hout) eq 8 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 20;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE SQ12",lo,hi;
assert lo eq 15 and hi eq 15;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 15};
QCExamples["SQ12"]:=rec<QCFormat|Id:="SQ12",Ingredients:=<D1,D2>,
IngredientLabels:=<"I17_m3_p0_1","aux_m3_ell1_l2">,
IngredientParameters:=<[39,15,13,5],[3,2,2,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[42,8,15,20],OutputHull:=7,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[147]>;
for PaperNo in QCExamples["SQ12"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="SQ12";
end for;
print "VERIFIED QC-X4 SQ12";

// NQ02: I18_m3_snone_u0, aux_m3_ell1_l1; lambda=1.
InputPolys1:=[[P!(1+x^2),P!(w*x^2),P!(w^2*x^2),P!(x),P!(x+w*x^2),P!(w^2*x+x^2),P!(w*x),P!(x^2),P!(w*x+x^2),P!(w^2*x+w*x^2),P!(w*x),P!(w*x^2),P!(0),P!(w*x+x^2),P!(w*x^2),P!(w^2*x+x^2)],[P!(x^2),P!(1+x^2),P!(w*x+w^2*x^2),P!(w*x+x^2),P!(x+x^2),P!(x+w*x^2),P!(w^2*x+x^2),P!(w^2*x+w*x^2),P!(x),P!(w*x+w*x^2),P!(w^2*x+x^2),P!(x+w^2*x^2),P!(w^2*x+w^2*x^2),P!(w^2*x+w^2*x^2),P!(x^2),P!(x+w^2*x^2)],[P!(x^2),P!(w^2*x^2),P!(1+x+x^2),P!(w*x+w*x^2),P!(w^2*x),P!(w*x),P!(w^2*x+w*x^2),P!(x^2),P!(x+w*x^2),P!(w*x),P!(0),P!(x+x^2),P!(w^2*x),P!(w^2*x),P!(w*x+x^2),P!(w^2*x^2)],[P!(x^2),P!(w*x^2),P!(x+x^2),P!(1+w*x),P!(w*x^2),P!(w*x+w*x^2),P!(x),P!(x^2),P!(0),P!(w^2*x^2),P!(x+w*x^2),P!(w*x+x^2),P!(w^2*x+w*x^2),P!(w*x),P!(w*x+w^2*x^2),P!(0)],[P!(x^2),P!(w^2*x^2),P!(x^2),P!(x^2),P!(1+w^2*x+w*x^2),P!(w^2*x+w^2*x^2),P!(w*x^2),P!(x+x^2),P!(w*x+x^2),P!(w^2*x+w*x^2),P!(w*x+w^2*x^2),P!(x),P!(w*x+x^2),P!(x+w^2*x^2),P!(w*x+w*x^2),P!(x+w*x^2)],[P!(0),P!(0),P!(w^2*x+w^2*x^2),P!(w*x^2),P!(w^2*x+w*x^2),P!(1+x+x^2),P!(w*x+w^2*x^2),P!(w*x+w*x^2),P!(w^2*x+w^2*x^2),P!(x^2),P!(w*x+w^2*x^2),P!(w^2*x+w^2*x^2),P!(w*x^2),P!(w*x+w^2*x^2),P!(w*x+w*x^2),P!(w*x+w^2*x^2)],[P!(0),P!(w*x^2),P!(x),P!(w^2*x+w*x^2),P!(x+w^2*x^2),P!(w^2*x^2),P!(1+w^2*x+x^2),P!(x+w^2*x^2),P!(x+x^2),P!(w^2*x^2),P!(w*x+w^2*x^2),P!(w^2*x^2),P!(x),P!(x^2),P!(w^2*x+x^2),P!(w*x)],[P!(w*x^2),P!(x^2),P!(0),P!(w*x),P!(w^2*x^2),P!(w^2*x),P!(x+w^2*x^2),P!(1+w^2*x+w*x^2),P!(x+x^2),P!(w^2*x),P!(x+w^2*x^2),P!(w*x+w*x^2),P!(w^2*x^2),P!(w^2*x^2),P!(0),P!(x+w*x^2)]];
InputPolys2:=[[P!(1+x+x^2)]];
m:=3;lambda:=1;
G1:=QCMatrix(InputPolys1,m);G2:=QCMatrix(InputPolys2,m);D1:=LinearCode(G1);D2:=LinearCode(G2);
assert Length(D1) eq 48 and Dimension(D1) eq 18;
assert MinimumWeight(D1) eq 18 and Dimension(D1 meet HermitianDual(D1)) eq 6;
assert Length(D2) eq 3 and Dimension(D2) eq 1;
assert MinimumWeight(D2) eq 3 and Dimension(D2 meet HermitianDual(D2)) eq 0;
DomainPolys:=[P!(1+x+x^2),P!(0),P!(0),P!(0),P!(0),P!(0),P!(0),P!(w^2+w^2*x+w^2*x^2),P!(w+w*x+w*x^2),P!(0),P!(1+x+x^2),P!(0),P!(0),P!(1+x+x^2),P!(w+w*x+w*x^2),P!(1+x+x^2)];
ImagePolys:=[P!(1+x+x^2)];
DomainOrbit:=QCMatrix([DomainPolys],m);ImageOrbit:=QCMatrix([ImagePolys],m);
W1:=ZeroMatrix(F,0,48);W2:=ZeroMatrix(F,0,3);
for j in [1..m] do
  if Rank(VerticalJoin(W1,Matrix([DomainOrbit[j]]))) gt Nrows(W1) then
    W1:=VerticalJoin(W1,Matrix([DomainOrbit[j]]));W2:=VerticalJoin(W2,Matrix([ImageOrbit[j]]));
  end if;
end for;
assert Nrows(W1) eq lambda and Rank(W1) eq lambda and Rank(W2) eq lambda;
assert W1*Dag(W1) eq W2*Dag(W2) and Rank(W1*Dag(W1)) eq lambda;
assert RowSpace(W1) subset RowSpace(G1) and RowSpace(W2) subset RowSpace(G2);
phi:=X4Phi(W1,W2);
for j in [1..m] do assert phi(DomainOrbit[j]) eq ImageOrbit[j];end for;
for u in Rows(W1) do assert phi(QCShift(u,16)) eq QCShift(phi(u),1);end for;
U1:=D1 meet HermitianDual(LinearCode(W1));U2:=D2 meet HermitianDual(LinearCode(W2));
A1:=GeneratorMatrix(U1);A2:=GeneratorMatrix(U2);
Gout:=ConstructionX4(GeneratorMatrix(D1),GeneratorMatrix(D2),A1,A2,W1,W2);
Cout:=LinearCode(Gout);Hout:=Cout meet HermitianDual(Cout);
RecordedOutput:=Matrix(F,18,51,[
F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!1,w^2,w,F!0,w,w^2,w,F!0,F!0,w,F!0,w^2,F!1,w,w^2,F!0,w,F!1,F!0,F!1,F!1,w,F!0,w,F!0,F!1,w,F!1,w,w,w,
F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,w,F!1,F!1,w^2,w^2,F!1,w,w^2,F!1,w^2,w^2,F!0,F!1,F!1,F!1,w^2,F!1,F!1,w,F!1,w,F!0,w,F!1,w^2,w^2,w^2,F!1,w^2,w^2,w^2,w^2,
F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,w^2,w,w^2,F!0,F!1,w,F!0,F!1,w^2,w^2,w,F!0,F!1,w^2,F!1,w,F!0,F!0,w,F!1,w,F!0,F!0,F!1,F!0,F!0,F!1,w^2,w^2,w^2,w^2,
F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,F!0,w,F!1,F!0,F!0,F!0,F!1,w,w^2,w,w,F!0,F!1,w,F!1,F!0,w,w,F!0,F!1,F!0,w^2,w,F!1,w,F!0,w^2,F!0,F!1,F!1,F!1,
F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,w^2,F!0,F!1,w,w^2,w,F!1,w,F!1,w,F!1,F!1,w^2,F!1,F!1,w,w^2,w,F!1,F!1,w,w^2,F!0,F!1,w^2,w,w,w^2,w^2,w^2,
F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!0,w^2,F!1,w,w,w^2,F!0,w,w^2,F!0,w,w,w,F!0,F!0,w^2,w,w,F!1,w^2,w,w^2,F!1,w^2,w^2,w,w^2,w,w^2,F!1,F!1,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,F!1,F!0,w^2,F!1,F!1,F!0,w,F!0,F!1,F!0,w^2,w,F!0,w,F!0,w,w^2,w^2,F!1,w^2,F!1,w^2,w^2,w^2,F!0,F!1,F!1,F!0,F!0,F!0,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!0,w^2,F!1,w^2,F!1,w^2,F!1,w,F!0,F!0,F!0,F!1,w,F!1,F!0,F!0,w^2,F!0,w^2,w,F!1,F!0,w^2,w,w^2,w^2,F!0,w,F!0,F!0,F!0,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,w^2,F!1,w^2,w,F!1,w^2,w^2,w,w^2,w^2,F!1,w,w,F!0,w,w,w,w^2,F!1,F!0,w^2,w,F!1,w^2,F!1,F!1,w,w,F!0,w^2,w^2,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w^2,w,w,F!1,F!1,w,w,w^2,w,F!1,F!0,w,F!1,F!0,w,w^2,F!0,F!1,w^2,F!1,w^2,F!1,w,F!1,w,w^2,F!1,w^2,w^2,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w,F!0,w^2,F!1,F!0,w^2,w,F!0,w,F!1,F!1,w^2,F!0,F!1,F!1,F!1,F!1,w,F!0,F!1,F!0,F!1,F!1,F!1,F!0,F!1,w^2,F!0,F!1,F!0,w,w,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!0,w^2,F!1,F!0,w^2,F!0,w,F!1,w,w,F!1,w^2,w^2,w^2,w,w^2,w,F!1,F!0,F!1,F!1,F!1,F!0,w^2,F!1,w,F!1,w,w,F!0,w^2,w^2,w^2,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w,w,w,w^2,w,F!1,w^2,w,w,w^2,w^2,F!0,F!1,F!0,F!0,w,w^2,F!1,F!1,F!0,w,w,w^2,w^2,w,F!0,F!0,w^2,w,w,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,F!1,w,w,F!0,w^2,F!1,w,F!0,F!0,F!1,F!0,F!1,w,w,w^2,F!0,F!1,F!1,F!0,F!0,F!1,w^2,F!1,F!1,F!0,F!0,F!0,w^2,F!1,F!0,F!1,F!1,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,F!0,F!0,w,F!1,F!0,F!1,w^2,F!1,F!0,F!1,F!0,F!1,F!1,F!1,F!0,w,w,w,F!1,F!0,w^2,F!0,w,F!1,F!0,F!1,F!1,F!0,w^2,w,w,F!1,F!1,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,F!0,w^2,w^2,w,F!1,F!0,w^2,w,F!1,F!0,F!0,F!1,F!0,w,w^2,F!1,w,F!0,F!1,w^2,F!0,w^2,w^2,F!1,F!0,F!1,F!0,w^2,F!1,w^2,F!0,w,w,w,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,F!0,w^2,w^2,w,F!0,w^2,w^2,w,F!1,w^2,F!0,w^2,F!1,w^2,w,F!1,w,w^2,w^2,w,w^2,F!0,F!0,F!0,F!0,F!1,w,F!0,w,w^2,w,F!1,F!1,F!1,
F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!0,F!1,w^2,w,F!1,w^2,w^2,F!1,F!1,w^2,w,w,F!1,F!1,w,F!0,w^2,w,F!1,F!0,w,F!0,w^2,F!1,F!1,w,F!1,w^2,F!0,w^2,F!1,w^2,w^2,w^2,w^2]);
assert Cout eq LinearCode(RecordedOutput);
assert Length(Cout) eq 51 and Dimension(Hout) eq 7;
assert Dimension(Cout)-Dimension(Hout) eq 11 and Length(Cout)-Dimension(Cout)-Dimension(Hout) eq 26;
dclass:=MinimumWeight(Cout:MaximumTime:=10);lo,hi:=MinimumWeightBounds(Cout);
print "QC_DISTANCE NQ02",lo,hi;
assert lo eq 18 and hi eq 18;
minwords:=MinimumWords(Cout:NumWords:=100,MaximumTime:=5);
assert exists(v){v:v in minwords|not v in Hout and Weight(v) eq 18};
QCExamples["NQ02"]:=rec<QCFormat|Id:="NQ02",Ingredients:=<D1,D2>,
IngredientLabels:=<"I18_m3_snone_u0","aux_m3_ell1_l1">,
IngredientParameters:=<[48,18,18,6],[3,1,3,0]>,
PolynomialGenerators:=<InputPolys1,InputPolys2>,ShiftLength:=m,Lambda:=lambda,
MatchedDomain:=W1,MatchedCodomain:=W2,Phi:=phi,DomainGenerator:=DomainOrbit[1],ImageGenerator:=ImageOrbit[1],
DomainPolynomials:=DomainPolys,ImagePolynomials:=ImagePolys,Unpaired1:=A1,Unpaired2:=A2,
Output:=Cout,OutputParameters:=[51,11,18,26],OutputHull:=7,
OutputGenerator:=GeneratorMatrix(Cout),Witness:=v,DistanceType:="exact",PaperRows:=[148]>;
for PaperNo in QCExamples["NQ02"]`PaperRows do
  assert not IsDefined(PaperSourceIds,PaperNo);PaperSourceIds[PaperNo]:="NQ02";
end for;
print "VERIFIED QC-X4 NQ02";
assert #Keys(QCExamples) eq 32;print "VERIFIED ALL 32 QC-X4 EXAMPLES";
