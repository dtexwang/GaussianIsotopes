%chk=methane_3.chk
# opt freq=noraman rb3lyp/6-311g geom=Check Guess=Read freq=ReadIsotopes

Methane(65), 12CH2D2

0 1

298.15 1.0
12
2
2
1
1

