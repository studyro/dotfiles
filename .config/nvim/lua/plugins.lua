local utils = require('utils')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require "paq" {
  "savq/paq-nvim";
  -- General plugins
  'rking/ag.vim';
  {'jgdavey/tslime.vim', branch = 'main'};
  'majutsushi/tagbar'; -- nmap <leader>t :TagbarToggle<CR>
  'tpope/vim-surround';
  'benekastah/neomake';
  'tpope/vim-repeat';
  'tpope/vim-unimpaired';

  -- Plugins for nvim 0.5
  {'nvim-treesitter/nvim-treesitter', build = function() vim.api.nvim_command(':TSUpdate') end};
  'nvim-lua/plenary.nvim';
  'nvim-telescope/telescope.nvim';
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'};
  'ibhagwan/fzf-lua';
  'TimUntersberger/neogit';
  'folke/twilight.nvim';
  'windwp/nvim-autopairs';
  'aserowy/tmux.nvim';
  'swaits/zellij-nav.nvim';
  'nvim-lualine/lualine.nvim';
  'nvim-tree/nvim-web-devicons';
  'nvim-tree/nvim-tree.lua';
  'esmuellert/codediff.nvim';
  'lewis6991/gitsigns.nvim';

  -- Plugins for autocomplete on nvim 0.5+
  'lbrayner/vim-rzip';
  'neovim/nvim-lspconfig';
  'mason-org/mason.nvim';
  -- 'tamago324/nlsp-settings.nvim';
  'hrsh7th/nvim-cmp';
  'hrsh7th/cmp-nvim-lsp';
  'dcampos/nvim-snippy';
  'honza/vim-snippets';
  'dcampos/cmp-snippy';
  {'michaelb/sniprun', build = 'bash install.sh'};

  'kelan/gyp.vim';
  'jparise/vim-graphql';

  -- Plugins for Android
  'iamironz/android-nvim-plugin';

  -- Themes
  -- 'ajh17/Spacegray.vim';
  -- 'EdenEast/nightfox.nvim';
  -- 'rmehri01/onenord.nvim';
  -- 'AlexvZyl/nordic.nvim';
  {'rmehri01/onenord.nvim', branch = 'main'};
  'sphamba/smear-cursor.nvim';

  -- AI Coding
  'MunifTanjim/nui.nvim';
  'MeanderingProgrammer/render-markdown.nvim';
}

local opt = vim.opt
local g = vim.g

if vim.fn.executable('ag') then
  g.ag_highlight = 1
end

-- legacy vimscript plugins
g.jsx_ext_required = 0 -- Allow JSX in normal JS files
g.used_javascript_libs = 'react'

g.tslime_always_current_session = 1
g.tslime_always_current_window = 1

-- g.neomake_html_eelixir_enabled_makers = {}

g.go_code_completion_enabled = 0
g.go_gopls_enabled = 0 -- disable gopls for vim-go, we use coc-go for code completion
g.go_def_mapping_enabled = 0
g.go_highlight_operators = 1
g.go_highlight_functions = 1
g.go_highlight_function_calls = 1
g.go_highlight_types = 1
g.go_highlight_fields = 1

g.airline_theme = 'onedark'

require("nvim-tree").setup {
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
      },
    },
  },
}

local function start_treesitter(buf, lang)
  local ok = pcall(vim.treesitter.start, buf, lang)
  if ok then
    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
  return ok
end

local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = group,
  desc = 'Enable treesitter highlighting and indentation (non-blocking)',
  callback = function(event)
    local lang = vim.treesitter.language.get_lang(event.match) or event.match
    local buf = event.buf
    start_treesitter(buf, lang)
  end,
})
vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

local actions = require('telescope.actions')
require('fzf-lua')
require('twilight').setup {}
require('nvim-autopairs').setup {}

require('render-markdown').setup({})
require('lsp').setup()

-- require('tmux').setup {
--   copy_sync = {
--     enabled = true
--   },
--   navigation = {
--     -- enables default keybindings (C-hjkl) for normal mode
--     enable_default_keybindings = true,
--   }
-- }
if vim.env.ZELLIJ ~= nil then
  require('zellij-nav').setup({})
  -- NOTE: Ensures that when exiting NeoVim, Zellij returns to normal mode
  -- vim.api.nvim_create_autocmd("VimLeave", {
  --   pattern = "*",
  --   command = "silent !zellij action switch-mode normal"
  -- })
  vim.fn.system({ "zellij", "action", "switch-mode", "locked" })
  utils.map('n', '<c-h>', ':ZellijNavigateLeft<CR>')
  utils.map('n', '<c-l>', ':ZellijNavigateRight<CR>')
  utils.map('n', '<c-j>', ':ZellijNavigateDown<CR>')
  utils.map('n', '<c-k>', ':ZellijNavigateUp<CR>')
end

require('lualine').setup {
  options = {
    theme = 'nord'
  }
}

require('onenord').setup()

require('smear_cursor').setup {}
require("android").setup()
