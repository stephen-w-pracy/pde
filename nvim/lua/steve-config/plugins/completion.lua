-- File: plugins/completion.lua
-- Purpose: Declare and configure nvim-cmp and snippet engine.

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- Snippet engine (LuaSnip in this example)
    "L3MON4D3/LuaSnip",
    -- Source for nvim-cmp to use LuaSnip
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        -- Required for nvim-cmp to know how to expand snippets
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<CR>"]  = cmp.mapping.confirm({ select = true }),
        -- Add more keybindings as desired
      },
      sources = {
        { name = "nvim_lsp" },  -- LSP completions
        { name = "luasnip" },   -- Snippets
        -- { name = "buffer" },  -- Words from current buffer
        -- { name = "path" },    -- File system paths
      },
    })
  end,
}

