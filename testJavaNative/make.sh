#!/bin/sh

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.
javac HelloNative.java
javah HelloNative
gcc -I$JAVA_HOME/include -I$JAVA_HOME/include/linux -fPIC -shared HelloNative.c -o libHelloNative.so
java -cp ./ HelloNative

