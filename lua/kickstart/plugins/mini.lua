return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    -- dependencies = {
    --   'nvim-treesitter/nvim-treesitter-textobjects'
    -- },
    -- TODO: make option + u go up in treesitter context
    config = function()
      -- local spec_treesitter = require('mini.ai').gen_spec.treesitter
      -- -- Better Around/Inside textobjects
      -- --
      -- -- Examples:
      -- --  - va)  - [V]isually select [A]round [)]paren
      -- --  - yinq - [Y]ank [I]nside [N]ext [']quote
      -- --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }
      -- require('mini.ai').setup { n_lines = 500,
      --   custom_textobjects = {
      --     F = spec_treesitter({ a = '@function.outer', i = '@function.inner' }),
      --     o = spec_treesitter({
      --       a = { '@conditional.outer', '@loop.outer' },
      --       i = { '@conditional.inner', '@loop.inner' },
      --     })
      --   }
      -- }
      --
      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      -- require('mini.surround').setup()
      require('mini.bracketed').setup {
        oldfile = { suffix = 'f', options = {} },
        undo = { suffix = '', options = { disable = true } },
      }
      require('mini.basics').setup {
        mappings = {
          -- Basic mappings (better 'jk', save with Ctrl+S, ...)
          basic = true,

          -- Prefix for mappings that toggle common options ('wrap', 'spell', ...).
          -- Supply empty string to not create these mappings.
          option_toggle_prefix = [[#]],

          -- Window navigation with <C-hjkl>, resize with <C-arrow>
          windows = true,

          -- Move cursor in Insert, Command, and Terminal mode with <M-hjkl>
          move_with_alt = true,
        },
      }
      -- move lines or entire blocks of code easily
      require('mini.move').setup()
      require('mini.cursorword').setup()
      require('mini.files').setup {
        mappings = {

        },
        options = {
          -- Whether to delete permanently or move into module-specific trash
          permanent_delete = false,
          -- Whether to use for editing directories
          use_as_default_explorer = false,
        },
        windows = {
          preview = true,
          width_preview = 80
        }
      }
      vim.keymap.set('n', '-', function()
        if vim.bo.buftype ~= 'oil' then
          require('mini.files').open()
        end
      end, { desc = 'open mini.nvim file explorer unless buftype is oil' })

      require('mini.splitjoin').setup {
        -- Module mappings. Use `''` (empty string) to disable one.
        -- Created for both Normal and Visual modes.
        mappings = {
          toggle = '',
          split = 'gs',
          join = 'gS',
        },

        -- Detection options: where split/join should be done
        detect = {
          -- Array of Lua patterns to detect region with arguments.
          -- Default: { '%b()', '%b[]', '%b{}' }
          brackets = nil,

          -- String Lua pattern defining argument separator
          separator = ',',

          -- Array of Lua patterns for sub-regions to exclude separators from.
          -- Enables correct detection in presence of nested brackets and quotes.
          -- Default: { '%b()', '%b[]', '%b{}', '%b""', "%b''" }
          exclude_regions = nil,
        },

        -- Split options
        split = {
          hooks_pre = {},
          hooks_post = {},
        },

        -- Join options
        join = {
          hooks_pre = {},
          hooks_post = {},
        },
      }
      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      -- local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      -- statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      --   return '%2l:%-2v'
      -- end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
