FROM nvidia/cuda:10.2-devel-ubuntu18.04


# set timezone
ENV TZ=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get install -y apt-utils

# install some useful tools
RUN apt-get install -y openssh-server git vim wget curl zsh tmux zip htop sudo 

# install pyenv dependencies
RUN apt-get install -y --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

RUN echo '%sudo   ALL=(ALL:ALL) NOPASSWD:ALL' >> '/etc/sudoers'
ENV SHELL=/bin/zsh

ARG DEFAULT_ENV_NAME
ARG DEFAULT_PYTHON_VERSION
ENV DEFAULT_ENV_NAME=${DEFAULT_ENV_NAME}
ENV DEFAULT_PYTHON_VERSION=${DEFAULT_PYTHON_VERSION}

ARG UID
ARG USER
ARG DEFAULT_PASSWORD
RUN useradd -r -u ${UID} -G sudo -s /bin/zsh --create-home ${USER} 
# Not secure!
RUN echo "${USER}:${DEFAULT_PASSWORD}" | chpasswd 
USER ${USER}
WORKDIR /home/${USER}
COPY init.sh /src/init.sh