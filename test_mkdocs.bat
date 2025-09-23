@echo off
echo 🔍 Testing MkDocs installation and configuration...
echo.

echo ✅ Step 1: Check MkDocs version
C:\Users\sooog\AppData\Local\Programs\Python\Python313\python.exe -m mkdocs --version
echo.

echo ✅ Step 2: Validate configuration
C:\Users\sooog\AppData\Local\Programs\Python\Python313\python.exe -m mkdocs config
echo.

echo ✅ Step 3: Build the site
C:\Users\sooog\AppData\Local\Programs\Python\Python313\python.exe -m mkdocs build
echo.

if exist "site\index.html" (
    echo ✅ Site built successfully! Files are in the 'site' directory
    echo.
    echo 🚀 Starting development server...
    echo 📖 Your site will be available at: http://127.0.0.1:8000
    echo ⏹️  Press Ctrl+C to stop the server
    echo.
    C:\Users\sooog\AppData\Local\Programs\Python\Python313\python.exe -m mkdocs serve --dev-addr 127.0.0.1:8000
) else (
    echo ❌ Build failed! Please check the error messages above.
    echo.
    echo 🔍 Checking for common issues...
    if not exist "mkdocs.yml" (
        echo ❌ mkdocs.yml not found in current directory
    )
    if not exist "docs" (
        echo ❌ docs directory not found
    )
    if not exist "docs\index.md" (
        echo ❌ docs\index.md not found
    )
)

pause