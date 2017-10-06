INSTALL_PATH = ~/
VIM_HOME = $(INSTALL_PATH)/.vim

all: vim_plug vim_theme vimrc_file

vim_plug:
	@[ -d $(VIM_HOME) ] || mkdir -p $(VIM_HOME)
	@[ -d $(VIM_HOME)/autoload ] || mkdir -p $(VIM_HOME)/autoload
	@echo Getting vim-plug...
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo Done.

vim_theme:
	@[ -d $(VIM_HOME)/colors ] || mkdir -p $(VIM_HOME)/colors
	@echo Copying tibas colortheme...
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
	@rm -rf $(VIM_HOME)/autoload/plug.vim
	@rm -rf $(VIM_HOME)/plugged
	@rm -f $(VIM_HOME)/colors/tibas.vim
	@echo Done.
	@echo Restoring old vimrc...
	@[ -f $(INSTALL_PATH)/.vimrc_old ] && mv $(INSTALL_PATH)/.vimrc $(INSTALL_PATH)/.vimrc_bkp \
					&&  @mv $(INSTALL_PATH)/.vimrc_old $(INSTALL_PATH)/.vimrc \
					|| echo Old vimrc doesn\'t exist.
	@echo Done.

