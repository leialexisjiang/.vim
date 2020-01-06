# How to install .vim ?

Run commands below in `~/Projects`:

```
git clone git@github.com:leialexisjiang/.vim.git && cd .vim && git submodule init && git submodule update
```

Use by symbolic linking:

```shell
ln -snfv ~/Projects/.vim ~/.vim
ln -snfv ~/.vim/vimrc ~/.vimrc
```

Install vundle plugin:
```
vim +PluginInstall +qall
```
