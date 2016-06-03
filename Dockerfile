FROM ubuntu:16.04
MAINTAINER Dawid Nowak <nowakd@gmail.com>>
#RUN apt-get update && apt-get dist-upgrade && apt-get install -y openjdk-8-jdk emacs
#RUN apt-get update && apt-get install -y openjdk-8-jre
#RUN apt-get install -y openjdk-8-jre
RUN apt-get update && apt-get install -y netbase net-tools netcat iputils-ping
COPY ./spark-1.6.0-bin-hadoop2.6.tgz /opt
COPY ./jdk-8u71-linux-x64.tar.gz /opt
RUN tar xfz /opt/jdk-8u71-linux-x64.tar.gz -C /opt
RUN tar xfz /opt/spark-1.6.0-bin-hadoop2.6.tgz -C /opt
RUN ln -s /opt/spark-1.6.0-bin-hadoop2.6 /opt/spark-latest
RUN ln -s /opt/jdk1.8.0_71 /opt/java-latest
ENV JAVA_HOME=/opt/java-latest
COPY ./spark-conf/* /opt/spark-latest/conf/
COPY ./bootstrap.sh /opt/bootstrap.sh
RUN rm /opt/*gz
EXPOSE 8080 7077 22222 45000-55000
CMD ["/opt/bootstrap.sh"]