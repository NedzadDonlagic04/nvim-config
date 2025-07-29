vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.wildignore:append({ '*.o', '*.obj', '*.pyc', '*.class', '*.jar' })

vim.keymap.set('n', '<ESC>', ':noh<CR>', { desc = 'Clear search highlights', silent = true })

vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set('n', '<leader>=', '<C-a>', { desc = 'Increment number' })
vim.keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })

vim.keymap.set('n', 'Y', 'y$', { desc = 'Yank to end of the line' })
vim.keymap.set({'n', 'v'}, '<leader>d', '"_d', { desc = 'Delete without yanking' })
vim.keymap.set('n', 'J', 'maJ`a', { desc = 'Join lines while keeping cursor pos' })

vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selected line down' })
vim.keymap.set('v', '<A-k>', ":m '>-2<CR>gv=gv", { desc = 'Move selected line up' })

vim.keymap.set('t', '<ESC><ESC>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<A-h>', ':tabprevious<CR>', { desc = 'Move to previous tab' })
vim.keymap.set('n', '<A-l>', ':tabnext<CR>', { desc = 'Move to next tab' })

local augroup = vim.api.nvim_create_augroup('UserConfig', {})

vim.api.nvim_create_autocmd('TextYankPost', {
    group = augroup,
    callback = function()
        vim.highlight.on_yank()
    end
})

vim.api.nvim_create_autocmd('BufReadPost', {
    group = augroup,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local line_count = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= line_count then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end
})
