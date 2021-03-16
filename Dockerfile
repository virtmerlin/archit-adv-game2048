FROM public.ecr.aws/u3e9a9s8/centos:7
MAINTAINER The CentOS Project <cloud-ops@centos.org>
LABEL Vendor="CentOS" \
      License=GPLv2 \
      Version=2.4.6-40
ENV ServerName=web2048-site

RUN yum -y update && \
    yum -y install httpd unzip && \
    yum clean all

# Install app
COPY ./code/ /var/www/html/

# Config App
RUN echo "ServerName fargate.training " >> /etc/httpd/conf/httpd.conf

EXPOSE 80

ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
