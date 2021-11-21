data bmt2;
/* Klein, Moschberger book p.12 */
input allo hodgkins time status kscore wtime;
label
  allo     = "Transplant: 1 = allogenic. 0= autologus (0)"
  hodgkins = "Hodgkins: 1= Hodgkins disease, 0= Non-Hodgkins lymphoma"
  time     = "Leukemia-free survival (in days)"
  status   = "Status: 1=dead or relapsed , 0= otherwise"
  kscore   = "The pretransplant Karnofsky score"
  wtime    = "Waiting time to transplant (in months)"
  
cards;
 1 0   28 1  90  24
 1 0   32 1  30   7 
 1 0   49 1  40   8 
 1 0   84 1  60  10
 1 0  357 1  70  42
 1 0  933 0  90   9
 1 0 1078 0 100  16
 1 0 1183 0  90  16
 0 0 1560 0  80  20
 1 0 2114 0  80  27
 1 0 2144 0  90   5
 
 0 0   42 1  80 19
 0 0   53 1  90 17
 0 0   57 1  30  9
 0 0   63 1  60 13
 0 0   81 1  50 12
 0 0  141 1 100 11
 0 0  176 1  80 38
 0 0  210 0  90 16
 0 0  252 1  90 21
 0 0  476 0  90 24
 0 0  524 1  90 30
 0 0  924 1  90 39
 0 0 1037 0  90 84

 
 1 1    2 1  20  34
 1 1    4 1  50  28
 1 1   72 1  80  59
 1 1   77 1  60 102
 1 1   79 1  70  71
 
 0 1   30 1  90 73
 0 1   36 1  80 61
 0 1   41 1  70 34
 0 1   52 1  60 18
 0 1   62 1  90 40
 0 1  108 1  70 65
 0 1  132 1  60 17
 0 1  180 0 100 61
 0 1  307 0 100 24
 0 1  406 0 100 48
 0 1  446 0 100 52
 0 1  484 0  90 84
 0 1  748 0  90 171
 0 1 1290 0  90 20
 0 1 1345 0  80 98
;