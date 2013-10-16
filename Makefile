install:
	rm -rf ~/.vimrc
	ln -s "`pwd`/vimrc" ~/.vimrc
	[ -d bundle/vundle ] || git clone https://github.com/gmarik/vundle.git bundle/vundle
	vim -u vimrc +BundleInstall +q -c ':q'

update:
	(cd bundle/vundle; git pull)
	vim -u vimrc +BundleInstall! +q -c ':q'

clean:
	vim -u vimrc +BundleClean! +q -c ':q'

distclean:
	rm -rf bundle
