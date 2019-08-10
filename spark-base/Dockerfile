FROM alpine:3.10

# Set up environment variables
ENV SPARK_VERSION=2.4.3
ENV HADOOP_VERSION=2.7

# Install wget, tar and bash commands
RUN apk --update add wget tar bash

# Install OpenJDK
RUN apk add --no-cache openjdk8

# Install Python3 and pip3 and link pip to pip3
RUN apk add --no-cache python3 && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi

# Download Spark
RUN wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

# Extract, move to /spark and remove the archive file
RUN tar -xzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /spark && \
    rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

# Set up Spark environment
ENV SPARK_HOME="/spark"