# Vim Configuration for Python, JavaScript, Bash & Web Development

This is my personal Vim configuration tailored for Python, JavaScript, **Bash/Shell scripting**, and web development. It focuses on ease of use, readability, and productivity while staying close to vanilla Vim.

Two configs are provided:

| File | Description |
|------|-------------|
| `.vimrc` | Full config with plugins via [vim-plug](https://github.com/junegunn/vim-plug) |
| `.vimrc.lite` | Zero-plugin alternative using Vim built-ins only — no `:PlugInstall` needed |

Both configs are **cross-platform**: macOS (Apple Terminal & iTerm2) and Linux (with xclip fallback when `+clipboard` is unavailable).

---

## Features

- Syntax highlighting
- Line numbers & relative numbers
- Consistent indentation (4 spaces for Python/Bash, 2 for JS/HTML)
- Automatic & smart indentation
- Smart case search with real-time results
- Mouse support
- System clipboard integration (macOS `unnamed`, Linux `unnamedplus`, xclip fallback)
- Persistent undo across sessions
- Sensible split behavior
- macOS + Linux compatibility with automatic OS detection
- Trailing whitespace auto-cleanup on save for `.py`, `.sh`, `.bash`
- Dotfiles hidden by default in the file tree (easy toggle)
- Clock and session timer in the status line
- `:Theme` command to switch colorschemes
- `:Open` (Vim 9.2+ built-in) to reveal files/folders in Finder or the system file manager
- `:Reload` to re-source the config without restarting Vim

---

## .vimrc — Full Config (Plugin-based)

### Plugins

- **NERDTree** — file tree navigation (`Ctrl+n` / `:Tree`)
- **vim-airline** — enhanced status line with ALE integration, clock, and session timer
- **ALE** — asynchronous linting and auto-fixing on save
- **vim-commentary** — easy commenting with `gc`
- **vim-monokai** — Monokai color scheme (default)
- **gruvbox**, **tokyonight**, **onedark**, **moonfly** — additional themes via `:Theme`
- **emmet-vim** — fast HTML/CSS writing
- **CtrlP** — fuzzy file finder (`Ctrl+p`), ignores `node_modules`, `.git`, `dist`, `build`
- **auto-pairs** — auto-close brackets and quotes
- **vim-gitgutter** — git diff indicators in the gutter
- **vim-polyglot** — enhanced syntax highlighting for all languages
- **vim-buftabline** — visual buffer list at the top of the screen

### Linting & Fixing (ALE)

ALE lints in real-time and auto-fixes on save:

| Language | Linters | Fixers |
|----------|---------|--------|
| Python | `flake8`, `pylint` | `isort`, `black` (88 char line length) |
| JavaScript | `eslint` | `prettier` |
| HTML | `htmlhint` | `prettier` |
| Shell/Bash | `shellcheck` | — |

### Python Virtual Environment Auto-Detection

When opening a `.py` file, Vim automatically searches parent directories for `.venv` or `venv` and configures ALE linters (`flake8`, `pylint`) to use the virtual environment's Python binary.

### Installation

**1. Install vim-plug:**

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

**2. Clone this repository:**

```bash
git clone git@github.com:georgegozal/vim-config.git
```

**3. Copy the .vimrc to your home directory:**

```bash
cp vim-config/.vimrc $HOME/.vimrc
```

**4. Install plugins — launch Vim and run:**

```vim
:PlugInstall
```

---

## .vimrc.lite — Zero-Plugin Config

A drop-in alternative for **servers, fresh machines, SSH sessions, or any environment where you only have Vim** — no plugins, no internet, no `:PlugInstall`. Works in any shell (bash, zsh, sh, etc.).

All features use Vim built-ins: netrw, syntax/filetype detection, built-in colorschemes, and custom Vimscript functions.

| Full `.vimrc` | `.vimrc.lite` equivalent |
|---------------|--------------------------|
| NERDTree | netrw (`Lexplore`) |
| vim-airline | custom built-in `statusline` with clock and session timer |
| CtrlP | `set path+=**` + `:find` with tab completion |
| vim-commentary | custom `ToggleComment()` function |
| vim-buftabline | custom `BufTabLine()` function |
| Plugin themes | built-in themes via `:Theme` |

Comment toggling (`\c`) is filetype-aware and supports: Python, Bash/Shell, Zsh, YAML, JavaScript, Java, C/C++, Vim, HTML, XML.

**Optional OS tools** (only needed for specific features):

| Feature | macOS | Linux |
|---------|-------|-------|
| Clipboard | built-in | `+clipboard`, or `xclip` as fallback |
| `:Open` | built-in (Vim 9.2+) | fallback via `xdg-open` on older Vim |

### Usage

```bash
# Use instead of ~/.vimrc for a single session
vim -u ~/.vimrc.lite

# Add a shell alias for convenience (add to ~/.bashrc or ~/.zshrc)
alias viml="vim -u ~/.vimrc.lite"

# Or install permanently
cp vim-config/.vimrc.lite $HOME/.vimrc
```

---

## Commands

Both configs share these commands (leader key is `\`):

| Command | Description |
|---------|-------------|
| `:Tree` | Toggle file explorer |
| `:TreeHidden` | Toggle dotfile visibility in the file tree |
| `:Theme <name>` | Switch colorscheme (`:Theme list` shows all; `:Theme default` resets) |
| `:Open [path]` | Open file or folder in Finder / system file manager (Vim 9.2+ built-in; lite falls back on older Vim) |
| `:Reload` | Re-source the config without restarting Vim |

---

## Key Mappings

Both configs share the same key mappings unless noted.

### File Navigation

- `Ctrl+n` — toggle file explorer (NERDTree or netrw)
- `Ctrl+p` — fuzzy file finder (CtrlP, full config only)
- `:Tree` — command alias to open file explorer
- `:find <name>` — file search with tab completion (lite config)
- `\.` — toggle dotfile visibility in the file tree
- `Cmd+E` — toggle file explorer (macOS, when terminal forwards Cmd)
- `Cmd+F` — fuzzy file finder (macOS, full config only)

### File Tree — Dotfiles

Dotfiles (`.git`, `.env`, etc.) are **hidden by default**. Toggle visibility with:

- `\.` or `:TreeHidden` — from anywhere
- `I` — when focused in NERDTree (full config)
- `a` — when focused in netrw (lite config)

### NERDTree File Opening (full config)

- `Enter` — open file in current window
- `i` — open file in horizontal split
- `s` — open file in vertical split
- `t` — open file in new tab

### Buffer Management

- `\n` — next buffer
- `\p` — previous buffer
- `\d` — delete buffer
- `\b` — show buffer list and switch
- `\1` to `\5` — jump to buffer 1–5
- `\x` — delete buffer without closing window
- `:ls` — show all open buffers

### Window Navigation

- `Ctrl+w h/j/k/l` — move between windows

### Splits

- `\v` — vertical split
- `\s` — horizontal split

### Editing

- `jk` — escape insert mode (alternative to Esc)
- `Ctrl+s` — save file
- `\w` — quick save
- `\q` — quick quit
- `\h` — clear search highlights
- `\c` — toggle comment (lite config; use `gc` in full config)

### Line Movement

- `Ctrl+j` — move current line/selection down
- `Ctrl+k` — move current line/selection up
- `Alt+j` / `Alt+k` — same (only available in iTerm2 on macOS)

### Visual Mode

- `<` — indent left (keeps selection)
- `>` — indent right (keeps selection)

---

## File Type Settings

| Language | Indentation |
|----------|-------------|
| Python | 4 spaces |
| Bash / Shell scripts | 4 spaces |
| JavaScript | 2 spaces |
| HTML / XML | 2 spaces |
| JSON / YAML | 2 spaces |

---

## Colorscheme

Use `:Theme <name>` to switch themes at any time.

| Config | Default | Available themes |
|--------|---------|------------------|
| **Full** (`.vimrc`) | **monokai** | monokai, gruvbox, tokyonight, onedark, moonfly, desert, slate, evening |
| **Lite** (`.vimrc.lite`) | **desert** | desert, slate, evening, elflord, delek, industry, koehler, ron, shine, torte, zellner |

- `:Theme list` — show available themes and the default
- `:Theme default` — reset to the config's default theme

The lite config applies custom highlight tweaks for cursor line, line numbers, and status bar on top of built-in themes.

---

## Status Line

Both configs show a **clock** (`HH:MM`) and **session timer** (`MM:SS`) in the status line.

- **Full config**: displayed in vim-airline (right section)
- **Lite config**: displayed in the built-in statusline

---

## Screenshots

<p align='center'>
  <img src="https://github.com/georgegozal/vim-config/blob/main/screenshot.png">
</p>

---

## Contributing

If you have suggestions or improvements, feel free to fork this repo and submit a pull request!

---

## License

This project is licensed under the [GNU Affero General Public License v3.0](LICENSE) (AGPL-3.0). You are free to use, modify, and distribute this configuration, provided that any modifications are also released under the same license.
