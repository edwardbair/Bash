#!/bin/sh
# summarize max memory usage by day from sar
# find only sa files
for i in `ls -t /var/log/sysstat/ | egrep 'sa[0-9]+'`
do
sadf -dt /var/log/sysstat/$i -- -r | tail --lines=+1| \
awk -F ';' -v max=0,dt=0 '{if($7>max&& ($7 ~ /^[0-9]+/)){max=$7;dt=$3}}END{printf "Max memory used: %s%% at %s\n", max,dt} '

done
