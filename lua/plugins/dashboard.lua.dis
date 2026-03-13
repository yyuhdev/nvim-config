return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-web-devicons" },
  config = function()
    local db = require("dashboard")

    db.setup({
      theme = "doom",
      hide = {
        statusline = true,
        tabline    = true,
        winbar     = true,
      },
      config = {
        header = vim.split([[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

        ]], "\n"),
        center = {
          { icon = "  ", key = "n", desc = "New File",        action = "enew" },
          { icon = "  ", key = "f", desc = "Find File",       action = "Telescope find_files" },
          { icon = "  ", key = "r", desc = "Recent Files",   action = "Telescope oldfiles" },
          { icon = "  ", key = "g", desc = "Live Grep",      action = "Telescope live_grep" },
          { icon = "  ", key = "q", desc = "Quit",           action = "qa" },
        },
        footer = function()
          local stats = require("lazy").stats()
          return { "⚡ " .. stats.loaded .. "/" .. stats.count .. " plugins loaded" }
        end,
      },
    })

    local groups = {
      DashboardHeader    = "Special",
      DashboardCenter    = "Identifier",
      DashboardIcon      = "Statement",
      DashboardDesc      = "Statement",
      DashboardKey       = "Keyword",
      DashboardFooter    = "Function",
      DashboardShotCut   = "Title",
      DashboardShortCut  = "Title",
    }

    for group, color in pairs(groups) do
      vim.api.nvim_set_hl(0, group, { link = color })
    end
  end,
}
