#!/bin/bash
# Move compiled binaries for each platform under src/main/resources
# for packaging
# For each supported platform, create the lib directory suitable for
# https://github.com/scijava/native-lib-loader
# and move the corresponding library file

set -x

mkdir -p src/main/resources/META-INF/lib/windows_64
mv artifacts-windows-x86_64/Debug/turbojpeg.dll src/main/resources/META-INF/lib/windows_64/
mkdir -p src/main/resources/META-INF/lib/osx_arm64
mv artifacts-macos-arm64/libturbojpeg.dylib src/main/resources/META-INF/lib/osx_arm64/
mkdir -p src/main/resources/META-INF/lib/osx_64
mv artifacts-macos-x86_64/libturbojpeg.dylib src/main/resources/META-INF/lib/osx_64/
mkdir -p src/main/resources/META-INF/lib/linux_arm64
mv artifacts-linux-arm64/libturbojpeg.so src/main/resources/META-INF/lib/linux_arm64/
mkdir -p src/main/resources/META-INF/lib/linux_64
mv artifacts-linux-x86_64/libturbojpeg.so src/main/resources/META-INF/lib/linux_64/
