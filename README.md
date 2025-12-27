# Vim Configuration for Python, JavaScript & Web Development

This is my personal Vim configuration tailored for Python, JavaScript, Shell scripting, and web development. It focuses on ease of use, readability, and productivity while staying close to vanilla Vim.

---

## 🚀 Features

✅ Syntax highlighting  
✅ Line numbers & relative numbers  
✅ Consistent indentation (4 spaces for Python, 2 for JS/HTML)  
✅ Automatic & smart indentation  
✅ Smart case search with real-time results  
✅ Mouse support  
✅ System clipboard integration  
✅ Persistent undo across sessions  
✅ Sensible split behavior  
✅ Easy plugin management (via [vim-plug](https://github.com/junegunn/vim-plug))  

### 🔌 Included Plugins

- **NERDTree**: File tree navigation
- **vim-airline**: Enhanced status line
- **ALE**: Asynchronous linting and fixing
- **vim-commentary**: Easy commenting with `gc`
- **vim-monokai**: Beautiful Monokai color scheme
- **emmet-vim**: Fast HTML/CSS writing
- **CtrlP**: Fuzzy file finder
- **auto-pairs**: Auto-close brackets and quotes
- **vim-gitgutter**: Git diff indicators in the gutter
- **vim-polyglot**: Enhanced syntax highlighting for all languages

---

## 📦 Installation

### 1️⃣ Install [vim-plug](https://github.com/junegunn/vim-plug):

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### 2️⃣ Clone this repository:

```bash
git clone git@github.com:georgegozal/vim-config.git
```

### 3️⃣ Copy the .vimrc to your home directory:

```bash
cp vim-config/.vimrc $HOME/.vimrc
```

### 4️⃣ Install plugins:

Launch Vim and run:

```vim
:PlugInstall
```

---

## ⌨️ Key Mappings

### Window Navigation
- `Alt+h` — move to the left window
- `Alt+j` — move to the window below
- `Alt+k` — move to the window above
- `Alt+l` — move to the right window

### File Navigation
- `Ctrl+n` — toggle NERDTree file explorer
- `Ctrl+p` — fuzzy file finder (CtrlP)
- `:Tree` — custom command to open NERDTree

### Buffer Management
- `\n` — next buffer
- `\p` — previous buffer
- `\d` — delete buffer

### Splits
- `\v` — vertical split
- `\s` — horizontal split

### Editing
- `jk` — escape insert mode (alternative to Esc)
- `Ctrl+s` — save file
- `\w` — quick save
- `\q` — quick quit
- `\h` — clear search highlights

### Line Movement
- `Alt+j` — move current line/selection down
- `Alt+k` — move current line/selection up

### Visual Mode
- `<` — indent left (keeps selection)
- `>` — indent right (keeps selection)

---

## 🎨 Colorscheme

**Monokai** is used by default with true color support enabled for terminal compatibility.

---

## 🐍 Python Virtual Environment

This configuration **automatically detects** your Python virtual environment (`.venv` or `venv`) from the directory where Vim is launched and configures ALE linters to use it seamlessly.

---

## 🛠️ Linting & Fixing

ALE is configured to automatically lint and fix on save:

- **Python**: `flake8`, `pylint`, `black`
- **JavaScript**: `eslint`, `prettier`
- **HTML**: `htmlhint`, `prettier`

### Configuration Details:
- Line length: 88 characters (Black standard)
- Auto-fix on save enabled
- Real-time linting feedback

---

## 📁 File Type Settings

- **Python**: 4-space indentation
- **JavaScript**: 2-space indentation
- **HTML/XML/JSON/YAML**: 2-space indentation
- **Shell scripts**: 4-space indentation

---

## 💾 Additional Features

- **Persistent Undo**: Undo history saved in `~/.vim/undodir`
- **Smart Search**: Case-insensitive unless uppercase is used
- **Auto-pairs**: Automatically closes brackets, quotes, and parentheses
- **Git Integration**: See git changes in the gutter with vim-gitgutter
- **Enhanced Completion**: Better autocomplete behavior

---

## 📸 Screenshots

<p align='center'>
  <img src="https://github.com/georgegozal/vim-config/blob/main/screenshot.png">
</p>

---

## 🙌 Contributing

If you have suggestions or improvements, feel free to fork this repo and submit a pull request!

---

## 📝 License

This configuration is free to use and modify for personal or commercial use.