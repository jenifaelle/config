"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configurations (plug.vim)

call plug#begin('~/.config/nvim/plugged')
" Plug (self-managed)
Plug 'junegunn/vim-plug'

" Deps of other plugins
Plug 'nvim-lua/plenary.nvim' " via Telescope, Gitsigns
Plug 'vim-denops/denops.vim' " via ddc

" Airline
Plug 'vim-airline/vim-airline'

" Commentary
Plug 'tpope/vim-commentary'

" DAP
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'mfussenegger/nvim-dap-python'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

" Darcula theme
Plug 'blueshirts/darcula'

" DDC (completion)
Plug 'Shougo/ddc.vim'
Plug 'LumaKernel/ddc-file'
Plug 'Shougo/ddc-around'
Plug 'tani/ddc-fuzzy'
Plug 'Shougo/ddc-nvim-lsp'
Plug 'https://gitlab.com/jenifael.gingras/ddc-zettelkasten.git'
Plug 'Shougo/pum.vim'

" Devicons
Plug 'kyazdani42/nvim-web-devicons'

" Fugitive
Plug 'tpope/vim-fugitive'

" Gitsigns
Plug 'lewis6991/gitsigns.nvim'

" Neovim Lsp Config
Plug 'neovim/nvim-lspconfig'

" Iron (repl)
Plug 'https://gitlab.com/jenifael.gingras/iron.nvim.git'

" Snippet
Plug 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet-snippets'
Plug 'https://gitlab.com/jenifael.gingras/nvim-snippets.git'

" Taboo
Plug 'gcmt/taboo.vim'

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" UUID
Plug 'kburdett/vim-nuuid'

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
" nnoremap <C-p> :Files<cr>
" nnoremap <C-e> :History<cr>


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
nnoremap <silent> <c-h> <cmd>lua vim.lsp.buf.signature_help()<CR>
inoremap <silent> <c-h> <cmd>lua vim.lsp.buf.signature_help()<CR>
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
call ddc#custom#patch_global('sources', ['nvim-lsp', 'file', 'around', 'deoppet', 'zettelkasten'])
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sourceOptions', {
  \   '_': {
  \     'matchers': ['matcher_fuzzy'],
  \     'sorters': ['sorter_fuzzy'],
  \     'converters': ['converter_fuzzy']
  \   },
  \   'nvim-lsp': {
  \     'mark': 'LSP',
  \     'forceCompletionPattern': '\.\w*|:\w*|->\w*'
  \   },
  \  'deoppet': {'dup': v:true, 'mark': 'DP'},
  \  'zettelkasten': {'mark': 'ZK', 'forceCompletionPattern': '\[\[w*'},
  \ })
call ddc#custom#patch_global('sourceParams', {
  \  'zettelkasten': {'zettelpath': $HOME . '/Nextcloud/Documents/Zettelkasten'},
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
" let g:denops#debug = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treesitter
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Telescope
nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <c-e> <cmd>Telescope buffers<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>ff <cmd>Telescope file_browser<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Zettelkasten
command ZetSearch :lua require('telescope.builtin').find_files({cwd = "~/Nextcloud/Documents/Zettelkasten"})

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DAP
vnoremap <silent> <F3> <cmd>lua require'dapui'.eval()<cr>
nnoremap <silent> <F4> :lua require'dapui'.open()<cr>
nnoremap <silent> <F5> :lua require'dap'.continue()<cr>
nnoremap <silent> <F6> :lua require'dapui'.close()<cr>
nnoremap <silent> <F8> :lua require'dap'.toggle_breakpoint()<cr>
nnoremap <silent> <F10> :lua require'dap'.step_over()<cr>
nnoremap <silent> <F11> :lua require'dap'.step_into()<cr>
nnoremap <silent> <F12> :lua require'dap'.step_out()<cr>
