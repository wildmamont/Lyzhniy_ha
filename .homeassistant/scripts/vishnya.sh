#!/bin/bash
. /config/scripts/secure/set_vishnya_llt.sh
for i in '28_3c01b5560bc5_temperature' '28_3c01b55646ad_temperature' '28_3c01b5568add_temperature' '28_3c01b556abd9_temperature' '28_3c01b556dd86_temperature' '28_3c01b556ecd0_temperature' 'garage_temperature' 'garage_humidity' 'garage_dewpoint'
do
curl -s --connect-timeout 10  -o /tmp/sensor.$i.txt --location --request GET "$HASS_HOST:8123/api/states/sensor.$i" \
--header "Authorization: Bearer $HASS_LLT" \
--header 'Content-Type: application/json'
RETVAL=$?
#echo $i $RETVAL
if [ $RETVAL -eq 0 ] 
   then
if [ "`grep -Eo 'entity_id' /tmp/sensor.$i.txt`" == "entity_id" ]
 then
echo Found Entity $i
echo `grep -Eo 'unknown' /tmp/sensor.$i.txt`
if [ "`grep -Eo 'unknown' /tmp/sensor.$i.txt`" == "unknown" ] || [ "`grep -Eo 'unavailable' /tmp/sensor.$i.txt`" == "unavailable" ] ; then
echo unknown or unavailable $i
else
#  echo $i
  cp /tmp/sensor.$i.txt /config/sensors/$i.json

fi
fi

fi

done
 