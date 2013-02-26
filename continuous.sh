#!/bin/bash
x=1
while [ $x -le 5000 ]
do
echo "Execution: $x"
	
TEST_SERVER_PORT="34777" ADB_DEVICE_ARG="42f14a1c1ed57f75" calabash-android run adw_new_debug.apk

sleep 20

TEST_SERVER_PORT="34778" ADB_DEVICE_ARG="HT255TV02934" calabash-android run adw_new_debug.apk

sleep 20

TEST_SERVER_PORT="34779" ADB_DEVICE_ARG="SH28EW502803" calabash-android run adw_new_debug.apk

sleep 20
	
x=$(( $x + 1 ))
done


