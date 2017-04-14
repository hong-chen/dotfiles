rm -rf ~/.vim*
ln -sf $PWD/vimrc ~/.vimrc
mkdir -p ~/.vim/after; rm -rf ~/.vim/after/my_snippets; ln -sf $PWD/data/my_snippets ~/.vim/after/my_snippets

rm -rf ~/.gitconfig
ln -sf $PWD/gitconfig ~/.gitconfig

rm -rf ~/.tmux.conf
ln -sf $PWD/tmux.conf ~/.tmux.conf
