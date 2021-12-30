FROM openjdk:8-jdk-alpine
RUN \
  echo "**** install build packages ****" && \
  apk add --no-cache \
    curl \
    wget \
    unzip \
    bash && \
  curl -s https://api.github.com/repos/fjaros/wowchat/releases/latest \
    | grep "browser_download_url.*zip" \
    | cut -d '"' -f 4 \
    | wget -qi - && \
  unzip wowchat-*.zip && \
  rm wowchat-*.zip && \
  mv wowchat/* ./ && \
  rm -R wowchat/ && \
  apk del \
    curl \
    wget \
    unzip

ENTRYPOINT ["bash","run.sh"]