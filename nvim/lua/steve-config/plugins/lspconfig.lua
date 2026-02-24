-- File: plugins/lspconfig.lua
-- Purpose: Declare and configure the LSP (Pyright) using the new API,
--          while remaining backward-compatible with pre-0.11 Neovim.

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- Enhance LSP capabilities for nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Optional on_attach for LSP keymaps, etc.
    local on_attach = function(_, _)
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end

    -- Tiny compatibility shim: prefer new API, fall back if needed
    local function setup_server(server, opts)
      if vim.fn.has("nvim-0.11") == 1 then
        -- New built-in API (no deprecation warning)
        vim.lsp.config(server, opts)
      else
        -- Older Neovim fallback (only used if you actually run <0.11)
        require("lspconfig")[server].setup(opts)
      end
    end

    -- Pyright setup (unchanged options)
    setup_server("pyright", {
      on_attach = on_attach,
      capabilities = capabilities,
      -- settings = {
      --   python = { analysis = { typeCheckingMode = "strict" } },
      -- },
    })

    -- Add other servers the same way later:
    -- setup_server("lua_ls", { on_attach = on_attach, capabilities = capabilities })
  end,
}

