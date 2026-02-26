return {
  "windwp/nvim-autopairs",
  event = "InsertEnter", 
  config = function()
    local npairs = require("nvim-autopairs")

    npairs.setup({
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
      },
      disable_filetype = { "TelescopePrompt", "vim" },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub("[%'%)%>%]%)%}]", "%p", "%%%0"),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
    })

    local ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
    if ok then
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  end,
}
