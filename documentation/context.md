# Rick-And-Morty-Loop Context
STATUS: CORRECTION
PHASE: REFACTOR_ORCHESTRATOR
OBJECTIVE: Resolve technical debt and configuration inconsistencies in the orchestration scripts.

## Current Micro-Task
1. Modify `rick-loop.sh` to source the `.env` file.
2. Replace hardcoded paths and commands in `rick-loop.sh` (MORTY_CMD, LOG_FILE, etc.) with environment variables.
3. Remove redundant dependency checks from `start.sh` and ensure it relies on `setup.sh`.
4. Synchronize `.env.example` with the actual variables used by the scripts.
