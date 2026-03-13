return {
  'laytan/cloak.nvim',
  config = function()
    require('cloak').setup {
      enabled = true,
      cloak_character = '*',
      highlight_group = 'Comment',
      patterns = {
        {
          file_pattern = {
            '-secret.yml',
            '-secret.yaml',
            '*secret*.yml',
            '*secret*.yaml',
            '.env*',
            'wrangler.toml',
            '.dev.vars',
          },
          cloak_pattern = { '=.+', ':.+' },
        },
      },
    }
  end,
}
