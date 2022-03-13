curl -s -o session_token.xml  -v http://192.168.8.1/api/webserver/SesTokInfo
SESSION_ID=`cat session_token.xml|grep SessionID | sed -E "s/.*SessionID=([^<]*)<.*/\1/"`
TOKEN=`cat session_token.xml|grep TokInfo | sed -E "s/.*TokInfo>([^<]*)<.*/\1/"`

echo $SESSION_ID


curl -s -o sms_list.xml  -X POST "http://192.168.8.1/api/sms/sms-list" --cookie "SessionID=$SESSION_ID" -H "__RequestVerificationToken: $TOKEN" -H "Content-Type: text/xml" -d "
<request><PageIndex>1</PageIndex><ReadCount>5</ReadCount><BoxType>1</BoxType><SortType>0</SortType><Ascending>0</Ascending><UnreadPreferred>1</UnreadPreferred></request>" 

#curl  -X POST  -H "Content-Type: text/xml" -s -v --cookie "SessionID=$SESSION_ID" -d "<request><PageIndex>1</PageIndex><ReadCount>20</ReadCount><BoxType>1</BoxType><SortType>0</SortType><Ascending>0</Ascending><UnreadPrefe
#rred>1</UnreadPreferred></request>"  http://192.168.8.1/api/sms/sms-list
