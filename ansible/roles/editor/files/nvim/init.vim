"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configurations (plug.vim)

call plug#begin('~/.config/nvim/plugged')
" Surround
Plug 'tpope/vim-surround'

" Yaml
Plug 'stephpy/vim-yaml'

" Completion
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'LumaKernel/ddc-file'
Plug 'Shougo/ddc-around'
Plug 'tani/ddc-fuzzy'
Plug 'Shougo/ddc-nvim-lsp'

" Commentary
Plug 'tpope/vim-commentary'

" Common Lisp
Plug 'l04m33/vlime', {'rtp': 'vim'}

" Clojure
Plug 'guns/vim-clojure-static'

" Darcula theme
Plug 'blueshirts/darcula'

" Fennel
Plug 'bakpakin/fennel.vim'

" Fireplace
Plug 'tpope/vim-fireplace'

" Fugitive
Plug 'tpope/vim-fugitive'

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://gitlab.com/jenifael.gingras/fzf.vim'

" Gitgutter
Plug 'airblade/vim-gitgutter'

" Jinja
Plug 'lepture/vim-jinja'

" Json
Plug 'elzr/vim-json'

" Neovim Lsp Config
Plug 'neovim/nvim-lspconfig'

" Paredit
Plug 'vim-scripts/paredit.vim'

" Powershell
Plug 'PProvost/vim-ps1'

" Pum
Plug 'Shougo/pum.vim'

" Sexp
Plug 'guns/vim-sexp'

" Sudo Edit
Plug 'chrisbra/SudoEdit.vim'

" Snippet
Plug 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet-snippets'

" Rainbow parentheses
Plug 'luochen1990/rainbow'

" Repl integration
Plug 'hkupty/iron.nvim'

" Rust
Plug 'rust-lang/rust.vim'

" Scratch
Plug 'mtth/scratch.vim'

" Taboo
Plug 'gcmt/taboo.vim'

" Toml
Plug 'cespare/vim-toml'

" UUID
Plug 'kburdett/vim-nuuid'

" Unimpaired
Plug 'tpope/vim-unimpaired'

" Plug
Plug 'junegunn/vim-plug'

" Better status line
Plug 'vim-airline/vim-airline'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
syntax on
filetype plugin indent on

luafile $HOME/.config/nvim/plugins.lua
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
set splitright


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get rid of backup file
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation management
set expandtab
set smarttab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search options
set ignorecase
set smartcase
set hlsearch
set showmatch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make utf8 and unix the default
set encoding=utf8
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping
let mapleader = ","
noremap <leader>ev :e $HOME/.config/nvim/init.vim<cr>
noremap <leader>el :e $HOME/.config/nvim/plugins.lua<cr>
noremap <leader>rv :source $MYVIMRC<cr>
nnoremap <leader><leader>s :%s/\s+$//ge \| noh <cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommand
augroup vimrc
    au!
    au BufRead *.yml :setf ansible
    au BufRead Jenkinsfile :setf groovy
augroup end


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
set background=dark
colorscheme darcula


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
let g:airline_powerline_fonts = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commentary
nnoremap <c-m> :Commentary<cr>
vnoremap <c-m> :Commentary<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fzf
nnoremap <C-p> :Files<cr>
nnoremap <C-e> :History<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Taboo
set sessionoptions+=tabpages,globals


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbow
let g:rainbow_active = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Something try desperately to make vim file auto comment new line...
autocmd FileType vim setlocal formatoptions-=c formatoptions-=r formatoptions-=o


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autopairs
let g:AutoPairsCenterLine = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neovim LSP

" Utilities
nnoremap <leader>lss <cmd>lua print(vim.inspect(vim.lsp.buf_get_clients()))<CR>
nnoremap <leader>lsa <cmd>lua print(vim.inspect(vim.lsp.get_active_clients()))<CR>
nnoremap <leader>lsr <cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>
nnoremap <leader>lsc <cmd>verbose set omnifunc?<CR>
nnoremap <leader>lsd <cmd>lua vim.lsp.diagnostic.clear(vim.api.nvim_eval("bufnr('%')"))<CR>

" Declaration, definition, implementation, references
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>lsp <cmd>lua vim.lsp.buf.peek_definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR><cmd>cwindow 5<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.util.buf_clear_references()<CR>

" Hover, signature, formatting
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
inoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <s-l> <cmd>lua vim.lsp.buf.formatting()<CR>

" Previous|Next Error (quickfix)
nnoremap <silent> ]g <cmd>vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> [g <cmd>vim.lsp.diagnostic.goto_next()<CR>

" Trigger completions
inoremap <c-space> <c-x><c-o>

" Load the omnifunc for completions
augroup lspomni
    autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd Filetype sh setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd Filetype dockerfile setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd Filetype go setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd Filetype json setlocal omnifunc=v:lua.vim.lsp.omnifunc
    " autocmd Filetype vim setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd Filetype lua setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd Filetype yaml setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup end


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimspector
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REPL
let g:iron_map_defaults = 0
let g:iron_map_extended = 0
nmap <leader>rr :IronRepl<cr>
nmap <leader>rf :IronFocus<cr>
nmap <leader>rs <Plug>(iron-send-line)
nmap <leader>rm <Plug>(iron-send-motion)
nmap <leader>rl <Plug>(iron-clear)
vmap <leader>rs <Plug>(iron-visual-send)
nmap <leader>ri mm<leader>(<Plug>(iron-send-motion)%`m
nmap <leader>rd mm[[<Plug>(iron-send-motion)]]`m
nmap <leader>rcc <Plug>(iron-interrupt)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" S-EXP
let g:sexp_enable_insert_mode_mappings = 0
nmap <leader>( <Plug>(sexp_move_to_prev_top_element)
nmap <leader>) <Plug>(sexp_move_to_next_top_element)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DDC
call ddc#custom#patch_global('sources', ['nvim-lsp', 'file', 'around', 'deoppet'])
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sourceOptions', {
  \   '_': {
  \     'matchers': ['matcher_fuzzy'],
  \     'sorters': ['sorter_fuzzy'],
  \     'converters': ['converter_fuzzy']
  \   },
  \   'nvim-lsp': {
  \     'mark': 'lsp',
  \     'forceCompletionPattern': '\.\w*|:\w*|->\w*'
  \   },
  \  'deoppet': {'dup': v:true, 'mark': 'dp'},
  \ })
call ddc#enable()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pum
inoremap <c-n> <cmd>call pum#map#insert_relative(+1)<cr>
inoremap <c-p> <cmd>call pum#map#insert_relative(-1)<cr>
inoremap <c-e> <cmd>call pum#map#confirm()<cr>
inoremap <c-y> <cmd>call pum#map#cancel()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoppet
call deoppet#initialize()
call deoppet#custom#option('snippets', map(globpath(&runtimepath, 'neosnippets', 1, 1), { _, val -> { 'path': val } }))
imap <c-k> <Plug>(deoppet_expand)
imap <c-f> <Plug>(deoppet_jump_forward)
imap <c-b> <Plug>(deoppet_jump_backward)
smap <c-f> <Plug>(deoppet_jump_forward)
smap <c-b> <Plug>(deoppet_jump_backward)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Denops
let g:denops#debug = 1
