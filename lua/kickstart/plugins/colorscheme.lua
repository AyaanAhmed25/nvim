return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      require('catppuccin').setup({
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          diffview=true,
          treesitter=true,
          flash = true,
          indent_blankline = {
            enabled = true,
            scope_color = "rosewater", -- catppuccin color (eg. `lavender`) Default: text
            colored_indent_levels = true,
          },
          neotree=true,
          navic = {
            enabled = true,
            -- custom_bg = "surface0", -- "lualine" will set background to mantle
          },
        }

      })
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'catppuccin-mocha'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
