FROM ubuntu:18.04
LABEL mainainer Giovanni.perez@velocitymobility.de
################################################################################
# Install pandoc
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
RUN echo "Europe/Berlin" > /etc/timezone

RUN apt-get -qy update \
 	&& apt-get install -yq --no-install-recommends \
	wget \
	build-essential \
	spell \
	cmake \
	git \
	locales \
	# latex toolchain
	lmodern \
	texlive \
	texlive-lang-french \
	texlive-lang-german \
	texlive-luatex \
	texlive-pstricks \
	texlive-xetex \
	xzdec \
	# reveal (see issue #18)
	netbase \
	# dia
	dia \
	# fonts
	fonts-lato \
	fonts-liberation \	
	# required for PDF meta analysis
	poppler-utils \
	zlibc \
	# for emojis
	librsvg2-bin \
	&& apt-get clean && \
	rm -rf /var/lib/apt/lists/* 
		
ARG PANDOC_VERSION=2.7
RUN mkdir -p /installation/ && \
	wget https://github.com/jgm/pandoc/releases/download/2.7.2/pandoc-2.7.2-1-amd64.deb \ 
	--no-check-certificate \
	-O /installation/pandoc.deb \
	&& dpkg -i /installation/pandoc.deb 

# Install full latex stack
# RUN apt-get install -y -o Acquire::Retries=10 --no-install-recommends texlive-full

#RUN wget https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.4.1/linux-pandoc_2_7_2.tar.gz \
	#	--no-check-certificate \
	#&& tar -xvzf linux-pandoc_* \
	#&& mv pandoc-cross* /usr/bin/ \
	#&& dpkg -i /installation/pandoc.deb \
	#&& rm -rf /installation linux-pandoc* \
	#&& mkdir -p /tmp/workspace \
	#&& apt-get remove -y wget \
	#&& rm -rf /var/lib/apt/lists/* 
################################################################################
# RUN apt-get install -y -o Acquire::Retries=10 --no-install-recommends texlive-full
