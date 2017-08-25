%chk=methane_3.chk
# opt freq=noraman rb3lyp/6-311g geom=Check Guess=Read freq=ReadIsotopes

Methane(62), 13CH4

0 1

298.15 1.0
13
1
1
1
1

