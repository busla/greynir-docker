FROM pypy:3

MAINTAINER Jon Levy "nonni@nonni.cc"

# Update aptitude with new repo and install software 
RUN apt-get update && apt-get install -y git build-essential

RUN apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i is_IS -c -f UTF-8 -A /usr/share/locale/locale.alias is_IS.UTF-8

ENV LANG is_IS.utf8

# Clone the Greynir repo
RUN mkdir -p /usr/src/app

RUN cd /usr/src/app && git clone https://github.com/vthorsteinsson/Reynir.git

RUN cd /usr/src/app/Reynir && pip install -r requirements.txt && make

# Build the ordalisti.text.dawg file
RUN cd /usr/src/app/Reynir/utils && pypy3 dawgbuilder.py

ENV GREYNIR_DB_HOST=greynir_db GREYNIR_DB_PORT=5432

WORKDIR /usr/src/app/Reynir

EXPOSE 5000

ENTRYPOINT pypy3 scraperinit.py && exec pypy3 main.py

#VOLUME /usr/src/app/Reynir/resources


