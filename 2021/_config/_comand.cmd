@ECHO OFF & (PUSHD "%~DP0")


@echo off

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (


goto UACPrompt

) else ( goto gotAdmin )

:UACPrompt

echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"

echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"

exit /B

:gotAdmin

echo "...loading"
@echo off
echo f|xcopy /r /c /h /q /s /e /y ".\_content"  %appdata%\JetBrains\>nul
echo f|xcopy /r /c /h /q /s /e /i /y ".\configfile"  %windir%\configfile\>nul
echo "done"

@echo off