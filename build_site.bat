@echo off
echo 🏗️ Building MkDocs site...
echo.

C:\Users\sooog\AppData\Local\Programs\Python\Python313\python.exe -m mkdocs build

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ✅ Site built successfully!
    echo 📁 Built files are in the 'site' directory
    echo 🌐 You can now deploy the 'site' directory to your web server
) else (
    echo.
    echo ❌ Build failed!
)

pause