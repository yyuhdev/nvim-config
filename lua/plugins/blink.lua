return {
  "saghen/blink.cmp",
  version = "*",
  opts = {
    keymap = {
      preset = "none",
      ["<Tab>"]    = { "accept", "fallback" },
      ["<C-e>"]   = { "cancel" },
      ["<C-d>"]   = { "scroll_documentation_down" },
      ["<C-u>"]   = { "scroll_documentation_up" },
    },
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
      },
    },
  },
}
