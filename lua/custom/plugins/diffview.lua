return {
	'sindrets/diffview.nvim',
	config = function()
		require('diffview').setup()
		vim.keymap.set({ 'n', 'x' }, '<leader>gd', "<cmd>DiffviewOpen<cr>", { desc = '[G]it [D]iff' })
		vim.keymap.set({ 'n', 'x' }, '<leader>gh', "<cmd>DiffviewFileHistory<cr>", { desc = '[G]it [H]istory' })
	end,


}
