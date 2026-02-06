#!/bin/bash

# Rick-And-Morty-Loop: Autonomous Adversarial Orchestration Engine
# Version: 4.5 (Professional Edition)

# 1. PATH CONFIGURATION
MORTY_CMD="copilot"
CONTEXT_FILE="documentation/context.md"
MEMORY_FILE="documentation/oversight_memory.md"
LOG_FILE="documentation/rick_and_morty_loop.log"
PROMPT_DIR="system-prompts"

# 2. SYSTEM PROMPT LOADER
RICK_LAW="$PROMPT_DIR/RICK_OVERSIGHT.md"
MORTY_LAW="$PROMPT_DIR/ELITE_ENGINEER.md"

echo "🥒 RICK-AND-MORTY-LOOP v4.5: INITIALIZING..." | tee -a $LOG_FILE

# 3. ENVIRONMENT DETECTION & SECURITY
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "🛡️ SECURITY: Running in POSIX environment. Ensure 'bubblewrap' or 'docker' is configured for sandboxed execution." | tee -a $LOG_FILE
fi

# 4. TELEMETRY INITIALIZATION
TURN_COUNTER=0
START_TIME=$(date +%s)

while true; do
    ((TURN_COUNTER++))
    echo "--------------------------------------------------" | tee -a $LOG_FILE
    echo "🥒 Turn: $TURN_COUNTER | Telemetry: [Context: Dynamic | Latency: Active]" | tee -a $LOG_FILE
    
    # 4. THE ADVERSARIAL AUDIT (The "Rick" Phase)
    # Rick reads his own law, the engineer's law, and the project state.
    echo "🥒 ARCHITECT (RICK) is auditing the implementation..." | tee -a $LOG_FILE
    
    gemini --yolo -p "
        IDENTITY: Read $RICK_LAW.
        GOVERNANCE: Read $MORTY_LAW.
        STATE: Read $CONTEXT_FILE and $MEMORY_FILE.
        LIBRARY: You have access to the full technical library in '$PROMPT_DIR/'.
        
        TASK: Perform a high-variance audit of the current codebase. 
        Identify if the Worker has introduced technical debt, mocks, or placeholders.
        Consult the specialized guides in '$PROMPT_DIR/' if working on specific modules (e.g., Firebase, Agora, Security).
        Synthesize a strict MICRO-TASK for the Worker and set STATUS: CORRECTION.
        If the project satisfies the Prime Directive, set STATUS: SUCCESS.
    " | tee -a $LOG_FILE

    # 5. TERMINATION CHECK
    if grep -q "STATUS: SUCCESS" "$CONTEXT_FILE"; then
        echo "✅ MISSION COMPLETE. Heuristic Alignment Achieved." | tee -a $LOG_FILE
        break
    fi

    # 6. THE EXECUTION (The "Morty" Phase)
    echo "🤖 ENGINEER (MORTY) is implementing directives..." | tee -a $LOG_FILE
    
    # Pass the context and the engineering standard to Morty
    $MORTY_CMD --model claude-sonnet-4.5 --yolo --allow-all --no-ask-user -p "
        STANDARD: Read $MORTY_LAW.
        CONTEXT: Read $CONTEXT_FILE.
        
        TASK: Execute the Micro-Task defined in the context. 
        Do not use mocks. Use industrial-grade logic.
        If in a Mobile Environment, ensure 'npm run android' passes.
    " | tee -a $LOG_FILE

    # 7. STATE SNAPSHOT (Persistence)
    git add .
    git commit -m "Rick-And-Morty-Loop Checkpoint: $(date +'%Y-%m-%d %H:%M:%S')" --allow-empty
    
    echo "⏳ Cycle complete. Cooldown for 30s..." | tee -a $LOG_FILE
    sleep 30
done