# Android-Screenshoot-Remote
demo for remote screenshoot on Android, build from autojs + cgi + adb

more info at [blog](https://4ft35t.github.io/post/post/android-screenshoot-remote/)

---
使用 autojs + cgi + adb 实现的安卓远程截图。

更多信息见[blog](https://4ft35t.github.io/post/post/android-screenshoot-remote/)

## 使用方法
1. git clone https://github.com/4ft35t/Android-Screenshoot-Remote
2. 手机连接电脑，修改 cgi/cgi-bin/yunshanfu.sh 中的 `dev` 为自己手机的 id
3. 修改 cgi/cgi-bin/yunshanfu.sh 中 `unlock` 函数内 12345678 为自己的锁屏密码，仅支持数字
4. 手机安装 autojs，并开启 autojs 无障碍服务权限
5. 电脑执行 `run.sh`, 电脑访问 `http://127.0.0.1:8000/cgi-bin/yunshanfu.sh`

设置端口转发，公网访问效果如图
![](https://cdn.jsdelivr.net/gh/4ft35t/images@blog/img/2021/IMG_0317.jpg)
