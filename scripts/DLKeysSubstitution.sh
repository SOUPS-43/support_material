#!/bin/bash

awk '{if(FNR==NR) {a[FNR]=$1;b[FNR]=$2}
	else{
		for(i=1;i<=NF;i++)
			for(j in a)
				if($i==a[j]) {
					$i=b[j]
				}
	print $0
	}
      }
      ' tableOfMappedSymbols.txt parametersFile.txt | sed 's/-//g' | sed 's/ //g'
