export SESSION_ID=`curl -s -v http://192.168.8.1/html/index.html 2>&1 |grep -E SessionID|sed -E "s/.*SessionID=([^;]*);.*/\1/"`
curl -s -v --cookie "SessionID=$SESSION_ID" -H "Accept: application/json" -H "Content-Type: application/json" "http://192.168.8.1/$1"
