DOT_CONFIG_DIR=~
DOT_FILES_DIR=~/.dotfiles

ln -s $DOT_FILES_DIR/.vim $DOT_CONFIG_DIR/.vim
ln -s $DOT_FILES_DIR/.vim/.vimrc $DOT_CONFIG_DIR/.vimrc
ln -s $DOT_FILES_DIR/ctags/.ctags $DOT_CONFIG_DIR/.ctags
ln -s $DOT_FILES_DIR/eslint/.eslintrc $DOT_CONFIG_DIR/.eslintrc

ln -s $DOT_FILES_DIR/fzf/.fzf.zsh $DOT_CONFIG_DIR/.fzf.zsh
ln -s $DOT_FILES_DIR/tmux/.tmux.conf $DOT_CONFIG_DIR/.tmux.conf
ln -s $DOT_FILES_DIR/zsh/.zshrc $DOT_CONFIG_DIR/.zshrc

ln -s $DOT_FILES_DIR/git/.gitignore_global $DOT_CONFIG_DIR/.gitignore_global

ln -s $DOT_FILES_DIR/.config/mpv $DOT_CONFIG_DIR/.config/mpv
ln -s $DOT_FILES_DIR/.config/nvim $DOT_CONFIG_DIR/.config/nvim

ln -s $DOT_FILES_DIR/xvim/.xvimrc $DOT_CONFIG_DIR/.xvimrc
