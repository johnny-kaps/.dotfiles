# Babun Only
#export PATH=$PATH:/cygdrive/c/Users/johnny.kaps/.boot2docker/certs/boot2docker-vm/
#export PATH=$PATH:/cygdrive/c/Program\ Files/Boot2Docker\ for\ Windows/
#export PATH=$PATH:$HOME/bin

#export DOCKER_CERT_PATH=/cygdrive/c/Users/johnny.kaps/.boot2docker/certs/boot2docker-vm
#export DOCKER_TLS_VERIFY=1
#export DOCKER_HOST=tcp://192.168.59.103:2376

# Console2 Only
export PATH=$PATH:/c/Users/johnny.kaps/.boot2docker/certs/boot2docker-vm/
export PATH=$PATH:/c/Program\ Files/Boot2Docker\ for\ Windows/
export PATH=$PATH:$HOME/bin

export DOCKER_CERT_PATH=/c/Users/johnny.kaps/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376


[[ "$-" != *i* ]] && return

eval $(ssh-agent -s)
ssh-add ~/.ssh/jk_gh_xubuntu

# Aliases
if [ -f "${HOME}/.bash_aliases" ]; then
  source "${HOME}/.bash_aliases"
fi


if [ -f "$HOME/.nvm/nvm.sh" ]; then
  source "$HOME/.nvm/nvm.sh"
  nvm use node
fi


