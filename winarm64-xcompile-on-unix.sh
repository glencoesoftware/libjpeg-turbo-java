if [ ! -d "jdk" ]; then
    # https://learn.microsoft.com/en-us/java/openjdk/download#openjdk-11
    wget https://aka.ms/download-jdk/microsoft-jdk-11.0.21-windows-aarch64.zip -O jdk.zip
    unzip jdk.zip
    rm jdk.zip
    mv jdk-11.0.21+9 jdk
fi
export JAVA_HOME="${PWD}/jdk"
export CPPFLAGS="-I${JAVA_HOME}/include -I${JAVA_HOME}/include/win32"
export CC="zig cc -target aarch64-windows"
export CXX="zig c++ -target aarch64-windows"
export AR="zig ar"
export RANLIB="zig ranlib"
cd libjpeg-turbo
autoreconf -fiv
mkdir build_winarm
cd build_winarm
../configure --with-java --host aarch64-windows
make
zig cc -target aarch64-windows .libs/libturbojpeg.a -shared -o .libs/libturbojpeg-arm64.dll

