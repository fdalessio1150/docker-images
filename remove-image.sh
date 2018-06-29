#!/bin/bash

imageId=$1

if [$imageId == ""]
then
        echo "Imagem não localizada no docker"
	exit 0
else
        imageId="$(docker image ls --all | grep $imageId | awk '{print $3}')"
fi

for id in $imageId
        do
                echo "Deletar imagem: $id"
                docker rmi $id
        done
