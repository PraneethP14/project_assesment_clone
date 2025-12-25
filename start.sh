#!/bin/bash
# Quick Start Script for AI Video Editor

echo "🚀 Starting AI Video Editor..."
echo ""

# Check if node_modules exist
if [ ! -d "node_modules" ]; then
    echo "📦 Installing root dependencies..."
    npm install
fi

if [ ! -d "client/node_modules" ]; then
    echo "📦 Installing client dependencies..."
    cd client
    npm install
    cd ..
fi

echo ""
echo "✅ All dependencies installed!"
echo ""
echo "🎯 Starting development servers..."
echo "   Server: http://localhost:5000"
echo "   Client: http://localhost:3000"
echo ""

npm run dev
