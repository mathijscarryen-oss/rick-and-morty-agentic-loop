# 🥒 Rick-And-Morty-Loop: Quick Start Guide

If you are seeing this, it means you haven't defined a mission for the agents yet. Follow these steps to ignite the Singularity:

### Step 1: Configure your Identity
Open the `.env` file and add your API keys.
```bash
GEMINI_API_KEY=your_key_here
GITHUB_TOKEN=your_token_here
```

### Step 2: Define the Mission
Open `documentation/context.md` and tell the agents what to do. You must start with the status.

**Example Content for `documentation/context.md`:**
```markdown
STATUS: PLANNING
Objective: Implement a new login screen using React Native and Firebase.
Constraints: No mock data, use industrial-grade error handling.
```

### Step 3: Launch the Loop
Once you have saved your mission in `context.md`, run the launcher again:
```bash
./start.sh
```

### Step 4: Watch the Chaos (and the Code)
The agents will now alternate turns. 
- **Rick** will audit your code and write a Micro-Task.
- **Morty** will execute the task and run the build.
- The system will auto-commit every successful turn to Git.

**Success Criteria:** The loop will automatically terminate once Rick sets `STATUS: SUCCESS`.

---
**"Don't think about it, Morty. Just do it."**
