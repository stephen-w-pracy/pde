-- File: plugins/lspconfig.lua
-- Purpose: Declare and configure the LSP (Pyright).

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- We depend on cmp-nvim-lsp so we can set up autocompletion capabilities
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")

    -- Enhance LSP capabilities for nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Optional on_attach function for setting LSP keymaps, etc.
    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      -- Add more as you see fit
    end

    -- Pyright setup
    lspconfig.pyright.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      -- Example Pyright settings:
      -- settings = {
      --   python = {
      --     analysis = {
      --       typeCheckingMode = "strict",
      --     },
      --   },
      -- },
    })

    -- If you have other servers, configure them here too
    -- lspconfig.rust_analyzer.setup{ ... }
    -- lspconfig.lua_ls.setup{ ... }
  end,
}

