FROM php:7.0-fpm-alpine
RUN apk add --no-cache \
    autoconf \
    binutils \
    curl \
    file \
    freetype \
    freetype-dev \
    g++ \
    gcc \
    isl \
    libjpeg-turbo \
    libjpeg-turbo-dev \
    libmcrypt-dev \
    libpng \
    libpng-dev \
    make \
    postfix
RUN docker-php-ext-install -j 4 iconv mcrypt gd pdo_mysql
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

#Xdebug
#RUN apk del autoconf file g++ gcc binutils isl libatomic libc-dev musl-dev make re2c libstdc++ libgcc binutils-libs mpc1 mpfr3 gmp libgomp \
#  && rm -rf /var/cache/apk/*
#RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN echo "php_flag[display_errors] = Off">>/usr/local/etc/php-fpm.conf \
  && echo "php_admin_flag[log_errors] = On">>/usr/local/etc/php-fpm.conf \
  && echo "php_admin_value[display_errors] = 'stderr'">>/usr/local/etc/php-fpm.conf \
  && ln -sf /dev/stdout /var/log/php5-fpm.log

RUN docker-php-ext-install -j 4 \
  bcmath \
  bz2 \
  calendar \
  ctype \
  curl \
  dba \
  dom \
  enchant \
  exif \
  fileinfo \
  filter \
  ftp \
  gd \
  gettext \
  gmp \
  hash \
  iconv \
  imap \
  interbase \
  intl \
  json \
  ldap \
  mbstring \
  mcrypt \
  mysqli \
  oci8 \
  odbc \
  opcache \
  pcntl \
  pdo \
  pdo_dblib \
  pdo_firebird \
  pdo_mysql \
  pdo_oci \
  pdo_odbc \
  pdo_pgsql \
  pdo_sqlite \
  pgsql \
  phar \
  posix \
  pspell \
  readline \
  recode \
  reflection \
  session \
  shmop \
  simplexml \
  snmp \
  soap \
  sockets \
  spl \
  standard \
  sysvmsg \
  sysvsem \
  sysvshm \
  tidy \
  tokenizer \
  wddx \
  xml \
  xmlreader \
  xmlrpc \
  xmlwriter \
  xsl \
  zip

RUN rm -rf /var/cache/apk/*