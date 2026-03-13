vim.g.mapleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

vim.opt.number = true

vim.opt.relativenumber = true

vim.opt.statuscolumn = '%=%{v:relnum?v:relnum:v:lnum} ▏ '

vim.opt.cursorline = true

vim.opt.expandtab = true

vim.opt.tabstop = 2

vim.opt.cmdheight = 0

vim.opt.shiftwidth = 2

vim.opt.softtabstop = 2

vim.opt.smartindent = true

vim.opt.clipboard = 'unnamedplus'

vim.o.signcolumn = 'yes'

vim.opt.list = true
vim.opt.listchars = { trail = '·', tab = '→ ' }

vim.keymap.set('n', '<leader>t', function()
  vim.cmd 'enew'
  vim.cmd 'terminal'
end, { desc = 'New terminal buffer' })

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

require('lazy').setup {
  { import = 'plugins' },
}

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('LspFormat', { clear = true }),
  callback = function(event)
    local buf = event.buf
    local clients = vim.lsp.get_active_clients { bufnr = buf }
    for _, client in ipairs(clients) do
      if client.supports_method 'textDocument/formatting' then vim.lsp.buf.format { bufnr = buf, async = false } end
    end
  end,
})

vim.api.nvim_set_keymap('n', '<A-l>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-h>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<A-h>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })

vim.diagnostic.config {
  virtual_text = {
    prefix = '',
    spacing = 2,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
}

require 'config.lsp'
