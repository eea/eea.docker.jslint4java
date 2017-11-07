#!/bin/sh
set -e
CMD="$1"

if [[ ${CMD:0:4} = "http" ]]; then
  GIT_SRC=$1
  CMD="jslint"
fi

if [[ ${CMD:0:3} = "git" ]]; then
  GIT_SRC=$1
  CMD="jslint"
fi

if [ ! -z "$GIT_SRC" ]; then
  cd /code
  git clone $GIT_SRC
  if [ ! -z "$GIT_NAME" ]; then
     if [ -z "$GIT_BRANCH" ]; then
       GIT_BRANCH="master"
     fi
     cd $GIT_NAME
     if [ ! -z "$GIT_CHANGE_ID" ]; then
        git fetch origin pull/$GIT_CHANGE_ID/head:$GIT_BRANCH
     fi
     git checkout $GIT_BRANCH
     cd /code
  fi
fi

if [ -z "$REPORT" ]; then
  REPORT="xml"
fi

if [ "$CMD" = "jslint" ]; then
  JSFILES=`find /code -regex ".*\.js" $CUSTOM_FIND ! -path "*/documentation/*" -not -exec grep -H -E -o -c "jslint:disable" {} \; | grep ":0$" | sed s/:0//g`
  java -jar /jslint4java.jar --report $REPORT $JSFILES
else
  exec "$@"
fi
