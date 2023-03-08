require "paq" {
  "savq/paq-nvim";
  -- General plugins
  'rking/ag.vim';
  {'jgdavey/tslime.vim',  branch = 'main'};
  'tpope/vim-fugitive';
  'vim-airline/vim-airline';
  'vim-airline/vim-airline-themes';
  'majutsushi/tagbar'; -- nmap <leader>t :TagbarToggle<CR>
  'scrooloose/nerdtree';
  'tpope/vim-surround';
  'benekastah/neomake';
  'terryma/vim-multiple-cursors';
  'tpope/vim-commentary';
  'tpope/vim-repeat';
  'tpope/vim-unimpaired';
  {'prettier/vim-prettier', run = 'npm install'};

  -- Plugins for nvim 0.5
  {'nvim-treesitter/nvim-treesitter', run = function() vim.api.nvim_command(':TSUpdate') end};
  'nvim-treesitter/playground';
  'nvim-lua/plenary.nvim';
  'nvim-telescope/telescope.nvim';
  'TimUntersberger/neogit';
  'sindrets/diffview.nvim';
  'folke/twilight.nvim';
  'folke/zen-mode.nvim';
  'windwp/nvim-autopairs';
  'aserowy/tmux.nvim';

  -- Plugins for autocomplete on nvim 0.5+
  'neovim/nvim-lspconfig';
  'williamboman/nvim-lsp-installer';
  -- 'tamago324/nlsp-settings.nvim';
  'hrsh7th/nvim-cmp';
  'hrsh7th/cmp-nvim-lsp';
  'dcampos/nvim-snippy';
  'honza/vim-snippets';
  'dcampos/cmp-snippy';
  {'michaelb/sniprun', run = 'bash install.sh'};

  -- Plugins for JavaScript
  'pangloss/vim-javascript';
  'mustache/vim-mustache-handlebars';

  -- Plugins for Ruby
  'skalnik/vim-vroom';
  'tpope/vim-endwise';
  'tpope/vim-bundler';
  'tpope/vim-rails';

  -- Plugins for Go
  'fatih/vim-go';

  -- Plugins for elixir
  'elixir-editors/vim-elixir';

  -- Plugins for elm
  'lambdatoast/elm.vim';

  -- Plugin for clang-based languages
  'keith/swift.vim';

  'kelan/gyp.vim';
  'jparise/vim-graphql';

  -- Themes
  -- 'ajh17/Spacegray.vim';
  'EdenEast/nightfox.nvim'
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

require('nvim-treesitter.configs').setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,
    disable = { "css" },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
}
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    layout_config = {
      width = 0.7,
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
  },
}
require('twilight').setup {}
require('zen-mode').setup {}
require('nvim-autopairs').setup {}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr) ---@diagnostic disable-line
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
end

local lsp_installer = require('nvim-lsp-installer')
lsp_installer.setup{}

local lspconfig = require('lspconfig')
lspconfig.clangd.setup{
  capabilities = capabilities,
  on_attach = on_attach
}
lspconfig.tsserver.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

local snippy = require('snippy')
local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      snippy.expand_snippet(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif snippy.can_expand_or_advance() then
        snippy.expand_or_advance()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif snippy.can_jump(-1) then
        snippy.previous()
      else
        fallback()
      end
    end,
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    },
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'snippy' },
    { name = 'buffer' },
  },
}

require('tmux').setup {
  copy_sync = {
    enabled = true
  },
  navigation = {
    -- enables default keybindings (C-hjkl) for normal mode
    enable_default_keybindings = true,
  }
}

