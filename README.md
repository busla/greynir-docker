# Docker images for Greynir

*A natural language processor for Icelandic* -
https://github.com/vthorsteinsson/Reynir

This repository contains Dockerfiles and a `docker-compose.yml` file
for container images related to Greynir.

A simple Greynir application cluster can be built and run via `docker-compose`.
This consists of two Docker images, a *database image* (containing
a PostgreSQL server) and a *web image* (connecting to the database
image and exposing a HTTP server on port 5050 by default).

## How to run

```bash
cd greynir-docker
```

Attached to console: `docker-compose up`

Detached from console: `docker-compose -d up`

Attached-mode will display all output from the containers in the console.

# Building and running the images separately

## Building the database container image

```bash
cd greynir-docker/db
docker build -t greynir/db .
```

## Running the database container

This will expose the Greynir database on port 5432.

```bash
docker run -d --name greynir_db -p 5432:5432 greynir/db
```

## Building the web container image

```bash
cd greynir-docker/web
docker build -t greynir/web .
```

## Running the web container

The default settings will expose the web server on port 5050.

```bash
docker run -d --name greynir_web -p 5050:5000 --link greynir_db greynir/web
```

## Running several containers

The `greynir/web` image uses the `GREYNIR_DB_HOST` and `GREYNIR_DB_PORT`
environment variables to connect to the database.

To run multiple instances of Greynir you can set these variables
when you run `greynir/web`.

Example:

```bash
docker run --name <new_greynir_db> -p <new-db-port>:5432 greynir/db

docker run --name <new_greynir_web> \
	-e GREYNIR_DB_HOST=<new_greynir_db> \
	-e GREYNIR_DB_PORT=<new_db_port> \
	-p <new-web-port>:5000 \
	--link <new_greynir_db> greynir/web
```
