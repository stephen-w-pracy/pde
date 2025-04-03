local global = vim.g
local o = vim.opt

o.autoindent = true
o.clipboard = "unnamedplus"
o.colorcolumn = "80"
o.cursorline = true
o.encoding = "UTF-8"
o.expandtab = true
-- t:autowrap, c: autowrap comments l:don't break existing lines, 
-- n: indent lists nicely
o.formatoptions = {tcln} 
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
o.syntax = "on"
o.tabstop = 2
o.termguicolors = true
o.title = true
o.ttimeoutlen = 0
o.wildmenu = true
o.laststatus = 2 -- Only 1 global status line
