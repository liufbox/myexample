:: Microsoft Visual Studio 2012 Visual C++ compiler
:: SET VC="D:\Program Files (x86)\Microsoft Visual Studio 14.0\VC"
:: Microsoft Windows SDK for Windows 7 and .NET Framework 4 
:: SET MSDK="C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A"
:: Java 1.7.0 update 21
SET JAVA_HOME="C:\javahome\jdk1.8.0_172"

 

javac HelloNative.java
javah HelloNative
::%VC%\bin\cl /I%JAVA_HOME%\include /I%JAVA_HOME%\include\win32 /I%VC%\include /I%VC%\lib /I%MSDK%\Lib HelloNative.c /FeHelloNative.dll /MACHINE:X64 /LD
:: Mingw gcc
gcc -m64 -Wl,--add-stdcall-alias -I"C:\javahome\jdk1.8.0_172\include" -I"C:\javahome\jdk1.8.0_172\include\win32" -shared -o HelloNative.dll HelloNative.c

java HelloNative

