#!/bin/bash
curl -s 'http://admin:admin@192.168.20.110/jpgimage/1/image.jpg' -o /config/www/bao_snapshot.jpg 
RETVAL=$?
if [ $RETVAL -eq 52 ] 
   then
ffmpeg -fflags discardcorrupt -t 3 -rtsp_transport udp -i rtsp://admin:admin@192.168.20.110:554/1/h264major/multicast -y -frames:v 1 -f image2 /config/www/bao_snapshot.jpg > /tmp/ffmpeg_out.txt 2>/tmp/ffmpeg_err.txt
fi

