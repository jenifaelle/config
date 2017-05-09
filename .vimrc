call plug#begin('~/.vim/pluged')

"Ansible/Yaml
Plug 'chase/vim-ansible-yaml'

"ALE
Plug 'w0rp/ale'

"Better completion
Plug 'maralla/completor.vim'

"Ctrl Space
Plug 'vim-ctrlspace/vim-ctrlspace'

"Darcula theme
Plug 'blueshirts/darcula'

"Sudo Edit
Plug 'chrisbra/SudoEdit.vim'

Plug 'jremmen/vim-ripgrep'

"Better status line
Plug 'vim-airline/vim-airline'
call plug#end()

syntax on
filetype plugin indent on

"general settings
set number
set nocompatible
set hidden
set showcmd
set wildmenu
set backspace=eol,start,indent
set laststatus=2

"get rid of backup file
set nobackup
set nowb
set noswapfile

"indentation management
set expandtab
set smarttab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4

"search options
set smartcase
set hlsearch
set showmatch

"make utf8 and unix the default
set encoding=utf8
set ffs=unix,dos,mac

"mapping
let mapleader = ","
noremap <leader>ev :e $MYVIMRC<cr>
noremap <leader>rv :source $MYVIMRC<cr>
nnoremap <leader><leader>s :%s/\s$//g<cr>

"theme
set background=dark
colorscheme darcula

"airline
let g:airline_powerline_fonts = 1

"ALE
nnoremap <c-j> :ALENext<cr>
nnoremap <c-k> :ALEPrevious<cr>
