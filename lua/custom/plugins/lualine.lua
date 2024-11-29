local mocha = require("catppuccin.palettes").get_palette "mocha"
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'SmiteshP/nvim-navic' },
  config = function()
    -- local navic = require('nvim-navic').setup {
    --   lsp = {
    --     auto_attach = true,
    --   },
    --   highlight = true,
    --   separator = ' > ',
    -- }
    require('lualine').setup {
      options = {
        icons_enabled = true,
        -- theme = 'rose-pine',
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 200,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        -- lualine_c = { {
        -- 	function()
        -- 		return navic.get_location()
        -- 	end,
        -- 	cond = function()
        -- 		return navic.is_available()
        -- 	end
        -- }, },
        lualine_x = {
          'filetype', --[[ icon={color = {fg='rosewater'}} ]]
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
