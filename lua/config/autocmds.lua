local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('HighlightYank', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

-- C++ specific indentation settings for Allman style
autocmd('FileType', {
  pattern = {'c', 'cpp'},
  callback = function()
    vim.opt_local.cindent = true
    vim.opt_local.cinoptions = 'l1,g1s,h1s,N-s,t0,i0,(0,W4,m1'
    -- l1: Align with case label instead of statement after it
    -- g1s: Place C++ scope declarations (public:, private:, protected:) indented by 1 shiftwidth (2 spaces)
    -- h1s: Place statements after C++ scope declarations indented by 1 additional shiftwidth
    -- N-s: Don't indent inside C++ namespace
    -- t0: Don't indent function return types
    -- i0: C++ base class declarations are aligned with the opening brace
    -- (0: Line up with unclosed parentheses
    -- W4: When following lines are not indented, indent them by 4
    -- m1: Line up the closing parentheses with the first character of the line with the opening parentheses
    vim.opt_local.shiftwidth = 2  -- Use 2 spaces for indentation in C/C++ files
  end,
})

-- Also apply C++ settings to header files by extension
autocmd({'BufRead', 'BufNewFile'}, {
  pattern = {'*.h', '*.hpp', '*.hxx', '*.hh'},
  callback = function()
    vim.bo.filetype = 'cpp'
  end,
})
