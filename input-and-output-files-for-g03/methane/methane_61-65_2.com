$RunGauss
%chk=methane_61-65_2.chk
# opt freq=noraman rb3lyp/6-311g geom=connectivity

Methane(61), 12CH4

0 1
 C                  0.08108108   -2.21621618    0.00000000
 H                  0.43773550   -3.22502619    0.00000000
 H                  0.43775392   -1.71181799    0.87365150
 H                  0.43775392   -1.71181799   -0.87365150
 H                 -0.98891892   -2.21620300    0.00000000

 1 2 1.0 3 1.0 4 1.0 5 1.0
 2
 3
 4
 5
