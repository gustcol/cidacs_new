FROM apache/spark:v3.2.2

COPY entrypoint.sh /entrypoint.sh

USER root

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
