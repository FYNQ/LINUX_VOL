# Dockerfile for local linux-stable repository

# Build with:
# docker-compose build 

# Run with:
# docker-compose up

# user/passwort to login containter: user/nopasswd

###############################################################################
#                                INSTALLATION
###############################################################################


FROM debian:stretch


RUN set -x \
 && apt-get update -qq

RUN set -x && apt-get install --assume-yes \
    vim screen python3-pip passwd locales bash git sudo

RUN set -x && apt-get clean
RUN pip3 install python-dateutil psutil APScheduler mydaemon
ENV TZ=Europe/Vienna
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN locale-gen en_US.UTF-8
RUN localedef -i en_US -f UTF-8 en_US.UTF-8
RUN useradd -p nopasswd user -s /bin/bash
RUN echo "user:nopasswd" | chpasswd && adduser user sudo


ADD . /home/user/src
RUN chown -R user:user /home/user

USER user
ENV HOME /home/user
RUN cd /home/user/ && git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
WORKDIR /home/user/src
CMD tail -n 2 -f info.txt
