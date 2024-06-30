-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- save file regardless of the mode with control s
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

-- move lines up or down like in normal IDES:
vim.keymap.set({ 'i', 'n' }, "<A-j>", ":m .+1<CR>==")
vim.keymap.set({ 'i', 'n' }, "<A-k>", ":m .-2<CR>==")


-- Move cursor in Insert mode
vim.keymap.set('i', '<D-h>', '<Left>', { desc = 'Move cursor left in insert mode', noremap = true, silent = true })
vim.keymap.set('i', '<D-j>', '<Down>', { desc = 'Move cursor down in insert mode', noremap = true, silent = true })
vim.keymap.set('i', '<D-k>', '<Up>', { desc = 'Move cursor up in insert mode', noremap = true, silent = true })
vim.keymap.set('i', '<D-l>', '<Right>', { desc = 'Move cursor right in insert mode', noremap = true, silent = true })

-- Move cursor in Command mode
vim.keymap.set('c', '<D-h>', '<Left>', { desc = 'Move cursor left in command mode', noremap = true, silent = true })
vim.keymap.set('c', '<D-j>', '<Down>', { desc = 'Move cursor down in command mode', noremap = true, silent = true })
vim.keymap.set('c', '<D-k>', '<Up>', { desc = 'Move cursor up in command mode', noremap = true, silent = true })
vim.keymap.set('c', '<D-l>', '<Right>', { desc = 'Move cursor right in command mode', noremap = true, silent = true })

-- Move cursor in Terminal mode
vim.keymap.set('t', '<D-h>', '<C-\\><C-N><C-w>h',
  { desc = 'Move cursor left in terminal mode', noremap = true, silent = true })
vim.keymap.set('t', '<D-j>', '<C-\\><C-N><C-w>j',
  { desc = 'Move cursor down in terminal mode', noremap = true, silent = true })
vim.keymap.set('t', '<D-k>', '<C-\\><C-N><C-w>k',
  { desc = 'Move cursor up in terminal mode', noremap = true, silent = true })
vim.keymap.set('t', '<D-l>', '<C-\\><C-N><C-w>l',
  { desc = 'Move cursor right in terminal mode', noremap = true, silent = true })


--keymap to map jk to esc
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
