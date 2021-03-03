1. Install Docker & Docker-compose
    https://docs.docker.com/engine/install/ubuntu/

2. Install nvidia toolkit
    https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#install-guide



## Build and initial docker image
```shell
mkdir -p ./docker-home
export DOCKER_HOME=./docker-home

docker build -t lab .
docker run -it --rm -v ./init:/init -v $DOCKER_HOME:/root lab sh /init/init.sh
```

## `.env` file
```plaintext
USER=hank
PORT=8888
HOME=./docker-home
```

## Test Run
```shell
docker-compose run -p 8888:8888 zsh
docker-compose run -p 8888:8888 jupyter
```

## RUN!
```shell
# run jupyter server
docker-compose up -d jupyter

# run shell in container
sudo docker exec -it ${USER}_server zsh
```