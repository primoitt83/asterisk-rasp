#!/bin/sh
 
apt-get update
 
apt-get install -y \
  build-essential \
  curl \
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
  wget
 
#git clone https://github.com/asterisk/asterisk.git /asterisk
#wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-16-current.tar.gz
wget http://downloads.asterisk.org/pub/telephony/asterisk/old-releases/asterisk-13.33.0.tar.gz
tar -xvf asterisk-*
# Comente daqui pra baixo para alterar coisas no asterisk
cd asterisk-13.33.0
export DEBIAN_FRONTEND=noninteractive
contrib/scripts/install_prereq install
./configure --with-pjproject-bundled
make menuselect.makeopts
menuselect/menuselect --disable-category MENUSELECT_CDR menuselect.makeopts
menuselect/menuselect --disable-category MENUSELECT_CEL menuselect.makeopts
menuselect/menuselect --enable MOH-OPSOUND-WAV menuselect.makeopts
menuselect/menuselect --disable-category MENUSELECT_UTILS menuselect.makeopts
menuselect/menuselect --disable astcanary --disable astdb2sqlite3 --disable astdb2bdb menuselect.makeopts
menuselect/menuselect --disable CORE-SOUNDS-EN-GSM menuselect.makeopts
menuselect/menuselect --enable CORE-SOUNDS-EN-WAV menuselect.makeopts
menuselect/menuselect --enable codec_opus menuselect.makeopts
make -j4
make install
make config
make samples
 
#cd /tmp
#wget https://downloads.digium.com/pub/telephony/codec_opus/asterisk-16.0/x86-64/codec_opus-16.0_current-x86_64.tar.gz
#tar xvzf codec_opus-*
#cp codec_opus-16.0_1.3.0-x86_64/*.so /usr/lib/asterisk/modules/
#cp codec_opus-16.0_1.3.0-x86_64/codec_opus_config-en_US.xml /var/lib/asterisk/documentation/thirdparty