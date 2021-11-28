%let cdir_path=.;   /* Path to current directory */ 

filename bmtdata "&cdir_path\inc\create-bmt-data.sas";
%include bmtdata;

options nocenter;
ods html file = "05-bmt-descriptive.html" (title ="BMT descriptive")
         path = "&cdir_path\reports";
         
Title "Contents of BMT data";
proc contents data=bmt;
run;

Title "BMT data n=43";
proc print data=bmt;
run;

Title "Frequencies for selected variables";
proc freq data = bmt;
tables hodgkins allo status;
tables hodgkins*allo/ nopercent; 
run;

title "Descriptive stats for t variable by censored status";
proc sort data=bmt;
by status;
run;

proc means data = bmt;
var time;
by status;
run;

ods html close;
