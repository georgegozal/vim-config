# Vim Configuration for Python & JavaScript Development

This is my personal Vim configuration tailored for Python, JavaScript, and web development. It focuses on ease of use, readability, and productivity.

---

## 🚀 Features

✅ Syntax highlighting  
✅ Line numbers & relative numbers  
✅ Consistent indentation  
✅ Automatic indentation  
✅ Smart case search  
✅ Mouse support  
✅ System clipboard integration  
✅ Easy plugin management (via [vim-plug](https://github.com/junegunn/vim-plug))  
✅ Popular plugins:
- **NERDTree**: File tree navigation
- **vim-airline**: Enhanced status line
- **ALE**: Asynchronous linting and fixing
- **vim-commentary**: Easy commenting
- **vim-monokai**: Monokai color scheme
- **emmet-vim**: Fast HTML/CSS writing

---

## 📦 Installation

### 1️⃣ Install [vim-plug](https://github.com/junegunn/vim-plug):

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### 2️⃣ Clone this repository into your home directory:
```bash
git clone git@github.com:georgegozal/vim-config.git
```
### 3️⃣ Copy the .vimrc to your home directory
```bash
cp vim-config/.vimrc $HOME/.vimrc
```

### 4️⃣ Install plugins:


Launch Vim and run:
```bash
:PlugInstall
```
### 🎨 Colorscheme
**Monokai** is used by default with true color support

### 🐍 Python Virtual Environment
This configuration automatically detects your Python virtual environment (`.venv` or `venv`) from the directory where Vim is launched and configures it for seamless Python development.

### 🛠️ Linting & Fixing
ALE is configured to automatically lint and fix on save:
* Python: flake8, pylint, black

* JavaScript: eslint, prettier

* HTML: htmlhint, prettier

### NERDTree: File tree navigation

**NERDTree** automatically opens on Vim startup.  
If it’s closed or not running, you can open it anytime with the command `:Tree`


Navigation shortcuts between windows (useful for moving between NERDTree and file buffers):

`ctrl + h` or `ctrl + w + h` — move to the left window

`ctrl + j` or `ctrl + w + j` — move to the window below

`ctrl + k` or `ctrl + w + k` — move to the window above

`ctrl + l` or `ctrl + w + l` — move to the right window

### 📸 Screenshots
<p align='center'>
  <img src="https://github.com/georgegozal/vim-config/blob/main/screenshot.png">
</p>

### 🙌 Contributing

If you have suggestions or improvements, feel free to fork this repo and submit a pull request!