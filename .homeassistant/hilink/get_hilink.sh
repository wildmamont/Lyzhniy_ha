curl -s -o /tmp/session_token.xml  -v http://192.168.8.1/api/webserver/SesTokInfo
SESSION_ID=`cat /tmp/session_token.xml|grep SessionID | sed -E "s/.*SessionID=([^<]*)<.*/\1/"`
TOKEN=`cat /tmp/session_token.xml|grep TokInfo | sed -E "s/.*TokInfo>([^<]*)<.*/\1/"`

#curl -o device_basic_information.xml -s -v --cookie "SessionID=$SESSION_ID"  http://192.168.8.1/api/device/basic_information
#curl -o monitoring_status.xml -s -v --cookie "SessionID=$SESSION_ID"  http://192.168.8.1/api/monitoring/status
#curl -o monitoring_trafic-statistics.xml -s -v --cookie "SessionID=$SESSION_ID"  http://192.168.8.1/api/monitoring/traffic-statistics
#curl -o device_information.xml -s -v --cookie "SessionID=$SESSION_ID"  http://192.168.8.1/api/device/information
#curl -o check-notifications.xml -s -v --cookie "SessionID=$SESSION_ID"  http://192.168.8.1/api/monitoring/check-notifications
curl -o /tmp/month_statistics.xml -s -v --cookie "SessionID=$SESSION_ID"  http://192.168.8.1/api/monitoring/month_statistics
cat /tmp/month_statistics.xml|tr -d '\r\n'|sed -E 's/.*CurrentMonthDownload>([^<]+)<.*CurrentMonthUpload>([^<]+).*MonthDuration>([^<]+).*MonthLastClearTime>([^<]+)<.*/{"response": {"CurrentMonthDownload": "\1", "CurrentMonthUpload": "\2", "MonthDuration": "\3", "MonthLastClearTime": "\4"}}/'>/home/homeassistant/.homeassistant/hilink/month_statistics.json

curl -o /tmp/sms-count.xml -s -v --cookie "SessionID=$SESSION_ID"  http://192.168.8.1/api/sms/sms-count
cat /tmp/sms-count.xml |tr -d '\r\n'| sed -E 's/.+LocalUnread>([[:digit:]]+)<.*/{"response": {"LocalUnread": "\1"}}/' >/home/homeassistant/.homeassistant/hilink/sms-count.json


curl -s -o /tmp/session_token.xml  -v http://192.168.20.44:8080/api/webserver/SesTokInfo
