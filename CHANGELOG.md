# Changelog — jadlis-output-styles

Формат: [Keep a Changelog](https://keepachangelog.com/ru/1.1.0/), версии — [SemVer](https://semver.org/lang/ru/).
История до 1.0.0 — в плагине `jadlis-claudecode` 1.1.0–1.3.0 (`assets/output-styles/`).

## [1.0.0] — 2026-11-04 — Отдельный репо / Own repo

### Для человека
- Стили Jadlis и Jadlis Voice теперь живут в своём репо. Ставятся одной командой `sh install.sh`, без плагина.
- `install.sh --plan` показывает дифф до записи. Старый файл уходит в `.bak-<дата>`.

### For agents
- Added: `jadlis.md`, `jadlis-voice.md` (owner export by `jadlis-claudecode/tools/export-owner.py`; Voice without the owner's play-button mod).
- Added: `install.sh [--plan]` → `${CLAUDE_CONFIG_DIR:-$HOME/.claude}/output-styles`, backup on replace, `UNCHANGED` on a second run.
