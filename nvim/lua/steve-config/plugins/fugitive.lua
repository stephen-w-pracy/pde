return {
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gd", ":Gvdiffsplit!<CR>", desc = "Fugitive 3-way diff (ours|base|theirs)" },
      { "<leader>gs", ":Git<CR>", desc = "Fugitive status" },
    },
    config = function()
      -- Set co/ct only when a window is in diff mode
      local grp = vim.api.nvim_create_augroup("FugitiveDiffMaps", { clear = true })
      vim.api.nvim_create_autocmd("BufWinEnter", {
        group = grp,
        callback = function()
          if vim.wo.diff then
            local opts = { buffer = 0, noremap = true, silent = true }
            vim.keymap.set("n", "co", "<cmd>diffget //2<CR>", opts) -- Ours (current branch)
            vim.keymap.set("n", "ct", "<cmd>diffget //3<CR>", opts) -- Theirs (merged-in branch)
            vim.keymap.set("n", "c1", "<cmd>diffget //1<CR>", opts) -- Base (optional)
          end
        end,
      })
    end,
  },
}

