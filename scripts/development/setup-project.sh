#!/bin/bash

# Project Setup Script
# This script sets up a new development project with best practices

set -e

PROJECT_NAME=$1
PROJECT_TYPE=$2

if [ -z "$PROJECT_NAME" ]; then
    echo "❌ Please provide a project name"
    echo "Usage: ./setup-project.sh <project-name> <project-type>"
    echo "Project types: web, mobile, ai-ml, api, desktop"
    exit 1
fi

if [ -z "$PROJECT_TYPE" ]; then
    echo "❌ Please provide a project type"
    echo "Usage: ./setup-project.sh <project-name> <project-type>"
    echo "Project types: web, mobile, ai-ml, api, desktop"
    exit 1
fi

echo "🚀 Setting up project: $PROJECT_NAME"
echo "📁 Project type: $PROJECT_TYPE"

# Create project directory
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Initialize git repository
git init

# Create basic project structure
case $PROJECT_TYPE in
    "web")
        echo "🌐 Setting up web project..."
        mkdir -p {src,public,assets,styles,scripts}
        touch src/index.html src/main.js src/style.css
        echo "Web project structure created!"
        ;;
    "mobile")
        echo "📱 Setting up mobile project..."
        mkdir -p {lib,assets,test}
        touch lib/main.dart pubspec.yaml
        echo "Mobile project structure created!"
        ;;
    "ai-ml")
        echo "🤖 Setting up AI/ML project..."
        mkdir -p {data,models,notebooks,src,results}
        touch requirements.txt src/main.py notebooks/analysis.ipynb
        echo "AI/ML project structure created!"
        ;;
    "api")
        echo "⚙️ Setting up API project..."
        mkdir -p {src,test,docs}
        touch src/app.py requirements.txt
        echo "API project structure created!"
        ;;
    "desktop")
        echo "🖥️ Setting up desktop project..."
        mkdir -p {src,assets,resources}
        touch src/main.py requirements.txt
        echo "Desktop project structure created!"
        ;;
    *)
        echo "❌ Unknown project type: $PROJECT_TYPE"
        exit 1
        ;;
esac

# Create common files
echo "📝 Creating common files..."

# Create README.md
cat > README.md << EOF
# $PROJECT_NAME

## Description
Brief description of the project.

## Features
- Feature 1
- Feature 2
- Feature 3

## Installation
\`\`\`bash
# Installation instructions
\`\`\`

## Usage
\`\`\`bash
# Usage instructions
\`\`\`

## Contributing
Please read CONTRIBUTING.md for details on our code of conduct.

## License
This project is licensed under the MIT License.
EOF

# Create .gitignore
cat > .gitignore << EOF
# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg

# Virtual Environment
venv/
env/
ENV/

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
*.log
logs/

# Dependencies
node_modules/
vendor/
EOF

# Create LICENSE
cat > LICENSE << EOF
MIT License

Copyright (c) $(date +%Y) Jayesh Kumar Goyal

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

echo "✅ Project setup complete!"
echo "📁 Project location: $(pwd)"
echo "🎉 Happy coding!"
