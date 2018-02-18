#!/bin/bash

egrep -v "^#|^:" "$1" | egrep -oh "\s(-\S+)|\s(--\S+)|(^-\S+)" | sort | uniq -c | sort -nr | awk 'BEGIN{cur=33;for(n=0;n<256;n++)chr[n]=sprintf("%c",n)}{if(length($2)>2) {print $2,chr[cur];cur++} else {print $2, $2}}'
