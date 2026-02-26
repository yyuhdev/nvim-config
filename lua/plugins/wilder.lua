return {
  "gelguy/wilder.nvim",
  event = "CmdlineEnter",
  config = function()
    local wilder = require("wilder")
    wilder.setup({ modes = { ":", "/", "?" } })

    wilder.set_option("pipeline", {
      wilder.branch(
        wilder.cmdline_pipeline({
          fuzzy = 1,
          use_python = 0,
        }),
        wilder.vim_search_pipeline()
      ),
    })

    wilder.set_option(
      "renderer",
      wilder.popupmenu_renderer({
        highlighter = wilder.basic_highlighter(),
        left = { " ", wilder.popupmenu_devicons() },
        right = { " ", wilder.popupmenu_scrollbar() },
        max_height = 10,
        min_height = 3,
      })
    )
  end,
}
