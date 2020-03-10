FROM centos:7

COPY ./web/nginx/nginx.repo /etc/yum.repos.d/nginx.repo
RUN yum update -y
RUN yum install -y  nginx && systemctl enable nginx
COPY ./web/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./web/nginx/default.conf /etc/nginx/conf.d/default.conf

VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/var/log/nginx", "/var/www"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["/sbin/init"]

# Expose ports.
EXPOSE 8000
EXPOSE 443
