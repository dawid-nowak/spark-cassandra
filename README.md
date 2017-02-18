# spark-cassandra
Dockerized Apache Spark + Cassandra




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
Following commands should do the trick assuming that you have a docker network called **spark_default** created
```
docker run -d --rm  --network sparkcassandra_default -e "SPARK_MODE=master"  --name spark-master dawidnowak/spark-cassandra:2.1
docker run -d --rm  --network sparkcassandra_default --name spark-node1 dawidnowak/spark-cassandra:2.1
```