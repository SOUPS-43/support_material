#!/bin/bash

egrep -v "^#|^:" "$1" | egrep -oh "\s(-j)\s\S+|(^-j)\s\S+|\s(-g)\s\S+|(^-g)\s\S+|\s(--jump)\s\S+|(^--jump)\s\S+|\s(--goto)\s\S+|(^--goto)\s\S+" | egrep -v "ACCEPT|DROP|REJECT|LOG|MARK|DNAT|SNAT|MASQUERADE|REDIRECT|NLOG|CONNMARK|TCPMSS" | wc -l | sed -e $'s/ //g' 
