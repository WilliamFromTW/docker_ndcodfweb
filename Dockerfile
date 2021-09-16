FROM centos:7
RUN yum -y install epel-release
RUN yum -y update 
RUN yum -y upgrade
RUN yum -y install sudo unzip ntp bind-utils net-tools supervisor httpd mod-ssl telnet rsyslog vi vim wget rsync 
EXPOSE 9980
VOLUME ["/etc/ndcodfweb","/etc/letsencrypt","/var/log"]
COPY rsyslog.conf /etc/rsyslog.conf
COPY listen.conf /etc/rsyslog.d/listen.conf
COPY setup.sh /setup.sh
COPY prepare.sh /prepare.sh
RUN  yum -y reinstall glibc-common \
    && localedef -c -f UTF-8 -i en_US en_US.UTF-8 \
    && echo 'LANG="en_US.UTF-8"' > /etc/locale.conf \
    && source /etc/locale.conf 
ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8
RUN chmod +x /setup.sh
RUN /prepare.sh
COPY ndcodfweb.xml /etc/ndcodfweb
COPY supervisord.conf /etc
CMD /setup.sh
