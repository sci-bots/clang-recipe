@echo off
setlocal ENABLEDELAYEDEXPANSION

set URL=http://releases.llvm.org/%PKG_VERSION%/libcxx-%PKG_VERSION%.src.tar.xz
set FILENAME=libcxx-%PKG_VERSION%.src.tar.xz

echo %URL%

REM Download Windows (32-bit) binary.
curl -L -o %FILENAME% %URL%
if errorlevel 1 exit 1
REM Extract `tar` archive from LZMA archive.
%PREFIX%\Library\usr\lib\p7zip\7z.exe e libcxx-%PKG_VERSION%.src.tar.xz -y
if errorlevel 1 exit 1
REM Extract `$_OUTDIR\include` from `tar` archive.
%PREFIX%\Library\usr\lib\p7zip\7z.exe x libcxx-%PKG_VERSION%.src.tar include -r -y
if errorlevel 1 exit 1
REM Move extracted headers to `${PREFIX}\Library\include\clang-libcxx`
mkdir "%PREFIX%"\Library\include
move libcxx-%PKG_VERSION%.src\include "%PREFIX%"\Library\include\clang-libcxx
if errorlevel 1 exit 1

endlocal

