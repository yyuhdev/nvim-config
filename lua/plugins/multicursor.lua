return {
  {
    'mg979/vim-visual-multi',
    branch = 'master',

    init = function() vim.g.VM_default_mappings = 0 end,

    keys = {
      {
        '<C-j>',
        '<Plug>(VM-Add-Cursor-Down)',
        mode = { 'n', 'x' },
        desc = 'Add cursor down',
      },
      {
        '<C-k>',
        '<Plug>(VM-Add-Cursor-Up)',
        mode = { 'n', 'x' },
        desc = 'Add cursor up',
      },
    },
  },
}
