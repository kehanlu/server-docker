
```shell
mkdir -p docker-home
```

## `.env`
```plaintext
USER=hank
PORT=8888
HOME=./docker-home
```

## Build and initial docker image
```shell
docker build -t lab .
docker run -it --rm -v ./init:/init -v $DOCKER_HOME:/root lab sh /init/init.sh
```

## Test Run
```shell
docker-compose run --rm -p 8888:8888 zsh
docker-compose run -p 8888:8888 jupyter
```

## RUN!
```shell
# run jupyter server
docker-compose up -d jupyter

# run shell in container
sudo docker exec -it ${USER}_server zsh
```