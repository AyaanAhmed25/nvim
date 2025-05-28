return {
  {
    'folke/tokyonight.nvim',
  },
  {
    'rebelot/kanagawa.nvim',
  },
  {
    'sainnhe/everforest',
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    init = function()
      require('rose-pine').setup {
        variant = 'main', -- auto, main, moon, or dawn
        dark_variant = 'main', -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },

        groups = {
          border = 'muted',
          link = 'iris',
          panel = 'surface',

          error = 'love',
          hint = 'iris',
          info = 'foam',
          note = 'pine',
          todo = 'rose',
          warn = 'gold',

          git_add = 'foam',
          git_change = 'rose',
          git_delete = 'love',
          git_dirty = 'rose',
          git_ignore = 'muted',
          git_merge = 'iris',
          git_rename = 'pine',
          git_stage = 'iris',
          git_text = 'rose',
          git_untracked = 'subtle',

          h1 = 'iris',
          h2 = 'foam',
          h3 = 'rose',
          h4 = 'gold',
          h5 = 'pine',
          h6 = 'foam',
        },

        palette = {
          -- Override the builtin palette per variant
          -- moon = {
          --     base = '#18191a',
          --     overlay = '#363738',
          -- },
        },

        highlight_groups = {
          -- Comment = { fg = "foam" },
          -- VertSplit = { fg = "muted", bg = "muted" },
        },

        before_highlight = function(group, highlight, palette)
          -- Disable all undercurls
          -- if highlight.undercurl then
          --     highlight.undercurl = false
          -- end
          --
          -- Change palette colour
          -- if highlight.fg == palette.pine then
          --     highlight.fg = palette.foam
          -- end
        end,
      }
    end,
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
      require('catppuccin').setup {
        default_integrations = true,
        styles = {
          comments = { 'italic' },
          functions = { 'bold' },
          keywords = { 'italic' },
          operators = { 'bold' },
          conditionals = { 'italic' },
          loops = { 'italic' },
          booleans = { 'italic' },
          miscs = {},
        },
        -- color_overrides = {
        --   mocha = {
        --     base = "#11111b"
        --   }
        -- },
        -- custom_highlights example
        -- custom_highlights = function(colors)
        --   return {
        --     Comment = { fg = colors.flamingo },
        --   }
        -- end,
        integrations = {
          blink_cmp = true,
          gitsigns = true,
          native_lsp = true,
          diffview = true,
          notify = false,
          treesitter = true,
          flash = true,
          indent_blankline = {
            enabled = true,
            scope_color = 'sky', -- catppuccin color (eg. `lavender`) Default: text
            colored_indent_levels = false,
          },
          neotree = true,
          navic = {
            enabled = true,
            -- custom_bg = "surface0", -- "lualine" will set background to mantle
          },
          rainbow_delimiters = true,
          dashboard = true,
          telescope = { enabled = true, style = 'nvchad' },
          lsp_saga = true,
          grug_far = true,
        },
      }
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
