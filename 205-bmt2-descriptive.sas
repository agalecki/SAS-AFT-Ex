%let cdir_path=.;   /* Path to current directory */ 

filename bmt2data "&cdir_path\inc\create-bmt2-data.sas";
%include bmt2data;

options nocenter;
ods html file = "205-bmt2-descriptive.html" (title ="BMT2 descriptive")
         path = "&cdir_path\reports2";
         
Title "Contents of BMT2 data";
proc contents data=bmt2;
run;

Title "BMT2 data n=43";
proc print data=bmt2;
run;

Title "Frequencies for selected variables";
proc freq data = bmt2;
tables hodgkins allo status;
tables hodgkins*allo/ nopercent; 
run;

title "Descriptive stats for t variable by censored status";
proc sort data=bmt2;
by status;
run;

proc means data = bmt2;
var time;
by status;
run;

ods html close;
