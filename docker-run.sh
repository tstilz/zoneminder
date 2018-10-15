#!/bin/bash

docker run -d --name="ZM" \
		--net="bridge" \
		--privileged="true" \
		-p 80:80/tcp \
		-p 8443:443/tcp \
		-p 9000:9000/tcp \
		-e TZ="Europe/Oslo" \
		-e SHMEM="50%" \
		-e SSL_EVENTS="1" \
		-e PGID=$(id -g $USER) -e PUID=$(id -u $USER) \		
		-v "/mnt/SS1/zm":"/config":rw \
		-v "/mnt/SS1/zm/data":"/var/cache/zoneminder":rw \
	zoneminder

		# -e PUID="99" \
		# -e PGID="100" \
