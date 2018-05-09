#!/bin/bash

JENKINS_USER=
JENKINS_PASSWORD=
JENKINS_SERVER=
JENKINS_JOB_NAME=
JENKINS_BRANCH_NAME=
JENKINS_TIME_BETWEEN_CALLS=
DEVICE_NO=
SOUND_FAILED=
SOUND_SUCCESS=

lightOn() {
  clewarecontrol -c 1 -d $DEVICE_NO -as $1 1 2>&1
}
lightOff() {
  clewarecontrol -c 1 -d $DEVICE_NO -as $1 0 2>&1
}
allOff() {
  lightOff 0;
  lightOff 1;
  lightOff 2;
}

allOn() {
  lightOn 0;
  lightOn 1;
  lightOn 2;
}

redOn() {
  lightOn 0;
}

yellowOn() {
  lightOn 1;
}

greenOn() {
  lightOn 2;
}

allOn;
while true; do
color=`curl -Ss -u $JENKINS_USER:$JENKINS_PASSWORD $JENKINS_SERVER/job/$JENKINS_JOB_NAME/api/json?pretty=true -k | jq '.jobs[] | select (.name == "$JENKINS_BRANCH_NAME") | .color'`
  state=`echo $color | sed 's/\"//g'`
  if [ "$default" != "$state" ]
  then
    case $state in
      red)          allOff; mpg123 $SOUND_FAILED & redOn;;
      yellow)       allOff; yellowOn;;
      blue)         allOff; mpg123 $SOUND_SUCCESS & greenOn;;
      red_anime)    allOff; yellowOn;;
      yellow_anime) allOff; yellowOn;;
      blue_anime)   allOff; yellowOn;;
      *)            echo "Nothing matched state: $state";;
    esac;
    default=$state
  fi

  sleep $JENKINS_TIME_BETWEEN_CALLS;
done;
