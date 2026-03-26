-- Neovim Configuration file

-- OPTIONS:

-- Line Numbering & Indentation & Scrolloff
vim.o.number = true -- Enable line numbers
vim.o.ruler = true
vim.o.tabstop = 4 -- Number of spaces a tab represents
vim.o.shiftwidth = 4 -- Number of spaces for each indentation
vim.o.expandtab = true -- Convert tabs to spaces - TURN OFF IF EXPERIENCE PROBLEMS
vim.o.smartindent = true -- Automatically indent new lines
vim.o.wrap = true -- Enable line wrapping
vim.o.cursorline = true -- Highlight the current line
vim.o.scrolloff = 8 -- Keep 8 lines above/below cursor
vim.o.sidescrolloff = 8 -- keep 8 columns above/below cursor

-- Visual Settings
vim.o.termguicolors = true -- Enable 24-bit RGB colors
vim.o.showmatch = true -- Highlight matching brackets


-- Clipboard
vim.opt.clipboard="unnamedplus"


-- Leader Key(s)
vim.g.mapleader = ' ' -- Space as the leader key
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })

-- KEYMAPS:


-- DIAGNOSTICS:


-- AUTOCMDS:

-- Highlight yanked text
-- below is in vimscript - try to change it into lua
--local highlight_group = augroup('YankHighlight', { clear = true })
--autocmd('TextYankPost', {
--    pattern = '*',
--    callback = function()
--        vim.highlight.on_yank({ timeout = 170 })
--    end,
--    group = highlight_group,
--})

-- COLORSCHEME:

local colorscheme = "sorbet"
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.o.background = "dark" -- or "light" for light mode
if not ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
