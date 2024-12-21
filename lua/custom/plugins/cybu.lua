return {
  'ghillb/cybu.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'nvim-lua/plenary.nvim' },

  config = function()
    require('cybu').setup {
      behavior = { -- set behavior for different modes
        mode = {
          default = {
            switch = 'immediate', -- immediate, on_close
            view = 'rolling', -- paging, rolling
          },
          last_used = {
            switch = 'immediate', -- immediate, on_close
            view = 'rolling', -- paging, rolling
          },
          auto = {
            view = 'rolling', -- paging, rolling
          },
        },
        show_on_autocmd = false, -- event to trigger cybu (eg. "BufEnter")
      },
    }
    vim.keymap.set({ 'n' }, '[b', '<cmd>CybuLastusedNext<cr>')
    vim.keymap.set({ 'n' }, ']b', '<cmd>CybuLastusedPrev<cr>')
  end,
}
