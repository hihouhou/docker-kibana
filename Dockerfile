#
# Kibana Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

LABEL org.opencontainers.image.authors="hihouhou < hihouhou@hihouhou.com >"

ENV KIBANA_VERSION=v9.0.3

# Update & install packages for kibana
RUN apt-get update && \
    apt-get install -y wget dpkg-dev openjdk-11-jre

RUN wget https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}-amd64.deb && \
    dpkg -i kibana-${KIBANA_VERSION}-amd64.deb

COPY kibana.yml /etc/kibana/

USER kibana

EXPOSE 5601

CMD ["/usr/share/kibana/bin/kibana", "-c", "/etc/kibana/kibana.yml"]
