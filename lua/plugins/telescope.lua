return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
        },
        sorting_strategy = "ascending",
        winblend = 0,
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    telescope.load_extension("fzf")

    vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "find files" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep,   { desc = "live grep" })
    vim.keymap.set("n", "<leader>sb", builtin.buffers,     { desc = "buffers" })
  end,
}
