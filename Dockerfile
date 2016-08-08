# 本体
#
# VERSION               0.0.1

FROM      gendosu/ubuntu-ruby:2.2.3

MAINTAINER Gen Takahashi "gendosu@gmail.com"

RUN apt-get update \
&&  apt-get -y upgrade \
&&  apt-get install -y --force-yes \
    postgresql-client \
    libpq-dev \
    fonts-hanazono \
    imagemagick \
    language-pack-ja \
    fonts-migmix \
    sqlite3 \
    libsqlite3-dev \
&& apt-get clean \
&& rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash \
&& bash -c ". /root/.nvm/nvm.sh; nvm install v5.7.0; npm install webpack -g"

RUN mkdir -p /products
WORKDIR /products

ADD Gemfile /products/Gemfile
ADD Gemfile.lock /products/Gemfile.lock
ADD run.sh /products

RUN eval "$(rbenv init -)"; bundle
