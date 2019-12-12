"============================================================================
" Begin : General configuration
"============================================================================
" Make not compatible with classic VI
set nocompatible

set encoding=utf-8

" Display line numbers on the left
set number

" Enable syntax highlighting
syntax enable

" set tabs to have 2 spaces
set ts=2

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" allow you access your system clipboard
set clipboard=unnamed

" Better command-line completion
set wildmenu

" Highlight searches
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Enable use of the mouse for all modes
set mouse=a

" specify different areas of the screen where the splits should occur
set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Set file type
au BufRead,BufNewFile Jenkinsfile set ft=groovy

" Mapping for moving between the previous/next buffer
map <F9> :bprevious<CR>
map <F10> :bnext<CR>

"============================================================================
" End : General configuration
"============================================================================

"============================================================================
" Begin : Vundle plugin management
"============================================================================
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Custom plugins
" git interface
Plugin 'tpope/vim-fugitive'

" auto-completion stuff
Plugin 'davidhalter/jedi-vim'

" near the top of your .vimrc
Plugin 'ekalinin/Dockerfile.vim'

" python plugins
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'jmcantrell/vim-virtualenv'

" toolbars
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" colors!!!
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin indent on
"============================================================================
" End : Vundle plugin management
"============================================================================

"============================================================================
" Begin : Code folding
"============================================================================
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
"============================================================================
" End : Code folding
"============================================================================

"============================================================================
" Begin : airline configuration
"============================================================================
set laststatus=2
let g:airline_theme = 'molokai'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
"============================================================================
" End : airline configuration
"============================================================================

"============================================================================
" Begin : Python stuff
"============================================================================
" enable all Python syntax highlighting features
let python_highlight_all = 1

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

" spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
"============================================================================
" End : Python stuff
"============================================================================

"============================================================================
" Begin : NERDTree configuration
"============================================================================
" let g:NERDTreeDirArrows=0

" Open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree

" Show hidden file
let NERDTreeShowHidden=1

" Open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
"============================================================================
" End : NERDTree configuration
"============================================================================
