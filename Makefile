INSTALL_PATH = ~/
VIM_HOME = $(INSTALL_PATH)/.vim
.PHONY: vim_plug vim_theme vimrc_file bashrc gitconfig

all: vimrc_file bashrc gitconfig

vimrc_file:
	@echo Configure the vimrc
	@echo Backing up the old vimrc...
	@[ -f $(INSTALL_PATH)/.vimrc ] && mv $(INSTALL_PATH)/.vimrc $(INSTALL_PATH)/.vimrc_old \
					|| echo vimrc doesn\'t exist.
	@echo Done.
	@echo Copying the new vimrc
	@cp vimrc $(INSTALL_PATH)/.vimrc
	@echo Done.

bashrc:
	@echo Configure the .bashrc
	@cp LESS_TERMCAP $(INSTALL_PATH)/.LESS_TERMCAP
	@echo Backing up the old .bashrc...
	@[ -f $(INSTALL_PATH)/.bashrc ] && cp $(INSTALL_PATH)/.bashrc $(INSTALL_PATH)/.bashrc_old \
					|| echo .bashrc doesn\'t exist.
	@echo Done.
	@echo Adding new .bashrc lines
	@cat ./bashrc >> $(INSTALL_PATH)/.bashrc
	@echo Done.

gitconfig:
	@echo Configure the .gitconfig
	@echo Backing up the old .gitconfig...
	@[ -f $(INSTALL_PATH)/.gitconfig ] && cp $(INSTALL_PATH)/.gitconfig $(INSTALL_PATH)/.bashrc_old \
					|| echo .gitconfig doesn\'t exist.
	@echo Done.
	@echo Adding new .gitconfig lines
	@cat ./gitconfig >> $(INSTALL_PATH)/.gitconfig
	@echo Done.

clean:
	@echo Clean up .vim directory...
	@rm -rf $(VIM_HOME)/autoload/plug.vim
	@rm -rf $(VIM_HOME)/plugged
	@rm -rf $(VIM_HOME)/colors
	@echo Done.
	@echo Restoring old vimrc...
	@[ -f $(INSTALL_PATH)/.vimrc_old ] && mv $(INSTALL_PATH)/.vimrc $(INSTALL_PATH)/.vimrc_bkp \
					&&  @mv $(INSTALL_PATH)/.vimrc_old $(INSTALL_PATH)/.vimrc \
					|| echo Old vimrc doesn\'t exist.
	@echo Restoring old bashrc...
	@[ -f $(INSTALL_PATH)/.bashrc_old ] && mv $(INSTALL_PATH)/.bashrc $(INSTALL_PATH)/.bashrc_bkp \
					&&  @mv $(INSTALL_PATH)/.bashrc_old $(INSTALL_PATH)/.bashrc \
					|| echo Old vimrc doesn\'t exist.
	@echo Done.

