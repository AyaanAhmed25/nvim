return {
	"AckslD/nvim-neoclip.lua",
	dependencies = {
		{ 'nvim-telescope/telescope.nvim' },
	},
	config = function()
		require('neoclip').setup({
			enable_persistent_history = true,
			keys = {
				telescope = {
					i = {
						paste = '<c-v>',
					}
				}
			}
		})
	end,

	dependencies = {
		"kkharji/sqlite.lua"
	}
}
