auto();
app.launch("com.unionpay");
waitForPackage("com.unionpay");

// 首页点击乘车码
sleep(1500)
if(text("充值中心").exists()){
    toastLog("找到 乘车码 关键字");
    target = text("乘车码").findOne();
    while(!target.clickable()){
        target = target.parent()
    }
    target.click()
}

waitForActivity("com.unionpay.activity.react.UPActivityReactNative");
sleep(2000);
// 2、请求截图
if(!requestScreenCapture()){
    toastLog("请求截图失败");
    exit();
}

// 3、进行截图
captureScreen("/sdcard/img.png");
toastLog("截图完成");
