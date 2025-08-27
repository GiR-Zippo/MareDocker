#!/bin/bash

echo Docker compose script for mare
echo set your enviroment variables in compose/.env

echo "Be aware these are barebone configs. For https usage you have to figure out by your self!"

echo "Select proxy type: (v)arnish (n)ginx:"

read -rsn1 input
if [ "$input" = "v" ]; then
    docker compose -f compose/mare-varnish.yml -p standalone up
fi
if [ "$input" = "n" ]; then
    docker compose -f compose/mare-nginx.yml -p standalone up
fi