FROM alpine:latest
MAINTAINER Paul Braham

RUN apk add --no-cache --virtual .build-deps curl git gcc g++ python-dev openssl-dev libxml2-dev libxslt-dev && \
# Install packages
apk add --no-cache python libxml2 libxslt && \
# Installing python dependencies 
curl https://bootstrap.pypa.io/get-pip.py > /root/pip.py && \
python /root/pip.py && \
pip install lxml && \
# Install Couchpotato
git clone https://github.com/CouchPotato/CouchPotatoServer.git /opt/couchpotato && \
ln -s /opt/config /root/.couchpotato && \

# Removing all software installed in order to compile 
apk del .build-deps && \
# Removing all download and package cache 
rm -rf /var/cache/apk/* && \
rm /root/pip.py

EXPOSE 5050

VOLUME ["/opt/config","/opt/downloads","/opt/tv","/opt/films/"]

ENTRYPOINT python /opt/couchpotato/CouchPotato.py --data_dir ${CP_DATA-/opt/config}

