VIMC:=$(shell  nvim --version &> /dev/null && echo nvim || echo vim) -u vimrc -c

help:
	@echo "make install		Install configuration for Vim & Neovim"
	@echo "make centos7		Install Vim for Centos7"
	@echo "make osx			Install Vim for OSX"

install: clean link_vimrc neoinit autoload/plug.vim ftdetect/snippets.vim pluginstall

clean:
	rm -rf autoload bundle

neoinit:
	mkdir -p ~/.config/nvim/
	ln -fs `pwd`/init.vim ~/.config/nvim/init.vim
	mkdir -p ~/.local/share/nvim/site
	ln -fs `pwd`/autoload ~/.local/share/nvim/site/autoload

link_vimrc:
	ln -fs "`pwd`/vimrc" ~/.vimrc

ftdetect/snippets.vim:
	mkdir -p ftdetect
	ln -fs `pwd`/bundle/ultisnips/ftdetect/snippets.vim \
		`pwd`/ftdetect/snippets.vim

autoload/plug.vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pluginstall:
	${VIMC} ':PlugInstall | qa'

centos7:
	yum -y install epel-release
	yum -y update
	yum -y install neovim python2-neovim python36-neovim

osx:
	port install vim +python37
