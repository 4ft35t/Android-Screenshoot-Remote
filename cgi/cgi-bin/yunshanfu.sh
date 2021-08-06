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
     while true
     do
         # 校验文件大小，避免 pull 回来未写完图片
         adb pull $img /tmp/ysf.png && [ "$(stat -c %s /tmp/ysf.png)" -ge 300000 ] && break
         sleep 1
     done

     # press power button
     adb shell input keyevent 26
}

cleanup
unlock
screenshoot

echo "<img src='data:image/png;base64,$(cat /tmp/ysf.png | base64 -w 0)'>"
echo "</body></html>"

