#!/bin/bash
cd $(dirname $0)
fn=$(mktemp)
(while read domain; do 

IFS=':' split=($domain)

if [ ${#split[@]} -gt 1 ]; then
	host="${split[0]}"
	port="${split[1]}"
fi

	echo -e "$domain\t$(./ssl_cert_check.sh expire $host $port)" >> $fn

done) < domains.txt 

mv $fn result.cache
