return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                'saghen/blink.cmp',
                dependencies = {
                    'rafamadriz/friendly-snippets',
                },
                opts = {},
            },
        },
        opts = {
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { 'vim' },
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                            telemetry = {
                                enable = false,
                            },
                        },
                    },
                },
                ts_ls = {
                    javascript = {
                        implicitProjectConfig = {
                            checkJs = false,
                        },
                    },
                },
                prismals = {
                    prisma = {
                        prismaFmtBinPath = ""
                    }
                },
            },
        },
        config = function(_, opts)
            local blink = require('blink.cmp')
            local lspconfig = require('lspconfig')

            local on_attach = function(_, bufnr)
                local set_keymap = function(mode, keymap, action, description)
                    vim.keymap.set(mode, keymap, action, { buffer = bufnr, desc = description })
                end

                set_keymap('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
                set_keymap('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
                set_keymap('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
                set_keymap('n', 'gr', vim.lsp.buf.references, 'Go to references')
                set_keymap('n', 'K', vim.lsp.buf.hover, 'Show docs')
                set_keymap('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature help')
                set_keymap('n', '<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
                set_keymap('n', '<leader>ca', vim.lsp.buf.code_action, 'Code action')
                set_keymap('n', '<leader>e', vim.diagnostic.open_float, 'Show diagnostics')
                set_keymap('n', '[d', function() vim.diagnostic.jump({ float = true, count = -1 }) end, 'Previous diagnostic')
                set_keymap('n', ']d', function() vim.diagnostic.jump({ float = true, count = 1 }) end, 'Next diagnostic')
            end

            for server, config in pairs(opts.servers) do
                config.capabilities = blink.get_lsp_capabilities(config.capabilities)
                config.on_attach = on_attach
                lspconfig[server].setup(config)
            end
        end
    }
}
