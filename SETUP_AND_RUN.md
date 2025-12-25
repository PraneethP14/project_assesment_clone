# Complete Setup and Run Guide

A detailed step-by-step guide to get the Clueso Clone application running on your machine after downloading from GitHub.

---

## Table of Contents

1. [System Requirements](#system-requirements)
2. [Prerequisites Installation](#prerequisites-installation)
3. [Project Setup](#project-setup)
4. [Environment Configuration](#environment-configuration)
5. [Running the Application](#running-the-application)
6. [Verifying the Installation](#verifying-the-installation)
7. [Troubleshooting](#troubleshooting)
8. [Project Structure](#project-structure)
9. [Available Commands](#available-commands)

---

## System Requirements

### Minimum Requirements
- **Operating System**: Windows 10+, macOS 10.14+, or Linux (Ubuntu 18.04+)
- **RAM**: 4GB minimum (8GB recommended)
- **Disk Space**: 2GB free space minimum
- **Internet**: Required for API connections and dependencies

### Software Requirements
- **Node.js**: v16.0.0 or higher
- **npm**: v8.0.0 or higher (comes with Node.js)
- **FFmpeg**: v4.0 or higher
- **Git**: v2.0 or higher (for cloning the repository)

---

## Prerequisites Installation

### 1. Install Node.js and npm

#### On Windows:
```powershell
# Download and install from https://nodejs.org/
# Download the LTS (Long Term Support) version

# After installation, verify in PowerShell:
node --version
npm --version
```

#### On macOS:
```bash
# Using Homebrew (install Homebrew first if not present)
brew install node

# Verify installation:
node --version
npm --version
```

#### On Linux (Ubuntu/Debian):
```bash
# Update package manager
sudo apt update

# Install Node.js and npm
sudo apt install nodejs npm

# Verify installation:
node --version
npm --version
```

### 2. Install FFmpeg

FFmpeg is required for video and audio processing.

#### On Windows:
```powershell
# Option 1: Using Chocolatey (if installed)
choco install ffmpeg

# Option 2: Manual installation from https://ffmpeg.org/download.html
# 1. Download FFmpeg zip file
# 2. Extract to a folder (e.g., C:\ffmpeg)
# 3. Add to system PATH:
#    - Right-click "This PC" → Properties
#    - Click "Advanced system settings"
#    - Click "Environment Variables"
#    - Add the FFmpeg bin folder to PATH

# Verify installation:
ffmpeg -version
```

#### On macOS:
```bash
# Using Homebrew
brew install ffmpeg

# Verify installation:
ffmpeg -version
```

#### On Linux (Ubuntu/Debian):
```bash
# Install FFmpeg
sudo apt install ffmpeg

# Verify installation:
ffmpeg -version
```

### 3. Install Git

#### On Windows:
```powershell
# Download from https://git-scm.com/
# Or use Chocolatey:
choco install git

# Verify installation:
git --version
```

#### On macOS:
```bash
# Using Homebrew
brew install git

# Verify installation:
git --version
```

#### On Linux:
```bash
# Ubuntu/Debian
sudo apt install git

# Verify installation:
git --version
```

---

## Project Setup

### Step 1: Clone the Repository

```bash
# Navigate to where you want to store the project
cd "path/to/your/projects"

# Clone the repository
git clone https://github.com/your-username/clueso-clone.git

# Navigate into the project directory
cd clueso-clone
```

**Note**: Replace the GitHub URL with the actual repository URL.

### Step 2: Install Dependencies

```bash
# From the root directory of the project
npm run install-deps
```

This command will:
- Install backend dependencies (in the root directory)
- Install frontend dependencies (in the `client` directory)

**Expected output**: You should see "added X packages" messages for both backend and client.

**Installation time**: This typically takes 5-15 minutes depending on internet speed.

### Step 3: Verify Installation

```bash
# Check if node_modules exists in root
dir node_modules

# Check if node_modules exists in client
dir client\node_modules
```

Both directories should exist with packages installed.

---

## Environment Configuration

### Step 1: Create Environment Files

#### Backend Environment (.env)

```bash
# From the root directory
# Create a new file named .env
```

On Windows (PowerShell):
```powershell
New-Item -Path "." -Name ".env" -ItemType "file"
```

On macOS/Linux:
```bash
touch .env
```

#### Step 2: Configure Backend Variables

Open the `.env` file and add the following variables:

```env
# Server Configuration
PORT=5000
NODE_ENV=development

# Cohere AI API Configuration
COHERE_API_KEY=your_cohere_api_key_here

# File Upload Configuration
UPLOAD_DIR=./uploads
MAX_FILE_SIZE=524288000

# FFmpeg Configuration
FFMPEG_TIMEOUT=300000

# CORS Configuration
CORS_ORIGIN=http://localhost:3000

# Session Configuration
SESSION_SECRET=your_secret_key_here
```

### Step 3: Get API Keys

#### Cohere AI API Key:

1. Visit [cohere.ai](https://cohere.ai/)
2. Sign up for a free account
3. Navigate to "API Keys" section
4. Create a new API key
5. Copy the key and paste it in your `.env` file as `COHERE_API_KEY`

### Step 4: Create Frontend Environment File

Navigate to the `client` directory:

```bash
cd client
```

Create a `.env` file:

On Windows (PowerShell):
```powershell
New-Item -Path "." -Name ".env" -ItemType "file"
```

On macOS/Linux:
```bash
touch .env
```

Add the following content:

```env
REACT_APP_API_URL=http://localhost:5000
GENERATE_SOURCEMAP=false
```

---

## Running the Application

### Development Mode

This runs both frontend and backend with hot-reload enabled.

#### From the root directory:

```bash
npm run dev
```

**What happens:**
1. Backend server starts on `http://localhost:5000`
2. Frontend development server starts on `http://localhost:3000`
3. Both services run concurrently
4. Changes to code will automatically reload

**Expected output:**
```
> npm run dev

> concurrently "npm run server" "npm run client"

[0] npm notice created a lockfile as package-lock.json
[0] [nodemon] 3.0.1
[0] [nodemon] to restart at any time, type `rs`
[0] [nodemon] watching path(s): server/**/*
[0] [nodemon] watching extensions: js,json
[0] [0] ✔ Express server running on port 5000
[1] Compiled successfully!
[1] You can now view client in the browser.
[1]   Local:            http://localhost:3000
```

**Access the application:** Open your browser and go to `http://localhost:3000`

### Production Mode

To run the production build:

```bash
# Build the frontend
npm run build

# Start the server
npm start
```

This will:
1. Create an optimized production build of the frontend
2. Serve both frontend and backend from the same server on `http://localhost:5000`

---

## Verifying the Installation

### 1. Check Backend Server

Open a terminal and test the backend:

```powershell
# Test if backend is running (Windows PowerShell)
Invoke-WebRequest -Uri http://localhost:5000/health

# Should return status 200 if healthy
```

Or on macOS/Linux:
```bash
curl http://localhost:5000/health
```

### 2. Check Frontend Application

1. Open `http://localhost:3000` in your browser
2. You should see the Clueso Clone interface
3. Check browser console for any errors (F12 → Console tab)

### 3. Check File Uploads Directory

Verify that the uploads directory exists:

```bash
# Should exist in the root directory
ls -la uploads/
# or on Windows
dir uploads
```

### 4. Verify FFmpeg

```bash
ffmpeg -version
ffprobe -version
```

Both commands should return version information.

---

## Troubleshooting

### Common Issues and Solutions

#### Issue 1: Node.js Command Not Found

**Error**: `'node' is not recognized as an internal or external command`

**Solution:**
1. Check if Node.js is installed: `node --version`
2. If not installed, download from [nodejs.org](https://nodejs.org/)
3. Restart your terminal/command prompt after installation
4. On Windows, verify Node.js is in your PATH:
   - Right-click "This PC" → Properties
   - Click "Advanced system settings"
   - Click "Environment Variables"
   - Verify `C:\Program Files\nodejs` is in the PATH variable

#### Issue 2: FFmpeg Not Found

**Error**: `'ffmpeg' is not recognized` or `FFmpeg not found`

**Solution:**
1. Verify FFmpeg is installed: `ffmpeg -version`
2. On Windows, add FFmpeg to system PATH
3. Restart your terminal after adding to PATH
4. Test again: `ffmpeg -version`

#### Issue 3: Port 3000 or 5000 Already in Use

**Error**: `EADDRINUSE: address already in use :::5000`

**Solution:**

On Windows (PowerShell):
```powershell
# Find process using port 5000
Get-NetTCPConnection -LocalPort 5000 | Select-Object *

# Kill the process
Stop-Process -Id <PID> -Force
```

On macOS/Linux:
```bash
# Find process using port 5000
lsof -i :5000

# Kill the process
kill -9 <PID>
```

Or change the port in your `.env` file:
```env
PORT=5001
```

#### Issue 4: Module Not Found Errors

**Error**: `Cannot find module 'express'` or similar

**Solution:**
```bash
# Reinstall all dependencies
rm -r node_modules
npm install

# For client
cd client
rm -r node_modules
npm install
cd ..
```

#### Issue 5: Permission Denied (macOS/Linux)

**Error**: `EACCES: permission denied`

**Solution:**
```bash
# Don't use sudo. Instead fix npm permissions:
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH

# Add to ~/.bashrc or ~/.zshrc:
# echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
```

#### Issue 6: Cohere API Key Issues

**Error**: `Invalid API key` or `Unauthorized`

**Solution:**
1. Verify your API key is correct in `.env`
2. Check that the key is valid on [cohere.ai](https://cohere.ai/)
3. Ensure there are no extra spaces in the `.env` file
4. Restart the server after updating the API key

#### Issue 7: Uploads Directory Issues

**Error**: `ENOENT: no such file or directory, mkdir 'uploads'`

**Solution:**
```bash
# Create uploads directory manually
mkdir uploads
mkdir uploads/exports
mkdir uploads/processed
```

#### Issue 8: npm install Fails

**Error**: `npm ERR! code ERESOLVE`

**Solution:**
```bash
# Use legacy peer deps flag
npm install --legacy-peer-deps

# For the client as well
cd client
npm install --legacy-peer-deps
```

---

## Project Structure

```
clueso-clone/
├── client/                          # React Frontend
│   ├── public/                      # Static files
│   ├── src/
│   │   ├── components/              # React components
│   │   ├── App.tsx                  # Main app component
│   │   └── index.tsx                # Entry point
│   ├── package.json
│   └── tsconfig.json
│
├── server/                          # Node.js Backend
│   ├── index.js                     # Server entry point
│   └── routes/                      # API routes
│
├── uploads/                         # File storage
│   ├── exports/                     # Exported files
│   └── processed/                   # Processed videos
│
├── .env                             # Environment variables
├── package.json                     # Root dependencies
└── README.md                        # Project documentation
```

---

## Available Commands

### Development Commands

```bash
# Start both frontend and backend with hot-reload
npm run dev

# Start only the backend server
npm run server

# Start only the frontend development server
npm run client

# Install all dependencies
npm run install-deps
```

### Build Commands

```bash
# Build the frontend for production
npm run build

# Build and start production server
npm start
```

### Other Commands

```bash
# Clear node modules and reinstall
npm install

# Update npm packages
npm update

# Check npm for outdated packages
npm outdated
```

---

## Next Steps After Setup

1. **Create Your First Video**:
   - Click "Upload Video" or "Record Video"
   - Select a video file from your computer
   - Follow the on-screen prompts

2. **Configure AI Settings**:
   - Set your preferred content types
   - Configure voice settings for text-to-speech
   - Adjust output quality settings

3. **Process with AI**:
   - Click "Process with AI"
   - Wait for processing (5-10 minutes)
   - Review AI-generated content

4. **Edit and Export**:
   - Edit generated content as needed
   - Export to your desired format
   - Share or download the final video

---

## Getting Help

If you encounter issues:

1. Check the [Troubleshooting](#troubleshooting) section above
2. Check application logs in the terminal
3. Review browser console (F12)
4. Check `.env` file configuration
5. Ensure all prerequisites are properly installed

---

## Performance Tips

1. **For Better Performance**:
   - Use SSD storage for faster file operations
   - Increase RAM allocation if experiencing slowdowns
   - Close unnecessary applications while running

2. **For Video Processing**:
   - Keep video files under 500MB for faster processing
   - Use H.264 codec for better compatibility
   - Ensure stable internet for API calls

3. **For Development**:
   - Use VSCode with ES7+ extensions for better development experience
   - Install the "Thunder Client" extension for API testing
   - Use browser DevTools for debugging frontend (F12)

---

## Version Information

- **Node.js Required**: v16.0.0 or higher
- **npm Required**: v8.0.0 or higher
- **FFmpeg Required**: v4.0 or higher
- **React Version**: Latest (see client/package.json)
- **Express Version**: 4.18.2 or higher

---

**Last Updated**: December 2024
**Document Version**: 1.0
