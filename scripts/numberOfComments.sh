#!/bin/bash

egrep -n "^#" "$1" | sed -e $'s/:/ /g' | awk 'BEGIN {cur=-1}{if($1-cur > 1){print $1;cur=$1}}' | wc -l | sed -e $'s/ //g'
