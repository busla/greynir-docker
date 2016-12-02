create role reynir with password 'reynir';
create role notandi with password 'notandi';

alter role notandi with superuser;

alter role notandi with login;
alter role reynir with login;

create database bin with encoding 'UTF8' LC_COLLATE='is_IS.UTF-8' LC_CTYPE='is_IS.UTF-8' TEMPLATE=template0;
\c bin;
create table ord (stofn varchar(80), utg integer, ordfl varchar(20), fl varchar(20), ordmynd varchar(80), beyging varchar(24));
copy ord from '/usr/src/app/Reynir/resources/ord.csv' with (format csv, delimiter ';', encoding 'UTF8');
create index ffx on ord(fl);
create index ofx on ord(ordfl);
create index oix on ord(ordmynd);
create index sfx on ord(stofn);
grant select on ord to reynir;
grant all on ord to notandi;
create database scraper with encoding 'UTF8' LC_COLLATE='is_IS.utf8' LC_CTYPE='is_IS.utf8' TEMPLATE=template0;
grant all privileges on database scraper to reynir;
grant all privileges on database scraper to notandi;    
\c scraper;
create extension if not exists "uuid-ossp";