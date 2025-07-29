local opt = vim.opt

--line numbers
opt.number = true
opt.relativenumber = true

--indentation
opt.autoindent = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

--search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

--appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.conceallevel = 2  -- For Obsidian.nvim UI features

--behavior
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.incsearch = true
opt.scrolloff = 8
opt.isfname:append("@-@")
opt.updatetime = 50

--folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99  -- Start with all folds open
opt.foldenable = true

--leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

