## Installation

1. [Install Docker & Docker-compose](https://docs.docker.com/engine/install/ubuntu/)
2. [Install nvidia toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#install-guide)

## Build Image

```shell
git clone https://github.com/kehanlu/server-docker

cd server-docker

docker build -t lab .
docker run -v $(pwd)/docker-home:/root sh /src/init.sh

# Done!
```

## Run Container

Edit `.env`

```shell
DOCKER_USER=username
JUPYTER_PORT=8990
DOCKER_HOME=./docker-home
```

start Jupyter server.

```shell
docker-compose up -d
```

Attach a shell to container.

```shell
docker exec -it username_server zsh
```
