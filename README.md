# Big Data Sandbox

Personal sandbox for Big Data ecosystem (HDFS, Spark) and Machine Learning integration using Docker.

TODO:
- HDFS
- Machine Learning

## Table of Contents

- [Example](#Example)
- [Requirements](#Requirements)
- [Setting up Spark Docker images](#Setting-up-Spark-Docker-images)
- [Inspirations](#Inspirations)
- [Docker Cheat Sheat](#Docker-Cheat-Sheat)

## Example

We will set up a local cluster consisting of 3 worker nodes and one master node, and will execute one of the examples provided by Spark (calculation of pi). All of this will be done using a separate docker container for each node, imitating a real environment.

1. Build images from Dockerfiles:

```
$ docker build -t kshp/spark:latest spark-base
$ docker build -t kshp/spark-master:latest spark-master
$ docker build -t kshp/spark-worker:latest spark-worker
```

2. Launch the cluster with one master node and three worker nodes:

```
$ docker-compose up --scale spark-worker=3
```

You can now view the master console in http://localhost:8080/ and workers in ports 8081, 8082 and 8083. 

3. Open a new terminal and execute the following commands:

```
$ docker run -it --rm --network big-data-sandbox_spark-network kshp/spark-worker:latest /bin/sh
/ # /spark/bin/spark-submit --master spark://spark-master:7070 /spark/examples/src/main/python/pi.py 1000
```

This will submit the spark job to the cluster and you can then see it being processed in master UI console. You can also see the result in this terminal ("Pi is roughly 3.141527") - this node will act as a client for the app.

4. To stop the cluster:

```
$ docker-compose down
```

## Requirements

The only requirement is Docker. You can download Docker from [here](https://docs.docker.com/install/). To check if everything is installed correctly, you can run the following:

```
$ docker --version
19.03.1
$ docker-compose --version
1.24.1
$ docker-machine --version
0.16.1
```

## Spark in Docker

### Spark-base image

We use `alpine:3.10` as a base image for `spark-base` image. This will act as a base image for all further images.

This will set up the environment by installing OpenJDK, Python 3.7 and Spark 2.4.3

### Spark master

We use `kshp/spark:latest` as a base image for `spark-master` image.

The spark master node will be the one launching `/spark/bin/start-master.sh`. This will start a standalone master server, and then the workers will be able to connect to it.

### Spark worker

We use `kshp/spark:latest` as a base image for `spark-worker` image.

### Spark network

Docker can be used to create a local network where the containers can communicate with each other. We specify the network in `docker-compose.yml`, thus the containers will operate in `big-data-sandbox_spark-network`.

## Inspirations

Spark with Docker setup inspired by:

- https://medium.com/@marcovillarreal_40011/creating-a-spark-standalone-cluster-with-docker-and-docker-compose-ba9d743a157f
- https://github.com/big-data-europe/docker-spark
- https://towardsdatascience.com/a-journey-into-big-data-with-apache-spark-part-1-5dfcc2bccdd2

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


