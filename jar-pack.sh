#!/bin/bash

set -x

cd build/libs
# unpack the Java-only jar
jar xvvf libjpeg-turbo*.jar

# for each platform, create the lib directory suitable for
# https://github.com/scijava/native-lib-loader
# and move the corresponding library file
mkdir -p META-INF/lib/windows_64
mv ../../artifacts-windows-x86_64/Debug/turbojpeg.dll META-INF/lib/windows_64/
mkdir -p META-INF/lib/osx_64
mv ../../artifacts-macos-x86_64/libturbojpeg.dylib META-INF/lib/osx_64/
mkdir -p META-INF/lib/linux_64
mv ../../artifacts-linux-x86_64/libturbojpeg.so META-INF/lib/linux_64/
mkdir -p META-INF/lib/windows_arm64
mv ../../artifacts-windows-arm64/libturbojpeg.dll META-INF/lib/windows_arm64/

# repack the jar file to include the native libraries
jar uvvf libjpeg-turbo*.jar META-INF/lib/*
