return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 300,
          ignore_whitespace = true,
        },
        preview_config = {
          border = "rounded", -- options: "none", "single", "double", "rounded", "solid", "shadow"
          row = 1,
          col = 1,
          style = "minimal",
        },
      })

      -- Custom commands
      vim.api.nvim_create_user_command('Gb', function()
        require('gitsigns').toggle_current_line_blame()
      end, {})

      vim.api.nvim_create_user_command('Gbf', function()
        require('gitsigns').blame_line({ full = true })
      end, {})
    end
  },
}
