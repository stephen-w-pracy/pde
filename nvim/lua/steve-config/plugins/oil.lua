return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional for icons
    config = function()
      require("oil").setup({
        -- See :help oil-setup for config details
        -- e.g., columns = { "icon" },
        columns = { "size", "mtime", "icon"  }, 
        -- keymaps, etc.
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = true,
          -- This function defines what is considered a "hidden" file
          is_hidden_file = function(name, bufnr)
            return name:match("^%.") ~= nil
          end,
          -- This function defines what will never be shown, even when `show_hidden` is set
          is_always_hidden = function(name, bufnr)
            return false
          end,
        },
      })

      -- Example keymap (moved outside of setup())
      vim.keymap.set("n", "<leader>o", require("oil").open, { desc = "Open parent directory" })
    end,
  },
  -- other plugins...
}

