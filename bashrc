# Babun Only
#export PATH=$PATH:/cygdrive/c/Users/johnny.kaps/.boot2docker/certs/boot2docker-vm/
#export PATH=$PATH:/cygdrive/c/Program\ Files/Boot2Docker\ for\ Windows/

#export DOCKER_CERT_PATH=/cygdrive/c/Users/johnny.kaps/.boot2docker/certs/boot2docker-vm
#export DOCKER_TLS_VERIFY=1
#export DOCKER_HOST=tcp://192.168.59.103:2376

# Console2 Only
#export PATH=$PATH:/c/Users/johnny.kaps/.boot2docker/certs/boot2docker-vm/
#export PATH=$PATH:/c/Program\ Files/Boot2Docker\ for\ Windows/

#export DOCKER_CERT_PATH=/c/Users/johnny.kaps/.boot2docker/certs/boot2docker-vm
#export DOCKER_TLS_VERIFY=1
#export DOCKER_HOST=tcp://192.168.59.103:2376

git_status='git rev-parse --abbrev-ref HEAD 2>/dev/null'

export PATH=$PATH:$HOME/bin
export PS1="${debian_chroot:+($debian_chroot)}\[\e[32m\]\u\[\e[0m\]@\[\e[35m\]\h\[\e[0m\]|\[\e[36m\]\w\[\e[33m\]\$($git_status)>\[\e[0m\]"
export TERM=xterm

[[ "$-" != *i* ]] && return

#eval $(ssh-agent -s)
#ssh-add ~/.ssh/jk_gh_xubuntu
#ssh-add ~/.ssh/jk_bb_xubuntu

if [ -f "${HOME}/.bash_aliases" ]; then
  source "${HOME}/.bash_aliases"
fi

if [ -f "$HOME/.nvm/nvm.sh" ]; then
  source "$HOME/.nvm/nvm.sh"
  nvm use node
fi

if [ -d "/usr/share/nginx" ]; then
  echo "NGINX Detected"
  if [ ! -d "/usr/share/nginx/html" ]; then
  echo "NGINX HTML directory Detected"
    if [ ! -L "/usr/share/nginx/html" ]; then
      echo "Installing missing components to use with Docker container aj."
      cd ${HOME}/code/current/alex_client/.lib
      npm install
      bower install
      mkdir /home/fads/code/current/alex_client/.www
      gulp debug
      sudo ln -s /home/fads/code/current/alex_client/.www /usr/share/nginx/html
      echo "Installation complete. Docker container aj is ready."
    fi
  fi
fi

if [ $HOSTNAME == "aj" ]; then
  cd ${HOME}/code/current/alex_client/.lib
  clear  
  echo "Starting Karma"
  karma start
fi

  
