%let cdir_path=.;   /* Path to current directory */ 

filename bmtdata "&cdir_path\inc\create-bmt-data.sas";
%include bmtdata;

proc sort data =bmt;
by group xb;
run;

data bmt;
  set bmt;
  by group;
  /* variable `control` allows to subset rows in `output` dataset created by `proc lifereg` */ 
  control =0;
  if first.group then control =1; 
  if last.group then control =1;
run;


options nocenter;
ods html file = "20-bmt-lifereg-predicted.html" (title ="BMT predicted")
         path = "&cdir_path\reports";
title "Variale `control` created";
proc contents data=bmt;
run;

Title "a: Weibull model. Predicted values.";
proc lifereg data=bmt;
   class group;
   a: model t*status(0)= group xb /dist = weibull;
      output out=outa quantiles=.1 .5 .9
      std=std p=predtime control=control
      ;
run;

Title "b: Log-normal model. Predicted values";
proc lifereg data=bmt;
  class group;
   b: model t*status(0)= group xb / dist=lnormal;
      output out=outb quantiles=.1 .5 .9 
      std=std p=predtime control=control
      ;
run;

data out;
   set outa outb;
run;

data out1;
   set out;
   ltime=log(predtime);
   stde=std/predtime;
   upper=exp(ltime+1.64*stde); /* 90 pct confidence interval */
   lower=exp(ltime-1.64*stde);
run;

title 'Quantile Estimates and Confidence Limits';
proc print data=out1(drop=t);
   id idx;
run;
title;

ods html close;
