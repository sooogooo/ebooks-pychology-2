#!/bin/bash

# Deployment script for MkDocs site

echo "🚀 Starting deployment process..."

# Check if mkdocs is installed
if ! command -v mkdocs &> /dev/null; then
    echo "❌ MkDocs is not installed. Installing dependencies..."
    pip install -r requirements.txt
fi

# Build the site
echo "🏗️ Building the site..."
mkdocs build

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✅ Site built successfully!"
    echo "📁 Built files are in the 'site' directory"
    echo "🌐 You can now deploy the 'site' directory to your web server"
else
    echo "❌ Build failed!"
    exit 1
fi

# Optional: Deploy to GitHub Pages
read -p "🤔 Do you want to deploy to GitHub Pages? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🚀 Deploying to GitHub Pages..."
    mkdocs gh-deploy --force
    if [ $? -eq 0 ]; then
        echo "✅ Successfully deployed to GitHub Pages!"
    else
        echo "❌ GitHub Pages deployment failed!"
    fi
fi

echo "🎉 Deployment process completed!"