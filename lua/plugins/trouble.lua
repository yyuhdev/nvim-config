return {
  "folke/trouble.nvim",
  dependencies = { "nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    modes = {
      diagnostics = {
        auto_open = false,
        auto_close = true,
      },
    },
  },
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
    { "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List" },
  },
}
