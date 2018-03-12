#!/bin/bash
while read line
 do
  for file in input_files/*.txt
   do
    echo -n "Parameters: ${line} Filename: ${file} Result: "
    python run_test.py -d $line max 5 $file
   done
 done <parameters.txt >results.txt