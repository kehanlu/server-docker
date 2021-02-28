printf "Y\n" | sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

/root/.pyenv/bin/pyenv install 3.8.5
/root/.pyenv/bin/pyenv virtualenv 3.8.5 lab
/root/.pyenv/bin/pyenv global lab

cp /init/.zshrc /root
cp /init/.p10k.zsh /root

/root/.pyenv/versions/3.8.5/envs/lab/bin/python -m pip install --upgrade pip
/root/.pyenv/versions/3.8.5/envs/lab/bin/python -m pip install jupyterlab
mkdir -p /root/.jupyter
echo "c.ServerApp.password_required = True\n\
c.ServerApp.ip = '0.0.0.0'\n\
c.ServerApp.open_browser = False\n\
c.ServerApp.notebook_dir = '/root'" > /root/.jupyter/jupyter_lab_config.py

echo "\n\nJupyter lab password:"
/root/.pyenv/versions/3.8.5/envs/lab/bin/python -m jupyter_server.auth password