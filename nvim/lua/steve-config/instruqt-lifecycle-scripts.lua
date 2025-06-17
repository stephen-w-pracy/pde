vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = { "setup-*", "cleanup-*", "check-*", "solve-*" },
  callback = function()
    vim.bo.filetype = "bash"
  end
})

-- Alternatively, add `# -*- mode:sh; coding: utf-8 -*-` to the top of 
-- extensionless shell scripts.
