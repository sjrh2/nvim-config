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
vim.g.netrw_list_style = 3 -- configure how netrw is presented to the user

-- Clipboard
vim.opt.clipboard="unnamedplus"

-- Spelling 
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-- Leader Key(s)
vim.g.mapleader = ' ' -- Space as the leader key
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })

-- KEYMAPS:


-- DIAGNOSTICS:

vim.diagnostic.enable = true
vim.diagnostic.config({
    virtual_lines = true,
    })


-- AUTOCMDS:

-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if client == nil then
--       return
--     end
--     if client.name == 'ruff' then
--       -- Disable hover in favor of Pyright
--       client.server_capabilities.hoverProvider = false
--     end
--   end,
--   desc = 'LSP: Disable hover capability from Ruff',
-- })

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

-- LANGUAGE SERVER PROTOCOL:

-- Python
vim.lsp.config('ruff', {
  init_options = {
    settings = {
      -- Ruff language server settings go here
      loglevel = 'debug'
    }
  }
})

vim.lsp.config('ty', {
    settings = {
        ty = {
        -- ty language server settings go here
        }
    }
})

vim.lsp.config('ltex-ls', {
    settings = {
        ltex = {
            language = "en-US",
            -- latex language server settings go here
        },
    },
})

-- vim.lsp.enable('ruff')
vim.lsp.enable('ty')
vim.lsp.enable('basedpyright')

-- TypeScript / JavaScript / etc:
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

vim.lsp.enable('denols')
-- If error in project, try making a biome.json in the project dir
vim.lsp.enable('biome')

-- C / C++
vim.lsp.enable('clangd')

-- Typst
vim.lsp.enable('tinymist')

-- R language
vim.lsp.enable('air')

-- Spelling
-- vim.lsp.enable('cspell_ls')
vim.lsp.enable('ltex-ls')

-- COLORSCHEME:

local colorscheme = "sorbet"
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.o.background = "dark" -- or "light" for light mode
if not ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
