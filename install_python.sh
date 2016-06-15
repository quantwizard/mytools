#!/usr/bin/env bash
# Authur: Feng Liu
# Date: 9 Mar, 2016
# This shell script is used to update python on CentOS from 2.6 to 2.7 

yum -y update
yum groupinstall -y 'development tools'
yum install -y zlib-devel bzip2-devel openssl-devel xz-libs wget git
if [ ! -f ./Python-2.7.11.tar.xz ]; then
    wget https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tar.xz
    if [ ! -d ./Python-2.7.11 ]; then
        xz -d Python-2.7.11.tar.xz
        tar -xvf Python-2.7.11.tar
    fi
fi
cd Python-2.7.11
./configure --prefix=/usr/local

make
make altinstall
if [ -e /usr/bin/python ]; then        
    rm -f /usr/bin/python
fi
ln -s /usr/local/bin/python2.7 /usr/bin/python
sed -i -e '1c#!/usr/bin/python2.6' /usr/bin/yum
