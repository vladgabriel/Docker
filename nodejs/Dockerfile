FROM ubuntu:14.04
MAINTAINER Vlad Vedinas [vedinasvlad@gmail.com]

# node version to install
ENV NODE_VERSION v4.2.1
# nodeuser
ENV SUDOER nodedev

# run system updates
RUN \
    apt-get update && \
    apt-get upgrade -y

# install dependencies for nvm
RUN \
    apt-get install -y \
        build-essential \
        libssl-dev \
        curl

# create sudoer
RUN \
    useradd -ms /bin/bash $SUDOER && \
    usermod -a -G  sudo $SUDOER && \
    echo "$SUDOER    ALL=NOPASSWD:ALL" >> /etc/sudoers

USER $SUDOER

# install nvm
RUN \
    curl --location https://raw.github.com/creationix/nvm/master/install.sh | sh && \
    sudo /bin/bash -c "echo \"[[ -s \$HOME/.nvm/nvm.sh ]] && . \$HOME/.nvm/nvm.sh\" >> /etc/profile.d/npm.sh" && \
    echo "[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh" >> $HOME/.bashrc

# install node
#RUN \
#    nvm install $NODE_VERSION

#RUN \
#    npm install yo && \
#    npm install --global generator-node