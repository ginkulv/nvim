local function get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  local s = table.concat(lines, ' ')
  return s:gsub("'", ""):gsub('"', '')
end

function _G.open_github()
    local name = get_visual_selection()
    local url = "https://github.com/" .. name
    vim.cmd("call netrw#BrowseX('" .. url .. "', 0)")
end

function _G.search_google()
    local name = get_visual_selection()
    local url = "https://google.com/search?q=" .. name
    vim.cmd("call netrw#BrowseX('" .. url .. "', 0)")
end

-- Changing size of views
vim.keymap.set('n', '<C-k>', '<C-w>+', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>-', { silent = true })
vim.keymap.set('n', '<C-h>', '<C-w><', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>>', { silent = true })
-- Navigating tabs
vim.keymap.set('n', '<Tab>', 'gt', { silent = true })
vim.keymap.set('n', '<s-Tab>', 'gT', { silent = true })
-- Exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', { silent = true })

vim.keymap.set('v', '<leader>gh', ':<C-u>call v:lua.open_github()<CR>', { silent = true })
vim.keymap.set('v', '<leader>gg', ':<C-u>call v:lua.search_google()<CR>', { silent = true })

-- Plugins settings
vim.keymap.set('n', '<C-f>', '<cmd>Telescope find_files<cr>', { silent = true })

vim.keymap.set('i', '<C-r>', 'coc#refresh()', { expr = true } )
vim.keymap.set('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"', {expr = true } )
-- map('i', '<C-space>',  ':call coc#refresh()<CR>')

