echo `id`

# install zsh
printf "Y\n" | sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"


# install pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

echo '\nexport PYENV_ROOT="$HOME/.pyenv"\nexport PATH="$PYENV_ROOT/bin:$PATH"\neval "$(pyenv init --path)"\neval "$(pyenv virtualenv-init -)"\n' >> .zshrc
echo '\nexport PATH="$HOME/.local/bin:$PATH"' >> .zshrc

$HOME/.pyenv/bin/pyenv install $DEFAULT_PYTHON_VERSION
$HOME/.pyenv/bin/pyenv virtualenv $DEFAULT_PYTHON_VERSION $DEFAULT_ENV_NAME
$HOME/.pyenv/bin/pyenv global $DEFAULT_ENV_NAME



# install jupyter
$HOME/.pyenv/versions/$DEFAULT_ENV_NAME/bin/python3 -m pip install --upgrade pip
$HOME/.pyenv/versions/$DEFAULT_ENV_NAME/bin/python3 -m pip install jupyterlab

mkdir -p $HOME/.jupyter
echo "c.ServerApp.ip = '0.0.0.0'\n\
c.ServerApp.open_browser = False\n\
c.ServerApp.notebook_dir = '$HOME'" > $HOME/.jupyter/jupyter_lab_config.py