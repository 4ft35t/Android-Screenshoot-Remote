#!/bin/bash

SRC=$(dirname $(readlink -f $0))

cd $SRC
adb push ysf.js /sdcard/Scripts/

cd cgi
python3 -m http.server --cgi
