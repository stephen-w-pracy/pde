return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufRead",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "bash",
                "css",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "python",
                "typescript",
            },
            highlight = { 
              enable = true,
              additional_vim_regex_highlighting = { "markdown" },
            },
            indent = { 
              enable = true,
              disable = { "markdown"},
            }
        }
    end
}

