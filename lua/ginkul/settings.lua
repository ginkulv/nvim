local g = vim.g
local o = vim.o
local api = vim.api

o.termguicolors = true
o.number = true
o.relativenumber = true
o.splitright = true
o.splitbelow = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1
o.list = true
o.listchars = 'tab:→ '
o.showbreak = "↪ "
o.expandtab = true
o.shell = 'powershell'
-- o.cursorline = true

g.netrw_banner = 0
g.netrw_liststyle = 3

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})

api.nvim_create_autocmd("FileType", { pattern = { "vimwiki" }, command = [[set linebreak]] })
