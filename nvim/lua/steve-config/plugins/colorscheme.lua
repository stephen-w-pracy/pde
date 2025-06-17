return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nightfox").setup({
      options = {
        transparent = true,
      },
      groups = {
        all = {
          ["@markup.quote"] = { fg = "#999999", style = "italic" },
        },
      },
    })

    vim.cmd("colorscheme nightfox")
  end,
}
