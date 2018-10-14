FROM ubuntu:18.04
MAINTAINER florian@ey3ball.net

RUN apt-get update && \
        apt-get install -y proftpd proftpd-mod-vroot wget && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* && \
        sed -i -e 's/# PassivePorts.*/PassivePorts 6000 6010/g' /etc/proftpd/proftpd.conf

CMD ["-n"]
ENTRYPOINT ["proftpd"]
EXPOSE 21 6000 6001 6002 6003 6004 6005 6006 6007 6008 6009 6010
