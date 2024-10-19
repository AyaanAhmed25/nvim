return {
  "karb94/neoscroll.nvim",
  config = function()
    require('neoscroll').setup({
      mappings = { '<C-u>', '<C-d>', --[[ 'zt', 'zz', 'zb' ]] }
    })
    local neoscroll = require('neoscroll')
    local keymap = {
      ["<C-u>"] = function()
        neoscroll.ctrl_u({ duration = 70 })
        vim.defer_fn(function()
          vim.cmd('normal! zz')
        end, 80) -- Add a slight delay (in milliseconds) to allow scrolling to finish
      end,
      ["<C-d>"] = function()
        neoscroll.ctrl_d({ duration = 70 })
        vim.defer_fn(function()
          vim.cmd('normal! zz')
        end, 80) -- Adjust delay as needed
      end,
    }
    local modes = { 'n', 'v', 'x' }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end
}
