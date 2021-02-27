
```shell
docker build -t lab .
docker run --rm -v $PWD/init:/init lab sh /init/init.sh
```

```
docker run -it --rm -v  $PWD/docker-home:/root -p 10088:8888 lab zsh
```

```
docker run -d --rm -v $PWD/docker-home:/root -p 10088:8888 lab /root/.pyenv/versions/lab/bin/jupyter lab --allow-root 
```

```
docker-compose up
```