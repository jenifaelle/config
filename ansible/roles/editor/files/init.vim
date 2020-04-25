call plug#begin('~/.config/nvim/plugged')
"Auto pair
Plug 'jiangmiao/auto-pairs'

"Yaml
Plug 'stephpy/vim-yaml'

"CoC
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Commentary
Plug 'tpope/vim-commentary'

"Common Lisp
Plug 'l04m33/vlime', {'rtp': 'vim'}

"Clojure
Plug 'guns/vim-clojure-static'

"Darcula theme
Plug 'blueshirts/darcula'

"Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"Fireplace
Plug 'tpope/vim-fireplace'

"Fugitive
Plug 'tpope/vim-fugitive'

"Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://gitlab.com/jenifael.gingras/fzf.vim'

"Gitgutter
Plug 'airblade/vim-gitgutter'

"Jinja
Plug 'lepture/vim-jinja'

"Json
Plug 'elzr/vim-json'

"Neovim Lsp
Plug 'neovim/nvim-lsp'

"Paredit
Plug 'vim-scripts/paredit.vim'

"Powershell
Plug 'PProvost/vim-ps1'

"Sudo Edit
Plug 'chrisbra/SudoEdit.vim'

"Rainbow parentheses
Plug 'luochen1990/rainbow'

"rust
Plug 'rust-lang/rust.vim'

"Taboo
Plug 'gcmt/taboo.vim'

"Toml
Plug 'cespare/vim-toml'

"Vimspector (DAP)
Plug 'puremourning/vimspector'

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

nnoremap <silent> <c-s> <cmd>let @/ = ""<cr>

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

"Fzf
nnoremap <C-p> :Files<cr>
nnoremap <C-e> :History<cr>

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

"Something try desperately to make vim file auto comment new line...
autocmd FileType vim setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Autopairs
let g:AutoPairsCenterLine = 0

""""""""""
"CoC
"completion
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" " Use <cr> to confirm completion
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

""""""""""
"Neovim LSP

lua << EOF
--pyls
local nvim_lsp = require'nvim_lsp'
nvim_lsp.pyls.setup{
    root_dir = nvim_lsp.util.root_pattern('.git');
    settings = {
        pyls = {
            configurationSources = "flake8";
            plugins = {
                pyflakes = {
                    enabled = false;
                };
                yapf = {
                    enabled = false;
                }
            }
        }
    }
}

--rust analyzer
nvim_lsp.rust_analyzer.setup{}

--bash ls
nvim_lsp.bashls.setup{}

--dockerls
nvim_lsp.dockerls.setup{}

--go lsp
nvim_lsp.gopls.setup{}

--jsonls
nvim_lsp.jsonls.setup{}

--vimls
nvim_lsp.vimls.setup{}

--lua
nvim_lsp.sumneko_lua.setup{}
EOF


"Utilities
nnoremap <leader>lss <cmd>lua print(vim.inspect(vim.lsp.buf_get_clients()))<CR>
nnoremap <leader>lsr <cmd>lua vim.lsp.stop_client(lsp.get_active_clients())<CR>
nnoremap <leader>lsc <cmd>verbose set omnifunc?<CR>
nnoremap <leader>lsd <cmd>lua vim.lsp.util.buf_clear_diagnostics(0)<CR>

"Declaration, definition, implementation, references
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>lsp <cmd>lua vim.lsp.buf.peek_definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR><cmd>cwindow 5<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.util.buf_clear_references()<CR>

"Hover, signature, formatting
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
inoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <s-l> <cmd>lua vim.lsp.buf.formatting()<CR>
" nnoremap <silent> <s-l> <cmd>lua vim.lsp.buf.formatting()<CR><cmd>lua vim.lsp.util.trim_empty_lines()<CR>

"Previous|Next Error (quickfix)
nnoremap <silent> [g <cmd>cprevious<CR>
nnoremap <silent> ]g <cmd>cnext<CR>

"Trigger completions
inoremap <c-space> <c-x><c-o>

"Load the omnifunc for completions
augroup lspomni
    autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd Filetype sh setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd Filetype dockerfile setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd Filetype go setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd Filetype json setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd Filetype vim setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd Filetype lua setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup end

""""""""""
"Vimspector
nmap <F9> <Plug>VimspectorContinue
nmap <F5> <Plug>VimspectorContinue
command! DebugRun :execute "normal \<Plug>VimspectorContinue"
nmap <leader>dr <cmd>DebugRun<cr>

nmap <S-F2> <Plug>VimspectorStop
command! DebugStop :execute "normal \<Plug>VimspectorStop"
command! DebugRestart :execute "normal \<Plug>VimspectorRestart"
command! DebugPause :execute "normal \<Plug>VimspectorPause"

nmap <C-F8> <Plug>VimspectorToggleBreakpoint
command! DebugBreakpoint :execute "normal \<Plug>VimspectorToggleBreakpoint"
nmap <leader>db <cmd>DebugBreakpoint<cr>

nmap <F8> <Plug>VimspectorStepOver
command! DebugStepOver :execute "normal \<Plug>VimspectorStepOver"
nmap <leader>ds <cmd>DebugStepOver<cr>

nmap <F7> <Plug>VimspectorStepInto
command! DebugStepInto :execute "normal \<Plug>VimspectorStepInto"
nmap <leader>do <cmd>DebugStepInto<cr>

nmap <S-F8> <Plug>VimspectorStepOut
command! DebugStepOut :execute "normal \<Plug>VimspectorStepOut"
nmap <leader>do <cmd>DebugStepOut<cr>

" command! DebugReset <cmd>VimspectorReset<cr>
" nmap <leader>dd <cmd>DebugReset<cr>


""""""""""
"Deoplete
let g:deoplete#enable_at_startup = 1
set completeopt=noinsert,menuone,noselect
" call deoplete#custom#option('omni_patterns', {
"             \ 'python': ['[^. *\t]\.\w*']
"             \})
