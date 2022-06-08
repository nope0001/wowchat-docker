WoWChat Docker
==============

WoWChat is a Discord integration chat bot for old versions of World of Warcraft.

This repo builds a docker image to run [WoWChat](https://github.com/fjaros/wowchat).

The image is build monthly by a cron trigger and pushed to [dockerhub](https://hub.docker.com/repository/docker/nope01/wowchat-docker).

The architectures supported by this image are:

| Architecture |
| :----: |
| amd64 |
| armv8 |
| armv7 |
| armv6 |

---
### docker-compose 
```
---
version: "3"

services:
  wowchat:
    image: nope01/wowchat-docker:latest
    container_name: wowchat
    volumes:
      - path/to/config/wowchat.conf:/wowchat.conf
    restart: unless-stopped
```

### docker CLI

```
$ docker run -d \
  --name=wowchat \
  -v path/to/config/wowchat.conf:/wowchat.conf \
  --restart unless-stopped \
  nope01/wowchat-docker:latest
```

---
Edit the https://github.com/fjaros/wowchat/blob/master/src/main/resources/wowchat.conf to your needs and copy it into your /path/to/config directory. Now restart or deploy the container to apply the config changes.
