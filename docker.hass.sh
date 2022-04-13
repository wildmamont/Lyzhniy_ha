#!/bin/bash

docker run  --init --restart unless-stopped -d --name="home-assistant" -e "TZ=Europe/Moscow"  -v /home/homeassistant/.homeassistant:/config  --net=host homeassistant/raspberrypi3-homeassistant:stable
#docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
#docker run -d \
#  -p 3000:3000 \
#  -v /home/homeassistant/.homeassistant:/config_db \
#  -v grafana-storage:/var/lib/grafana \
#  --name=grafana \
#  -e "GF_INSTALL_PLUGINS=frser-sqlite-datasource" \
#  grafana/grafana

# docker volume create grafana-storage
