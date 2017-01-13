FROM ubuntu:latest

# dpkg-preconfigure error messages fix
# http://stackoverflow.com/a/31595470
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update \
  && apt-get install -y software-properties-common \
  && LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php \
  && apt-get update

#Install PHP and git
RUN apt-get install -y --allow-unauthenticated \
  php7.0-cli \
  php7.0-mysql \
  php7.0-gd \
  php7.0-json \
  php7.0-zip \
  php7.0-mbstring \
  git

RUN php -v

RUN apt-get install -y --allow-unauthenticated \
  nodejs \
  npm \

  && ln -s /usr/bin/nodejs /usr/bin/node

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

RUN mkdir /build /.config /.composer \
  && chown 82:82 /build /.config /.composer

USER 82

WORKDIR /build