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


