
```shell
docker build -t lab .
docker run -it --rm -v ./init:/init -v ./docker-home:/root lab sh /init/init.sh
```

```shell
docker-compose run --rm -p 10088:8888 zsh

docker-compose run -p 10088:8888 jupyter
```

```shell
docker-compose up -d jupyter

sudo docker exec -it hank_server zsh
```