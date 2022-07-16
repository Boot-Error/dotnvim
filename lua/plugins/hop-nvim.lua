require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

vim.api.nvim_set_keymap('n',
  'f',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
  {})
vim.api.nvim_set_keymap('n',
  'F',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
  {})
vim.api.nvim_set_keymap('n',
  't',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
  {})
vim.api.nvim_set_keymap('n',
  'T',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
  {})
vim.api.nvim_set_keymap('n',
  'mm',
  "<cmd>lua require'hop'.hint_words({})<cr>",
  {})

