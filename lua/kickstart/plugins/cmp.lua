return {
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },
  'saghen/blink.compat',
  version = '2.*',
  { -- Autocompletion
    'saghen/blink.cmp',
    lazy = false,
    dependencies = {
      -- Snippet Engine & it's associated nvim-cmp source
      'rafamadriz/friendly-snippets',
      'L3MON4D3/LuaSnip',
      'echasnovski/mini.snippets',
      'xzbdmw/colorful-menu.nvim',
      'Kaiser-Yang/blink-cmp-dictionary',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },
    version = 'v1.*',
    opts = {
      -- snippets = { preset = 'mini_snippets' },
      snippets = { preset = 'luasnip' },
      keymap = {
        preset = 'default',
        ['<Tab>'] = {},
        ['<S-Tab>'] = {},
        ['<C-h>'] = {
          'snippet_backward',
          'fallback',
        },
        ['<C-l>'] = { 'snippet_forward' },
      },
      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = true,
        -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },
      completion = {
        trigger = {
          -- Show_on_insert_on_trigger_character = false,
        },
        menu = {
          draw = {
            columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind' } },
            components = {
              label = {
                text = function(ctx)
                  return require('colorful-menu').blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require('colorful-menu').blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
      },
      signature = {
        enabled = true,
      },
      -- default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, via `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'dictionary', 'buffer' },
        providers = {
          dictionary = {
            -- dictionary_files = '/usr/share/dict/words',
            module = 'blink-cmp-dictionary',
            name = 'Dict',
            -- Make sure this is at least 2.
            -- 3 is recommended
            min_keyword_length = 3,
            opts = {
              -- options for blink-cmp-dictionary
              dictionary_files = {'/usr/share/dict/words'},
            },
          },
        },
        -- optionally disable cmdline completions
        -- cmdline = {},
      },
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    -- opts_extend = { 'sources.default' },
  },
}
-- vim: ts=2 sts=2 sw=2 et
