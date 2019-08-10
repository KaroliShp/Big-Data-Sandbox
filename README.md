# Big-Data-Sandbox

Sandbox for Big Data ecosystem (HDFS, Spark) using Docker.

## Table of Contents

- [Example](#Example)
- [Setting up Docker](#Setting-up-Docker)
- [Setting up Spark Docker images](#Setting-up-Spark-Docker-images)
- [Docker Cheat Sheat](#Docker-Cheat-Sheat)

## Example

TODO

## Setting up Docker

Download from https://docs.docker.com/install/:

```
$ docker --version
$ docker-compose --version
$ docker-machine --version
```

## Setting up Spark Docker images

### Spark base image

We use alpine:3.10 as a base image

Build and run:

```
$ docker build -t kshp/spark:latest .
$ docker run -it --rm kshp/spark:latest /bin/sh
```

This will set up the environment by installing OpenJDK, Python 3.7 and Spark 2.4.3


## Docker Cheat Sheat

To see dangling images:

```
$ docker images -f dangling=true
```

To clean docker:

```
$ docker system prune
$ docker rmi $(docker images -q)
```


