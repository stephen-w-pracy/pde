return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufRead",
    config = function()
        require("nvim-treesitter.configs").setup {
            highlight = { enable = true },
            indent = { 
              enable = true,
              disable = { "markdown"},
            }
        }
    end
}

