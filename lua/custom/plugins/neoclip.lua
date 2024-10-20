return {
  'AckslD/nvim-neoclip.lua',
  config = function()
    require('neoclip').setup {
      enable_persistent_history = true,
      keys = {
        telescope = {
          i = {
            paste = '<c-v>',
          },
        },
      },
    }
  end,

  dependencies = {
    'kkharji/sqlite.lua',
    'nvim-telescope/telescope.nvim',
  },
}
