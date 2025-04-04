-- Override `gx` mapping for opening relative paths in markdown files.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.keymap.set("n", "gx", function()
      local filename = vim.fn.expand("<cfile>")

      -- URL? Open it directly.
      if filename:match("^https?://") then
        vim.ui.open(filename)
        return
      end

      -- Absolute path? Open it directly.
      if filename:match("^/") and vim.fn.filereadable(filename) == 1 then
        vim.ui.open(filename)
        return
      end

      -- Otherwise resolve relative to buffer directory
      local buf_dir = vim.fn.expand("%:p:h")
      local absolute_path = vim.fn.fnamemodify(buf_dir .. "/" .. filename, ":p")

      if vim.fn.filereadable(absolute_path) == 1 then
        vim.ui.open(absolute_path)
      else
        print("File not found: " .. absolute_path)
      end
    end, { buffer = true, desc = "gx: Open markdown link or relative image" })
  end,
})

