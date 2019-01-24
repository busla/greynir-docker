FROM pypy:3

# Update aptitude with new repo and install software 
RUN apt-get update \
	&& apt-get install -y git build-essential

RUN apt-get install -y locales \
	&& rm -rf /var/lib/apt/lists/* \
    && localedef -i is_IS -c -f UTF-8 -A /usr/share/locale/locale.alias is_IS.UTF-8

ENV LANG is_IS.utf8
ENV LANGUAGE is_IS:is

# Clone the Greynir repo
RUN mkdir -p /usr/src/app

RUN cd /usr/src/app \
	&& git clone https://github.com/vthorsteinsson/Reynir.git

# Install requirements
RUN cd /usr/src/app/Reynir \
	&& pip install --upgrade pip \
	&& pip install --no-cache-dir -r requirements.txt

ENV GREYNIR_DB_HOST=greynir_db GREYNIR_DB_PORT=5432

WORKDIR /usr/src/app/Reynir

# Initialize the database tables (nondestructively)
# and run the Flask server on port 5000 (exposed at port 5050)
ENTRYPOINT pypy3 scraperinit.py && exec pypy3 main.py

#VOLUME /usr/src/app/Reynir/resources
