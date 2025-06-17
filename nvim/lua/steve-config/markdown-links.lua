-- Wraps selected text in a markdown link using the URL from the clipboard.
-- Currently broken
vim.keymap.set("v", "<leader>m", function()
  local url = vim.fn.getreg("+")
  print("Clipboard URL: " .. url)

  local mode = vim.fn.visualmode()
  print("Visual mode: " .. mode)

  vim.cmd('normal! "vy')
  local selected_text = vim.fn.getreg('v')
  print("Selected text: " .. selected_text)

  vim.fn.setreg('v', '')

  local markdown_link = "[" .. selected_text .. "](" .. url .. ")"
  print("Final markdown: " .. markdown_link)

  vim.api.nvim_feedkeys("c" .. markdown_link, mode == "V" and "x" or "n", true)
end, { desc = "Wrap selection in markdown link using clipboard URL" })

