#!/bin/bash
x=1
while [ $x -le 5 ]
do
echo "Execution: $x"
	
#TEST_SERVER_PORT="34777" ADB_DEVICE_ARG="42f7b50fb91b9fcf" calabash-android run adw_new_debug.apk

#sleep 20

TEST_SERVER_PORT="34778" ADB_DEVICE_ARG="HT255TV02934" calabash-android run adw_new_debug.apk features/my_first.feature

#sleep 20
	
x=$(( $x + 1 ))
done


