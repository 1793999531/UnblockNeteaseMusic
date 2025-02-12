<img src="https://user-images.githubusercontent.com/26399680/47980314-0e3f1700-e102-11e8-8857-e3436ecc8beb.png" alt="logo" width="140" height="140" align="right">

# UnblockNeteaseMusic

解锁网易云音乐客户端变灰歌曲

## 更新
更新时间：20250212
修复报错：Error: certificate has expired
现在需要满足以下条件才可破解
- 1.需要安装2.9.5版本客户端
- 2.需要临时会员，可让有vip的好友赠送几天临时vip，如果没会员，歌曲只有30秒。

## 项目来源
https://github.com/nondanee/UnblockNeteaseMusic

## 使用教程
运行环境：windowns系统，node(网上下载，https://nodejs.org）  
项目代码下载：https://github.com/1793999531/UnblockNeteaseMusic  
开机自动启动参考：https://www.bilibili.com/video/av61889414  

在cmd里（win+r 输入cmd，进入)  
输入命令：ping music.163.com  
得到网易云服务器IP:59.111.181.60  
<!-- -p是端口号，我设置为2333,可更改;-f 是要监听的网易云音乐服务器IP -->  
输入命令：node app.js -p 2333 -f 59.111.181.60   

一劳永逸法  

创建MusicDemo文件夹下的”autoLaunch.vbs “的快捷方式并放到“C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp”  
文件夹下实现开机自动启动(该文件夹已被计算机隐藏，可直接导航该目录  
注意：“https://github.com/nondanee/UnblockNeteaseMusic”下载的项目不会自动启动，  
我配置了两个文件（"autoLaunch.vbs"和"readyStart.bat"）实现开机自动启动。  
如果网易云音乐打开后无法连接网络请8秒后重试（刚开始连上网络马上打开网易云音乐时有这问题）  

最后在网易云音乐app设置代理  
自定义代理输入ip:127.0.0.1,端口为:2333  

注：  
autoLaunch.vbs代码r如下:
```
Set ws = CreateObject("Wscript.Shell")
ws.run "cmd /c readyStart.bat",vbhide

readyStart.bat代码如下:
@echo off
:Begin 
::测试是否已连接网络
echo 开始尝试连接网络
ping www.baidu.com 
if errorlevel 1 goto Reboot 
if errorlevel 0 goto Continue
:Continue
echo 网络连接成功，监听端口号为：2333，开始启动破解...
for /f "tokens=2 delims=[]" %%i in ('ping music.163.com') do (
echo 网易云IP为：%%i
node app.js -p 2333 -f %%i
)
pause
:Reboot 
echo 连接失败，延迟8S后重试
timeout /t 8 
goto Begin
```

## 声明

该项目只能用作学习，请自行开通会员以支持平台购买更多的版权