#!/bin/bash
#
echo ">> install valgrind"
#apt-get -y install vlagrind
wget https://sourceware.org/pub/valgrind/valgrind-3.23.0.tar.bz2
tar -xf valgrind-3.23.0.tar.bz2
cd valgrind-3.23.0
./configure
make
make install

