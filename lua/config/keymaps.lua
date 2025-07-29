local map = vim.keymap.set

-- Folding keymaps
map('n', 'za', 'za', { desc = 'Toggle fold under cursor' })
map('n', 'zA', 'zA', { desc = 'Toggle all folds under cursor recursively' })
map('n', 'zr', 'zr', { desc = 'Open all folds by one level' })
map('n', 'zR', 'zR', { desc = 'Open all folds' })
map('n', 'zm', 'zm', { desc = 'Close all folds by one level' })
map('n', 'zM', 'zM', { desc = 'Close all folds' })
map('v', 'zf', 'zf', { desc = 'Create fold from visual selection' })

-- NvimTree toggle
map('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
map('n', '<leader>o', ':NvimTreeFindFile<CR>', { desc = 'Find current file in tree' })

-- Window splits
map('n', '<leader>sh', ':split<CR>', { desc = 'Horizontal split' })
map('n', '<leader>sv', ':vsplit<CR>', { desc = 'Vertical split' })
map('n', '<leader>se', '<C-w>=', { desc = 'Equal window sizes' })
map('n', '<leader>sx', ':close<CR>', { desc = 'Close current split' })

-- Window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Window resizing
map('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
map('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
map('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

-- Buffer navigation
map('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
map('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })
map('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete buffer' })

-- Clear search highlighting
map('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

-- Better indenting in visual mode
map('v', '<', '<gv', { desc = 'Indent left and reselect' })
map('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Move text up and down in visual mode
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Keep cursor centered when scrolling
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })
map('n', 'n', 'nzzzv', { desc = 'Next search result and center' })
map('n', 'N', 'Nzzzv', { desc = 'Previous search result and center' })

-- Better paste
map('x', '<leader>p', '"_dP', { desc = 'Paste without yanking' })

-- Save file
map('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
map('n', '<leader>wa', ':wa<CR>', { desc = 'Save all files' })
map('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
map('n', '<leader>qa', ':qa<CR>', { desc = 'Quit all' })

-- Line number toggles
map('n', '<leader>tr', ':set relativenumber!<CR>', { desc = 'Toggle relative line numbers' })
map('n', '<leader>tn', ':set number!<CR>', { desc = 'Toggle absolute line numbers' })

-- Obsidian keymaps
map('n', '<leader>os', ':ObsidianSearch<CR>', { desc = 'Search Obsidian notes' })
map('n', '<leader>oo', ':ObsidianQuickSwitch<CR>', { desc = 'Quick switch Obsidian note' })
map('n', '<leader>on', ':ObsidianNew<CR>', { desc = 'Create new Obsidian note' })
map('n', '<leader>ot', ':ObsidianTags<CR>', { desc = 'Browse Obsidian tags' })