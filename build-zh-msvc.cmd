@echo off
setlocal
where cl >nul 2>nul
if not errorlevel 1 goto ready
set "VSWHERE=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
if not exist "%VSWHERE%" (
  echo Visual Studio C++ tools not found. Install Desktop development with C++.
  exit /b 1
)
for /f "usebackq tokens=*" %%I in (`"%VSWHERE%" -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath`) do set "VSROOT=%%I"
if not defined VSROOT exit /b 1
call "%VSROOT%\VC\Auxiliary\Build\vcvars64.bat"
if errorlevel 1 exit /b 1
:ready
cd /d "%~dp0"
if not exist build-zh mkdir build-zh
rc /nologo /c65001 /I res /fo build-zh\app.res res\app.rc
if errorlevel 1 exit /b 1
cl /nologo /std:c++17 /EHsc /utf-8 /O1 /MT /MP4 /W2 /DUNICODE /D_UNICODE /DNOMINMAX /D_WIN32_WINNT=0x0A00 /DWINVER=0x0A00 /D_CRT_SECURE_NO_WARNINGS /Fo:build-zh\ /Fe:WirelessBattery.exe src\*.cpp src\drivers\*.cpp build-zh\app.res /link /SUBSYSTEM:WINDOWS /OPT:REF /OPT:ICF hid.lib setupapi.lib cfgmgr32.lib ole32.lib oleaut32.lib comctl32.lib gdi32.lib user32.lib shell32.lib advapi32.lib runtimeobject.lib ws2_32.lib winhttp.lib uuid.lib
exit /b %errorlevel%
