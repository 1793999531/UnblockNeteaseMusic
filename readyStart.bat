@echo off
:Begin 
::�����Ƿ�����������
echo ��ʼ������������
ping www.baidu.com 
if errorlevel 1 goto Reboot 
if errorlevel 0 goto Continue
:Continue
echo �������ӳɹ��������˿ں�Ϊ��2333����ʼ�����ƽ�...
for /f "tokens=2 delims=[]" %%i in ('ping music.163.com') do (
echo ������IPΪ��%%i
node app.js -p 2333 -f %%i
)
pause
:Reboot 
echo ����ʧ�ܣ��ӳ�8S������
timeout /t 8 
goto Begin


