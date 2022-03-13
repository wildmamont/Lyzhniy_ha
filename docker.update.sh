#!/bin/bash

echo Pull update
PULL=`docker pull homeassistant/raspberrypi3-homeassistant:stable`
#PULL=`docker pull homeassistant/raspberrypi3-homeassistant:2021.6.6`

RETURN=$?

if [ "$RETURN" -eq "0" ] ; then 
   UPTO=`expr match "$PULL" '.*\(Image.is.up.to.date\).*'`
   if [ "$UPTO" == "Image is up to date" ]; then
     echo $UPTO
     exit $RETURN
    fi  
 else
  echo $PULL
fi

echo exit

sleep 15
echo Stop
docker stop home-assistant
#docker stop portainer
sleep 5
echo Remove 
docker rm home-assistant
#docker rm portainer
sleep 5
echo  Run
/home/homeassistant/docker.hass.sh
sleep 120
#docker image prune -a -f
