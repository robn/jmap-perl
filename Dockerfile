# DOCKER-VERSION 0.3.4
FROM        perl:latest
MAINTAINER  Robert Norris robn@fastmail.com

RUN curl -L https://cpanmin.us | perl - App::cpanminus
RUN cpanm Carton Starlet

RUN apt-get update
RUN apt-get -y install nginx libssl-dev uuid-dev

RUN cachebuster=0 git clone https://github.com/robn/jmap-perl
RUN cd jmap-perl && carton install --deployment

#EXPOSE 8080

#WORKDIR hopscotch
#CMD carton exec plackup -S Starlet --port 8080 ./hopscotch
