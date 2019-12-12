#!/bin/bash

git --version >/dev/null 2>&1
GIT_IS_AVAILABLE=$?

if [ $GIT_IS_AVAILABLE -ne 0 ]; then
    echo "Warn : can not install development environment without 'git'"
    echo "Please install 'git' at first before installing development environment"
    exit 1
fi

vim --version >/dev/null 2>&1
VIM_IS_AVAILABLE=$?

if [ $VIM_IS_AVAILABLE -ne 0 ]; then
    echo "Warn : 'vim' is not installed in your system. No vim configuration will be done!"
fi

INSTALL_PATH=$HOME
DEV_ENV_REPO_NAME=.vim
DEV_ENV_REPO_PATH=$INSTALL_PATH/$DEV_ENV_REPO_NAME
DEV_ENV_REPO_GIT=$DEV_ENV_REPO_NAME.git

if ! [ -e $DEV_ENV_REPO_PATH ]; then
    git clone https://github.com/leialexisjiang/$DEV_ENV_REPO_GIT $DEV_ENV_REPO_PATH
elif [ -d $DEV_ENV_REPO_PATH/.git ]; then 
    cd $DEV_ENV_REPO_PATH && git pull -r
else
    echo "Warn : cannot checkout .vim configuration project!"
    echo "Is $DEV_ENV_REPO_PATH a git directory ?"
    exit 1
fi

backup_local_configuration_file() {
    if [ -e $1 ] && [ ! -L $1 ]; then
        rm -fr "$1_old" && mv $1 $1_old
    fi
}

#---------------------------------------------------------------------------
# Begin : VIM
#---------------------------------------------------------------------------
if [ $VIM_IS_AVAILABLE -eq 0 ]; then
    backup_local_configuraition_file $INSTALL_PATH/.vimrc
    
    ln -snfv $DEV_ENV_REPO_PATH/vimrc $INSTALL_PATH/.vimrc
    
    vundle_installed=true
    VUNDLE_PATH=$INSTALL_PATH/.vim/bundle/Vundle.vim
    if ! [ -e $VUNDLE_PATH ]; then
        git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_PATH
    elif [ -d $VUNDLE_PATH/.git ]; then
        cd $VUNDLE_PATH && git pull -r
    else
        vundle_installed=false
        echo "Warn : cannot get Vundle plugin manager!"
    fi
    if $vundle_installed; then
        echo "try to install vim plugins by vundle"
        vim +PluginInstall +qall
    fi
fi 
#---------------------------------------------------------------------------
# End : VIM
#---------------------------------------------------------------------------
