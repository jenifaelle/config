--Tree-sitter
-- require'nvim-treesitter.configs'.setup {
--     ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
--     -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
--     highlight = {
--         enable = true,              -- false will disable the whole extension
--         -- disable = { "c", "rust" },  -- list of language that will be disabled
--     },
-- }

--------------------------------------------------------------------------------
--Repl
local iron = require('iron')
iron.core.set_config {
    preferred = {
        python = "ptipython",
    },
    memory_management = "singleton",
    repl_open_cmd = "vsplit"
}

--------------------------------------------------------------------------------
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

--------------------------------------------------------------------------------
-- Treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    sync_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlight = false,
    },
}

--------------------------------------------------------------------------------
-- Telescope
require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
}
require('telescope').load_extension('fzf')

--------------------------------------------------------------------------------
-- DAP

-- Go (delve)
require('dap-go').setup()

-- Python (debugpy)
require('dap-python').setup('~/.pyenv/shims/python')
require('dap-python').test_runner = 'pytest'

-- Virtual text
require('nvim-dap-virtual-text').setup()

-- UI
require("dapui").setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
    },
    sidebar = {
        -- You can change the order of elements in the sidebar
        elements = {
            -- Provide as ID strings or tables with "id" and "size" keys
            {
                id = "scopes",
                size = 0.25, -- Can be float or integer > 1
            },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 00.25 },
        },
        size = 40,
        position = "right", -- Can be "left", "right", "top", "bottom"
    },
    tray = {
        elements = { "repl" },
        size = 10,
        position = "bottom", -- Can be "left", "right", "top", "bottom"
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
})
