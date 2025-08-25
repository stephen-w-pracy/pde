-- Aliases for convenience
local o = vim.opt
local g = vim.g

-- Editor settings
o.autoindent = true
o.clipboard = "unnamedplus"
o.colorcolumn = "80"
o.cursorline = true
o.encoding = "utf-8"
o.expandtab = true

-- formatoptions: t = auto-wrap text, c = auto-wrap comments, l = don't break long lines, n = smart indent lists
o.formatoptions = "tcln"
o.hidden = true
o.inccommand = "split"
o.mouse = "a"
o.number = true
o.ruler = true
o.shiftwidth = 2
o.showcmd = true
o.showmatch = true
o.splitbelow = true
o.splitright = true
-- o.syntax = "on"                -- `o.syntax` isn't valid — use `vim.cmd("syntax on")` instead
o.tabstop = 2
o.termguicolors = true
o.title = true
o.ttimeoutlen = 0
o.wildmenu = true
o.laststatus = 2               -- 2 = always show; 3 = global statusline in newer Neovim versions

-- Enable syntax highlighting (this is not an option, it's a command)
vim.cmd("syntax on")

-- Start the Neovim server for external control
pcall(vim.fn.serverstart, "/tmp/nvim.sock")

