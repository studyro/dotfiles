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
"Plug 'kien/ctrlp.vim'
"Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer', 'on': [] }
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'majutsushi/tagbar' " nmap <leader>t :TagbarToggle<CR>
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'benekastah/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'

" Plugins for JavaScript
Plug 'mxw/vim-jsx'
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

" Plugin for Swift
Plug 'https://github.com/keith/swift.vim.git'

" ll of your Plugins must be added before the following line
call plug#end()

" lazy-load ultrasnips and ycm
augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
                     \| call youcompleteme#Enable() | autocmd! load_us_ycm
augroup END

" Colors
" colorscheme Tomorrow-Night
set background=dark
colorscheme hybrid
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
set foldmethod=indent
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
" A remap to CtrlP Tag searching
nnoremap <leader>o :CtrlPTag<CR>
" A remap to TagBar.vim toggling
nnoremap <leader>t :TagbarToggle<CR>
" A remap to NERDTree toggling
nnoremap <leader>n :NERDTreeToggle<CR>
" A remap to fzf toggling
nnoremap <C-p>     :Files<CR>

" Configuration for ctrlp.vim
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git\|node_modules\|bin\|\.hg\|\.svn\|build\|log\|resources\|coverage\|doc\|tmp\|public/assets\|vendor\|Android',
  \ 'file': '\.jpg$\|\.exe$\|\.so$\|tags$\|\.dll$'
  \ }
" CtrlP Funky
" let g:ctrlp_extensions = ['funky']
" let g:ctrlp_funky_multi_buffers = 1
" fzf configuration
let g:fzf_height='30%'
" syntastic configurations
" let g:syntastic_javascript_checkers = ['eslint']
" neomake configurations
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_elixir_enabled_makers = []
autocmd BufWritePost,BufEnter * Neomake
" jsx configurations
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" javascript-libraries-syntax
let g:used_javascript_libs = 'react'

" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" Configuration for ultisnips.vim
"let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" let g:UltiSnipsEditSplit="vertical"

" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<c-n>"

set infercase
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d

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
