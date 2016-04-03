From ubuntu:14.04

RUN apt-get -y update

RUN apt-get -y install curl

RUN apt-get -y install apache2 \
    php5 libapache2-mod-php5  \
    php5-fpm php5-cli php5-mysqlnd php5-pgsql php5-sqlite php5-redis \
    php5-apcu php5-intl php5-imagick php5-mcrypt php5-json php5-gd php5-curl && \
    php5enmod mcrypt && \
    rm -rf /var/lib/apt/lists/* && \
    cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

COPY apache-foreground /usr/local/bin/

EXPOSE 80

CMD ["apache-foreground"]
