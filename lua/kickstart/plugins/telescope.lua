-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-telescope/telescope-frecency.nvim' },
      { 'jonarrien/telescope-cmdline.nvim' },
      { 'smilovanovic/telescope-search-dir-picker.nvim' },
      { 'AyaanAhmed25/telescope-picker-list.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    keys = {
      { 'Q', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        defaults = {
          file_ignore_patterns = { 'node_modules', 'png', 'jpeg', 'ico', 'icns', 'svg', 'gif', 'ogg', 'mp3', 'mp4' },
          sorting_strategy = 'ascending',
          file_previewer = require('telescope.previewers').vim_buffer_cat.new,
          grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
          qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
          file_sorter = require('telescope.sorters').get_fuzzy_file,
          generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
          buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
          results_title = false,
          prompt_prefix = '   ',
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.65,

              size = {
                width = '100%',
                height = '100%',
              },
              width = 0.85,
              height = 0.92,
            },
          },
        },
        pickers = {
          buffers = {
            sort_mru = true,
            ignore_current_buffer = false,
            mappings = {
              n = {
                ['<C-k>'] = require('telescope.actions').delete_buffer,
              },
              i = {
                ['<C-k>'] = require('telescope.actions').delete_buffer,
              },
            },
          },
        },
        extensions = {
          picker_list = {
            -- excluded_pickers = {
            --   'fzf',
            --   'fd',
            --   'buffer',
            --   'oldfiles',
            --   'commands'
            -- },
            -- user defined pickers
            user_pickers = {
              {
                'todo',
                function()
                  vim.cmd [[TodoTelescope]]
                end,
              },
              {
                'a',
                function()
                  vim.cmd [[Telescope builtin]]
                end,
              },
            },
          },
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          aerial = {
            show_lines = false,
            show_nesting = {
              ['_'] = false, -- This key will be the default
              lua = true, -- You can set the option for specific filetypes
            },
          },
          frecency = {
            show_scores = true,
            show_unindexed = true,
            ignore_patterns = { '*.git/*', '*/tmp/*' },
          },
        },
      }
      -- require 'telescope._extensions.harpoon'
      -- require 'telescope._extensions.session-lens'
      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'neoclip')
      pcall(require('telescope').load_extension, 'frecency')
      pcall(require('telescope').load_extension, 'harpoon')
      pcall(require('telescope').load_extension, 'aerial')
      pcall(require('telescope').load_extension, 'cmdline')
      pcall(require('telescope').load_extension, 'search_dir_picker')
      pcall(require('telescope').load_extension, 'picker_list')
      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', '<cmd> Telescope picker_list<cr>', { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>sp', builtin.registers, { desc = '[S]earch registers' })
      vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = '[S]earch [M]arks' })
      vim.keymap.set('n', '<leader>sb', "<cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<cr>", { desc = "[S]earch in [B]uffers" })
      vim.keymap.set('n', '<leader>/', function ()
        builtin.current_buffer_fuzzy_find()
      end, { desc = '[/] Fuzzily search in current buffer' })
      vim.keymap.set('n', '<leader>sa', function()
        require('telescope').extensions.aerial.aerial()
      end, { desc = '[S]earch [A]erial' })
      --i have no need for this "fancy" theme i like it better with the preview🙃
      -- Slightly advanced example of overriding default behavior and theme
      -- vim.keymap.set('n', '<leader>/', function()
      --   -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      --   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      --     winblend = 10,
      --     borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
      --     previewer = false,
      --   })
      -- end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
