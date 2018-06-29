#!/bin/bash

container=$1
containersIds=""

if [$container == ""]
then
	containersIds="$(docker container ls --all | awk '{print $1}' | sed -n '1!p')"
else
        containersIds="$(docker container ls --all | grep $container | awk '{print $1}')"
fi

for id in $containersIds
	do
		docker stop $id 
		echo "Delete do container: $id"
		docker rm $id
	done
