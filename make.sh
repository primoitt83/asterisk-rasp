#!/bin/sh
 
apt-get update
 
apt-get install -y \
  build-essential \
  curl \
  libjack-dev \
  git \
  gzip \
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
  sqlite3 \
  tar \
  unixodbc \
  unixodbc-dev \
  uuid-dev \
  wget \
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
  libsnmp-dev
  
 
#git clone https://github.com/asterisk/asterisk.git /asterisk
wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-16-current.tar.gz
tar -xvf asterisk-*
cd asterisk-16.21.0
export DEBIAN_FRONTEND=noninteractive
contrib/scripts/install_prereq install
./configure --with-pjproject-bundled
make menuselect
make -j4
make install
make config
make samples
 
#cd /tmp
#wget https://downloads.digium.com/pub/telephony/codec_opus/asterisk-16.0/x86-64/codec_opus-16.0_current-x86_64.tar.gz
#tar xvzf codec_opus-*
#cp codec_opus-16.0_1.3.0-x86_64/*.so /usr/lib/asterisk/modules/
#cp codec_opus-16.0_1.3.0-x86_64/codec_opus_config-en_US.xml /var/lib/asterisk/documentation/thirdparty