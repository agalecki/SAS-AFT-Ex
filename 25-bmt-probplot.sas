%let cdir_path=.;   /* Path to current directory */ 

filename bmtdata "&cdir_path\inc\create-bmt-data.sas";
%include bmtdata;

/* 
Based on https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/grstatug/p0cmojsdkiab8cn1k2qk3rp3a8s0.htm 
*/

%let report_name= 25-bmt-probplot;

Title "xdata for probplot (one row)";
data uxdata;
 allo =1;
 hodgkins =0;
 kscore = 50;
 wtime=10;
 output;
run;


options nocenter;
ods graphics / reset imagename="&report_name" outputfmt=png;
ods _all_ close;

ods html file  = "&report_name..html" (title = "25-BMT probplot")
         path  = "&cdir_path\reports" 
         gpath = "&cdir_path\reports" (URL = none)         
         ;
Title "uxdata";
proc print data=uxdata;
run;

Title "Weibull model with probplot";
proc lifereg data=bmt xdata = uxdata;
   class allo hodgkins;
   a: model time*status(0)= allo hodgkins kscore wtime / dist = weibull;
   probplot  / nodata
       plower=.5
       vref(intersect) = 75
       vreflab = '75 Percent';
   inset;
run;

ods html close;
