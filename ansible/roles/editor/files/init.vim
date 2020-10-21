call plug#begin('~/.config/nvim/plugged')
"Tabnine
Plug 'aca/completion-tabnine', { 'do': './install.sh' }

"Auto pair
Plug 'jiangmiao/auto-pairs'

"Surround
Plug 'tpope/vim-surround'

"Yaml
Plug 'stephpy/vim-yaml'

"Completion
Plug 'nvim-lua/completion-nvim'

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
" Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

"Diagnostic
Plug 'nvim-lua/diagnostic-nvim'

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
Plug 'neovim/nvim-lspconfig'

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

"scratch
Plug 'mtth/scratch.vim'

"Taboo
Plug 'gcmt/taboo.vim'

"Toml
Plug 'cespare/vim-toml'

"Vimspector (DAP)
Plug 'puremourning/vimspector'

"UUID
Plug 'kburdett/vim-nuuid'

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
"Neovim LSP

lua << EOF
--pyls
local nvim_lsp = require'nvim_lsp'
nvim_lsp.pyls.setup{
    root_dir = nvim_lsp.util.root_pattern('.git');
    settings = {
        pyls = {
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

--yamlls
require'nvim_lsp'.yamlls.setup{
    settings = {
        yaml = {
            schemas = {
                ['/home/jenifael/src/work/micropackages/_schemas/app_config.schema.json'] = "/*_config.yml",
            };
            schemaStore = {
                enable = false
            }
        }
    }
}
EOF


"Utilities
nnoremap <leader>lss <cmd>lua print(vim.inspect(vim.lsp.buf_get_clients()))<CR>
nnoremap <leader>lsa <cmd>lua print(vim.inspect(vim.lsp.get_active_clients()))<CR>
nnoremap <leader>lsr <cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>
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
nnoremap <silent> [g <cmd>NextDiagnosticCycle<CR>
nnoremap <silent> ]g <cmd>PrevDiagnosticCycle<CR>

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
    autocmd Filetype yaml setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup end

"Completion configuration
lua << EOF
local on_attach_vim = function(client)
  require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)
end
require'nvim_lsp'.pyls.setup{on_attach=on_attach_vim}
EOF
set shortmess+=c
let g:completion_sorting = "none"
let g:completion_matching_strategy_list = ['fuzzy', 'all']
let g:completion_chain_complete_list = [
            \{'complete_items': ['tabnine', 'lsp', 'snippet']},
            \{'mode': '<c-p>'},
            \{'mode': '<c-n>'}
\]
let g:completion_tabnine_priority = 1
let g:completion_tabnine_sort_by_details = 1

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
" let g:deoplete#enable_at_startup = 1
" set completeopt=noinsert,menuone,noselect
" call deoplete#custom#option('omni_patterns', {
"             \ 'python': ['[^. *\t]\.\w*']
"             \})
" call deoplete#custom#var('tabnine', {
"             \ 'line_limit': 500,
"             \ 'max_num_results': 20,
"             \})
