data progLang;
input R Python;
diff=R-Python;
cards;
533.52 77.76
 45.73 17.02
264.54 32.89
 53.16 15.32
  9.56 21.99
 14.56 17.93
  1.57  1.14
;
proc univariate data=progLang;
var diff;
run;
