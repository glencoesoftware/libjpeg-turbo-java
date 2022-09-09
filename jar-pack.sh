#!/bin/bash

set -x

# extract downloaded artifacts for each platform
unzip artifacts-linux-x86_64.zip
unzip artifacts-macos-x86_64.zip
unzip artifacts-windows-x86_64.zip
cd build/libs
# unpack the Java-only jar
jar xvvf libjpeg-turbo*.jar

# for each platform, create the lib directory suitable for
# https://github.com/scijava/native-lib-loader
# and move the corresponding library file
mkdir -p META-INF/lib/windows_64
mv ../../Debug/turbojpeg.dll META-INF/lib/windows_64/
mkdir -p META-INF/lib/osx_64
mv ../../libturbojpeg.dylib META-INF/lib/osx_64/
mkdir -p META-INF/lib/linux_64
mv ../../libturbojpeg.so META-INF/lib/linux_64/

# repack the jar file to include the native libraries
jar uvvf libjpeg-turbo*.jar META-INF/lib/*
