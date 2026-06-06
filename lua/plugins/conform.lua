require("conform").setup({
  formatters_by_ft = {
    cpp = { "clang-format" },
  }
})

vim.keymap.set("n", "<leader>F", function()
  require("conform").format({ async = true, lsp_fallback = true })
end)

