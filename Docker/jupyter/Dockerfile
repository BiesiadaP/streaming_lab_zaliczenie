FROM jupyter/pyspark-notebook:spark-3.4.1
# FROM jupyter/pyspark-notebook

USER root

RUN apt-get update && apt-get install -y python3 python3-pip python3-venv curl tar gzip && apt-get clean

RUN pip install pyspark==3.4.1
RUN pip install delta-spark==2.4.0
RUN pip install numpy
RUN pip install pandas
RUN pip install kafka-python
RUN pip install jsonschema
RUN pip install psycopg2-binary
RUN pip install confluent-kafka

# Instalacja Java 11 i ustawienie JAVA_HOME
RUN apt-get install -y openjdk-11-jdk && rm -rf /var/lib/apt/lists/*
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH="$JAVA_HOME/bin:$PATH"

# Instalacja bibliotek Kafka + Spark-Kafka Connector
RUN wget https://repo1.maven.org/maven2/org/apache/spark/spark-sql-kafka-0-10_2.12/3.4.1/spark-sql-kafka-0-10_2.12-3.4.1.jar -P /usr/local/spark/jars/ && \
    wget https://repo1.maven.org/maven2/org/apache/spark/spark-token-provider-kafka-0-10_2.12/3.4.1/spark-token-provider-kafka-0-10_2.12-3.4.1.jar -P /usr/local/spark/jars/ && \
    wget https://repo1.maven.org/maven2/io/delta/delta-core_2.12/2.4.0/delta-core_2.12-2.4.0.jar -P /usr/local/spark/jars && \
    wget https://repo1.maven.org/maven2/io/delta/delta-storage/2.4.0/delta-storage-2.4.0.jar -P /usr/local/spark/jars && \
    wget https://repo1.maven.org/maven2/org/apache/kafka/kafka-clients/3.4.1/kafka-clients-3.4.1.jar -P /usr/local/spark/jars && \
    wget https://repo1.maven.org/maven2/org/apache/commons/commons-pool2/2.11.1/commons-pool2-2.11.1.jar -P /usr/local/spark/jars && \
    wget https://repo1.maven.org/maven2/org/postgresql/postgresql/42.6.0/postgresql-42.6.0.jar -P /usr/local/spark/jars

USER $NB_UID
