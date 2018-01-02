if "%ARCH%"=="32" (
   set PLATFORM=x86
   REM activate x86 Python 2.7
   call C:\Miniconda\Scripts\activate.bat
) else (
   set PLATFORM=x64
   REM activate x64 Python 2.7
   call C:\Miniconda-x64\Scripts\activate.bat
)

call vcbuild.bat nosign release %PLATFORM%

COPY Release\node.exe %PREFIX%\node.exe

%PREFIX%\node.exe -v
%PREFIX%\node.exe deps\npm\bin\npm-cli.js install deps\npm -gf
%PREFIX%\npm.cmd version
REM dedupe npm to avoid too-long path issues on Windows
cd %PREFIX%\node_modules\npm
%PREFIX%\npm.cmd dedupe
