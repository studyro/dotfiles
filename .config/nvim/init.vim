set nocompatible              " be iMproved, required
set re=1
syntax on
filetype on " required
filetype plugin indent on    " required

call plug#begin('~/.vim/plugged')

" General plugins
Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jgdavey/tslime.vim'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar' " nmap <leader>t :TagbarToggle<CR>
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'benekastah/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'radenling/vim-dispatch-neovim'
Plug 'jiangmiao/auto-pairs'
Plug 'janko-m/vim-test'

" Plugins for autocomplete
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" Plugins for JavaScript
Plug 'mxw/vim-jsx'
Plug 'carlitux/deoplete-ternjs'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'

" Plugins for Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'skalnik/vim-vroom'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'

" Plugins for elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Plugins for elm
Plug 'lambdatoast/elm.vim'

" Plugin for Swift
Plug 'https://github.com/keith/swift.vim.git'
" Plug 'mitsuse/autocomplete-swift'

" ll of your Plugins must be added before the following line
call plug#end()

" Colors
" colorscheme Tomorrow-Night
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
colorscheme onehalfdark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 0 " Remove this line if using the default palette.

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
set mouse=a
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
nnoremap <leader>a :Ag<space>
" A remap to search the word under cursor
nnoremap <leader>k :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" A remap to CtrlP Tag searching
nnoremap <leader>o :CtrlPTag<CR>
" A remap to TagBar.vim toggling
nnoremap <leader>t :TagbarToggle<CR>
" A remap to NERDTree toggling
nnoremap <leader>n :NERDTreeToggle<CR>
" A remap to fzf toggling
nnoremap <C-p>     :Files<CR>

" fzf configuration
let g:fzf_height='30%'
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" tslime configuration
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r     <Plug>SetTmuxVars

" vim-test configuration
let test#strategy = "dispatch"
" neomake configurations
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_elixir_enabled_makers = []
autocmd BufWritePost,BufEnter * Neomake
" jsx configurations
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" javascript-libraries-syntax
let g:used_javascript_libs = 'react'

" Configuration for neosnippet.vim
imap <C-f>     <Plug>(neosnippet_expand_or_jump)
smap <C-f>     <Plug>(neosnippet_expand_or_jump)
xmap <C-f>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'

" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<c-n>"

set infercase
set completeopt=preview,menuone
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d

let g:deoplete#enable_at_startup = 1

" Autocompletion for swift
" call sourcekitten_daemon#enable(6600)

" let g:ycm_semantic_triggers =  {
"             \   'c' : ['->', '.'],
"             \   'objc' : ['->', '.'],
"             \   'ocaml' : ['.', '#'],
"             \   'cpp,objcpp' : ['->', '.', '::'],
"             \   'perl' : ['->'],
"             \   'php' : ['->', '::', '"', "'", 'use ', 'namespace ', '\'],
"             \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
"             \   'html,xml,erb,ejs,liquid' : ['<', 're!<.*\s', '</'],
"             \   'vim' : ['#', '_', 'g:', 'v:', 's:', 'b:', 'w:'],
"             \   'lua' : ['.', ':'],
"             \   'erlang' : [':'],
"             \   'haskell' : ['.', 're!.'],
"             \   'css,scss': [ 're!^\s{2}', 're!:\s+' ]
"             \ }

augroup omni_complete
  " clear commands before resetting
  autocmd!
  " Enable omnicomplete for supported filetypes
  autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType elixir setlocal omnifunc=elixircomplete#Complete
augroup END

" Autogroups for some type of files.
augroup configgroup
            autocmd!
            autocmd VimEnter * highlight clear SignColumn
            "autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
            "                        \:call <SID>StripTrailingWhitespaces()
            autocmd FileType java setlocal noexpandtab
            autocmd FileType java setlocal list
            autocmd FileType java setlocal listchars=tab:+\ ,eol:-
            autocmd FileType java setlocal formatprg=par\ -w80\ -T4
            autocmd FileType php setlocal expandtab
            autocmd FileType php setlocal list
            autocmd FileType php setlocal listchars=tab:+\ ,eol:-
            autocmd FileType php setlocal formatprg=par\ -w80\ -T4
            autocmd FileType python setlocal commentstring=#\ %s
            autocmd BufEnter *.cls setlocal filetype=java
            autocmd BufEnter *.zsh-theme setlocal filetype=zsh
            autocmd BufEnter Makefile setlocal noexpandtab
            autocmd BufEnter *.sh setlocal tabstop=2
            autocmd BufEnter *.sh setlocal shiftwidth=2
            autocmd BufEnter *.sh setlocal softtabstop=2
            autocmd BufNewFile,BufRead Fastfile set filetype=ruby
            autocmd BufNewFile,BufRead *.html.eex set filetype=html.eelixir
            autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby
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
