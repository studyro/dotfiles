local utils = require('utils')

utils.map('n', '<leader><space>', ':nohlsearch<CR>')
-- utils.map('n', '<leader>a', ':Ag!<space>')
-- utils.map('n', '<leader>k', ':Ag! <C-R><C-W>')
utils.map('n', '<leader>n', ':NvimTreeToggle<CR>')

utils.map('n', '<leader>ff', ':Telescope find_files<CR>')
utils.map('n', '<leader>fg', ':Telescope live_grep<CR>')
utils.map('n', '<leader>ag', ':Telescope live_grep<CR>')
utils.map('n', '<leader>k', ':Telescope grep_string<CR>')

utils.map('n', '<leader>g', ':Neogit<CR>')

utils.map('n', '<leader>h', ':TSHighlightCapturesUnderCursor<CR>')

utils.map('n', '<leader>aa', '<Plug>(AvanteToggle)')
utils.map('v', '<leader>ae', '<Plug>(AvanteEdit)')
utils.map('n', '<leader>af', '<Plug>(AvanteFocus)')
utils.map('n', '<leader>ar', '<Plug>(AvanteRefersh)')
-- vmap <C-c><C-c> <Plug>SendSelectionToTmux
-- nmap <C-c><C-c> <Plug>NormalModeSendToTmux
-- nmap <C-c>r     <Plug>SetTmuxVars

