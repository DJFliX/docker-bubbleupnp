FROM gliderlabs/alpine:latest

RUN set -ex && \
    apk add --no-cache openjdk8-jre unzip wget ffmpeg sox

EXPOSE 58050/tcp 58051/tcp 1900/udp

RUN set -ex && \
    mkdir /bubbleupnpserver

WORKDIR /bubbleupnpserver

ADD bcprov-jdk16-146.jar .
ADD BubbleUPnPServer.jar .
ADD BubbleUPnPServerLauncher.jar .
ADD launch.sh .
RUN chmod +x launch.sh

CMD ["sh", "launch.sh"]