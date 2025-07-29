return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = {},
        keys = {
            {
                '<leader>tf',
                '<CMD>ToggleTerm direction=float<CR>',
                desc = 'Toggle floating terminal',
            },
            {
                '<leader>tt',
                function()
                    require("toggleterm.terminal").Terminal
                    :new({ direction = "tab", hidden = true })
                    :toggle()
                end,
                desc = 'Toggle tab terminal',
            },
            {
                '<leader>th',
                '<CMD>ToggleTerm size=15 direction=horizontal<CR>',
                desc = 'Toggle horizontal terminal',
            },
            {
                '<leader>tv',
                '<CMD>ToggleTerm size=40 direction=vertical<CR>',
                desc = 'Toggle vertical terminal',
            },
            {
                '<leader>g',
                function ()
                    local Terminal = require('toggleterm.terminal').Terminal
                    local lazygit = Terminal:new({
                        cmd = 'lazygit',
                        hidden = true,
                        direction = 'float',
                        float_opts = {
                            border = 'curved',
                        },
                        on_open = function ()
                            vim.cmd('startinsert')
                        end
                    })

                    lazygit:toggle()
                end,
                {
                    desc = 'Toggle lazygit floating terminal',
                    noremap = true,
                    silent = true,
                },
                desc = 'Toggle floating lazy git terminal',
            },
        },
    }
}
