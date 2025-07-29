local lspconfig = require('lspconfig')
local cmp = require('cmp')

-- Set up completion
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- LSP setup
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Configure individual language servers
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'}
      }
    }
  }
})

-- C++ language server
lspconfig.clangd.setup({
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--fallback-style=Microsoft",  -- Allman-style braces, left-aligned pointers
  },
  filetypes = {"c", "cpp", "objc", "objcpp", "cuda", "proto"},
})

-- Add more LSP servers as needed
-- lspconfig.nixd.setup({ capabilities = capabilities })
-- lspconfig.tsserver.setup({ capabilities = capabilities })

-- Set up keymaps for LSP actions
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    -- Format keymaps
    vim.keymap.set({'n', 'v'}, '<leader>f', function()
      vim.lsp.buf.format({ async = true })
    end, vim.tbl_extend('force', opts, {desc = 'Format document'}))

    -- Other useful LSP keymaps
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, {desc = 'Go to definition'}))
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, {desc = 'Hover documentation'}))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, {desc = 'Go to references'}))
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, {desc = 'Rename symbol'}))
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, {desc = 'Code action'}))
    vim.keymap.set('n', 'ge', vim.diagnostic.open_float, vim.tbl_extend('force', opts, {desc = 'Show diagnostics (errors)'}))
  end
})

-- Format on save for C/C++ files
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = {'*.c', '*.cpp', '*.h', '*.hpp', '*.cc', '*.cxx'},
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
