return {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    -- dependencies = { "echasnovski/mini.icons" },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
        require("oil").setup({
            delete_to_trash = true,
        })
    end
}
