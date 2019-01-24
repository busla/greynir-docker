
alter role reynir with superuser;

create database scraper with encoding 'UTF8' LC_COLLATE='is_IS.utf8' LC_CTYPE='is_IS.utf8' TEMPLATE=template0;
grant all privileges on database scraper to reynir;
\c scraper;
create extension if not exists "uuid-ossp";

