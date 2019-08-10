FROM kshp/spark:latest

# Copy master script
COPY start-master.sh /

# Set up and expose relevant ports

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG /spark/logs

EXPOSE 8080 7077 6066

# https://stackoverflow.com/questions/44576787/apache-spark-startup-error-on-alpine-linux-docker
RUN apk --update add --no-cache coreutils procps

# Start master script
CMD ["/bin/bash", "/start-master.sh"]
