FROM ubuntu:bionic

RUN apt-get update -q && \
	apt-get install -qy wget && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/nzbget/nzbget/releases/download/v21.1/nzbget-21.1-bin-linux.run && \
	chmod +x nzbget-21.1-bin-linux.run && \
	mkdir -p /opt/nzbget && \
	./nzbget-21.1-bin-linux.run --destdir /opt/nzbget && \
	rm -f ./nzbget-21.1-bin-linux.run

ADD nzbget-entry.sh /usr/bin/nzbget-entry.sh

VOLUME ["/nzbget"]
EXPOSE 6789

CMD [ "--server" ]

ENTRYPOINT ["/usr/bin/nzbget-entry.sh"]
