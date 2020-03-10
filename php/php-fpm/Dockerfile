#FROM php:7-fpm
#
#COPY ./src/html /var/www/html
FROM centos:7

RUN groupadd -g1000 vagrant
RUN useradd -u1000 -g1000 vagrant
RUN yum update -y
COPY ./php/php-fpm/php7.sh /tmp/php7.sh
RUN /bin/sh /tmp/php7.sh
RUN systemctl enable php-fpm;
#COPY ./web/nginx/default.conf /etc/nginx/conf.d/default.conf

#VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/var/log/nginx", "/var/www"]

# Define working directory.
#WORKDIR /etc/nginx

# Define default command.
CMD ["/sbin/init"]

# Expose ports.
EXPOSE 9000
