return {
    {
        "L3MON4D3/LuaSnip",
        version = "2.*",
        event = "InsertEnter",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local luasnip = require("luasnip")

            require("luasnip.loaders.from_vscode").lazy_load()

            vim.api.nvim_set_keymap("i", "<C-k>", "<cmd>lua require('luasnip').jump(1)<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("s", "<C-k>", "<cmd>lua require('luasnip').jump(1)<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("i", "<C-j>", "<cmd>lua require('luasnip').jump(-1)<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("s", "<C-j>", "<cmd>lua require('luasnip').jump(-1)<CR>", { noremap = true, silent = true })

            vim.api.nvim_set_keymap("i", "<C-l>", "<cmd>lua require('luasnip').change_choice(1)<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("s", "<C-l>", "<cmd>lua require('luasnip').change_choice(1)<CR>", { noremap = true, silent = true })
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
                { name = "luasnip" },
            }))
            return opts
        end,
    },
}
