local opt = vim.opt

vim.cmd('let $NVIM_TUI_ENABLE_TRUE_COLOR=1')
opt.background = 'dark'
opt.termguicolors = true
-- vim.cmd('colorscheme nightfox')
vim.cmd('colorscheme nordic')
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
]], true)

vim.g.mapleader = ','

