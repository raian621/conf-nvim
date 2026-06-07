vim.opt.number = true
vim.opt.relativenumber = true

-- Tab settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Miscellaneous
vim.opt.incsearch = true
vim.opt.autoread = true
vim.g.mapleader = " "

-- Text wrapping
vim.opt.wrap = false
vim.opt.textwidth = 80
vim.opt.colorcolumn = "80,120"

-- LSP settings
vim.opt.autocomplete = true
vim.opt.completeopt = "fuzzy,menuone,noselect,popup"
vim.opt.pumheight = 7
vim.lsp.enable({ 'clangd', 'lua_ls', 'rust_analyzer' })
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),

  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    -- Set up autocomple:
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

    -- Map 'gd' to symbol definition
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  end
})

-- Static warning & error messages inline
vim.diagnostic.config({
  virtual_text = true, -- enables inline messages
  signs = true,
  underline = true,
})
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Packages
vim.pack.add({
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  {
    src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  { src = 'https://github.com/ellisonleao/gruvbox.nvim' },
  { src = 'https://github.com/vyfor/cord.nvim' },
  { src = 'https://github.com/stevearc/conform.nvim' },
})

require('plugins.telescope')
require('plugins.conform')

-- Color theme
vim.opt.termguicolors = true
vim.cmd('colorscheme gruvbox')

vim.opt.number = true
vim.opt.relativenumber = true

-- Tab settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Miscellaneous
vim.opt.incsearch = true
vim.opt.autoread = true
vim.g.mapleader = " "

-- Text wrapping
vim.opt.wrap = false
vim.opt.textwidth = 80
vim.opt.colorcolumn = "80,120"

-- LSP settings
vim.opt.autocomplete = true
vim.opt.completeopt = "fuzzy,menuone,noselect,popup"
vim.opt.pumheight = 7
vim.lsp.enable({ 'clangd', 'lua_ls' })
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),

  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    -- Set up autocomple:
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

    -- Map 'gd' to symbol definition
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  end
})

-- Static warning & error messages inline
vim.diagnostic.config({
  virtual_text = true, -- enables inline messages
  signs = true,
  underline = true,
})

-- Packages
vim.pack.add({
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  {
    src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  { src = 'https://github.com/ellisonleao/gruvbox.nvim' },
  { src = 'https://github.com/vyfor/cord.nvim' },
  { src = 'https://github.com/stevearc/conform.nvim' },
})

require('plugins.telescope')

-- Color theme
vim.opt.termguicolors = true
vim.cmd('colorscheme gruvbox')
