## Introduction

A docker image including Ubuntu, CUDA, Python, Jupyter Lab for basic deep learning usage based on [nvidia/cuda](https://hub.docker.com/r/nvidia/cuda). It helps you starting a new system within a minute. Isolating your system from others in same server.

- **Jupyter Lab**: access via `http://public_IP:port`
- **ssh**： use `docker exec` to execute an iteractive shell in a running container.
- **Vscode remote container**

![](https://blog.hanklu.tw/post/cuda-docker-for-deep-learning/2021-06-26-01-11-45.png)

## Installation

### Prerequisite

1. Install [docker](https://docs.docker.com/engine/install/ubuntu/)
2. Install [docker-compose](https://docs.docker.com/compose/install/)
3. Install nvidia-driver
4. Install [nvidia toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#install-guide)

### Build image

```shell
git clone https://github.com/kehanlu/server-docker
cd server-docker
```

```shell
docker build \
--build-arg UID=$UID \
--build-arg USER=$USER \
-t lab .
```

### Run init.sh

create a directory for `/home/user` in docker

```shell
mkdir docker-home
docker run -v $(pwd)/docker-home:/home/$USER lab sh /src/init.sh
```

## Usage

### Start Jupyter

`-d`: run command in background

```shell
docker-compose up -d
```

**NOTE:** In `.env` you can change the default port of jupyter. Default: `your_ip:8080`

### Exec shell

Executing a shell in container(jupyter).

```shell
docker exec -it $USER_lab zsh
```

## Modified root file

Important! If you modify any file out of home directory, you must run `docker commit` for preserving the modified file or the change will be discarded after the container is closed. You can add the changes to `Dockerfile` and rebuild the image.

```shell
docker commit $USER_lab lab
```
