# Big-Data-Sandbox

Sandbox for Big Data ecosystem (HDFS, Spark) and Machine Learning integration using Docker.

## Table of Contents

- [Example](#Example)
- [Requirements](#Requirements)
- [Setting up Spark Docker images](#Setting-up-Spark-Docker-images)
- [Docker Cheat Sheat](#Docker-Cheat-Sheat)

## Example

TODO

## Requirements

The only requirement is Docker and Unix environment. You can download Docker from [here](https://docs.docker.com/install/). To check if everything is installed correctly, you can run the following:

```
$ docker --version
$ docker-compose --version
$ docker-machine --version
```

To launch and then stop the cluster:

```
$ docker-compose up
$ docker-compose down
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
$ docker run -it --rm -p 7070:7070 -p 8080:8080 kshp/spark-master:latest
```

The spark master node will be the one launching `./sbin/start-master.sh`. This will start a standalone master server, and then the workers will be able to connect to it.

### Spark worker

We use `kshp/spark:latest` as a base image for `spark-worker` image.

```
$ docker build -t kshp/spark-worker:latest .
$ docker run -it --rm kshp/spark-worker:latest
```

## Setting up Spark network

Docker can be used to create a local network where the containers can communicate with each other

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


