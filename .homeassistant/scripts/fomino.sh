#!/bin/bash
. /config/scripts/secure/set_fomino_llt.sh
### 28_3c01b5562324_temperature
 
for i in '28_e0505c050000_temperature' '28_eb675a050000_temperature' 'sonoff_th1_mqtt_temperature' 'sonoff_th1_mqtt_humidity' 'sonoff_th2_mqtt_temperature' 'sonoff_th2_mqtt_humidity' '28_3c01b55640a2_temperature' '28_0000055a67eb_temperature' 'sht30_14e21d_temperature' 'sht30_14e21d_humidity' 'tasmota_148a24_temperature' 'tasmota_148a24_humidity' 'tasmota_148a24_dewpoint'
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
 