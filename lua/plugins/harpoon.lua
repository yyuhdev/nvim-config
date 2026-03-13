return {
  'ThePrimeagen/harpoon',
  keys = {
    { '<leader>ha', function() require('harpoon.mark').add_file() end, desc = 'Harpoon Add File' },
    { '<leader>hh', function() require('harpoon.ui').toggle_quick_menu() end, desc = 'Harpoon Quick Menu' },
    { '<leader>h1', function() require('harpoon.ui').nav_file(1) end, desc = 'Harpoon Go To 1' },
    { '<leader>h2', function() require('harpoon.ui').nav_file(2) end, desc = 'Harpoon Go To 2' },
    { '<leader>h3', function() require('harpoon.ui').nav_file(3) end, desc = 'Harpoon Go To 3' },
    { '<leader>h4', function() require('harpoon.ui').nav_file(4) end, desc = 'Harpoon Go To 4' },
  },
  config = function()
    require('harpoon').setup {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 10,
      },
    }
  end,
}
