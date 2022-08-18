FROM apache/airflow:2.2.2-python3.7

USER root

ENV HADOOP_VERSION=3.2.2

ENV SPARK_HOME=/opt/spark

ENV PATH=$PATH:$SPARK_HOME/sbin

ENV PYSPARK_PYTHON=/usr/bin/python3

ENV HADOOP_HOME=/opt/hadoop

ENV PATH=$PATH:/opt/hadoop/bin

ENV LD_LIBRARY_PATH=/opt/hadoop/lib/native

COPY entrypoint.sh /entrypoint.sh

RUN usermod -aG sudo airflow && echo "airflow  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER airflow

RUN sudo apt update && sudo apt install default-jdk scala wget procps  git -y
RUN wget https://downloads.apache.org/spark/spark-3.1.3/spark-3.1.3-bin-hadoop3.2.tgz && \
    tar xvf spark-3.1.3-bin-hadoop3.2.tgz && \
    rm -rf spark-3.1.3-bin-hadoop3.2.tgz && \
    sudo mv spark-3.1.3-bin-hadoop3.2 /opt/spark && \
    mkdir -p /opt/spark/jars/ && \
    wget https://repo1.maven.org/maven2/com/microsoft/azure/azure-data-lake-store-sdk/2.3.9/azure-data-lake-store-sdk-2.3.9.jar -O /opt/spark/jars/azure-data-lake-store-sdk-2.3.9.jar && \
    wget https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure-datalake/3.3.1/hadoop-azure-datalake-3.3.1.jar -O /opt/spark/jars/hadoop-azure-datalake-3.3.1.jar && \
    curl https://repo1.maven.org/maven2/org/wildfly/openssl/wildfly-openssl-java/2.1.4.Final/wildfly-openssl-java-2.1.4.Final.jar -o /opt/spark/jars/wildfly-openssl-java-2.1.4.Final.jar && \
    curl https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure/3.2.2/hadoop-azure-3.2.2.jar -o /opt/spark/jars/hadoop-azure-3.2.2.jar && \
    sudo chmod +x /entrypoint.sh

RUN cd /opt && \
    curl http://archive.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz | sudo tar -zx hadoop-${HADOOP_VERSION}/lib/native && \
    sudo ln -s hadoop-${HADOOP_VERSION} hadoop 


RUN sudo -H pip install scrapbook==0.5.0 apache-airflow-providers-papermill==2.1.0 pyspark==3.1.2 ipykernel==6.5.0 ipython==7.29.0 ipython-genutils==0.2.0 jupyter-client==7.0.6 jupyter-core==4.9.1

RUN sudo apt autoremove -y && sudo apt clean && sudo pip cache purge

ENTRYPOINT ["/entrypoint.sh"]
