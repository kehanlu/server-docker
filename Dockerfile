FROM nvidia/cuda:10.2-devel-ubuntu18.04
WORKDIR /root/lab

ENV SHELL=/bin/zsh
ENV TZ=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get install -y apt-utils
# install some useful tools
RUN apt-get install -y git vim wget curl zsh tmux zip htop

# install pyenv dependencies
RUN apt-get install -y --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# install node
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash
RUN apt-get install -y nodejs