FROM pypy:3

MAINTAINER Jon Levy "nonni@nonni.cc"

# Update aptitude with new repo
RUN apt-get update

# Install software 
RUN apt-get install -y git
RUN apt-get install build-essential -y


RUN apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i is_IS -c -f UTF-8 -A /usr/share/locale/locale.alias is_IS.UTF-8

ENV LANG is_IS.utf8

# Clone the Greynir repo
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN git clone https://github.com/vthorsteinsson/Reynir.git

WORKDIR /usr/src/app/Reynir

RUN pip install -r requirements.txt

#ONBUILD COPY . /usr/src/app

WORKDIR /usr/src/app/Reynir
RUN make

# Build the ordalisti.text.dawg file
WORKDIR /usr/src/app/Reynir/utils
RUN pypy3 dawgbuilder.py

ENV GREYNIR_DB_HOST greynir_db
ENV GREYNIR_DB_PORT 5432

WORKDIR /usr/src/app/Reynir

EXPOSE 5000

#VOLUME /usr/src/app/Reynir/resources


