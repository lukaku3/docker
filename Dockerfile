#FROM debian:8
#ENV DEBIAN_FRONTEND noninteractive
#RUN apt-get update && apt-get install -y         slapd=2.4.40+dfsg-1+deb8u3         ldap-utils=2.4.40+dfsg-1+deb8u3 &&     apt-get clean &&     rm -rf /var/lib/apt/lists/*
#COPY ./config/custom_inetorgperson.ldif /etc/ldap/schema/
#COPY ./entrypoint.sh /
#ENTRYPOINT ["/entrypoint.sh"]
FROM centos:7
ENV container docker
#RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
#systemd-tmpfiles-setup.service ] || rm -f $i; done); \
#rm -f /lib/systemd/system/multi-user.target.wants/*;\
#rm -f /etc/systemd/system/*.wants/*;\
#rm -f /lib/systemd/system/local-fs.target.wants/*; \
#rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
#rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
#rm -f /lib/systemd/system/basic.target.wants/*;\
#rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN yum install -y net-tools vim openldap openldap-clients openldap-devel openldap-devel openldap-servers; yum clean all; \
    systemctl enable slapd;

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
