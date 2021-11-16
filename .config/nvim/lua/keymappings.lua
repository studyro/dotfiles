local utils = require('utils')

utils.map('n', '<leader><space>', ':nohlsearch<CR>')
utils.map('n', '<leader>a', ':Ag!<space>')
utils.map('n', '<leader>k', ':Ag! "\b<C-R><C-W>\b"')
utils.map('n', '<leader>n', ':NERDTreeToggle<CR>')

utils.map('n', '<leader>ff', ':Telescope find_files<CR>')
utils.map('n', '<leader>fg', ':Telescope live_grep<CR>')

utils.map('n', '<leader>g', ':Neogit<CR>')

utils.map('n', '<leader>h', ':TSHighlightCapturesUnderCursor<CR>')

-- vmap <C-c><C-c> <Plug>SendSelectionToTmux
-- nmap <C-c><C-c> <Plug>NormalModeSendToTmux
-- nmap <C-c>r     <Plug>SetTmuxVars

