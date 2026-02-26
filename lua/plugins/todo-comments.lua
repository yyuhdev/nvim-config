return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufReadPre",
  opts = {
    signs = true,
    highlight = {
      keyword = "bg",
      after = "fg",
    },
  },
  keys = {
    { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo List (Trouble)" },
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next TODO" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev TODO" },
  },
}
