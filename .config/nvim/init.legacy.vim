call plug#begin('~/.vim/plugged')

" General plugins
Plug 'rking/ag.vim'
Plug 'jgdavey/tslime.vim', { 'branch': 'main' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar' " nmap <leader>t :TagbarToggle<CR>
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'benekastah/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Plugins for nvim 0.5
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'TimUntersberger/neogit'
Plug 'sindrets/diffview.nvim'
Plug 'folke/twilight.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'windwp/nvim-autopairs'
" Plug 'kyazdani42/nvim-web-devicons'

" Plugins for autocomplete on nvim 0.5+
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'dcampos/nvim-snippy'
Plug 'honza/vim-snippets'
Plug 'dcampos/cmp-snippy'

" Plugins for JavaScript
Plug 'pangloss/vim-javascript'
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'mustache/vim-mustache-handlebars'

" Plugins for Ruby
Plug 'skalnik/vim-vroom'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'

" Plugins for Go
Plug 'fatih/vim-go'

" Plugins for elixir
Plug 'elixir-editors/vim-elixir'

" Plugins for elm
Plug 'lambdatoast/elm.vim'

" Plugin for clang-based languages
Plug 'https://github.com/keith/swift.vim.git'

Plug 'kelan/gyp.vim'
Plug 'jparise/vim-graphql'

" Themes
Plug 'ajh17/Spacegray.vim'

" ll of your Plugins must be added before the following line
call plug#end()

" Colors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
colorscheme spacegray_custom
let g:airline_theme='onedark'
" colorscheme nova

" Basic Configurations
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number
set showcmd
set cursorline
set showmatch
set lazyredraw
set wildmenu
set shell=zsh
set clipboard=unnamed
set splitright
set splitbelow
" set mouse=a
set tags=./tags,tags;$HOME
set laststatus=2

" Folding
set foldmethod=syntax
set foldlevel=1
set foldnestmax=10
set nofoldenable " Open all folds by default

" Searching
set incsearch
set hlsearch
set ignorecase
set smartcase
set tags+=gems.tags " Add gems.tags to files searched for tags
nnoremap <leader><space> :nohlsearch<CR>

" Leader
let mapleader=","

" Autocompletion
" set complete=.,b,]
set wildmode=longest,list:longest
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.gif,*.jpg,*.png,*.log
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*/resources/*
set wildignore+=node_modules/*
set wildignore+=*.swp,*~,._*
set wildignore+=.DS_Store

" A remap to Ag.vim
nnoremap <leader>a :Ag!<space>
" A remap to search the word under cursor
nnoremap <leader>k :Ag! "\b<C-R><C-W>\b"
" A remap to TagBar.vim toggling
nnoremap <leader>t :TagbarToggle<CR>
" A remap to NERDTree toggling
nnoremap <leader>n :NERDTreeToggle<CR>

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
let g:ag_highlight=1

" telescope.nvim configurations
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope live_grep<CR>

" Neogit
nnoremap <leader>g :Neogit<CR>

" tslime configuration
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r     <Plug>SetTmuxVars

" neomake configurations
let g:neomake_html_eelixir_enabled_makers = []
autocmd BufWritePost,BufEnter * Neomake
" jsx configurations
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" javascript-libraries-syntax
let g:used_javascript_libs = 'react'

" vim-go configurations
let g:go_code_completion_enabled = 0
let g:go_gopls_enabled = 0 " disable gopls for vim-go, we use coc-go for code completion
let g:go_def_mapping_enabled = 0
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

set infercase
set completeopt=menu,menuone,noselect
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d

" Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" Autogroups for some type of files.
augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.sh setlocal tabstop=2
  autocmd BufEnter *.sh setlocal shiftwidth=2
  autocmd BufEnter *.sh setlocal softtabstop=2
  autocmd BufNewFile,BufRead Fastfile set filetype=ruby
  autocmd BufNewFile,BufRead Dangerfile set filetype=ruby
  autocmd BufNewFile,BufRead Appfile set filetype=ruby
  autocmd FileType typescript,typescript.tsx setlocal indentkeys+=0
augroup END

" Tmux + Vim navigating.
" http://www.codeography.com/2013/06/19/navigating-vim-and-tmux-splits
if exists('$TMUX')
        function! TmuxOrSplitSwitch(wincmd, tmuxdir)
                let previous_winnr = winnr()
                silent! execute "wincmd " . a:wincmd
                if previous_winnr == winnr()
                        call system("tmux select-pane -" . a:tmuxdir)
                        redraw!
                endif
        endfunction

        let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
        let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
        let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

        nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
        nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
        nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
        nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
        map <C-h> <C-w>h
        map <C-j> <C-w>j
        map <C-k> <C-w>k
        map <C-l> <C-w>l
endif

nnoremap <leader>h :TSHighlightCapturesUnderCursor<CR>

lua <<EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
end

local lsp_installer = require('nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if server.name == "sumneko_lua" then
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  end

  server:setup(opts)
end)

local snippy = require('snippy')
local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      snippy.expand_snippet(args.body)
    end,
  },
  mapping = {
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
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'snippy' },
    { name = 'buffer' },
  },
}
EOF

