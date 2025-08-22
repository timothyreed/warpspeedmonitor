#!/bin/bash

echo "🚀 WarpSpeed Monitor Build Script"
echo "================================="

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 16+ and try again."
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt "16" ]; then
    echo "❌ Node.js version is too old. Please upgrade to Node.js 16+ and try again."
    exit 1
fi

echo "✅ Node.js $(node -v) detected"

# Install dependencies if not present
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
else
    echo "✅ Dependencies already installed"
fi

# Create icon placeholder if it doesn't exist
if [ ! -f "assets/icon.png" ]; then
    echo "⚠️  No icon found. Creating placeholder..."
    # You should replace this with actual icon creation
    touch assets/icon.png
fi

# Build for current platform
echo "🔨 Building WarpSpeed Monitor for $(uname -s)..."

case "$(uname -s)" in
    Darwin)
        echo "🍎 Building for macOS..."
        npm run build:mac
        ;;
    Linux)
        echo "🐧 Building for Linux..."
        npm run build:linux
        ;;
    MINGW*|MSYS*|CYGWIN*)
        echo "🪟 Building for Windows..."
        npm run build:win
        ;;
    *)
        echo "🌍 Building for current platform..."
        npm run build
        ;;
esac

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Build completed successfully!"
    echo "📁 Distributable files are in the 'dist/' directory"
    echo ""
    echo "Next steps:"
    echo "1. Test the built application"
    echo "2. Upload to GitHub releases or your preferred distribution platform"
    echo "3. Share with users!"
else
    echo ""
    echo "❌ Build failed. Check the error messages above."
    exit 1
fi
