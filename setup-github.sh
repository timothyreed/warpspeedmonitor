#!/bin/bash

echo "🚀 WarpSpeed Monitor - GitHub Setup"
echo "=================================="

# Check if we're in a git repo
if [ ! -d ".git" ]; then
    echo "❌ Not in a git repository. Please run from the WarpSpeed-App directory."
    exit 1
fi

echo "📋 Instructions:"
echo "1. Go to https://github.com/new"
echo "2. Repository name: warpspeedmonitor"
echo "3. Description: Professional AI Performance Monitoring Dashboard"
echo "4. Make it Public"
echo "5. Don't initialize with README/gitignore/license"
echo "6. Click 'Create repository'"
echo ""

read -p "Enter your GitHub username: " username

if [ -z "$username" ]; then
    echo "❌ Username cannot be empty"
    exit 1
fi

echo ""
echo "🔗 Setting up remote repository..."

# Add remote
git remote add origin "https://github.com/$username/warpspeedmonitor.git"

# Set main branch
git branch -M main

echo "✅ Remote repository configured!"
echo ""
echo "🚀 Pushing to GitHub..."

# Push to GitHub
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Success! Your repository is now on GitHub:"
    echo "https://github.com/$username/warpspeedmonitor"
    echo ""
    echo "🏷️  Next steps:"
    echo "1. Create a release: git tag v1.0.0 && git push origin v1.0.0"
    echo "2. GitHub Actions will automatically build installers"
    echo "3. Share your repository with users!"
else
    echo ""
    echo "❌ Push failed. Please check:"
    echo "1. Repository exists on GitHub"
    echo "2. You have write access"
    echo "3. Your GitHub credentials are set up"
fi
