-- https://neovim.io/doc/user/pi_netrw.html#g%3Anetrw_liststyle 
vim.g.netrw_liststyle = 3

-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- wrap
vim.opt.wrap = false

-- tabs & indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- clipboard settings
vim.opt.clipboard:append('unnamedplus')
-- ^ this SHOULD set the system clipboard as default

-- window splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- cursor line
vim.opt.cursorline = true

vim.opt.background = 'dark'
