@echo off
REM Quick Start Script for AI Video Editor (Windows)
REM Starts backend server and frontend client, then opens browser

echo 🚀 Starting AI Video Editor...
echo.

REM Check if node_modules exist
if not exist "node_modules" (
    echo 📦 Installing root dependencies...
    call npm install
    if errorlevel 1 (
        echo ❌ Failed to install root dependencies
        pause
        exit /b 1
    )
)

if not exist "client\node_modules" (
    echo 📦 Installing client dependencies...
    cd client
    call npm install
    if errorlevel 1 (
        echo ❌ Failed to install client dependencies
        cd ..
        pause
        exit /b 1
    )
    cd ..
)

echo.
echo ✅ All dependencies installed!
echo.
echo 🎯 Starting development servers...
echo    Server: http://localhost:5000
echo    Client: http://localhost:3000
echo.

REM Start server in a new window
echo 📡 Starting Backend Server...
start "AI Video Editor - Backend Server (Port 5000)" cmd /k "npm run server"

REM Wait for server to start
echo ⏳ Waiting for server to initialize...
timeout /t 6 /nobreak

REM Start client in a new window
echo 🎨 Starting Frontend Client...
start "AI Video Editor - Frontend Client (Port 3000)" cmd /k "cd client && npm start"

REM Wait for client to build and start
echo ⏳ Waiting for client to build and start...
timeout /t 10 /nobreak

REM Open browser automatically
echo 🌐 Opening application in browser...
start http://localhost:3000

echo.
echo ✅ APPLICATION STARTED SUCCESSFULLY!
echo.
echo 📝 SERVERS RUNNING:
echo    Backend Server: http://localhost:5000
echo    Frontend Client: http://localhost:3000
echo.
echo 🎯 NEXT STEPS:
echo    1. Wait for the browser to open (or manually open http://localhost:3000)
echo    2. Upload a video file
echo    3. Click "Process with AI"
echo    4. Download the processed video
echo.
echo 💡 TIPS:
echo    - Backend and Frontend run in separate windows
echo    - Close either window to stop that component
echo    - Check browser console (F12) for any errors
echo    3. Cohere AI generates script and voiceover
echo    4. Edit if needed
echo    5. Click "Export" to download
echo.
echo ✋ To stop the application, close both command windows.
echo.
pause
