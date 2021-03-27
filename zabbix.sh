#!/bin/bash
cd $(dirname $0)
if [[ -z $1 || -z $2 ]]; then
	JSON="{ \"data\":["
	SEP=""
	while read domain; do
		JSON=${JSON}"$SEP{\"{#DOMAIN}\":\"${domain}\"}"
		SEP=", "
	done < domains.txt
	JSON=${JSON}"]}"
	echo ${JSON}
	exit 0
fi


DOMAIN=$1
PARAM=$2


ROW=$(cat result.cache | grep -E "^$DOMAIN")

case $PARAM in
	"TTL")
		echo "$ROW" | awk '{print $2;}'
	;;
esac
