#!/bin/bash

if [[ -z $1 ]]; then
    echo "You need to pass a path to mount"
    exit;
fi;

name='php'
version='koolserve/php'
path=$1

if [[ $2 == "true" ]]; then
    version='koolserve/php:devel'
    docker build -t $version .
fi;

docker rm -f $name
docker run -d \
    --restart always \
    --name $name -p 9000:9000 \
    -v $path:/var/www/html \
    --link percona:percona \
    $version
docker logs -f $name