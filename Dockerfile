
FROM cassandra:3.9
COPY opt/spark-2.1.0-bin-hadoop2.7.tgz /opt/spark-2.1.0-bin-hadoop2.7.tgz
RUN tar xfz /opt/spark-2.1.0-bin-hadoop2.7.tgz -C /opt
RUN ln -s /opt/spark-2.1.0-bin-hadoop2.7 /opt/spark-latest
COPY ./spark-conf/* /opt/spark-latest/conf/
COPY ./bootstrap.sh /opt/bootstrap.sh
COPY ./bootstrap-master.sh /opt/bootstrap-master.sh
COPY ./bootstrap-slave.sh /opt/bootstrap-slave.sh
RUN rm /opt/*gz
EXPOSE 8080 7077 22222 45000-55000 7000 7001 7199 9042 9160 8080 7077 22222 
ENTRYPOINT ["/opt/bootstrap.sh"]
CMD ["cassandra","-f"]










