#!/bin/bash

# RICK-AND-MORTY-LOOP: UNIVERSAL LAUNCHER
# "One command to rule the multiverse."

# ANSI Color Codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# ASCII Banner
print_banner() {
    echo -e "${CYAN}"
    echo "  ____  _      _  __     _      _   _ ____    __  __  ___  ____ _____     __ "
    echo " |  _ \(_) ___| |/ /    / \    | \ | |  _ \  |  \/  |/ _ \|  _ \_   _ \   / / "
    echo " | |_) | |/ __| ' /    / _ \   |  \| | | | | | |\/| | | | | |_) || |  \ / /  "
    echo " |  _ <| | (__| . \   / ___ \  | |\  | |_| | | |  | | |_| |  _ < | |   / /   "
    echo " |_| \_\_|\___|_|\_\ /_/   \_\ |_| \_|____/  |_|  |_|\___/|_| \_\|_|  /_/    "
    echo "                                                                             "
    echo "      _      ___   ___  ____    "
    echo "     | |    / _ \ / _ \|  _ \   "
    echo "     | |   | | | | | | | |_) |  "
    echo "     | |___| |_| | |_| |  __/   "
    echo "     |_____|\___/ \___/|_|      "
    echo -e "${NC}"
    echo -e "${BLUE}   :: ADVERSARIAL AGENTIC ORCHESTRATION v4.5 ::${NC}"
    echo "--------------------------------------------------------"
}

check_dependencies() {
    echo -e "${YELLOW}🔍 System Scan Initiated...${NC}"
    
    MISSING_DEPS=0
    
    if ! command -v gemini &> /dev/null; then
        echo -e "${RED}❌ [FAIL] Gemini CLI missing.${NC}"
        MISSING_DEPS=1
    else
        echo -e "${GREEN}✅ [OK] Gemini CLI detected.${NC}"
    fi

    if ! command -v copilot &> /dev/null; then
        echo -e "${RED}❌ [FAIL] Copilot CLI missing.${NC}"
        MISSING_DEPS=1
    else
        echo -e "${GREEN}✅ [OK] Copilot CLI detected.${NC}"
    fi

    if [ -z "$(git config user.email)" ]; then
        echo -e "${RED}❌ [FAIL] Git user.email is not set.${NC}"
        echo -e "   Run: git config --global user.email 'you@example.com'"
        MISSING_DEPS=1
    fi

    if [ ! -f .env ]; then
        echo -e "${YELLOW}⚠️  [WARN] .env file not found.${NC}"
        echo -e "   Creating from template..."
        cp .env.example .env
        echo -e "${GREEN}✅ [OK] .env created.${NC}"
        echo -e "${RED}🛑 ACTION REQUIRED: Please edit .env and add your API keys.${NC}"
        exit 1
    fi

    if [ $MISSING_DEPS -eq 1 ]; then
        echo -e "${RED}CRITICAL: Missing dependencies or configuration. Please resolve and retry.${NC}"
        exit 1
    fi
}

initialize_state() {
    if [ ! -d "documentation" ]; then
        echo -e "${YELLOW}📂 Creating documentation directory...${NC}"
        mkdir documentation
    fi
    if [ ! -f "documentation/context.md" ]; then
        touch documentation/context.md
    fi
    if [ ! -f "documentation/oversight_memory.md" ]; then
        touch documentation/oversight_memory.md
    fi

    # CHECK FOR USER INPUT IN CONTEXT.MD
    if [ ! -s "documentation/context.md" ] || ! grep -q "STATUS:" "documentation/context.md"; then
        echo -e "${RED}🛑 MISSION NOT DEFINED!${NC}"
        echo -e "${YELLOW}The agents are idling because documentation/context.md is empty or unconfigured.${NC}"
        echo -e ""
        echo -e "${CYAN}--- QUICK START INSTRUCTIONS ---${NC}"
        echo -e "1. Open ${BLUE}.env${NC} and ensure your API keys are set."
        echo -e "2. Open ${BLUE}documentation/context.md${NC} and define your mission."
        echo -e "   Example: 'STATUS: PLANNING. Objective: Fix the navigation bug.'"
        echo -e "3. Run ${BLUE}./start.sh${NC} again."
        echo -e "--------------------------------"
        echo -e ""
        echo -e "See ${GREEN}START_GUIDE.md${NC} for full details."
        exit 1
    fi

    echo -e "${GREEN}✅ State files initialized and Mission detected.${NC}"
}

# Execution
clear
print_banner
check_dependencies
initialize_state

echo -e "${GREEN}🚀 All systems nominal. Initializing Loop...${NC}"
echo -e "${BLUE}📊 Telemetry: [Convergence Tracking: ENABLED | Event-Watch: PASSIVE]${NC}"
sleep 1
./rick-loop.sh
