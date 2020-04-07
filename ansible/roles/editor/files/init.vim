call plug#begin('~/.config/nvim/plugged')

"Ansible/Yaml
" Plug 'chase/vim-ansible-yaml'

"Auto pair
Plug 'jiangmiao/auto-pairs'

"Yaml
Plug 'stephpy/vim-yaml'

"Asyncomplete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'tsufeki/asyncomplete-fuzzy-match', {'do': 'cargo build --release'}

"Bash LSP
Plug 'lgranie/vim-lsp-bash'

"Commentary
Plug 'tpope/vim-commentary'

"Common Lisp
Plug 'l04m33/vlime', {'rtp': 'vim'}

"Clojure
Plug 'guns/vim-clojure-static'

"Darcula theme
Plug 'blueshirts/darcula'

"Fireplace
Plug 'tpope/vim-fireplace'

"Fugitive
Plug 'tpope/vim-fugitive'

"Fuzzy finder
Plug 'https://gitlab.com/jenifael.gingras/fzf.vim'
" Plug 'junegunn/fzf.vim'

"Gitgutter
Plug 'airblade/vim-gitgutter'

"Jinja
Plug 'lepture/vim-jinja'

"Json
Plug 'elzr/vim-json'

"Paredit
Plug 'vim-scripts/paredit.vim'

"Powershell
Plug 'PProvost/vim-ps1'

"Sudo Edit
Plug 'chrisbra/SudoEdit.vim'

"Rainbow parentheses
Plug 'luochen1990/rainbow'

"rope python project
" Plug 'python-rope/ropevim'

"rust
Plug 'rust-lang/rust.vim'

"Taboo
Plug 'gcmt/taboo.vim'

"Toml
Plug 'cespare/vim-toml'

"Unimpaired
Plug 'tpope/vim-unimpaired'

"Plug
Plug 'junegunn/vim-plug'

"Better status line
Plug 'vim-airline/vim-airline'
call plug#end()

syntax on
filetype plugin indent on

"general settings
set completeopt=menuone,noinsert,noselect
set formatoptions-=cro
set sessionoptions-=options
set number
set hidden
set showcmd
set wildmenu
set wildmode=longest,list
set backspace=eol,start,indent
set laststatus=2
set completeopt=menuone,noinsert,noselect
set nowrap

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
set ignorecase
set smartcase
set hlsearch
set showmatch

"make utf8 and unix the default
set encoding=utf8
set ffs=unix,dos,mac

"mapping
let mapleader = ","
noremap <leader>ev :e $HOME/.config/nvim/init.vim<cr>
noremap <leader>rv :source $MYVIMRC<cr>
nnoremap <leader><leader>s :%s/\s+$//ge \| noh <cr>

"autocommand
augroup vimrc
    au!
    au BufRead *.yml :setf ansible
    au BufRead Jenkinsfile :setf groovy
    autocmd BufWritePre *.py :%s/\s\+$//e
augroup end

"theme
set background=dark
colorscheme darcula

"airline
let g:airline_powerline_fonts = 1

"Commentary
nnoremap <c-m> :Commentary<cr>
vnoremap <c-m> :Commentary<cr>

"Fireplace
" noremap <leader>cc :Eval
" noremap <leader>ce :Eval<cr>
" noremap <leader>cb :%Eval<cr>

"Fzf
nnoremap <C-e> :History<cr>
nnoremap <C-p> :Files<cr>

"Rope
nnoremap <c-enter> :RopeAutoImport<cr>
let g:ropevim_prefer_py3='1'
" let g:ropevim_autoimport_modules = ["os", "shutil", "math", "random", "datetime", "curses", "re", "requests"]
" let g:ropevim_autoimport_underlineds = 1
let g:ropevim_vim_completion=0
let g:ropevim_guess_project=1
" let g:ropevim_enable_autoimport=1

"Taboo
set sessionoptions+=tabpages,globals

"Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25

"Rainbow
let g:rainbow_active = 1

"Asyncomplete
let g:asyncomplete_auto_completeopt = 1
imap <c-space> <Plug>(asyncomplete_force_refresh)<c-n><c-n>
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
inoremap <expr> <C-y> pumvisible() ? asyncomplete#close_popup() : "\<C-y>"
inoremap <expr> <C-e> pumvisible() ? asyncomplete#cancel_popup() : "\<C-e>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
            \ 'name': 'buffer',
            \ 'priority': 100,
            \ 'whitelist': ['*'],
            \ 'blacklist': ['lisp', 'cl'],
            \ 'completor': function('asyncomplete#sources#buffer#completor'),
            \ 'config': {
            \   'max_buffer_size': 5000000,
            \ },
            \ }))
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
            \ 'name': 'file',
            \ 'whitelist': ['*'],
            \ 'blacklist': ['lisp', 'cl'],
            \ 'priority': 20,
            \ 'completor': function('asyncomplete#sources#file#completor')
            \ }))
"Lsp
let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_virtual_text_enabled = 1
let g:lsp_highlights_enabled = 0
let g:lsp_log_verbose = 0
let g:lsp_log_file = expand('/home/jenifael/lsp.log')
nnoremap <leader>lne :LspNextError<cr>
nnoremap <leader>lpe :LspPreviousError<cr>
nnoremap <leader>lh :LspHover<cr>
inoremap <c-h> <c-o>:LspHover<cr>
nnoremap <leader>lss :LspStatus<cr>
nnoremap <leader>lsd :LspDocumentDiagnostic<cr>
nnoremap <leader>lr :LspReferences<cr>
nnoremap gd :LspDefinition<cr>
nnoremap <s-l> :LspDocumentFormat<cr>
au User lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': {server_info->['pyls']},
    \ 'whitelist': ['python'],
    \ 'workspace_config': {'pyls': {'plugins': {'pydocstyle': {'enabled': v:false}, 'pyls_mypy': {'enabled': v:true, 'live_mode': v:false}}}}
    \ })
au User lsp_setup call lsp#register_server({
    \ 'name': 'clojure-lsp',
    \ 'cmd': {server_info->['bash', '-c', '/usr/local/bin/clojure-lsp']},
    \ 'whitelist': ['clojure'],
    \ })
au User lsp_setup call lsp#register_server({
    \ 'name': 'rls',
    \ 'cmd': {server_info->['bash', '-c', '/usr/bin/rls']},
    \ 'whitelist': ['rust'],
    \ })
au User lsp_setup call lsp#register_server({
    \ 'name': 'jsonls',
    \ 'cmd': {server_info->['vscode-json-languageserver']},
    \ 'whitelist': ['json'],
    \ })

"Something try desperately to make vim file auto comment new line...
autocmd FileType vim setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Autopairs
let g:AutoPairsCenterLine = 0
