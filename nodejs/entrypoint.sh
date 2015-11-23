#!/bin/bash

source $NVM_DIR/nvm.sh
export TERM=linux
sudo mkdir /var/www
sudo chown -R nodedev:nodedev /var/www
cd /var/www

if [ $# -eq 0 ]
then
    exec "/bin/bash"
else
    exec "$@"
fi