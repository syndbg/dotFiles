install:
	# Copying files
	cp .bashrc .eslintrc .vimrc .zshrc ~/

	# Updating modules
	git submodule init
	git submodule update

	# Copying folders
	cp -R -r .atom/ z/ ~/

	# Installing VIM plugins
	vim +PluginClean +PluginInstall +qall

update:
	git pull
	git submodule init
	git submodule update
	vim +PluginClean +PluginInstall +PluginUpdate +qall
