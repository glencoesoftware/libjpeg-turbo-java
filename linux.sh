#!/bin/bash

set -x

cd "$(dirname "${0}")"
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
export CPPFLAGS="-I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux"
cd libjpeg-turbo
autoreconf -fiv
mkdir build
cd build
../configure --with-java
make
