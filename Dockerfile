FROM ubuntu:20.04

RUN apt-get update -y && apt-get upgrade -y 

# Basic commnads
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y sudo vim git cmake tmux xsel debootstrap \
    gcc build-essential pkg-config libpq-dev libssl-dev openssl \
    iputils-ping net-tools traceroute

# Add packages
RUN apt-get install -y fastboot liblocal-lib-perl cpanminus libxml-simple-perl \
filepp swig bison flex python-dev 

RUN apt install -y device-tree-compiler
RUN wget https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update -y 
RUN apt-get install -y apt-transport-https
RUN apt-get install -y dotnet-sdk-2.1

# Remove packages
RUN apt-get autoremove -y libreoffice* thunderbird firefox gnome-games rhythmbox gnome-mines aisleriot byobu \
    cheese gnome-mahjongg gnome-sudoku gnome-calendar
RUN apt-get autoclean && apt-get clean

ARG DOCKER_UID=9001
ARG DOCKER_GID=9001
ARG DOCKER_USER=user
ARG DOCKER_PASSWORD=user

RUN groupadd --gid ${DOCKER_GID} ${DOCKER_USER}
RUN useradd --create-home --uid ${DOCKER_UID} --gid ${DOCKER_GID} --groups sudo,video --shell /bin/bash ${DOCKER_USER} \
&& echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd

USER ${DOCKER_USER}
WORKDIR /home/${DOCKER_USER}

