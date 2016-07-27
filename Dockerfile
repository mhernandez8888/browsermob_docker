
# Browser Mob Proxy

FROM phusion/baseimage:0.9.15

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get -y install curl zip openjdk-7-jre-headless \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -SL "https://s3-us-west-1.amazonaws.com/lightbody-bmp/browsermob-proxy-2.0-beta-9-bin.zip" -o "/browsermob-proxy.zip" \
    && unzip -q /browsermob-proxy.zip \
    && rm -f /browsermob-proxy.zip

RUN mkdir /etc/service/bmp
ADD start-bmp.sh /etc/service/bmp/run

EXPOSE 9090 9091
