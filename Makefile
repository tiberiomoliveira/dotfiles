INSTALL_PATH = ~/
VIM_HOME = $(INSTALL_PATH)/.vim

all: pathogen_plugin git_bundles vim_theme vimrc_file

pathogen_plugin:
	@[ -d $(VIM_HOME) ] || mkdir -p $(VIM_HOME)
	@[ -d $(VIM_HOME)/autoload ] || mkdir -p $(VIM_HOME)/autoload
	@echo Getting pathogen plugin...
	@wget -O $(VIM_HOME)/autoload/pathogen.vim \
     https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
	@echo Done.

git_bundles:
	@[ -d $(VIM_HOME)/bundle ] || mkdir -p $(VIM_HOME)/bundle
	@echo Getting Snipmate...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/msanders/snipmate.vim.git || true)
	@echo Done.
	@echo Getting Syntastic...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/scrooloose/syntastic.git || true)
	@echo Done.
	@echo Getting NerdTree...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/scrooloose/nerdtree.git || true)
	@echo Done.
	@echo Getting Vim Nerd Tree Tabs...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/jistr/vim-nerdtree-tabs.git || true)
	@echo Done.
	@echo Getting Simple Pairs...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/vim-scripts/simple-pairs.git || true)
	@echo Done.
	@echo Getting Vim Easytags...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/xolox/vim-easytags.git || true)
	@echo Done.
	@echo Getting Vim Miscellaneous Autoload...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/xolox/vim-misc.git || true)
	@echo Done.


vim_theme:
	@[ -d $(VIM_HOME)/colors ] || mkdir -p $(VIM_HOME)/colors
	@echo Copying colortheme...
	@cp colors/tibas.vim $(VIM_HOME)/colors/
	@echo Done.

vimrc_file:
	@echo Configure the vimrc
	@echo Backing up the old vimrc...
	@[ -f $(INSTALL_PATH)/.vimrc ] && mv $(INSTALL_PATH)/.vimrc $(INSTALL_PATH)/.vimrc_old \
																|| echo vimrc doesn\'t exist.
	@echo Done.
	@echo Copying the new vimrc
	@cp vimrc $(INSTALL_PATH)/.vimrc
	@echo Done.

clean:
	@echo Clean up .vim directory...
	@rm -rf $(VIM_HOME)/autoload/pathogen.vim
	@rm -rf $(VIM_HOME)/bundle/snipmate.vim
	@rm -rf $(VIM_HOME)/bundle/syntastic
	@rm -rf $(VIM_HOME)/bundle/nerdtree
	@rm -rf $(VIM_HOME)/bundle/simple-pairs
	@rm -rf $(VIM_HOME)/bundle/easytags
	@rm -f $(VIM_HOME)/colors/tibas.vim
	@echo Done.
	@echo Restoring old vimrc...
	@[ -f $(INSTALL_PATH)/.vimrc_old ] && mv $(INSTALL_PATH)/.vimrc $(INSTALL_PATH)/.vimrc_bkp \
																			&&  @mv $(INSTALL_PATH)/.vimrc_old $(INSTALL_PATH)/.vimrc \
																			|| echo Old vimrc doesn\'t exist.
	@echo Done.

