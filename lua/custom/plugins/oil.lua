return {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    -- dependencies = { "echasnovski/mini.icons" },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    keys = {
        { '-', ':Oil <CR>', { desc = 'Oil reveal' } },
    },
    config = function()
        require("oil").setup({
            delete_to_trash = true,
            keymaps = {
                ["<C-u>"] = { "actions.preview_scroll_up" },
                ["<C-d>"] = { "actions.preview_scroll_down" },
            }
        })
    end
}
