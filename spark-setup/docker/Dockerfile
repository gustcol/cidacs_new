FROM apache/spark:v3.2.2

COPY entrypoint.sh /entrypoint.sh

USER root

RUN apt update && apt install dumb-init -y

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
