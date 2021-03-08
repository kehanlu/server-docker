1. Install Docker & Docker-compose
    https://docs.docker.com/engine/install/ubuntu/

2. Install nvidia toolkit
    https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#install-guide



## Build and initialize docker image
```shell
export DOCKER_HOME=$PWD/docker-home
mkdir -p $DOCKER_HOME

docker build -t lab - < Dockerfile

# You have to enter Jupyter lab password at the end
docker run -it --rm -v $PWD/init:/init -v $DOCKER_HOME:/root lab sh /init/init.sh
```

## Create `.env` file

- Container name will be `${DOCKER_USER}_server`
- Host name will be `${DOCKER_USER}-docker`

```plaintext
DOCKER_USER=your_username
PORT=8888
DOCKER_HOME=./docker-home
```

## Test Run
```shell
docker-compose run -p 8888:8888 zsh
docker-compose run -p 8888:8888 jupyter
```

## RUN!
```shell
# run jupyter server
docker-compose up -d

# run shell in container
sudo docker exec -it ${USER}_server zsh
```