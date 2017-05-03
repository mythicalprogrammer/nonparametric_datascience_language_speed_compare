data langSpeed;
input progproblem $ language $ speed @@;
datalines;
1 R 533.52 1 Python 77.76 1 Julia 2.11
2 R  45.73 2 Python 17.02 2 Julia 1.45
3 R 264.54 3 Python 32.89 3 Julia 1.15
4 R  53.16 4 Python 15.32 4 Julia 0.79
5 R   9.56 5 Python 21.99 5 Julia 1.00
6 R  14.56 6 Python 17.93 6 Julia 1.66
7 R   1.57 7 Python  1.14 7 Julia 1.02
;

proc sort data=langSpeed;
by progproblem;
run;

proc print data=langSpeed double label split= '*' n noobs;


proc rank data=langSpeed out=ranked;
var speed;
by progproblem;
ranks rank;
run;
proc freq data=ranked;
table progproblem*language*rank/noprint cmh;
run;
