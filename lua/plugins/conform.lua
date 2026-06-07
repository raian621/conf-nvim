require("conform").setup({
  formatters_by_ft = {
    c = { "clang_format" },
    cpp = { "clang_format" },
  },
  formatters = {
    clang_format = {
      prepend_args = { '--style=file', '--fallback-style=google' },
    },
  },
})

vim.keymap.set("n", "<leader>F", function()
  require("conform").format({ async = true, lsp_fallback = true })
end)
