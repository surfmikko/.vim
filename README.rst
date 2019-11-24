.vimrc
======

Useful Vim settings for mostly Python developers.

- Fast fuzzy file search
- Code completion / snippets
- Python indentation rules
- Python refactoring tools
- Static code analysis
- Git integration

More help with::

    :h cheatsheet

Installation
------------

Requirements:

- Vim8.0 or Neovim v0.3.0 (with python-neovim)
- Python3 support for latest UltiSnips (v3.2 with Python2)

Just clone the repository to your home directory and run `make install`::

    git clone https://github.com/surfmikko/.vim
    cd .vim
    make install

For Centos7 you can install Neovim from the Epel repository::
    
    sudo make centos7

For OS X you can install recent Vim8.1 from the Macports repository::

    sudo make osx

For OSX you may want to override system Vim in your ~/.bash_profile::

    export PATH="$PATH:/opt/local/bin"
    VIM=/opt/local/bin/vim
    alias vi=$VIM
    alias vim=$VIM
    export VISUAL=$VIM
    export EDITOR=$VIM
