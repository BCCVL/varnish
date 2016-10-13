FROM hub.bccvl.org.au/centos/centos7-epel:2016-08-21

RUN yum -y install https://repo.varnish-cache.org/redhat/varnish-4.1.el7.rpm && \
    yum -y install varnish

ENV VARNISH_VCL_CONF /etc/varnish/default.vcl
ENV VARNISH_LISTEN_ADDRESS 127.0.0.1
ENV VARNISH_LISTEN_PORT 6081
ENV VARNISH_ADMIN_LISTEN 127.0.0.1
ENV VARNISH_ADMIN_LISTEN_PORT 6082
ENV VARNISH_SECRET_FILE /etc/varnish/secret
ENV VARNISH_STORAGE malloc,1G

COPY files/cmd.sh /cmd.sh

CMD ["/cmd.sh"]
