FROM ubuntu:artful

RUN apt-get update -q && \
	apt-get install -qy wget && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/nzbget/nzbget/releases/download/v19.1/nzbget-19.1-bin-linux.run && \
	chmod +x nzbget-19.1-bin-linux.run && \
	mkdir -p /opt/nzbget && \
	./nzbget-19.1-bin-linux.run --destdir /opt/nzbget && \
	rm -f ./nzbget-19.1-bin-linux.run

ADD nzbget-entry.sh /usr/bin/nzbget-entry.sh

VOLUME ["/nzbget"]
EXPOSE 6789

CMD [ "--server" ]
ENTRYPOINT ["/usr/bin/nzbget-entry.sh"]
