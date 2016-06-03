docker run -t -i -p 8080 -p 7077 --ip 172.17.0.2 -e SPARK_MODE=master b55bd4e816e9
docker rm 6c80b49c6e84
docker rm $(docker ps -a -q)
