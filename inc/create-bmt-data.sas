
/* Create Bone marrow transplant data */

data bmt;
  set sashelp.bmt;
  idx =_n_;
 
/* xb - artificial covariate. Will be treated as continuous*/
 
 select(group);
  when ("AML-High Risk") xb0= 3; 
  when ("ALL")          xb0= 2;
  when ("AML-Low Risk") xb0=1;
 otherwise;
 end;
  xb = xb0 + 0.1 * rannor(12345);
run;
