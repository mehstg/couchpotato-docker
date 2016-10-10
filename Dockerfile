FROM centos:latest
MAINTAINER Paul Braham
RUN yum update -y && \
yum install git libxml2 libxml2-devel libxml2-python libxslt libxslt-devel -y && \
mkdir /opt/couchpotato && \
git clone https://github.com/CouchPotato/CouchPotatoServer.git /opt/couchpotato && \
ln -s /opt/config /root/.couchpotato && \
yum install epel-release -y && \
yum install python-pip gcc gcc-c++ python-devel openssl-devel -y && \
pip install --upgrade pip && \
pip install lxml pyopenssl


EXPOSE 5050

VOLUME ["/opt/config","/opt/downloads"]

ENTRYPOINT python /opt/couchpotato/CouchPotato.py

