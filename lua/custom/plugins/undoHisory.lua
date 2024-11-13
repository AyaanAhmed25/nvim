return {
  {
    'jiaoshijie/undotree',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  {
    'tzachar/highlight-undo.nvim',
    lazy = false,
    keys = { { 'u' }, { '<C-r>' } },
    opts = {
      duration = 1000
    },
  },
}
