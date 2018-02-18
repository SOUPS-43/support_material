#!/bin/bash

awk '{if(FNR==NR) {a[FNR]=$1;b[FNR]=$2}
	else{
		for(i=1;i<=NF;i++)
			for(j in a)						                                if($i==a[j]) {				        					$i=b[j]
														}							print $0							       
											}								
								   		}' semanticSimilarityCoefficient.txt DLDistance.txt > SSCtemp.txt;
										awk '{if(FNR==NR) {a[FNR]=$1}
										        else {								                	print $1*a[FNR]								}        
}' SSCtemp.txt actualSize.txt > size.txt
