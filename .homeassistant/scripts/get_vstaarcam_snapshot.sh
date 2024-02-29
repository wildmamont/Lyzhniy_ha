#!/bin/bash
curl -s 'http://admin:admin@192.168.20.110/jpgimage/1/image.jpg' -o /config/www/bao_snapshot.jpg 
RETVAL=$?
if [ $RETVAL -eq 52 ] 
   then
ffmpeg -fflags discardcorrupt -t 3 -i http://192.168.66.133:81/livestream.cgi?user=admin&pwd=888888&streamid=0 -y -frames:v 1 -f image2 /config/www/vstarcam_snapshot.jpg > /tmp/ffmpeg_out.txt 2>/tmp/ffmpeg_err.txt
fi

