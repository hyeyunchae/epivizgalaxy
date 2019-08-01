# FROM ubuntu:14.04
# These environment variables are passed from Galaxy to the container
# and help you enable connectivity to Galaxy from within the container.
# This means your user can import/export data from/to Galaxy.
# ENV DEBIAN_FRONTEND=noninteractive \
    # API_KEY=none \
    # DEBUG=false \
    # PROXY_PREFIX=none \
    # GALAXY_URL=none \
    # GALAXY_WEB_PORT=10000 \
    # HISTORY_ID=none \
    # REMOTE_HOST=none

# RUN apt-get -qq update && \
    # apt-get install --no-install-recommends -y \
    # wget procps nginx python python-pip net-tools nginx

# Our very important scripts. Make sure you've run `chmod +x startup.sh
# monitor_traffic.sh` outside of the container!
# ADD ./startup.sh /startup.sh
# ADD ./monitor_traffic.sh /monitor_traffic.sh

# /import will be the universal mount-point for Jupyter
# The Galaxy instance can copy in data that needs to be present to the
# container
# RUN mkdir /import

# Nginx configuration
# COPY ./proxy.conf /proxy.conf

# VOLUME ["/import"]
# WORKDIR /import/

# EXTREMELY IMPORTANT! You must expose a SINGLE port on your container.
# EXPOSE 80
# CMD /startup.sh

FROM alpine

ENV DEBIAN_FRONTEND=noninteractive \
    DEBUG=false \
    GALAXY_WEB_PORT=10000 \
    NOTEBOOK_PASSWORD=none \
    CORS_ORIGIN=none \
    DOCKER_PORT=none \
    API_KEY=none \
    HISTORY_ID=none \
    REMOTE_HOST=none \
    GALAXY_URL=none

# Ensure cran is available
RUN apk update && \
    apk add \
        wget procps nginx python py2-pip net-tools nginx git patch

ADD ./startup.sh /startup.sh
ADD ./monitor_traffic.sh /monitor_traffic.sh

RUN mkdir -p /import /web/helloworld /run/nginx

COPY ./proxy.conf /proxy.conf
COPY ./index.html /web/helloworld/
RUN chmod ugo+r /web/helloworld/index.html
RUN ["chmod", "+x", "startup.sh"]

VOLUME ["/import"]
WORKDIR /import/

EXPOSE 80
CMD /startup.sh
