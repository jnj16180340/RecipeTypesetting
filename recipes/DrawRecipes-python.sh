#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for thang in $(ls ./text/*)
do
  echo "$thang"
  python3 ./parseRecipesToLatex.py "$thang"
  done
mv ./text/*.tex ./latex/

for thang in $(ls ./latex/*)
do
  echo "$thang"
  pdflatex -interaction=batchmode "$thang"
  rm *.log
  rm *.aux
  mv *.pdf ./pdf
  done
  
IFS=$SAVEIFS
#python3 parseRecipesToLatex.py 
