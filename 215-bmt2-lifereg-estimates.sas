%let cdir_path=.;   /* Path to current directory */ 

filename bmt2data "&cdir_path\inc\create-bmt2-data.sas";
%include bmt2data;

%let xvar = allo hodgkins kscore wtime;

options nocenter;
ods html file = "215-bmt2-lifereg-estimates.html" (title ="BMT2 estimates")
         path = "&cdir_path\reports2";
         
Title "a: Estimates for Weibull model";
proc lifereg data=bmt2 outest=modela covout;
   a: model time*status(0)=  &xvar /dist = weibull;
run;

Title "b: Estimates for exponential model";
proc lifereg data=bmt2 outest=modelb covout;
   b: model time*status(0) = &xvar /dist = exponential;
run;

Title "c: Estimates for gamma model";
proc lifereg data=bmt2 outest=modelc covout;
   c: model time*status(0) = &xvar /dist = gamma;
run;

Title "d: Estimates for log-logistic model";
proc lifereg data=bmt2 outest=modeld covout;
   d: model time*status(0) = &xvar /dist = llogistic;
run;


Title "e: Estimates for log-normal";
proc lifereg data=bmt2 outest = modele covout;
   e: model time*status(0)= &xvar / dist=lnormal;
run;

data models;
   set modela modelb modelc modeld modele;
run;

proc print data=models;
   id _model_;
   title 'Estimates for Fitted Models';
run;

ods html close;
