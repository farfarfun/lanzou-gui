chcp 65001
@echo off
set DIST=%~dp0dist/lanzou-gui
cd %DIST%
@echo 删除Qt5相关
@del /F Qt5*.dll
@rd /q /s PyQt5
@echo 删除dist-info, egg-info,src 文件夹
@rd /q /s cryptography-37.0.1.dist-info
@rd /q /s setuptools-63.4.1-py3.9.egg-info
@rd /q /s wheel-0.37.1-py3.9.egg-info
@rd /q /s importlib_metadata-4.11.3.dist-info
@rd /q /s lz4-3.1.3.dist-info
@rd /q /s keyring-23.4.0.dist-info
@rd /q /s src
@echo 删除无用dll相关

@del /F libGLESv2.dll
@del /F libEGL.dll
@del /F libdeflate.dll
@del /F Lerc.dll
@del /F icu*58.dll
@del /F zstd.dll
@del /F libjpeg.dll
@del /F libpng16.dll
@del /F mfc140u.dll
@del /F "D3DCOMPILER_47.dll"
@del /F opengl32sw.dll

pause
