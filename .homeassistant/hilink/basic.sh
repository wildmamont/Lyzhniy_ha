curl -s -o /tmp/session_token.xml  -v http://192.168.20.44:8080/api/webserver/SesTokInfo
SESSION_ID=`cat /tmp/session_token.xml|grep SessionID | sed -E "s/.*SessionID=([^<]*)<.*/\1/"`
TOKEN=`cat /tmp/session_token.xml|grep TokInfo | sed -E "s/.*TokInfo>([^<]*)<.*/\1/"`

curl -o device_basic_information.xml -s -v --cookie "SessionID=$SESSION_ID"  http://192.168.20.44:8080/api/device/basic_information
