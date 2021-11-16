local opt = vim.opt
local g = vim.g

-- Basic Configurations
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.number = true
opt.showcmd = true
opt.cursorline = true
opt.showmatch = true
opt.lazyredraw = true
opt.wildmenu = true
opt.shell = 'zsh'
opt.clipboard = 'unnamed'
opt.splitright = true
opt.splitbelow = true
-- set mouse=a
opt.tags = './tags,tags;$HOME;gem.tags'
opt.laststatus = 2

-- Folding
opt.foldmethod = 'syntax'
opt.foldlevel = 1
opt.foldnestmax = 10

opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.infercase = true
opt.completeopt = 'menu,menuone,noselect'
opt.omnifunc = 'syntaxcomplete#Complete'
opt.completefunc = 'syntaxcomplete#Complete'
opt.complete = '.,w,b,u,U,t,i,d'

opt.wildmode = 'longest,list:longest'
opt.wildignore = {
  '*.o','*.out','*.obj','.git','*.rbc','*.rbo','*.class','.svn','*.gem',
  '*.gif','*.jpg','*.png','*.log',
  '*.zip','*.tar.gz','*.tar.bz2','*.rar','*.tar.xz',
  '*/vendor/gems/*','*/vendor/cache/*','*/.bundle/*','*/.sass-cache/*',
  '*/tmp/cache/assets/*/sprockets/*','*/tmp/cache/assets/*/sass/*',
  '*/resources/*',
  'node_modules/*',
  '*.swp','*~,._*',
  '.DS_Store'
}

vim.api.nvim_exec([[
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
]])

g.leader = ','

-- plugins
g.ag_highlight = 1

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
