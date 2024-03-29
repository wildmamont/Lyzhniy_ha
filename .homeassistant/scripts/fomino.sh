#!/bin/bash
. /config/scripts/secure/set_fomino_llt.sh
for i in '28_e0505c050000_temperature' '28_eb675a050000_temperature' 'sonoff_th1_mqtt_temperature' 'sonoff_th1_mqtt_humidity' 'sonoff_th2_mqtt_temperature' 'sonoff_th2_mqtt_humidity' '28_3c01b55640a2_temperature' '28_3c01b5562324_temperature' '28_0000055a67eb_temperature' 'sht30_14e21d_temperature' 'sht30_14e21d_humidity' 'tasmota_148a24_temperature' 'tasmota_148a24_humidity' 'tasmota_148a24_dewpoint'
do
curl -s -o /tmp/sensorf.txt --location --request GET "$HASS_HOST:8123/api/states/sensor.$i" \
--header "Authorization: Bearer $HASS_LLT" \
--header 'Content-Type: application/json'
RETVAL=$?
if [ $RETVAL -eq 0 ] 
   then
#cp /tmp/sensorf.txt /tmp/sensorf_$i.txt
cat /tmp/sensorf.txt |grep 'entity_id'|grep -v \"state\":\"unknown\"|grep -v \"state\":\ \"unavailable\"
RETVAL=$?
echo $i $RETVAL
if [ $RETVAL -eq 0 ] 
   then
  cp /tmp/sensorf.txt /config/sensors/$i.json
fi
fi

done
 