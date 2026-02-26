return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "BufReadPre",
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        numbers = "ordinal",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        separator_style = "thin",
      },
    })
  end,
}
