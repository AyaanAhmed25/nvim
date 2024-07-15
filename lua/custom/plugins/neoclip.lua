return {
	"AckslD/nvim-neoclip.lua",
	dependencies = {
		{ 'nvim-telescope/telescope.nvim' },
	},
	config = function()
		require('neoclip').setup({
			enable_persistent_history = true
		})
	end,

	dependencies = {
		"kkharji/sqlite.lua"
	}
}
