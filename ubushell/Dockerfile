FROM ubuntu:latest 
MAINTAINER florian@ey3ball.net

RUN apt-get update
RUN apt-get -y install vim
RUN apt-get -y install git
RUN apt-get -y install build-essential
RUN apt-get -y install fakeroot
RUN apt-get -y install devscripts
RUN apt-get -y install equivs
RUN apt-get -y install dh-make

RUN cd /etc && git clone --recursive http://github.com/ey3ball/Dotfiles.git && ./Dotfiles/deploy_local.bash -local

VOLUME ["/build"]

WORKDIR /build
ENTRYPOINT ["/bin/bash"]
