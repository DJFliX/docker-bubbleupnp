#!/bin/sh


HOMEDIR="$(dirname $0)"
cd "$HOMEDIR"

if [ "x$JAVA_HOME" != "x" ]; then
    JAVA="$JAVA_HOME/bin/java"
else
    JAVA="java"
fi


LAUNCHER_JAR="BubbleUPnPServerLauncher.jar"

if [ ! -f "$LAUNCHER_JAR" ]; then

    DOWNLOAD_URL="https://bubblesoftapps.com/bubbleupnpserver/core/$LAUNCHER_JAR"

	if command -v wget &> /dev/null; then
		wget -q "$DOWNLOAD_URL"
	elif command -v curl &> /dev/null; then
		curl -s "$DOWNLOAD_URL" -o "$LAUNCHER_JAR"	
	fi
fi 


# to make sure ffmpeg is found and used if present in start directory 
export PATH=".:$PATH"

# -Xss256k: thread stack size. 256K reduces per-thread memory usage and may prevent "java.lang.OutOfMemoryError: unable to create new native thread" on some systems
# -Djava.awt.headless=true: required for image transcoding to work on headless systems (eg no X-Window libraries)
# -Djava.security.disableSystemPropertiesFile: required on openSUSE Tumbleweed for connection test to not fail 

JVM_ARGS="-Xss256k -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8 -Djava.security.disableSystemPropertiesFile"

exec "$JAVA" $JVM_ARGS -jar $LAUNCHER_JAR $*
