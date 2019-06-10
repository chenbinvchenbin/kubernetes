#!/bin/bash
PUSH=$1

push() {
for i in `cat /tmp/img.txt`
do 
docker pull $i
docker tag $i  ${PUSH}$i
docker push ${PUSH}$i
echo "`date '+%F %T' ` ${PUSH}$i" >> /tmp/ok.txt
docker rmi ${PUSH}$i $i
done
}

push