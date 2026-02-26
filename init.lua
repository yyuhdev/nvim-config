vim.g.mapleader = ' '

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.number = true

vim.opt.relativenumber = true

vim.opt.cursorline = true

vim.opt.expandtab = true

vim.opt.tabstop = 2

vim.opt.cmdheight = 0

vim.opt.shiftwidth = 2

vim.opt.softtabstop = 2

vim.opt.smartindent = true

vim.opt.clipboard = "unnamedplus"

vim.o.signcolumn = "yes"

require('lazy').setup({
  { import = 'plugins' },
})

vim.api.nvim_set_keymap('n', '<A-l>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-h>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<A-h>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })

require("config.lsp")
