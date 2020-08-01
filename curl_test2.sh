#!/bin/bash
url=$(docker inspect php-test | grep IPA | tail -1 | awk -F\" '{print $4}')
url2="$url:8080"
echo $url2
status_code=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' $url2)
date=`date`

if [ $status_code -eq "200" ]
then
        echo "todo ok $date"
	curl $url2
else
	echo "fallo $date"
	exit 1
fi
