local iron = require('iron')

--Repl
iron.core.set_config {
    preferred = {
        python = "ptipython"
    },
    memory_management = "singleton",
    repl_open_cmd = "vsplit"
}

--pyls
local nvim_lsp = require'lspconfig'
nvim_lsp.pyls.setup{}

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
    cmd = {"/usr/bin/lua-language-server"};
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
