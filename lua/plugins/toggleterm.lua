return {
  'akinsho/toggleterm.nvim',
  cmd = 'ToggleTerm',
  config = function()
    require('toggleterm').setup {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = true,
      direction = 'float',
      close_on_exit = false,
      float_opts = {
        border = 'curved',
        winblend = 0,
      },
    }

    vim.keymap.set('n', '<leader>ft', '<cmd>ToggleTerm<CR>', { desc = 'Toggle floating terminal' })

    vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
  end,
}
