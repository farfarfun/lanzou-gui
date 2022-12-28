chcp 65001
@echo off
set DIST=%~dp0dist/lanzou-gui
cd %DIST%
@echo 删除Qt5相关
@del /F Qt5*.dll
@echo 删除windows相关
@del /F api-ms-win*.dll
@rd /q /s PyQt5
@echo 删除dist-info, egg-info,src 文件夹
@rd /q /s cryptography-37.0.1.dist-info
@rd /q /s setuptools-63.4.1-py3.9.egg-info
@rd /q /s wheel-0.37.1-py3.9.egg-info
@rd /q /s importlib_metadata-4.11.3.dist-info
@rd /q /s lz4-3.1.3.dist-info
@rd /q /s keyring-23.4.0.dist-info

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
@del /F zlib.dll

@echo 删除无用文件夹
@rd /q /s bcrypt
@rd /q /s brotli
@rd /q /s docutils
@rd /q /s markupsafe
@rd /q /s PIL
@rd /q /s pywin32_system32

@echo 删除无用pyd
@del /F win32api.pyd
@del /F win32cred.pyd
@del /F _win32sysloader.pyd
@del /F _msi.pyd
@del /F _elementtree.pyd
@del /F ucrtbase.dll
@del /F freetype.dll

@echo 删除自动生成文件
@del /F config.pkl
@del /F debug-lanzou-gui.log
@rd /q /s src

pause
