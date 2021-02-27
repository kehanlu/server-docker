
```shell
echo '\nexport DOCKER_HOME=/path/to/docker-home' >> ~/.zshrc
docker build -t lab .
docker run -it --rm -v $PWD/init:/init -v $DOCKER_HOME:/root lab sh /init/init.sh
```

```shell
docker run -it --rm -v $DOCKER_HOME:/root -p 10088:8888 lab zsh
```

```shell
docker run -d --rm --name hank_server -v $DOCKER_HOME:/root -p 10088:8888 lab /root/.pyenv/versions/lab/bin/jupyter lab --allow-root 
```

```
sudo docker exec -it hank_server zsh
```

```shell
docker-compose up
```