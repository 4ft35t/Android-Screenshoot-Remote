#!/bin/bash
echo "Content-Type:text/html"
echo ""
echo '<html><meta charset="UTF-8"><body>'

dev=NXTDU1xxxxxxxxx # 需要修改成自己的设备 id, 使用 adb devices 获取
img=/sdcard/img.png

adb(){
    /usr/bin/adb -s $dev $@
}

cleanup(){
    adb shell rm $img
    rm /tmp/ysf.png
}

unlock(){
    adb shell input keyevent 224 # 唤醒设备
    adb shell input swipe 300 500 300 1500 # 上滑到密码输入界面
    adb shell input text 12345678 # 需要修改成自己的锁屏密码
}

screenshoot(){
     adb shell am start -n org.autojs.autojs/.external.open.RunIntentActivity -d /sdcard/Scripts/ysf.js
     sleep 3
     start_time=$(date +%s)
     while true
     do
         sleep 1
         now=$(date +%s)
         [ "$((now - start_time))" -gt 30 ] && break
         # 等文件写完再 pull
         modify_time=$(adb shell stat -c %Y $img)
         [ "$modify_time" ] || continue
         [ "$modify_time" -lt "$now" ] && adb pull $img /tmp/ysf.png && break
     done

     # press power button
     adb shell input keyevent 26
}

cleanup
unlock
screenshoot

echo "<img src='data:image/png;base64,$(cat /tmp/ysf.png | base64 -w 0)'>"
echo "</body></html>"

