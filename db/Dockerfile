FROM postgres:latest

# Set the locale
RUN localedef -i is_IS -c -f UTF-8 -A /usr/share/locale/locale.alias is_IS.UTF-8

ENV LANG is_IS.utf8

ADD sql/initial_setup.sql /docker-entrypoint-initdb.d/initial_setup.sql
