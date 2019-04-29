FROM ubuntu:18.04

MAINTAINER Giovanni Perez Montt <Giovanni.perez@velocitymobility.de>

################################################################################
# Install pandoc
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
RUN echo "Europe/Berlin" > /etc/timezone

RUN apt-get update && apt-get install -y --no-install-recommends  \
    wget \
		texlive \
		#pandoc-citeproc \
		&& rm -rf /var/lib/apt/lists/* 
    
RUN mkdir -p /installation/ && \
    wget https://github.com/jgm/pandoc/releases/download/2.7.2/pandoc-2.7.2-1-amd64.deb \ 
    --no-check-certificate \
    -O /installation/pandoc.deb

RUN wget https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.4.1/linux-pandoc_2_7_2.tar.gz \
 		--no-check-certificate \
   	&& tar -xvzf linux-pandoc_* && mv pandoc-cross* /usr/bin/  && dpkg -i /installation/pandoc.deb && rm -rf /installation linux-pandoc*  && apt-get remove -y  wget
################################################################################
# Install full latex stack
# RUN apt-get install -y -o Acquire::Retries=10 --no-install-recommends texlive-full
