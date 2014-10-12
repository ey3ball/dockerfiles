FROM ey3ball/nzbget-env:latest

RUN sed -i 's/restricted$/restricted multiverse/' /etc/apt/sources.list && \
        apt-get update -q

RUN apt-get install -qy ${NZBGET_BUILDDEPS}
RUN apt-get install -qy ${NZBGET_RUNDEPS}
RUN apt-get install -qy wget

RUN wget -q http://sourceforge.net/projects/nzbget/files/${NZBGET_FILE}.tar.gz -O /tmp/nzbget.tar.gz

WORKDIR /tmp
RUN tar xvf nzbget.tar.gz && \
        rm -f nzbget.tar.gz && \
        mv ${NZBGET_EXTDIR} nzbget

WORKDIR nzbget
RUN ./configure --prefix=/usr

RUN make -j$(nproc)

VOLUME [ "/build" ]
ENTRYPOINT rm -rf /build/usr && make DESTDIR=/build install

#
# RUN make install
#
# RUN apt-get purge -qy ${NZBGET_BUILDDEPS} && \
#         apt-get autoremove -qy --purge && \
#         rm -rf /tmp/* && \
#         apt-get clean && \
#         rm -rf /var/lib/apt/lists/*
