vim.keymap.set("i", "jj", "<ESC>", { silent = true, desc = "Exit insert mode with jj" })

-- In insert mode, type the date in the format Tuesday, 2025-03-25
vim.keymap.set("i", "<C-d>", function()
    return os.date("%A, %Y-%m-%d")
end, {
    expr = true,
    silent = true,
    desc = "Insert current date in format Tuesday, 2025-03-25"
})

