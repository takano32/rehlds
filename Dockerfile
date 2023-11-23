FROM ubuntu:23.10
LABEL maintainer "TAKANO Mitsuhiro <takano32@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NOWARNINGS=yes

RUN grep '^deb ' /etc/apt/sources.list | sed 's/^deb/deb-src/g' > /etc/apt/sources.list.d/deb-src.list

RUN apt-get update
RUN apt-get install -y git
RUN git clone https://github.com/dreamstalker/rehlds.git
WORKDIR /rehlds

RUN apt-get install -y llvm clang lld
RUN apt-get install -y build-essential
RUN apt-get install -y cmake gcc-multilib g++-multilib

RUN apt-get install -y software-properties-common
RUN add-apt-repository multiverse
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install steam -y

COPY ./entrypoint.sh /
RUN chmod 755 /entrypoint.sh
EXPOSE 8000
ENTRYPOINT ["/entrypoint.sh"]

