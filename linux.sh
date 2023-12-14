#!/bin/bash

set -x

cd "$(dirname "${0}")"
if [ "$(uname -i)" = aarch64 ]; then
    export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk"
else
    export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk.x86_64"
fi
export CPPFLAGS="-I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux"
cd libjpeg-turbo
autoreconf -fiv
mkdir build
cd build
../configure --with-java
make
if [ "$(uname -i)" = aarch64 ]; then
    mv .libs/libturbojpeg.so .libs/libturbojpeg-arm64.so
fi
