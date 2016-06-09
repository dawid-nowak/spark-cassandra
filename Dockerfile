
FROM cassandra:latest

COPY ./spark-1.6.0-bin-hadoop2.6.tgz /opt
COPY ./spark-conf/* /opt/spark-latest/conf/
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN tar xfz /opt/spark-1.6.0-bin-hadoop2.6.tgz -C /opt \
&& ln -s /opt/spark-1.6.0-bin-hadoop2.6 /opt/spark-latest \
&& rm /opt/*gz


RUN apt-get update \
	&& apt-get install -y netbase net-tools netcat iputils-ping vim-tiny \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 7000 7001 7199 9042 9160 8080 7077 22222 

