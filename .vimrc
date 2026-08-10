" ============================================================================
" Vim Configuration for Python, JavaScript & Web Development
" Author: George Gozal
" macOS Compatible Version
" ============================================================================

" ============================================================================
" MACOS COMPATIBILITY FIXES
" ============================================================================

" Detect operating system
let s:is_mac = has('mac') || has('macunix')
let s:is_linux = has('unix') && !has('macunix')

" macOS-specific terminal setup
if s:is_mac
    " Fix for macOS Terminal color issues
    if $TERM_PROGRAM ==# 'Apple_Terminal'
        set notermguicolors
    else
        " iTerm2 and other modern terminals support true colors
        set termguicolors
    endif
    
    " macOS clipboard integration
    set clipboard=unnamed
    
    " Fix backspace on macOS
    set backspace=indent,eol,start
else
    " Linux settings
    set termguicolors
    if has('clipboard')
        set clipboard=unnamedplus
    else
        " Workaround: sync yank/paste with system clipboard via xclip
        autocmd TextYankPost * call system('xclip -selection clipboard', @")
        nnoremap p :let @"=system('xclip -selection clipboard -o')<CR>p
        nnoremap P :let @"=system('xclip -selection clipboard -o')<CR>P
    endif
endif

" ============================================================================
" GENERAL SETTINGS
" ============================================================================

" Enable filetype detection, plugins, and indentation
filetype plugin indent on

" Enable syntax highlighting
syntax on

" Show line numbers
set number

" Show relative line numbers
set relativenumber

" Set tab width to 4 spaces
set tabstop=4

" Set indentation width to 4 spaces
set shiftwidth=4

" Use spaces instead of tabs
set expandtab

" Highlight the current line
set cursorline

" Automatic indentation for new lines
set autoindent

" Disable line wrapping
set nowrap

" Case-insensitive search
set ignorecase

" Case-sensitive search if uppercase letters are used
set smartcase

" Show search results in real-time
set incsearch

" Highlight search results
set hlsearch

" Fix backspace behavior
set backspace=indent,eol,start

" Enable mouse support (useful for text selection)
set mouse=a

" Use UTF-8 encoding
set encoding=utf-8

" Set dark background
set background=dark

" ============================================================================
" BETTER DEFAULTS
" ============================================================================

" Allow switching buffers without saving
set hidden

" Sensible split directions
set splitright
set splitbelow

" Persistent undo across sessions
set undofile
set undodir=~/.vim/undodir

" Enhanced command completion
set wildmenu
set wildmode=list:longest,full

" Show partial commands
set showcmd

" Highlight matching brackets
set showmatch
set matchtime=2

" More command history
set history=1000

" Faster updates for better UX
set updatetime=300

" Don't redraw during macros (performance)
set lazyredraw

" Better completion options
set completeopt=menuone,noinsert,noselect
set shortmess+=c

" Disable swap and backup files (optional)
set noswapfile
set nobackup

" ============================================================================
" KEY MAPPINGS
" ============================================================================

" Save file with Ctrl+S
nnoremap <C-s> :w<CR>

" Quit Vim with Ctrl+Q
nnoremap <C-q> :q<CR>

" Clear search highlights with <leader>h (default leader is \)
nnoremap <leader>h :nohlsearch<CR>

" Move by visual lines (useful when lines are wrapped)
nnoremap j gj
nnoremap k gk

" Use 'jk' as an alternative to Esc in Insert mode
inoremap jk <Esc>

" ============================================================================
" BUFFER & WINDOW NAVIGATION
" ============================================================================

" Buffer navigation
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>
nnoremap <leader>d :bdelete<CR>

" Show buffer list and prompt for buffer switch
nnoremap <leader>b :ls<CR>: b<Space>

" Quick buffer switching by number (useful when many files open)
nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>5 :b5<CR>

" Delete buffer without closing window
nnoremap <leader>x :bp<bar>sp<bar>bn<bar>bd<CR>

" Quick splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>

" Quick save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Keep visual selection after indent
vnoremap < <gv
vnoremap > >gv

" macOS-compatible line moving (works without Alt key issues)
" Use Ctrl+j and Ctrl+k instead of Alt/Meta
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Alternative:  If you're using iTerm2, you can keep Alt mappings
if !s:is_mac || $TERM_PROGRAM ==# 'iTerm.app'
    nnoremap <M-j> :m .+1<CR>==
    nnoremap <M-k> :m .-2<CR>==
    vnoremap <M-j> :m '>+1<CR>gv=gv
    vnoremap <M-k> :m '<-2<CR>gv=gv
endif

" ============================================================================
" PLUGIN MANAGER (VIM-PLUG)
" ============================================================================

call plug#begin('~/.vim/plugged')

" File tree navigation
Plug 'preservim/nerdtree'

" Status line
Plug 'vim-airline/vim-airline'

" Syntax checking and linting
Plug 'dense-analysis/ale'

" Easy commenting/uncommenting
Plug 'tpope/vim-commentary'

" Color schemes
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'ghifarit53/tokyonight-vim'
Plug 'joshdick/onedark.vim'
Plug 'bluz71/vim-moonfly-colors'

" HTML/CSS fast writing
Plug 'mattn/emmet-vim'

" Fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" Auto-close brackets
Plug 'jiangmiao/auto-pairs'

" Git integration
Plug 'airblade/vim-gitgutter'

" Better syntax highlighting
Plug 'sheerun/vim-polyglot'

" Buffer list in tabline
Plug 'ap/vim-buftabline'

call plug#end()

" Fuzzy file finder
nnoremap <C-p> :CtrlP<CR>

let g:ctrlp_custom_ignore = {'dir': 'node_modules\|\.git\|dist\|build'}

" ============================================================================
" COLORSCHEME
" ============================================================================

let s:default_theme = 'monokai'
let s:available_themes = ['monokai', 'gruvbox', 'tokyonight', 'onedark', 'moonfly', 'desert', 'slate', 'evening']

function! s:ApplyTheme(name) abort
    if a:name ==# 'default'
        let l:name = s:default_theme
    elseif a:name ==# 'list' || empty(a:name)
        echo 'Default: ' . s:default_theme . ' | Available: ' . join(s:available_themes, ', ')
        return
    else
        let l:name = a:name
    endif
    try
        execute 'colorscheme' l:name
        echo 'Theme: ' . l:name
    catch
        echoerr 'Theme not available: ' . l:name . ' (run :PlugInstall)'
    endtry
endfunction

function! s:ThemeComplete(arglead, cmdline, cursorpos) abort
    return filter(['default'] + s:available_themes, 'v:val =~# "^" . a:arglead')
endfunction

command! -nargs=? -complete=customlist,s:ThemeComplete Theme call s:ApplyTheme(<q-args>)

try
    execute 'colorscheme' s:default_theme
catch
    colorscheme desert
endtry

" ============================================================================
" NERDTREE CONFIGURATION
" ============================================================================

" Toggle NERDTree with Ctrl+n
nnoremap <C-n> :NERDTreeToggle<CR>

" Custom alias :Tree for NERDTree (toggles, won't open duplicates)
command! Tree NERDTreeToggle

" Hide dotfiles by default; \. or :TreeHidden to toggle (or press I in NERDTree)
let g:NERDTreeShowHidden = 0

function! s:ToggleTreeDotfiles() abort
    NERDTreeToggleHidden
    echo g:NERDTreeShowHidden ? 'Tree: showing dotfiles' : 'Tree: hiding dotfiles'
endfunction

nnoremap <leader>. :call s:ToggleTreeDotfiles()<CR>
command! TreeHidden call s:ToggleTreeDotfiles()

" Auto-close NERDTree if it's the only window left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open NERDTree as a proper sidebar when vim starts with a directory argument
" This prevents 'vim .' from putting NERDTree in the main window, which would
" cause Ctrl+n to open a duplicate sidebar
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'cd' fnameescape(argv()[0]) | enew |
    \ execute 'NERDTree' fnameescape(getcwd()) | wincmd p | endif

" macOS-specific NERDTree settings
if s:is_mac
    " Use ASCII characters for NERDTree if terminal doesn't support Unicode well
    if $TERM_PROGRAM ==# 'Apple_Terminal'
        let g:NERDTreeDirArrowExpandable = '+'
        let g:NERDTreeDirArrowCollapsible = '-'
    endif
endif

" ============================================================================
" FILE TYPE SPECIFIC SETTINGS
" ============================================================================

" Python-specific settings
autocmd FileType python setlocal shiftwidth=4 tabstop=4

" JavaScript/Node.js-specific settings
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" HTML-specific settings
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" Shell script settings
autocmd FileType sh setlocal shiftwidth=4 tabstop=4

" XML settings
autocmd FileType xml setlocal shiftwidth=2 tabstop=2

" JSON settings
autocmd FileType json setlocal shiftwidth=2 tabstop=2

" YAML settings
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" ============================================================================
" ALE CONFIGURATION
" ============================================================================

" Configure linters
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript':  ['eslint'],
\   'html': ['htmlhint'],
\   'sh': ['shellcheck'],
\}

" Configure fixers
let g:ale_fixers = {
\   'python': ['isort', 'black'],
\   'javascript': ['prettier'],
\   'html': ['prettier'],
\}

" Auto-fix on save
let g:ale_fix_on_save = 1

" Python-specific ALE settings
let g:ale_python_flake8_use_global = 0
let g:ale_python_flake8_executable = 'python3 -m flake8'
let g:ale_python_flake8_options = '--max-line-length=88'
let g:ale_python_black_options = '--line-length=88'
let g:ale_python_auto_virtualenv = 1

" Show ALE errors in airline
let g:airline#extensions#ale#enabled = 1

" Clock and session timer in statusline
let g:vim_session_start = localtime()

function! AirlineClock() abort
    return strftime('%H:%M')
endfunction

function! AirlineSessionTimer() abort
    let l:elapsed = localtime() - g:vim_session_start
    return printf('%02d:%02d', l:elapsed / 60, l:elapsed % 60)
endfunction

let g:airline_section_z = '%{AirlineClock()} %{AirlineSessionTimer()} %3p%%'

function! s:RefreshStatusline(timer) abort
    if exists(':AirlineRefresh') == 2
        silent! AirlineRefresh
    else
        redrawstatus
    endif
endfunction

let s:status_timer = timer_start(1000, function('s:RefreshStatusline'), {'repeat': -1})

" ============================================================================
" PYTHON VIRTUAL ENVIRONMENT AUTO-DETECTION
" ============================================================================

function! ActivateVenv()
    let l:venv_dir = finddir('.venv', '.;')
    if empty(l:venv_dir)
        let l:venv_dir = finddir('venv', '.;')
    endif
    
    if ! empty(l:venv_dir)
        let l:venv_dir = fnamemodify(l:venv_dir, ':p')
        
        " macOS uses different path structure for Python in venv
        if s:is_mac
            let l:python_path = l:venv_dir . 'bin/python3'
        else
            let l:python_path = l:venv_dir . 'bin/python'
        endif
        
        if executable(l:python_path)
            let g:python3_host_prog = l:python_path
            let $VIRTUAL_ENV = l:venv_dir
            let $PATH = l:venv_dir . 'bin:' . $PATH
            
            " Configure ALE to use venv linters
            let g:ale_python_flake8_executable = l:venv_dir . 'bin/flake8'
            let g:ale_python_pylint_executable = l:venv_dir . 'bin/pylint'
        endif
    endif
endfunction

autocmd BufRead,BufNewFile *.py call ActivateVenv()

" ============================================================================
" MACOS PYTHON3 SETUP
" ============================================================================

if s:is_mac
    " Try to find Python 3 installation on macOS
    if executable('python3')
        let g:python3_host_prog = exepath('python3')
    elseif executable('/usr/local/bin/python3')
        let g:python3_host_prog = '/usr/local/bin/python3'
    elseif executable('/opt/homebrew/bin/python3')
        " Apple Silicon Mac (M1/M2/M3)
        let g:python3_host_prog = '/opt/homebrew/bin/python3'
    endif
endif

" ============================================================================
" AUTO-CLEANUP
" ============================================================================

" Remove trailing whitespace on save for Python and shell scripts
autocmd BufWritePre *.py,*.sh,*.bash %s/\s\+$//e

" ============================================================================
" COMMANDS & UX
" ============================================================================

" Vim 9.2+ ships :Open (openPlugin.vim). Only define a fallback on older Vim.
function! s:OpenPath(path) abort
    let l:path = a:path
    if empty(l:path)
        let l:path = expand('%:p')
        if empty(l:path)
            let l:path = getcwd()
        endif
    else
        let l:path = fnamemodify(expand(a:path), ':p')
    endif
    if !filereadable(l:path) && !isdirectory(l:path)
        echoerr 'Path does not exist: ' . l:path
        return
    endif
    if s:is_mac
        silent! call system('open ' . shellescape(l:path))
    elseif has('win32')
        silent! call system('start "" ' . shellescape(l:path))
    else
        silent! call system('xdg-open ' . shellescape(l:path))
    endif
endfunction

function! s:EnsureOpenCommand() abort
    if exists(':Open') == 2
        return
    endif
    command! -nargs=? -complete=file Open call s:OpenPath(<q-args>)
endfunction

augroup OpenFallback
    autocmd!
    autocmd VimEnter * call s:EnsureOpenCommand()
augroup END

command! Reload source $MYVIMRC | echo 'Config reloaded'

if s:is_mac
    nnoremap <D-e> :NERDTreeToggle<CR>
    nnoremap <D-f> :CtrlP<CR>
endif

" ============================================================================
" INITIALIZATION
" ============================================================================

" Create undo directory if it doesn't exist
if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "p", 0700)
endif