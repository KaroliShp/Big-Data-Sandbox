FROM kshp/spark:latest

# Copy master script
COPY start-worker.sh /

# Set up and expose relevant ports

ENV SPARK_WORKER_WEBUI_PORT 8080
ENV SPARK_MASTER "spark://spark-master:7070"

EXPOSE 8080

# Start master script
CMD ["/bin/bash", "/start-worker.sh"]
