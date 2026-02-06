# Changelog

All notable changes to the Rick-And-Morty-Loop project will be documented in this file.

## [4.5.0] - 2026-02-06
### Added
- **Adversarial Orchestration**: Integrated dual-agent feedback loop (Rick/Morty).
- **Technical Prompt Library**: 100+ specialized domain guides for the Supervisor.
- **AEM Engine**: Autonomous Execution Mode for non-interactive builds.
- **Self-Healing Infrastructure**: Automated Git-checkpointing.
- **Environment Agnostic Setup**: Universal `setup.sh` for multi-OS support.

### Changed
- Refactored `rick-loop.sh` for modularity and error resilience.
- Improved context window management (The 50/100 Rule).

### Fixed
- Resolved WSL-specific dependency locks.
- Fixed token-drift in long-running implementation cycles.
