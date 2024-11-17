#!/bin/bash
curl  --http0.9 -Y 1000000  -y 3 -o /config/www/video-livestream.h264 "http://192.168.20.33:81/livestream.cgi?user=admin&pwd=888888&streamid=0"
ffmpeg  -i /config/www/video-livestream.h264 -y -frames:v 1 -f image2 /config/www/vstarcam_snapshot.jpg 
#> /tmp/ffmpeg_out.txt 2>/tmp/ffmpeg_err.txt

