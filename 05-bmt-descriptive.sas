%let cdir_path=.;   /* Path to current directory */ 

filename bmtdata "&cdir_path\inc\create-bmt-data.sas";
%include bmtdata;

options nocenter;
ods html file = "05-bmt-descriptive.html" (title ="BMT descriptive")
         path = "&cdir_path\reports";
         
Title "Contents of BMT data";
proc contents data=bmt;
run;

Title "BMT data. First 10 observations";
proc print data=bmt(obs=10);
run;

Title "Frequencies for selected variables";
proc freq data = bmt;
tables group status;
run;

title "Descriptive stats for t variable by censored status";
proc sort data=bmt;
by status;
run;

proc means data = bmt;
var t;
by status;
run;

ods html close;
