# spark-cassandra
Dockerized Apache Spark + Cassandra

This allows running Apache Spark Standalone co-resident with Apache Cassandra Distributed Database.

The image is based on https://hub.docker.com/_/cassandra/ with some additions to get Apache Spark running

# running with compose
Ideally you would run it using docker compose ( see yml file provided). This will ensure that you start master and a worker node on the same network so they can see each other.



```bash
docker-compose --project-name spark-cassandra build
docker-compose --project-name spark-cassandra up -d
```

# scaling
With docker-compose adding mode worker nodes is as easy as:

```bash
docker-compose --project-name spark-cassandra scale spark-cassandra-node=3
```

# running with docker
Following commands should do the trick assuming that you have a docker network called **sparkcassandra_default** created
```
docker run -d --rm  --network sparkcassandra_default -e "SPARK_MODE=master" -e "CASSANDRA_SEEDS=spark-cassandra-master" --name spark-master dawidnowak/spark-cassandra:2.1
docker run -d --rm  --network sparkcassandra_default -e "CASSANDRA_SEEDS=spark-cassandra-master" --name spark-node1 dawidnowak/spark-cassandra:2.1
```

#checking your deployment
Cassandra
```
docker exec -ti spark-cassandra-master nodetool status

```
Spark Web Console can be accessed at 
```
firefox http://<<spark-master-cassandra>>:8080
```

