FROM apache/airflow:2.2.2-python3.7

USER root

COPY entrypoint.sh /entrypoint.sh

RUN usermod -aG sudo airflow && echo "airflow  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER airflow

RUN sudo chmod +x /entrypoint.sh && sudo -H pip install apache-airflow-providers-papermill pyspark==3.1.2 scrapbook

ENTRYPOINT ["/entrypoint.sh"]
