# Big-Data-Sandbox

Sandbox for Big Data ecosystem (HDFS, Spark) and Machine Learning integration using Docker.

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

### Spark-base image

We use alpine:3.10 as a base image for `spark-base` image. This will act as a base image for all further images.

```
$ docker build -t kshp/spark:latest .
$ docker run -it --rm kshp/spark:latest /bin/sh
```

This will set up the environment by installing OpenJDK, Python 3.7 and Spark 2.4.3

### Spark master

We use `kshp/spark:latest` as a base image for `spark-master` image.

```
$ docker build -t kshp/spark-master:latest .
 docker run -it --rm -p 7077:7077 -p 8080:8080 kshp/spark-master:latest
```

The spark master node will be the one launching `./sbin/start-master.sh`. This will start a standalone master server, and then the workers will be able to connect to it.

### Spark worker

We use `kshp/spark:latest` as a base image for `spark-worker` image.

```
$ docker build -t kshp/spark-worker:latest .
$ docker run -it --rm kshp/spark-worker:latest
```


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


