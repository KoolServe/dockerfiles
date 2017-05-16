FROM ubuntu:latest

# dpkg-preconfigure error messages fix
# http://stackoverflow.com/a/31595470
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update \
  && apt-get -y install curl libltdl7 iptables \
  && curl -O https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_17.03.1~ce-0~ubuntu-xenial_amd64.deb \
  && dpkg -i docker-ce_17.03.1~ce-0~ubuntu-xenial_amd64.deb

RUN docker --version

#Install PHP and git
RUN apt-get install -y --allow-unauthenticated \
  php7.0-cli \
  php7.0-curl \
  php7.0-json \
  php7.0-mysql \
  php7.0-gd \
  php7.0-json \
  php7.0-zip \
  php7.0-mbstring \
  php7.0-common \
  git \
  nodejs \
  npm \

  && ln -s /usr/bin/nodejs /usr/bin/node \

  && php -v \
  && node -v \
  && npm -v

RUN npm -g install bower grunt-cli gulp yarn \
  && bower --version \
  && grunt --version \
  && gulp --version \
  && yarn --version

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer \
  && composer --allow-root --version

RUN mkdir /build /.config /.composer /.npm /.yarn /.local \
  && chown 82:82 /build /.config /.composer /.npm /.yarn /tmp /.local

#USER 82

WORKDIR /build
