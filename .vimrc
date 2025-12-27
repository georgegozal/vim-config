" ============================================================================
" Vim Configuration for Python, JavaScript & Web Development
" Author: George Gozal
" ============================================================================

" ============================================================================
" GENERAL SETTINGS
" ============================================================================

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

" Smart indentation (e.g., for C-style code)
set smartindent

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

" Integrate with system clipboard (requires Vim compiled with +clipboard)
set clipboard=unnamedplus

" Set dark background
set background=dark

" Enable true color support
set termguicolors

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
nnoremap <leader>b :ls<CR>:b<Space>

" Quick buffer switching by number (useful when many files open)
nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>5 :b5<CR>

" Delete buffer without closing window
nnoremap <leader>x :bp<bar>sp<bar>bn<bar>bd<CR>

" Window navigation (standard Vim - Ctrl+w then h/j/k/l)
" Already built-in, no custom mapping needed

" Quick splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>

" Quick save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Keep visual selection after indent
vnoremap < <gv
vnoremap > >gv

" Move lines up/down (very useful!)
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

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

" Monokai color scheme
Plug 'crusoexia/vim-monokai'

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

" ============================================================================
" COLORSCHEME
" ============================================================================

" Enable Monokai color scheme
colorscheme monokai

" ============================================================================
" NERDTREE CONFIGURATION
" ============================================================================

" Toggle NERDTree with Ctrl+n
nnoremap <C-n> :NERDTreeToggle<CR>

" Custom alias :Tree for NERDTree
command! Tree NERDTree | wincmd p

" Auto-close NERDTree if it's the only window left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ============================================================================
" FILE TYPE SPECIFIC SETTINGS
" ============================================================================

" Python-specific settings
autocmd FileType python setlocal shiftwidth=4 tabstop=4

" JavaScript/Node.js-specific settings
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" HTML-specific settings
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" Shell script settings (2 spaces is standard)
autocmd FileType sh setlocal shiftwidth=2 tabstop=2

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
\   'javascript': ['eslint'],
\   'html': ['htmlhint'],
\}

" Configure fixers
let g:ale_fixers = {
\   'python': ['black'],
\   'javascript': ['prettier'],
\   'html': ['prettier'],
\}

" Auto-fix on save
let g:ale_fix_on_save = 1

" Python-specific ALE settings
let g:ale_python_flake8_use_global = 0
let g:ale_python_flake8_executable = 'python -m flake8'
let g:ale_python_flake8_options = '--max-line-length=88'
let g:ale_python_black_options = '--line-length=88'
let g:ale_python_auto_virtualenv = 1

" Show ALE errors in airline
let g:airline#extensions#ale#enabled = 1

" ============================================================================
" PYTHON VIRTUAL ENVIRONMENT AUTO-DETECTION
" ============================================================================

function! ActivateVenv()
    let l:venv_dir = finddir('.venv', '.;')
    if empty(l:venv_dir)
        let l:venv_dir = finddir('venv', '.;')
    endif
    
    if !empty(l:venv_dir)
        let l:venv_dir = fnamemodify(l:venv_dir, ':p')
        let l:python_path = l:venv_dir . 'bin/python'
        
        if executable(l:python_path)
            let g:python3_host_prog = l:python_path
            let $VIRTUAL_ENV = l:venv_dir
            let $PATH = l:venv_dir . 'bin:' . $PATH
            
            " Configure ALE to use venv Python
            let g:ale_python_flake8_executable = l:python_path . ' -m flake8'
            let g:ale_python_pylint_executable = l:python_path . ' -m pylint'
        endif
    endif
endfunction

autocmd BufRead,BufNewFile *.py call ActivateVenv()

" ============================================================================
" INITIALIZATION
" ============================================================================

" Create undo directory if it doesn't exist
if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "p", 0700)
endif