install:
	[ -d bundle/vundle ] || git clone https://github.com/gmarik/vundle.git bundle/vundle
	rm -rf ~/.vimrc
	ln -s "`pwd`/vimrc" ~/.vimrc
