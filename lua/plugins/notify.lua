return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    local notify = require("notify")

    notify.setup({
      top_down = true,
      render = "wrapped-compact",
      stages = "static",
      timeout = 1500,
      minimum_width = 30,
      max_width = function() return math.floor(vim.o.columns * 0.25) end,
      max_height = function() return math.floor(vim.o.lines * 0.4) end,
      icons = {
        ERROR = "",
        WARN  = "",
        INFO  = "",
        DEBUG = "",
        TRACE = "",
      },
    })

    local colors = require("catppuccin.palettes").get_palette("mocha")

    vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = colors.red })
    vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = colors.yellow })
    vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = colors.sky })
    vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = colors.mauve })
    vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = colors.peach })

    vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = colors.red })
    vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = colors.yellow })
    vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = colors.sky })
    vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = colors.mauve })
    vim.api.nvim_set_hl(0, "NotifyTRACETitle", { fg = colors.peach })

    vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = colors.red })
    vim.api.nvim_set_hl(0, "NotifyWARNIcon", { fg = colors.yellow })
    vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = colors.sky })
    vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { fg = colors.mauve })
    vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { fg = colors.peach })

    vim.api.nvim_set_hl(0, "NotifyERRORBody", { fg = colors.text })
    vim.api.nvim_set_hl(0, "NotifyWARNBody", { fg = colors.text })
    vim.api.nvim_set_hl(0, "NotifyINFOBody", { fg = colors.text })
    vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { fg = colors.text })
    vim.api.nvim_set_hl(0, "NotifyTRACEBody", { fg = colors.text })

    vim.notify = notify
  end,
}
