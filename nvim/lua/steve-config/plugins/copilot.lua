-- File: plugins/copilot.lua
-- Purpose: Declare and configure the Copilot plugin

return {
  {"github/copilot.vim",
  dependencies = {
    -- We depend on cmp-nvim-lsp so we can set up autocompletion capabilities
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
  end,
  },
  {"panozzaj/vim-copilot-ignore",
    config = function()
    end,
  }
}

