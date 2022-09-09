Fork of version 1.2.1 of https://github.com/libjpeg-turbo/libjpeg-turbo.

This slightly modifies the Java bindings to prevent automatic native library loading.
GitHub Actions is set up to create native libraries for 64-bit Linux, Mac, and Windows.
A single jar containing the Java bindings and all three native libraries is also produced.
The jar is suitable for use with https://github.com/scijava/native-lib-loader.
