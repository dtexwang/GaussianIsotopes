#!/usr/bin/bash

# Start Gaussian first 
# >> setup gaussian
# 
# Place *.com (input) files in same directory as this script and thermo.pl.
# Put JobNames into JobsQueue.txt, without the *.com extension.
#
# Then run this script 
# >> sh DoJobsGetVibs.sh JobsQueue.txt
#
# Written by D.T. Wang (dtw@mit.edu) on 8/30/2014

FILE=$1

rm -rf "./TRASH"

while read line; do
  if [ -f "./$line.com" ]
    then
      echo "Submitting job to Gaussian03: ./$line.com"
      frunjob="g03 < ./$line.com | tee ./$line.log"
      eval $frunjob
      
      rm thermo.dat
      perl thermo.pl "./$line.log" | tee "./$line.thermo.tsv"
      
      fmovecom="mkdir -p "./completedJobs"; mv "$line.com" ./completedJobs/"
      fmovelog="mkdir -p "./completedJobs"; mv "$line.log" ./completedJobs/"
      fmovevib="mkdir -p "./resVibs"; mv "$line.thermo.tsv" ./resVibs/"
      eval $fmovecom
      eval $fmovelog
      eval $fmovevib
  fi
done <$FILE

mkdir "./TRASH"
mv thermo.dat "./TRASH/"
mv *.chk "./TRASH/"
