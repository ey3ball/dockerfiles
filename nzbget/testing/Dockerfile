FROM ey3ball/nzbget-env:latest

RUN sed -i 's/restricted$/restricted multiverse/' /etc/apt/sources.list && \
        apt-get update -q && \
        apt-get install -qy ${NZBGET_RUNDEPS} && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

ADD build/ /

VOLUME ["/data"]
EXPOSE 6789
