@echo off
echo 🔍 Checking MkDocs installation...
echo.

:check_loop
C:\Users\sooog\AppData\Local\Programs\Python\Python313\python.exe -m mkdocs --version >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo ✅ MkDocs is installed successfully!
    goto build_site
) else (
    echo ⏳ MkDocs not ready yet, waiting 5 seconds...
    timeout /t 5 /nobreak >nul
    goto check_loop
)

:build_site
echo.
echo 🏗️ Building the MkDocs site...
echo.

C:\Users\sooog\AppData\Local\Programs\Python\Python313\python.exe -m mkdocs build

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ✅ Site built successfully!
    echo 📁 Built files are in the 'site' directory
    echo.
    echo 🚀 Starting development server...
    echo 📖 Your site will be available at: http://127.0.0.1:8000
    echo ⏹️  Press Ctrl+C to stop the server
    echo.
    C:\Users\sooog\AppData\Local\Programs\Python\Python313\python.exe -m mkdocs serve --dev-addr 127.0.0.1:8000
) else (
    echo.
    echo ❌ Build failed! Please check the error messages above.
)

pause