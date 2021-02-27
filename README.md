
```shell
echo 'export DOCKER_HOME=/path/to/docker-home'
docker build -t lab .
docker run --rm -v $PWD/init:/init $DOCKER_HOME:/root lab sh /init/init.sh
```

```shell
docker run -it --rm -v  $DOCKER_HOME:/root -p 10088:8888 lab zsh
```

```shell
docker run -d --rm -v $DOCKER_HOME:/root -p 10088:8888 lab /root/.pyenv/versions/lab/bin/jupyter lab --allow-root 
```

```shell
docker-compose up
```