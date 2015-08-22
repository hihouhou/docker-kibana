#
# Kibana Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV KIBANA_VERSION kibana-4.1.1

# Update & install packages for graylog
RUN apt-get update && \
    apt-get install -y wget dpkg-dev openjdk-7-jre
RUN wget https://download.elastic.co/kibana/kibana/${KIBANA_VERSION}-linux-x64.tar.gz  && \
    mkdir -p /opt/kibana && \
    tar -xz --strip-components=1 -C /opt/kibana -f ${KIBANA_VERSION}-linux-x64.tar.gz

#Configure graylog
ADD kibana.yml /opt/kibana/config/

#Add link for binary
RUN ln -s /opt/kibana/bin/kibana /usr/bin/kibana

EXPOSE 5601

CMD ["kibana"]
