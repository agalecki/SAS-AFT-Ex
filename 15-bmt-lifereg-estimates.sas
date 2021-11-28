%let cdir_path=.;   /* Path to current directory */ 

filename bmtdata "&cdir_path\inc\create-bmt-data.sas";
%include bmtdata;

%let xvar = allo hodgkins kscore wtime;

options nocenter;
ods html file = "15-bmt2-lifereg-estimates.html" (title ="BMT estimates")
         path = "&cdir_path\reports";

ods exclude all;         
Title "a: Estimates for Weibull model";
proc lifereg data=bmt outest=modela covout;
   a: model time*status(0)=  &xvar /dist = weibull;
run;

Title "b: Estimates for exponential model";
proc lifereg data=bmt outest=modelb covout;
   b: model time*status(0) = &xvar /dist = exponential;
run;

Title "c: Estimates for gamma model";
proc lifereg data=bmt outest=modelc covout;
   c: model time*status(0) = &xvar /dist = gamma;
run;

Title "d: Estimates for log-logistic model";
proc lifereg data=bmt outest=modeld covout;
   d: model time*status(0) = &xvar /dist = llogistic;
run;


Title "e: Estimates for log-normal";
proc lifereg data=bmt outest = modele covout;
   e: model time*status(0)= &xvar / dist=lnormal;
run;
ods exclude none;

data models;
   set modela modelb modelc modeld modele;
run;

proc print data=models (where = (_type_ = "PARMS"));
   id _model_;
   title 'Estimates for Fitted Models';
run;

ods html close;
