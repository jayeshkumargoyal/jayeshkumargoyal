#!/bin/bash

# Install Dependencies Script
# This script installs common dependencies for development

set -e

echo "🚀 Setting up development environment..."

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 is not installed. Please install Python3 first."
    exit 1
fi

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    exit 1
fi

# Install Python dependencies
echo "📦 Installing Python dependencies..."
if [ -f "requirements.txt" ]; then
    pip3 install -r requirements.txt
else
    echo "⚠️  No requirements.txt found. Installing common packages..."
    pip3 install numpy pandas matplotlib seaborn scikit-learn opencv-python
fi

# Install Node.js dependencies
echo "📦 Installing Node.js dependencies..."
if [ -f "package.json" ]; then
    npm install
else
    echo "⚠️  No package.json found. Skipping Node.js dependencies."
fi

# Create virtual environment for Python
echo "🐍 Creating Python virtual environment..."
python3 -m venv venv
source venv/bin/activate

# Install development tools
echo "🛠️  Installing development tools..."
pip3 install black flake8 pytest jupyter notebook

echo "✅ Setup complete!"
echo "To activate the virtual environment, run: source venv/bin/activate"
