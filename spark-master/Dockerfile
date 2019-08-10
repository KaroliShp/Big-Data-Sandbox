FROM kshp/spark:latest

# Copy master script
COPY start-master.sh /

# Set up and expose relevant ports

ENV SPARK_MASTER_PORT 7070
ENV SPARK_MASTER_WEBUI_PORT 8080

EXPOSE 8080 7070

# Start master script
CMD ["/bin/bash", "/start-master.sh"]
