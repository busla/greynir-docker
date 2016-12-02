FROM postgres:latest
MAINTAINER Jón Levy <nonni@nonni.cc>
# create the image: docker build -t busla/greynir_db . 
# docker run --name greynir_db --volumes-from greynir_data -d busla/greynir_db
# Set the locale


RUN localedef -i is_IS -c -f UTF-8 -A /usr/share/locale/locale.alias is_IS.UTF-8

ENV LANG is_IS.utf8

#ADD resources/ord.csv /srv/ord.csv
ADD sql/initial_setup.sql /docker-entrypoint-initdb.d/initial_setup.sql
