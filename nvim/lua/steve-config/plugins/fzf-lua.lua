return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional but nice
  },
  config = function()
    local fzf = require("fzf-lua")

    fzf.setup({
      -- keep defaults for now; we’ll tune later
      winopts = {
        preview = {
          layout = "vertical",
          vertical = "up:60%",
        },
      },
    })
  end,
}

