-- Normal mode mappings

vim.keymap.set("i", "jj", "<ESC>", { silent = true, desc = "Exit insert mode with jj" })

-- In insert mode, type the date in the format Tuesday, 2025-03-25
vim.keymap.set("i", "<C-d>", function()
    return os.date("%A, %Y-%m-%d")
end, {
    expr = true,
    silent = true,
    desc = "Insert current date in format Tuesday, 2025-03-25"
})

-- fzf-lua
-- Buffers (works anywhere)
vim.keymap.set("n", "<leader>b", "<cmd>FzfLua buffers<CR>", { desc = "Buffers" })

-- Oil-only
vim.keymap.set("n", "<leader>f", function()
  require("steve-config.oil-fzf").files()
end, { desc = "Oil: find files under current dir" })

vim.keymap.set("n", "<leader>g", function()
  require("steve-config.oil-fzf").live_grep()
end, { desc = "Oil: live grep under current dir" })

