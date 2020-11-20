param nRows;
set Rows:= 1..nRows;
param cashierCount;
set Cashiers:=1..cashierCount;
param cashierLength;
set ProductGroups;
param space{ProductGroups};
var ProductInRow{ProductGroups,Rows} binary;
var CashiersInRows{Rows,Cashiers} binary;
var redundant{Rows}>=0;

s.t. MindenSorbanMaxEgyKassza {r in Rows}:
sum{c in Cashiers} CashiersInRows[r,c]<=1;
s.t. MindenTermekCsakEgySorban {p in ProductGroups}:
sum{r in Rows} ProductInRow[p,r]=1;

s.t. Sorhossz{r in Rows}:
sum{p in ProductGroups,c in Cashiers} redundant[r]=space[p]+CashiersInRows[r,c]*cashierLength;

minimize Lengthh:redundant;

data;

param nRows         :=   3;
param cashierCount  :=   1;
param cashierLength := 2.5;

set ProductGroups :=  Group1 Group2 Group3 Group4 Group5 Group6 Group7 Group8;

param space :=
Group1	0.04
Group2	0.62
Group3	0.13
Group4	1.28
Group5	0.56
Group6	0.21
Group7	1.39
Group8	1.47
;
end;