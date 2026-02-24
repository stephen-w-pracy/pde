return {
  "dhruvasagar/vim-table-mode",
  ft = { "markdown", "text" }, -- only load for these filetypes
  keys = {
    { "<leader>tm", "<cmd>TableModeToggle<cr>", desc = "Toggle Table Mode" },
  },
  init = function()
    -- Optional: auto-align on write
    vim.g.table_mode_always_active = 0
    vim.g.table_mode_corner = "|"
  end,
}

