#include "HelloNative.h"
 
#include <stdio.h>
 
  
JNIEXPORT void JNICALL Java_HelloNative_sayHello(JNIEnv *env, jobject obj) 
{
 
	printf("Hello£¬JNI, stoneliu\n"); 
	return;
}


JNIEXPORT void JNICALL Java_HelloNative_hello(JNIEnv *env, jclass class, jstring message)
{
	const char *nativeString = (*env)->GetStringUTFChars(env, message, 0);
    printf("Hello %s", nativeString);
    (*env)->ReleaseStringUTFChars(env, message, nativeString);
}

