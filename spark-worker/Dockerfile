FROM kshp/spark:latest

# Copy master script
COPY start-worker.sh /

# Set up and expose relevant ports

ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_WORKER_LOG /spark/logs
ENV SPARK_MASTER "spark://spark-master:7077"

EXPOSE 8081

# https://stackoverflow.com/questions/44576787/apache-spark-startup-error-on-alpine-linux-docker
RUN apk --update add --no-cache coreutils procps

# Start master script
CMD ["/bin/bash", "/start-worker.sh"]
