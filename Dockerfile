FROM ubuntu:bionic

#Adding Maintainer
LABEL maintainer="Shashank Jaiswal  <shashanksuniljaiswal@outlook.com>"

RUN apt-get update

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && apt-get -y update && apt-get install -y locales curl software-properties-common \
  && locale-gen en_US.UTF-8 

RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update

# install php extensions
RUN apt-get install -y php5.6-cli php5.6-fpm
RUN apt-get install -y zlib1g-dev g++ icu-devtools icu-doc libicu-dev php5.6-mysql php5.6-zip php5.6-bcmath php5.6-curl php5.6-gd php5.6-dev
RUN apt-get install -y php5.6-json php5.6-tidy php5.6-opcache php5.6-xml php5.6-mbstring php5.6-soap 
RUN apt-get install -y php5.6-mcrypt php5.6-readline php5.6-common php5.6-dom php-pear 
RUN apt-get install -y php5.6-intl php-memcached 

# install PEAR channels && packages
#RUN pear channel-update pear.php.net
#RUN pear install Mail 
#RUN pear install Mail_Mime 
#RUN pear install Mail_mimeDecode 
#RUN pear install Net_SMTP



#PHP version
RUN php -version

#RUN cp /etc/php/5.6/fpm/php-fpm.conf /etc/php/5.6/fpm/php-fpm-backup.conf
#RUN rm -rf /etc/php/5.6/fpm/php-fpm.conf
#COPY ./conf/php-fpm.conf-development /etc/php/5.6/fpm/php-fpm.conf

#RUN cp -R /etc/php/5.6/fpm/pool.d /etc/php/5.6/fpm/pool.d-backup
#RUN rm -rf /etc/php/5.6/fpm/pool.d
#COPY ./conf/php-fpm.d /etc/php/5.6/fpm/pool.d

#COPY ./conf/php.ini-development /usr/local/etc/php/5.6/php.ini

RUN apt-get install -y vim
#RUN apt-get install -y monit

EXPOSE  9000 9010 9020 9030

# Include the start script
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
WORKDIR /root

CMD ["start.sh"]
