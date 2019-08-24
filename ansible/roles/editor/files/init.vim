call plug#begin('~/.config/nvim/plugged')

"Ansible/Yaml
Plug 'chase/vim-ansible-yaml'

"ALE
Plug 'w0rp/ale'

"Asyncomplete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'tsufeki/asyncomplete-fuzzy-match', {'do': 'cargo build --release'}

"Darcula theme
Plug 'blueshirts/darcula'

"Fireplace
Plug 'tpope/vim-fireplace'

"Fugitive
Plug 'tpope/vim-fugitive'

"Fuzzy finder
Plug 'junegunn/fzf.vim'

"Gitgutter
Plug 'airblade/vim-gitgutter'

"Jedi
Plug 'davidhalter/jedi-vim'

"Jinja
Plug 'lepture/vim-jinja'

"Pair
Plug 'jiangmiao/auto-pairs'

"Sudo Edit
Plug 'chrisbra/SudoEdit.vim'

"Rainbow parentheses
Plug 'luochen1990/rainbow'

"rope python project
Plug 'python-rope/ropevim'

"rust
Plug 'rust-lang/rust.vim'

"Taboo
Plug 'gcmt/taboo.vim'

"Toml
Plug 'cespare/vim-toml'

"tcomment
Plug 'tomtom/tcomment_vim'

"YouCompleteMe
" Plug 'ycm-core/YouCompleteMe'

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
augroup end

"theme
set background=dark
colorscheme darcula

"airline
let g:airline_powerline_fonts = 1

"ALE
nnoremap <c-j> :ALENext<cr>
nnoremap <c-k> :ALEPrevious<cr>
let g:ale_linters = {'rust': ['rls'], 'python': ['pyls']}
let g:ale_completion_enabled = 0
let g:ale_fixers = {'python': ['black'], '*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save = 1
nnoremap <a-c-l> :ALEFix<cr>
nnoremap <s-l> :ALEFix<cr>
nnoremap gd :ALEGoToDefinition<cr>

"Fzf
nnoremap <C-e> :History<cr>
nnoremap <C-p> :Files<cr>

"TComment
noremap <c-m> :TComment<cr>

"Rope
nnoremap <c-enter> :RopeAutoImport<cr>
let g:ropevim_prefer_py3='1'
let g:ropevim_autoimport_modules = ["os", "shutil", "math", "random", "datetime", "curses", "re", "requests"]
let g:ropevim_autoimport_underlineds = 1
let g:ropevim_vim_completion=0
let g:ropevim_guess_project=1
let g:ropevim_enable_autoimport=1

"Taboo
set sessionoptions+=tabpages,globals

"Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25

"YouCompleteMe
" let g:ycm_language_server = [{
" \'name': 'python',
" \'cmdline': ['pyls'],
" \'filetypes': ['python'],
" \},
" \{
" \'name': 'clojure',
" \'cmdline': ['bash', '-c', '/usr/local/bin/clojure-lsp'],
" \'filetypes': ['clojure'],
" \}]
" let g:ycm_filepath_completion_use_working_dir = 1
" let g:ycm_use_ultisnips_completer = 0

"Asyncomplete
let g:asyncomplete_auto_completeopt = 1
imap <c-space> <Plug>(asyncomplete_force_refresh)<c-n><c-n>
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
            \ 'name': 'buffer',
            \ 'whitelist': ['*'],
            \ 'completor': function('asyncomplete#sources#buffer#completor'),
            \ 'config': {
            \   'max_buffer_size': 5000000,
            \ },
            \ }))
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
            \ 'name': 'file',
            \ 'whitelist': ['*'],
            \ 'priority': 20,
            \ 'completor': function('asyncomplete#sources#file#completor')
            \ }))
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ale#get_source_options({
            \ 'priority': 10,
            \ }))

"Lsp
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif
if executable('clojure-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clojure-lsp',
        \ 'cmd': {server_info->['bash -c /usr/local/bin/clojure-lsp']},
        \ 'whitelist': ['clojure'],
        \ })
endif

"Jedi
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
call jedi#configure_call_signatures()
let g:jedi#show_call_signatures = 1
let g:jedi#show_call_signatures_delay = 200
inoremap <c-s> <c-o>:call jedi#show_call_signatures()<cr>

"Something try desperately to make vim file auto comment new line...
autocmd FileType vim setlocal formatoptions-=c formatoptions-=r formatoptions-=o
