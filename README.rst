.vimrc
======

Some useful Vim settings for mostly Python programmers.

Main features:

- Correct indentation rules
- Code completion / snippets
- Static syntax checking
- Python refactoring tools
- Git integration
- Some other goodies

Installation
------------

Just clone the repository to your home directory and run `make install`::

    git clone https://github.com/surfmikko/.vim
    cd .vim
    make install

For OS X you need to install a new version of Vim with Python support::

    sudo port install vim +python27

After this override the system Vim in your ~/.bash_profile::

    alias vim=/opt/local/bin/vim
    alias vi=/opt/local/bin/vim
