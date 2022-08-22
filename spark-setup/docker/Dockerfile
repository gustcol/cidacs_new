FROM apache/spark:v3.2.2

COPY entrypoint.sh /entrypoint.sh

USER root

RUN apt update && apt install python3 python3-pip -y

RUN pip install scrapbook==0.5.0 apache-airflow-providers-papermill==2.1.0 pyspark==3.1.3 ipykernel==6.5.0 ipython==7.29.0 ipython-genutils==0.2.0 jupyter-client==7.0.6 jupyter-core==4.9.1


RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
