-- Line numbering
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
vim.opt.termguicolors = true

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
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
    end
  end
})

-- Packages
vim.pack.add({
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' },
  { src = 'https://github.com/ellisonleao/gruvbox.nvim' },
  { src = 'https://github.com/vyfor/cord.nvim' },
})

