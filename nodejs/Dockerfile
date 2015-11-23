FROM ubuntu:14.04
MAINTAINER Vlad Vedinas [vedinasvlad@gmail.com]

# set envs
ENV SUDOER nodedev
# node v4.2.2 is LTS
ENV NODE_VERSION v4.2.2
ENV NVM_VERSION v0.29.0
ENV NVM_DIR /home/$SUDOER/.nvm

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
        python \
        ruby \
        make

# sass installation
RUN \
    gem install sass

#create node user
RUN \
    useradd -ms /bin/sh $SUDOER && \
    usermod -a -G  sudo $SUDOER && \
    echo "$SUDOER    ALL=NOPASSWD:ALL" >> /etc/sudoers

USER $SUDOER

# install nvm & npm packages
RUN bash -c "\
    curl https://raw.githubusercontent.com/creationix/nvm/$NVM_VERSION/install.sh | bash && \
    source $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default && \
    npm install -g npm && \
    npm install -g \
        yo \
        generator-angular-fullstack \
        bower \
        grunt \
        grunt-cli"

USER root

COPY entrypoint.sh /entrypoint.sh
RUN chmod o+x /entrypoint.sh

USER $SUDOER
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]