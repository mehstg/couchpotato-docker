FROM centos:latest
MAINTAINER Paul Braham
RUN yum update -y && \
yum install git -y && \
mkdir /opt/sabnzbd && \
git clone https://github.com/sabnzbd/sabnzbd.git /opt/sabnzbd/ --depth 1 && \
yum install epel-release -y && \


pip install --upgrade pip && \

EXPOSE 8080

VOLUME ["/opt/config","/opt/downloads"]

ENTRYPOINT python /opt/sabnzbd/SABnzbd.py -b 0 -f /opt/config -s 0.0.0.0:8080

