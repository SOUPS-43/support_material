#!/bin/bash

./getParametersOfIptablesFile.sh $1 > parametersFile.txt;
./actualSize.sh;
./getTableOfMappedSymbols.sh $1 > tableOfMappedSymbols.txt;
./DLKeysSubstitution.sh tableOfMappedSymbols.txt $1 > inputForCalculatingDLDistance.txt;
./calculateDLDistance.sh;
./semanticSimilarityCoefficient.sh;
./numberOfJumps.sh $1 > numberOfJumps.txt;
./numberOfComments.sh $1 > numberOfComments.txt;

awk '{size+=$1} END {printf "%.2f",size}' size.txt > tempSize.txt;
egrep -v "^#|^:" "$1" | egrep -oh "(^-\S+)" |wc -l | sed -e $'s/ //g' > numberOfRules.txt;

echo -e 'Size \tNumber of Jumps \tNumber of Comments \tNumber of Rules' > tmptmp.txt
paste tempSize.txt numberOfJumps.txt numberOfComments.txt numberOfRules.txt >> tmptmp.txt
cat tmptmp.txt | column -s $'\t' -t > finalResult.txt

rm -rf tmptmp.txt tempSize.txt SSCtemp.txt numberOfRules.txt numberOfJumps.txt numberOfComments.txt

