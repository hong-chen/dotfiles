ln -sf $PWD/vimrc ~/.vimrc

ln -sf $PWD/gitconfig ~/.gitconfig

mkdir -p ~/.vim/after; rm -rf ~/.vim/after/my_snippets; ln -sf $PWD/my_snippets ~/.vim/after/my_snippets
