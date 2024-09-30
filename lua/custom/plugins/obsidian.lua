return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre /Users/ayaan/Library/CloudStorage/OneDrive-TredyffrinEasttownSchoolDistrict/PersonalNotes/ObsidianNotes/**.md",
    "BufNewFile /Users/ayaan/Library/CloudStorage/OneDrive-TredyffrinEasttownSchoolDistrict/PersonalNotes/ObsidianNotes/**.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    ui = { enable = false },
    workspaces = {
      {
        name = "personal",
        path = "/Users/ayaan/Library/CloudStorage/OneDrive-TredyffrinEasttownSchoolDistrict/PersonalNotes/ObsidianNotes",
      },
      -- {
      --   name = "work",
      --   path = "~/vaults/work",
      -- },
    },

    -- see below for full list of options 👇
  },
}
