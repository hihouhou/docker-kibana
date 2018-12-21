#
# Kibana Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV KIBANA_VERSION 7.0.0-alpha2

# Update & install packages for kibana
RUN apt-get update && \
    apt-get install -y wget dpkg-dev openjdk-8-jre

RUN wget https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}-amd64.deb && \
    dpkg -i kibana-${KIBANA_VERSION}-amd64.deb

COPY kibana.yml /etc/kibana/

EXPOSE 5601

CMD ["/usr/share/kibana/bin/kibana"]
