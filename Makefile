INSTALL_PATH = ./test_dir
VIM_HOME = $(INSTALL_PATH)/.vim
HOME_FILES = bashrc gitconfig vimrc termite.config tmux.conf LESS_TERMCAP
#CONFIG_FILES = i3-config i3-status
TARGETS_COPY = $(addsuffix .copy,$(HOME_FILES))
TARGETS_CLEAN = $(addsuffix .clean,$(HOME_FILES))
.PHONY: $(TARGETS_COPY) $(TARGETS_CLEAN)

all: $(TARGETS_COPY)

$(TARGETS_COPY): %.copy:
	@[ -f $(INSTALL_PATH)/.$* ] && echo Backing up the old .$*\
		&& cp $(INSTALL_PATH)/.$* $(INSTALL_PATH)/.$*_old \
		|| echo .$* doesn\'t exist.
	@echo Copying the new .$*
	cat $* >> $(INSTALL_PATH)/.$*
	@echo Done.

vim_home.clean:
	@echo Clean up .vim directory
	rm -rf $(VIM_HOME)/autoload/plug.vim
	rm -rf $(VIM_HOME)/plugged
	rm -rf $(VIM_HOME)/colors
	@echo Done.

$(TARGETS_CLEAN): %.clean:
	@echo Restoring old $*...
	@[ -f $(INSTALL_PATH)/.$*_old ] && mv $(INSTALL_PATH)/.$* $(INSTALL_PATH)/.$*_bkp \
		&& mv $(INSTALL_PATH)/.$*_old $(INSTALL_PATH)/.$* \
		|| echo .$*_old doesn\'t exist.

clean: | vim_home.clean $(TARGETS_CLEAN)
