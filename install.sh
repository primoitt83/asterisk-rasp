#!/bin/sh
 
apt-get update
 
apt-get install -y \
  festival \
  libedit-dev \
  libjansson-dev \
  libldap2-dev \
  libncurses5-dev \
  libsqlite3-dev \
  libsrtp2-dev \
  libssl-dev \
  libuuid1 \
  libxml2-dev \
  odbc-postgresql \
  openssl \
  postgresql-client \
  supervisor \
  unixodbc \
  unixodbc-dev \
  uuid-dev \
  libxslt-dev \
  liburiparser-dev \
  xmlstarlet \
  libopus-dev \
  libopusfile-dev \
  libcurl4 \
  libcurl4-openssl-dev \
  libsybdb5 \
  libiksemel-dev \
  libosptk-dev \
  libcodec2-dev \
  libneon27-dev \
  libgmime-3.0-dev \
  libradcli-dev \
  libspeex-dev \
  libgsm1-dev \
  libvorbisfile3 \
  libradcli-dev \
  libunbound-dev \
  libspandsp-dev \
  liblua5.2-dev \
  libsnmp-dev \
  libjack-dev
   
apt-get autoclean
 
useradd asterisk
echo "asterisk:Obelix" | chpasswd