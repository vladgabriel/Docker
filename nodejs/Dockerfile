FROM ubuntu:14.04
MAINTAINER Vlad Vedinas [vedinasvlad@gmail.com]

# set envs
ENV SUDOER nodedev
ENV NVM_DIR /home/$SUDOER/.nvm
ENV NODE_VERSION v4.2.1
ENV NVM_VERSION v0.29.0

# enable sh in order to use "source"
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
# system updates
RUN \
    apt-get update && \
    apt-get upgrade -y
#install dependencies
RUN \
    apt-get install -y \
        build-essential \
        libssl-dev \
        curl \
        git \
        python

#create node user
RUN \
    useradd -ms /bin/sh $SUDOER && \
    usermod -a -G  sudo $SUDOER && \
    echo "$SUDOER    ALL=NOPASSWD:ALL" >> /etc/sudoers

USER $SUDOER
# install nvm & node
RUN \
    curl https://raw.githubusercontent.com/creationix/nvm/$NVM_VERSION/install.sh | bash && \
    source ~/.profile && \
    nvm install $NODE_VERSION

# set node location
ENV NODE_PATH $NVM_DIR/versions/node/$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH

# update npm to version 3
RUN \
    npm install -g npm@3.0
# install npm packages
RUN \
    npm install -g \
        yo \
        generator-node \
        bower \
        grunt \
        grunt-cli \
        gulp \
        generator-angular-fullstack