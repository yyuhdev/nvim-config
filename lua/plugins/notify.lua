return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    local notify = require("notify")

    notify.setup({
      top_down = false,
      render = "wrapped-compact",
      stages = "static",
      timeout = 1500,
      minimum_width = 30,
      max_width = function() return math.floor(vim.o.columns * 0.25) end,
      max_height = function() return math.floor(vim.o.lines * 0.4) end,
      icons = {
        ERROR = " ",
        WARN  = " ",
        INFO  = " ",
        DEBUG = " ",
        TRACE = "✎ ",
      },
    })

    vim.notify = notify
    vim.notify("Test", "info")
  end,
}
