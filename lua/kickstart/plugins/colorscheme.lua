return {
  {
    "folke/tokyonight.nvim"
  },
  {
    "rebelot/kanagawa.nvim"
  },
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
        custom_highlights = function(colors)
          return {
            lualine_x_fileType = { fg=colors.blue, bg=colors.red },
          }
        end,
        default_integrations = true,
        styles = {
          comments = { "italic" },
          functions = { "bold" },
          keywords = { "italic" },
          operators = { "bold" },
          conditionals = { "bold" },
          loops = { "bold" },
          booleans = { "bold", "italic" },
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          native_lsp = true,
          diffview = true,
          notify = false,
          treesitter = true,
          flash = true,
          indent_blankline = {
            enabled = true,
            scope_color = "sky", -- catppuccin color (eg. `lavender`) Default: text
            colored_indent_levels = false,
          },
          neotree = true,
          navic = {
            enabled = true,
            -- custom_bg = "surface0", -- "lualine" will set background to mantle
          },
          rainbow_delimiters = true,
          dashboard = true,
          telescope = { enabled = true, style = "nvchad" },
        }

      })
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'catppuccin'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
