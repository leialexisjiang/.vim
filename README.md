# How to install .vim ?

Run commands below in `~`:

```
git clone git@github.com:leialexisjiang/.vim.git && cd .vim && git submodule init && git submodule update
```

Use by symbolic linking:

```shell
ln -snfv ~/.vim/vimrc ~/.vimrc
```

Install vundle plugin:
```
vim +PluginInstall +qall
```
