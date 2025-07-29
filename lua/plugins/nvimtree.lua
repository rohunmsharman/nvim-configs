-- Disable netrw (nvim-tree replaces it)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set up nvim-tree without icons
require("nvim-tree").setup({
  -- Sort folders before files
  sort_by = "case_sensitive",

  -- View configuration
  view = {
    width = 30,
    side = "left",
  },

  -- Renderer configuration (no icons)
  renderer = {
    group_empty = true,
    icons = {
      show = {
        file = false,        -- Disable file icons
        folder = false,      -- Disable folder icons
        folder_arrow = true, -- Keep folder arrows (these are ASCII)
        git = false,         -- Disable git icons
      },
    },
    indent_markers = {
      enable = true,         -- Use ASCII characters for indentation
    },
  },

  -- File filtering
  filters = {
    dotfiles = false,  -- Show hidden files
  },

  -- Git integration (without icons)
  git = {
    enable = true,
    ignore = false,
  },

  -- Actions
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
    },
  },

  -- Auto-refresh on file changes
  filesystem_watchers = {
    enable = true,
  },
})
