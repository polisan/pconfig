#!/bin/bash
CWD=`dirname $0`
CONFIG_FILE="$CWD/sequence.conf"
TEMP_FILE="/tmp/hosts.`date +'%Y%m%d%H%M'`"
while read line; do
    cat $CWD/hosts.$line >> $TEMP_FILE
done < $CONFIG_FILE

sed -i -e "s///" $TEMP_FILE

mv $TEMP_FILE /etc/hosts



