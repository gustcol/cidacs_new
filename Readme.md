# Cidacs - Ambiente Analítico

Este repositório tem como objetivo colocar um ambiente analítico no ar fazendo o uso de recuros de virtualização, tais como docker e outros.

Para iniciar o ambiente basta executar o comando 
```bash
 ./start_all
  ```
Para interrroper ou parar  o ambiene, basta executar o seguinte comando 
```bash
./stop_all
```

Abaixo seguem as portas tcp defaults que são abertas após o start do script:

* 5044: Logstash Beats input
* 5000: Logstash TCP input
* 9600: Logstash monitoring API
* 9200: Elasticsearch HTTP
* 9300: Elasticsearch TCP transport
* 5601: Kibana
* 9001: Minio
* 8888: Jupiter notebook
* 8080: Spark 

Para accessar, bastar colocatr http://<ip do servidor>:porta tcp acima

Ex.:  http://172.16.15.251:5601/ (accesso ao Jupiter)

## Spark - Configuração de cada um dos nós
* 5 Nodes
* SPARK_WORKER_CORES=8
* SPARK_WORKER_MEMORY=32G


## Minio - Credenciais de acesso ao Minio
      - MINIO_ROOT_USER=admin
      - MINIO_ROOT_PASSWORD=supersecret
./data/minio ==> local folder to add and export the files
More info about Minio [https://thedatabaseme.de/2022/03/20/i-do-it-on-my-own-then-self-hosted-s3-object-storage-with-minio-and-docker/]


## Mudando memória e quantidade
Alterar sempre no arquivo docker-compose.yml

## Melhorando a performance dos servidores
O script abaixo só deverá ser executado na instalação do servidor

```bash
./env_tunning.sh
```
