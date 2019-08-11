FROM alpine:3.10

# Set yourself as root
USER root

# Set environment variables
ENV HADOOP_VERSION=2.7.0

# Install wget, tar and bash commands
RUN apk --update add wget tar bash

# Install packages
RUN apk add --no-cache openssh openssl openjdk8 rsync bash procps nss

# Download hadoop
RUN wget https://archive.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz

# Extract, move to /hadoop and remove the archive file
RUN tar -xzf hadoop-${HADOOP_VERSION}.tar.gz && \
    mv hadoop-${HADOOP_VERSION} /hadoop && \
    rm hadoop-${HADOOP_VERSION}.tar.gz

# Set environment variables
ENV JAVA_HOME="/usr/lib/jvm/java-1.8-openjdk"
ENV HADOOP_HOME="/hadoop"

# Make Hadoop data folder
RUN mkdir /hadoop-data