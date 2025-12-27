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

" Set dark background
set background=dark

" Initialize plugin manager (Vim-Plug)
call plug#begin('~/.vim/plugged')

" File tree navigation
Plug 'preservim/nerdtree'

" Status line
Plug 'vim-airline/vim-airline'

" Syntax checking and linting
Plug 'dense-analysis/ale'

" Autocompletion  YouCompleteMe unavailable: requires Vim 9.1.0016+
" Plug 'ycm-core/YouCompleteMe'

" Easy commenting/uncommenting
Plug 'tpope/vim-commentary'

" Popular color scheme (morhetz/gruvbox)
Plug 'crusoexia/vim-monokai'

" HTML/CSS-ის fast writing.
Plug 'mattn/emmet-vim'

" End plugin manager initialization
call plug#end()

" Enable Monokai color scheme
colorscheme monokai

set termguicolors


" Python-specific settings
autocmd FileType python setlocal shiftwidth=4 tabstop=4

" JavaScript/Node.js-specific settings
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" HTML-specific settings
autocmd FileType html setlocal shiftwidth=2 tabstop=2


let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'html': ['htmlhint'],
\}

let g:ale_fixers = {
\   'python': ['black'],
\   'javascript': ['prettier'],
\   'html': ['prettier'],
\}

let g:ale_fix_on_save = 1  " ავტომატური ფორმატირება ფაილის შენახვისას
let g:ale_python_flake8_use_global = 0
let g:ale_python_flake8_executable = 'python -m flake8'
let g:ale_python_flake8_options = '--max-line-length=88'
let g:ale_python_black_options = '--line-length=88'

"*************************************************
" NERDTree-ის ავტომატურად გახსნა Vim-ის გაშვებისას
 autocmd VimEnter * if argc() == 0 | NERDTree | endif

" Custom alias :Tree for NERDTree
command! Tree NERDTree | wincmd p

" Custom window navigation shortcuts (mapped for convenience)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" NERDTree-ის ავტომატურად დახურვა, თუ ერთადერთი ფანჯარაა
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Auto-detect venv and configure ALE
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
            
            "echo "Activated virtual environment: " . l:venv_dir
        endif
    endif
endfunction

autocmd BufRead,BufNewFile *.py call ActivateVenv()
