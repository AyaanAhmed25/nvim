return {
  'kevinhwang91/nvim-bqf',
  lazy = true,
  ft = 'qf',
  dependencies = {
    { 'junegunn/fzf', build = ':call fzf#install()' },
  },
}