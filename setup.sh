#!/bin/bash

# Rick-And-Morty-Loop: Environment Pre-flight Check
# This script ensures the Auditor and Implementer have the tools they need.

echo "🔍 Checking dependencies..."

# 1. Check for Gemini CLI
if ! command -v gemini &> /dev/null; then
    echo "❌ ERROR: Gemini CLI not found."
    echo "👉 Install it via: npm install -g @google/gemini-cli"
    exit 1
fi

# 2. Check for Copilot CLI
if ! command -v copilot &> /dev/null; then
    echo "❌ ERROR: Copilot CLI not found."
    echo "👉 Install it via your provider's instructions."
    exit 1
fi

# 3. Check for Git Configuration
if [ -z "$(git config user.email)" ]; then
    echo "⚠️  WARNING: Git user.email is not set."
    echo "👉 Run: git config --global user.email 'you@example.com'"
    exit 1
fi

# 4. Check for .env file
if [ ! -f .env ]; then
    echo "⚠️  WARNING: .env file not found."
    echo "📝 Copying template..."
    cp .env.example .env
    echo "👉 Action required: Open .env and add your API keys."
    exit 1
fi

# 4. Check for project context
if [ ! -d "documentation" ]; then
    echo "📂 Creating documentation directory..."
    mkdir documentation
    touch documentation/context.md
    touch documentation/oversight_memory.md
fi

echo "✅ Environment Ready. Run ./start.sh to start the Singularity."
