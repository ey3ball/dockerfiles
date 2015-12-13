FROM ubuntu:latest

ENV VERSION 16.4

ENV NZBGET_FILE nzbget-${VERSION}
ENV NZBGET_EXTDIR nzbget-${VERSION}
ENV NZBGET_PACK https://github.com/nzbget/nzbget/releases/download/v${VERSION}/nzbget-${VERSION}-src.tar.gz

ENV NZBGET_BUILDDEPS build-essential pkg-config  libxml2-dev libncurses5-dev \
                        libsigc++-2.0-dev libssl-dev
ENV NZBGET_RUNDEPS libxml2 libncurses5 libsigc++-2.0-0c2a libssl1.0.0 p7zip unrar
