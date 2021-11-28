%let cdir_path=.;   /* Path to current directory */ 

filename bmtdata "&cdir_path\inc\create-bmt-data.sas";
%include bmtdata;

/* 
Based on https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/grstatug/p0cmojsdkiab8cn1k2qk3rp3a8s0.htm 
*/

%let report_name= 10-bmt-desc-plot;

options nocenter;
ods graphics / reset imagename="&report_name" outputfmt=png;
ods _all_ close;

ods html file  = "&report_name..html" (title = "BMT desc-plot")
         path  = "&cdir_path\reports" 
         gpath = "&cdir_path\reports" (URL = none)         
         ;
         
*ods graphics on;

/*
   product-limit estimates of infection time
   based on https://support.sas.com/resources/papers/proceedings10/252-2010.pdf
*/
proc lifetest data=bmt
plots=survival(nocensor cb=hw cl strata=panel atrisk=0 to 1000 by 50);
strata hodgkins;
time time*status(0);

run;
* ods graphics off;

ods html close;
