return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    dependencies = {
      'HiPhish/rainbow-delimiters.nvim'
    },
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
    config = function()
      -- local highlight = {
      --   "RainbowRed",
      --   "RainbowYellow",
      --   "RainbowBlue",
      --   "RainbowOrange",
      --   "RainbowGreen",
      --   "RainbowViolet",
      --   "RainbowCyan",
      -- }
      -- require("ibl").setup { indent = { highlight = highlight } }
      -- uncomment above lines to enable per indent level different color highlighting
      -- and after that in colorscheme.lua, set colored indent levels to true
      --
      require("ibl").setup {
        exclude = {
          filetypes = {
            "dashboard"
          }
        }
      }
      vim.keymap.set("n", "<A-u>", function()
        local bufnr = vim.api.nvim_get_current_buf()
        local config = require("ibl.config").get_config(bufnr)
        local scope = require("ibl.scope").get(bufnr, config)
        if scope then
          local row, column = scope:start()
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { row + 1, column })
        end
      end)
    end
  },
}
