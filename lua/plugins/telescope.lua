local telescope = require('telescope')

telescope.setup({
  defaults = {
    layout_strategy = 'horizontal',
  }
})

telescope.load_extension('fzf')

