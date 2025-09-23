#!/usr/bin/env python3
"""
Local development server for the MkDocs site
"""

import subprocess
import sys
import os
from pathlib import Path

def check_dependencies():
    """Check if required dependencies are installed"""
    try:
        import mkdocs
        print("✅ MkDocs is installed")
    except ImportError:
        print("❌ MkDocs not found. Installing dependencies...")
        subprocess.run([sys.executable, "-m", "pip", "install", "-r", "requirements.txt"])

def serve_site():
    """Start the development server"""
    print("🚀 Starting MkDocs development server...")
    print("📖 Your site will be available at: http://127.0.0.1:8000")
    print("🔄 The site will auto-reload when you make changes")
    print("⏹️  Press Ctrl+C to stop the server")
    
    try:
        subprocess.run(["mkdocs", "serve", "--dev-addr", "127.0.0.1:8000"])
    except KeyboardInterrupt:
        print("\n👋 Server stopped. Thanks for using the development server!")
    except FileNotFoundError:
        print("❌ MkDocs command not found. Please install dependencies first:")
        print("   pip install -r requirements.txt")

def main():
    """Main function"""
    print("📚 Medical Aesthetics Psychology Book - Development Server")
    print("=" * 60)
    
    # Check if we're in the right directory
    if not Path("mkdocs.yml").exists():
        print("❌ mkdocs.yml not found. Please run this script from the project root.")
        sys.exit(1)
    
    check_dependencies()
    serve_site()

if __name__ == "__main__":
    main()