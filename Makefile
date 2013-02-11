INSTALL_PATH = .vim

all: pathogen_plugin git_bundles vim_theme vimrc_file

pathogen_plugin:
	@[ -d $(INSTALL_PATH) ] || mkdir -p $(INSTALL_PATH)
	@[ -d $(INSTALL_PATH)/autoload ] || mkdir -p $(INSTALL_PATH)/autoload
	@echo Getting pathogen plugin...
	@wget -O $(INSTALL_PATH)/autoload/pathogen.vim \
     https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
	@echo Done.

git_bundles:
	@[ -d $(INSTALL_PATH)/bundle ] || mkdir -p $(INSTALL_PATH)/bundle
	@echo Getting Minibufexpl...
	@(cd $(INSTALL_PATH)/bundle && git clone https://github.com/fholgado/minibufexpl.vim.git)
	@echo Done.
	@echo Getting Snipmate...
	@(cd $(INSTALL_PATH)/bundle && git clone https://github.com/msanders/snipmate.vim.git)
	@echo Done.
	@echo Getting Syntastic...
	@(cd $(INSTALL_PATH)/bundle && git clone https://github.com/scrooloose/syntastic.git)
	@echo Done.
	@echo Getting NerdTree...
	@(cd $(INSTALL_PATH)/bundle && git clone https://github.com/scrooloose/nerdtree.git)
	@echo Done.
	@echo Getting Simple Pairs...
	@(cd $(INSTALL_PATH)/bundle && git clone https://github.com/vim-scripts/simple-pairs.git)
	@echo Done.

vim_theme:
	@[ -d $(INSTALL_PATH)/colors ] || mkdir -p $(INSTALL_PATH)/colors
	@echo Copying colortheme...
	@cp colors/tibas.vim $(INSTALL_PATH)/colors/
	@echo Done.

vimrc_file:
	@echo Configure the vimrc
	@echo Backing up the old vimrc...
	@[ -f $(INSTALL_PATH)/.vimrc ] && mv $(INSTALL_PATH).vimrc $(INSTALL_PATH).vimrc_old \
																|| echo vimrc doesn\'t exist.
	@echo Done.
	@echo Copying the new vimrc
	@cp vimrc $(INSTALL_PATH).vimrc
	@echo Done.

clean:
	@echo Clean up .vim directory...
	@rm -rf $(INSTALL_PATH)/autoload/pathogen.vim
	@rm -rf $(INSTALL_PATH)/bundle/minibufexpl.vim
	@rm -rf $(INSTALL_PATH)/bundle/snipmate.vim
	@rm -rf $(INSTALL_PATH)/bundle/syntastic
	@rm -rf $(INSTALL_PATH)/bundle/nerdtree
	@rm -rf $(INSTALL_PATH)/bundle/simple-pairs
	@rm -f $(INSTALL_PATH)/colors/tibas.vim
	@echo Done.
	@echo Restoring old vimrc...
	@[ -f .vimrc_old ] && mv .vimrc .vimrc_bkp &&  @mv .vimrc_old .vimrc \
										|| echo Old vimrc doesn\'t exist.
	@echo Done.

