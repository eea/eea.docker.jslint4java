#!/bin/sh
set -e

if [ "$1" = "jslint" ]; then
  JSFILES=`find /code -regex ".*\.js" ! -path "*/documentation/*" -not -exec grep -H -E -o -c "jslint:disable" {} \; | grep ":0$" | sed s/:0//g`
  java -jar /jslint4java.jar --report xml $JSFILES
else
  exec "$@"
fi
