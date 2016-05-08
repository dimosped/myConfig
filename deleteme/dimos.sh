#!/usr/bin/env bash

pgrep java | xargs -I {} jstack {} > tmpA.log

grep tid tmpA.log | awk -F'nid=' '{print $2"--"$1}' | awk '{print $1"--"$0}' | awk -F'\"' '{print $2"--"$1}' | awk -F'--' '{print strtonum($2)"\t "$1}' | sort -n  > tmpA.log

#top -H -b -n 1 | grep java | sort -n | cut -d' ' -f 1 | grep -v -e '^$' > tids.log
#top -H -b -n 1 | grep java | sort -n | grep -v -e '^$' | awk '{print $1"\t"$9"\t"$10}' | sort -n  > tmpB.log

#join <(cat tmpA.log) <(top -H -b -n 1 | grep java | sort -n | grep -v -e '^$' | awk '{print $1"\t"$9"\t"$10}' | sort -n)

