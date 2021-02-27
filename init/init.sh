printf "Y\n" | sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

/root/.pyenv/bin/pyenv install 3.8.5
/root/.pyenv/bin/pyenv virtualenv 3.8.5 lab

cp /init/.zshrc /root
cp /init/.p10k.zsh /root


pip install jupyterlab
echo "c.ServerApp.password_required = True\n\
      c.ServerApp.ip = '0.0.0.0'\n\
      c.ServerApp.open_browser = False\n\
      c.ServerApp.notebook_dir = '/root'" > /root/.jupyter/jupyter_lab_config.py
echo 'ServerApp": {"password": "sha1:61dfcf7ce7d1:35a8c56ad9c981cea8dce87ad5ee138932ba1b8c"}}' > /root/.jupyter/jupyter_server_config.json