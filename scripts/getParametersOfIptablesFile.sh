#!/bin/bash

egrep -v "^#|^:" "$1" | egrep -oh "\s(-\S+)|\s(--\S+)|(^-\S+)" | tr '\n' ' ' | sed -e $'s/-A/\\\n-A/g' | grep -v "^$"
