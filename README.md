[Design detail](https://blog.hanklu.tw/post/2021/docker-for-deep-learning/)

## Introduction

A docker image including Ubuntu, CUDA, Python, Jupyter Lab for basic deep learning usage based on [nvidia/cuda](https://hub.docker.com/r/nvidia/cuda). It helps you starting a new system within a minute. Isolating your system from others in same server.

- **Jupyter Lab**: access via `http://public_IP:port`
- **ssh**： connet to container via ssh
- **Vscode remote container**(based on ssh)

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
--build-arg DEFAULT_ENV_NAME=lab \
--build-arg DEFAULT_PYTHON_VERSION=3.8.9 \
--build-arg DEFAULT_PASSWORD=password \
-t ${USER}-lab-image .
```

### Run init.sh

Create a directory for `/home/user` in docker. **Note**: you have to create the directory by yourself, or you will encouter `permission denied` error.

```shell
mkdir docker-home
docker run -v $(pwd)/docker-home:/home/$USER ${USER}-lab-image sh /src/init.sh
```

### Change password

The default password is set to `password` when building docker image. For security reason, setting up password in Dockerfile is not recommended. Please change the password before you start your project.

```shell
# Run the container
docker-compose up -d

# Execute a shell in the runing container and change the password
docker exec -it ${USER}_lab passwd

# Commit the change.
docker commit ${USER}_lab ${USER}-lab-image

# Close the container
docker-compose down
```

## Usage

**NOTE:** In `.env` you can change the external port and virtualenv to start jupyter.

```
JUPYTER_PORT=8080
SSH_PORT=2222
ENV_NAME=lab
```

### Start Jupyter

`-d`: run container in the background

```shell
docker-compose up -d
```

### SSH

Use ssh to log into container via 2222 port.

```shell
ssh username@your_ip -p 2222
```


### Executing shell

Executing a shell in a runing container(or you can just use ssh to login as describe above.)

```shell
docker exec -it ${USER}_lab zsh
```

## Modified root file

Important! If you modify any file out of home directory(e.g. change password), you must run `docker commit` for preserving the modified file, or the change will be discarded after the container is closed. You can also add the changes to `Dockerfile` and rebuild the image.

```shell
docker commit ${USER}_lab ${USER}-lab-image
```


## Change log

2021-09-09
- add ssh login and password setup
- add default shell
- add more argument when building image
- fix environment bug