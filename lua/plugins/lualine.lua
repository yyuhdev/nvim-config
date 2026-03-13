return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    lazy = false,
    keys = {
      { '<leader>e', ':Neotree toggle<CR>', desc = 'Toggle Neo-tree', silent = true },
    },
    opts = {
      filesystem = {
        window = {
          popup = {
            position = { col = '100%', row = '2' },
            size = function(state)
              local root_name = vim.fn.fnamemodify(state.path, ':~')
              local root_len = string.len(root_name) + 4
              return {
                width = math.max(root_len, 50),
                height = vim.o.lines - 6,
              }
            end,
          },
        },
      },
    },
  },
}
