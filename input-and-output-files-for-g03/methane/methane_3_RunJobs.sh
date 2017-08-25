#!/usr/bin/bash

# Enter Gaussian first >>setup gaussian
# then run this script >>sh SCRIPTNAME.sh
g03 < methane_61_3.com > methane_61_3.out
g03 < methane_62_3.com > methane_62_3.out
g03 < methane_63_3.com > methane_63_3.out
g03 < methane_64_3.com > methane_64_3.out
g03 < methane_65_3.com > methane_65_3.out
rm methane_3.chk
