#!/bin/sh

param=$1

case ${param} in
    start ) vagrant up --provider=virtualbox ;;
    stop ) vagrant halt ;;
    restart ) vagrant reload ;;
    * ) echo "${0} [start | stop | restart]..." ;;
esac

