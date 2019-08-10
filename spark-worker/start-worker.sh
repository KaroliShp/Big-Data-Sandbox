#!/bin/bash

# Set up all the required environment variables

. "/spark/sbin/spark-config.sh"

. "/spark/bin/load-spark-env.sh"

# Start worker node

/spark/bin/spark-class org.apache.spark.deploy.worker.Worker \
    --webui-port $SPARK_WORKER_WEBUI_PORT \
    $SPARK_MASTER