
PROC IMPORT OUT= scoresImport DATAFILE= "C:\data\scores" 
     DBMS=xlsx REPLACE;
     SHEET="scores"; 
     GETNAMES=YES;
RUN;
data scores(keep=score playerName);
set scoresImport; 
array Columns2Rows {*} _NUMERIC_ ; 
do i = 1 to dim(Columns2Rows); 
/*Create a column of variable names and first row*/
playerName = vname(Columns2Rows {i}) ;
score = Columns2Rows{i};
output; 
end;
RUN;

