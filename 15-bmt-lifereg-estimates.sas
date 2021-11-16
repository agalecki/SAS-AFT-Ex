%let cdir_path=.;   /* Path to current directory */ 

filename bmtdata "&cdir_path\inc\create-bmt-data.sas";
%include bmtdata;

options nocenter;
ods html file = "15-bmt-lifereg-estimates.html" (title ="BMT estimates")
         path = "&cdir_path\reports";
         
Title "a: Estimates for Weibull model";
proc lifereg data=bmt outest=modela covout;
   class group;
   a: model t*status(0)= group xb /dist = weibull;
run;

Title "b: Estimates for log-normal";
proc lifereg data=bmt outest=modelb covout;
  class group;
   b: model t*status(0)= group xb / dist=lnormal;
run;

data models;
   set modela modelb;
run;

proc print data=models;
   id _model_;
   title 'Estimates for Fitted Models';
run;

ods html close;
