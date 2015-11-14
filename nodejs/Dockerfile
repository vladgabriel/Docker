FROM ubuntu:14.04
MAINTAINER Vlad Vedinas [vedinasvlad@gmail.com]

# set envs
ENV SUDOER nodedev
# node v4.2.2 is LTS
ENV NODE_VERSION v4.2.2
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
        python \
        ruby

#create node user
RUN \
    useradd -ms /bin/sh $SUDOER && \
    usermod -a -G  sudo $SUDOER && \
    echo "$SUDOER    ALL=NOPASSWD:ALL" >> /etc/sudoers
# sass installation
RUN \
    gem install sass

USER $SUDOER
# install nvm & node and make it globally available
RUN \
    curl https://raw.githubusercontent.com/creationix/nvm/$NVM_VERSION/install.sh | bash && \
    source ~/.profile && \
    nvm install $NODE_VERSION && \
    n=$(which node);n=${n%/bin/node}; sudo chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local

# update npm to version 3. https://github.com/npm/npm/releases - get latest
RUN \
    sudo npm install -g npm@latest && \
    sudo chown -R $SUDOER ~/.npm
# install npm packages
RUN \
    sudo npm install -g \
        yo \
        generator-node \
        bower \
        grunt-cli \
        gulp \
        generator-angular-fullstack \
        nodemon \
        forever

#grunt should be install as dev-dependency in your project
#sudo npm install grunt --save-dev

#npm install can exceed windows shared folder path length
#to avoid this you need to do the following:
#mkdir /tmp/node_modules
#ln -s /tmp/node_modules /path/to/your/project/node_modules