#!/bin/bash
#url=$(docker inspect php-test | grep IPA | tail -1 | awk -F\" '{print $4}'
url="127.0.0.1:8080"
status_code=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' $url)
date=`date`

if [ $status_code -eq "200" ]
then
        echo "todo ok $date"
	curl $url
else
	echo "fallo $date"
	exit 1
fi
