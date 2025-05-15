FROM codercom/code-server
# https://coder.com/docs/code-server/FAQ

USER root
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv openjdk-17-jdk curl && rm -rf /var/lib/apt/lists/*

# Instalacja Spark
ENV SPARK_PACKAGE=spark-3.5.5-bin-hadoop3-scala2.13

RUN curl -fSL https://downloads.apache.org/spark/spark-3.5.5/${SPARK_PACKAGE}.tgz -o /tmp/spark.tgz && \
    tar -xzf /tmp/spark.tgz -C /opt && \
    ln -s /opt/${SPARK_PACKAGE} /opt/spark && \
    rm /tmp/spark.tgz

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV SPARK_HOME=/opt/spark
ENV PATH="${JAVA_HOME}/bin:${SPARK_HOME}/bin:${PATH}"

USER coder
RUN python3 -m venv /home/coder/nosql_venv
RUN /home/coder/nosql_venv/bin/pip install jupyterlab ipywidgets
RUN /home/coder/nosql_venv/bin/pip install numpy
RUN /home/coder/nosql_venv/bin/pip install pandas
RUN /home/coder/nosql_venv/bin/pip install tqdm
RUN /home/coder/nosql_venv/bin/pip install matplotlib
RUN /home/coder/nosql_venv/bin/pip install tabulate
RUN /home/coder/nosql_venv/bin/pip install delta-spark
RUN /home/coder/nosql_venv/bin/pip install kafka-python
RUN /home/coder/nosql_venv/bin/pip install jsonschema
RUN /home/coder/nosql_venv/bin/pip install psycopg2-binary
RUN /home/coder/nosql_venv/bin/pip install faust
RUN /home/coder/nosql_venv/bin/pip install prometheus-client
RUN /home/coder/nosql_venv/bin/pip install confluent-kafka

ENV PATH="/home/coder/nosql_venv/bin:$PATH"

COPY  --chown=coder:coder ./config.yaml /home/coder/.config/code-server/config.yaml
COPY  --chown=coder:coder ./settings.json /home/coder/.local/share/code-server/User/settings.json

RUN code-server --install-extension ms-python.python
RUN code-server --install-extension ms-toolsai.jupyter

# Code based on https://github.com/kjedrzejewski/podyplomowe_genai_public
# Well done Krzysztof!
