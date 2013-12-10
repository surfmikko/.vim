install:
	rm -rf ~/.vimrc
	ln -s "`pwd`/vimrc" ~/.vimrc
	[ -d bundle/vundle ] || git clone https://github.com/gmarik/vundle.git bundle/vundle
	vim -u vimrc +BundleInstall +q -c ':q'
	# Vundle handles ftdetect incorrectly and breaks UltiSnips
	# https://bugs.launchpad.net/ultisnips/+bug/989905
	[ -d ~/.vim/ftdetect ] || mkdir -p ~/.vim/ftdetect
	ln -s ~/.vim/bundle/ultisnips/ftdetect/UltiSnips.vim ~/.vim/ftdetect/UltiSnips.vim
	

update:
	(cd bundle/vundle; git pull)
	vim -u vimrc +BundleInstall! +q -c ':q'

clean:
	vim -u vimrc +BundleClean! +q -c ':q'

distclean:
	rm -rf bundle
