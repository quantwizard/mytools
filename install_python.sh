#!/usr/bin/env bash
yum -y update
yum groupinstall -y 'development tools'
yum install -y zlib-devel bzip2-devel openssl-devel xz-libs wget git
wget https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tar.xz
xz -d Python-2.7.11.tar.xz
tar -xvf Python-2.7.11.tar
cd Python-2.7.11
./configure --prefix=/usr/local

make
make altinstall
if [ -e /usr/bin/python ]; then        rm -f /usr/bin/python
fi
ln -s /usr/local/bin/python2.7 /usr/bin/python