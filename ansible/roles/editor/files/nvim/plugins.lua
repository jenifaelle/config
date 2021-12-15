--Tree-sitter
-- require'nvim-treesitter.configs'.setup {
--     ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
--     -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
--     highlight = {
--         enable = true,              -- false will disable the whole extension
--         -- disable = { "c", "rust" },  -- list of language that will be disabled
--     },
-- }

------
--Repl
local iron = require('iron')
iron.core.set_config {
    preferred = {
        python = "ptipython"
    },
    memory_management = "singleton",
    repl_open_cmd = "vsplit"
}

--------------------
--LSP client configs
--pyls
local nvim_lsp = require'lspconfig'
nvim_lsp.pylsp.setup{}

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

--lua
nvim_lsp.sumneko_lua.setup{
    cmd = {"/usr/local/bin/lua-language-server"};
}

--yamlls
require'lspconfig'.yamlls.setup{
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

--vimls
require'lspconfig'.vimls.setup{}

--tsserver
require'lspconfig'.tsserver.setup{}

--ansiblels
require'lspconfig'.ansiblels.setup{}
