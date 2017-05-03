

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


proc univariate noprint data=progLang;
var diff;
output out=stats n=n_obs mean=mean_all;
run;

proc surveyselect data=progLang out=bootstrap_samples outhits
seed=31415926 method=urs samprate=1 rep=1000;
run;

proc univariate noprint data=bootstrap_samples;
var diff;
by replicate;
output out=bootstrap_replicates mean=mean_diff; 
run;

proc univariate data=bootstrap_replicates;
var mean_diff;
output out=mean_CI pctlpre=CI_95_ pctlpts=2.5 97.5
pctlname=lower upper;
run;

proc print data=mean_CI; 
run;
