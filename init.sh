# install zsh
printf "Y\n" | sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# install pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

/root/.pyenv/bin/pyenv install 3.8.5
/root/.pyenv/bin/pyenv virtualenv 3.8.5 lab
/root/.pyenv/bin/pyenv global lab

echo 'export PATH="/root/.pyenv/bin:$PATH"\neval "$(pyenv init -)"\neval "$(pyenv virtualenv-init -)"\nexport PYENV_VIRTUALENV_DISABLE_PROMPT=1' >> .zshrc

# install jupyter
/root/.pyenv/versions/3.8.5/envs/lab/bin/python -m pip install --upgrade pip
/root/.pyenv/versions/3.8.5/envs/lab/bin/python -m pip install jupyterlab

mkdir -p /root/.jupyter
echo "c.ServerApp.ip = '0.0.0.0'\n\
c.ServerApp.open_browser = False\n\
c.ServerApp.notebook_dir = '/root'" > /root/.jupyter/jupyter_lab_config.py