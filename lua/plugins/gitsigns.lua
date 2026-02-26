return {
  {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",  -- lazy-load on buffer read
  opts = {
    signs = {
      add          = { text = "│" },
      change       = { text = "│" },
      delete       = { text = "_" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
    },
    numhl = false,
    linehl = false,
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 500,
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      vim.keymap.set("n", "]c", gs.next_hunk, { buffer = bufnr, desc = "Next Git hunk" })
      vim.keymap.set("n", "[c", gs.prev_hunk, { buffer = bufnr, desc = "Prev Git hunk" })
      vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr, desc = "Stage Hunk" })
      vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr, desc = "Reset Hunk" })
    end,
  }
}
}
