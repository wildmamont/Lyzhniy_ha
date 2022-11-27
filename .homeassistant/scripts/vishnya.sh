#!/bin/bash
. /config/scripts/secure/set_vishnya_llt.sh
for i in '28_3c01b5560bc5_temperature' '28_3c01b55646ad_temperature' '28_3c01b5568add_temperature' '28_3c01b556abd9_temperature' '28_3c01b556dd86_temperature' '28_3c01b5563c0e_temperature' '28_3c01b556ecd0_temperature' '28_3c01b5562324_temperature' 
do
curl -s --connect-timeout 10  -o /tmp/sensorf.txt --location --request GET "$HASS_HOST:8123/api/states/sensor.$i" \
--header "Authorization: Bearer $HASS_LLT" \
--header 'Content-Type: application/json'
RETVAL=$?
#echo $i $RETVAL
if [ $RETVAL -eq 0 ] 
   then
grep 'entity_id' /tmp/sensorf.txt
RETVAL=$?
#echo $i $RETVAL
if [ $RETVAL -eq 0 ] 
   then

  cp /tmp/sensorf.txt /config/sensors/$i.json
fi
fi

done
 