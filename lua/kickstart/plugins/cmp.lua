return {
  { -- Autocompletion
    'saghen/blink.cmp',
    lazy = false,
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'rafamadriz/friendly-snippets',
      'L3MON4D3/LuaSnip',
      'echasnovski/mini.snippets',
      'xzbdmw/colorful-menu.nvim',
    },
    version = 'v0.*',
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
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = true,
        -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },
      completion = {
        trigger = {
          -- show_on_insert_on_trigger_character = false,
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
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        -- optionally disable cmdline completions
        -- cmdline = {},
      },

      -- experimental signature help support
      -- signature = { enabled = true }
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    -- opts_extend = { 'sources.default' },
  },
}
-- vim: ts=2 sts=2 sw=2 et
