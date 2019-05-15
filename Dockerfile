FROM node:latest

LABEL maintainer="Roger Pence"

RUN apt-get update \
    && apt-get install -y --no-install-recommends apt-utils \
    && apt-get install apt-transport-https \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |  apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && apt-get update 
    #&& apt-get install -y git yarn \
    # && apt-get -y autoremove \
    # && apt-get clean \
    # && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

WORKDIR /opt    

RUN cd /opt \
    && apt-get install apt-transport-https \
    && npm install gulp-cli -g \
    && npm init -y \
    && npm install --save-dev gulp \
    && npm install --save-dev tailwindcss@next 

