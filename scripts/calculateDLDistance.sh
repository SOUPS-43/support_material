#!/bin/bash

rm -rf DLDistance.txt
lines=$(<inputForCalculatingDLDistance.txt)
cur=""

for i in $lines; do
	rhino DamerauLevenshtein.js $i $cur >> DLDistance.txt;
	#echo {$i},{$cur}
	cur="$i";
done
