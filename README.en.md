English · [Русский](README.md)

# Jadlis — two answer styles for Claude Code

Two output styles (an output style is an instruction that shapes how Claude Code answers). Both are written for a reader with ADHD: result first, short, plain words.

```
git clone https://github.com/beCyborg/jadlis-output-styles.git
sh jadlis-output-styles/install.sh --plan
sh jadlis-output-styles/install.sh
```

Then type `/output-style` in Claude Code and pick a style.

## Which style for what

| Style | File | What it does |
|---|---|---|
| **Jadlis** | `jadlis.md` | The answer opens with the result. Then what it means for you. Reasons and details come last, and only those that change your next step. The agent argues with a wrong premise instead of agreeing. Your action goes on the last line, «**От тебя:**». |
| **Jadlis Voice** | `jadlis-voice.md` | The same answer on screen, then a «🔊 Голосом» block at the end: the answer retold for the ear. No markup, no paths or commands, with emotion tags for the voice. |

Jadlis suits anyone who reads answers. Jadlis Voice is only for listening to answers.

**Jadlis Voice needs a TTS engine that understands tags.** The block targets ElevenLabs Eleven v4: it performs square-bracket tags (`[warm]`, `[short pause]`) as intonation. Another engine reads the tags aloud. The voice playback comes from the `jadlis-voice` plugin in the Jadlis marketplace. Without it you can still select the block and give it to any reader, but the tags will be spoken as words.

The answer language comes from the `language` key in `settings.json`, not from the style. The voice block is written for Russian speech.

## Install

`install.sh` copies both files into `~/.claude/output-styles/`. If `CLAUDE_CONFIG_DIR` is set, it writes into `$CLAUDE_CONFIG_DIR/output-styles/`.

- `--plan` shows what would change and writes nothing. For a changed file it prints the diff.
- If a file already exists and differs, the script first copies it to `<file>.bak-<date>`.
- A second run prints `UNCHANGED` and writes nothing.

The default style is the `outputStyle` key in `~/.claude/settings.json`: `"outputStyle": "Jadlis"`. If the style file is missing, Claude Code silently falls back to the Default style.

Update: `git -C jadlis-output-styles pull`, then run `install.sh` again.

## Related

- [jadlis-claude-md](https://github.com/beCyborg/jadlis-claude-md) — the global `CLAUDE.md`: how the agent understands a task, verifies the result and writes for people.
- [jadlis-claudecode](https://github.com/beCyborg/jadlis-claudecode) — a plugin that sets up Claude Code and the terminal. It turns the Jadlis style on in settings and can install this repo as one step.

## License

Apache-2.0, see [LICENSE](LICENSE).
