# Download base with Ubuntu and php 8.2
 
FROM amd64/php:8.2-cli
COPY . /usr/run/php
 
# LABEL about the custom image
LABEL maintainer="ranceaaron941@gmail.com"
 
#Update Ubuntu Software repository
RUN apt-get update
 
# Install packages
RUN set -x \
  && apt-get install -y wget \
    software-properties-common \
    build-essential \
    git \
    nano
 
RUN apt-get update && apt-get install -y \
    zip \
    unzip
 
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
 
RUN composer require aws/aws-sdk-php
 
WORKDIR /usr/run/php
CMD [ "php", "index.php" ]
