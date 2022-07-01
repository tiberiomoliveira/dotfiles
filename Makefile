INSTALL_PATH = ~/
VIM_HOME = $(INSTALL_PATH)/.vim
CONFIG_PATH = $(INSTALL_PATH)/.config
HOME_FILES = bashrc gitconfig vimrc tmux.conf
CONFIG_FILES = i3-config i3status-config i3-bin-rofi_app_launcher
TARGETS_COPY = $(addsuffix .copy,$(HOME_FILES))
TARGETS_CLEAN = $(addsuffix .clean,$(HOME_FILES))
TARGETS_CONFIG = $(subst -,/,$(CONFIG_FILES))
.PHONY: config $(TARGETS_CONFIG) $(TARGETS_COPY) $(TARGETS_CLEAN)

all: $(TARGETS_COPY) vim_plug fonts_powerline

$(TARGETS_COPY): %.copy:
	@[ -f $(INSTALL_PATH)/.$* ] && echo Backing up the old .$*\
		&& cp $(INSTALL_PATH)/.$* $(INSTALL_PATH)/.$*_old \
		|| echo .$* doesn\'t exist.
	@echo Copying the new .$*
	cat $* >> $(INSTALL_PATH)/.$*
	@echo Done.

vim_plug:
	@curl -fLo $(VIM_HOME)/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

fonts_powerline:
	@git clone https://github.com/powerline/fonts.git --depth=1
	@cd fonts && ./install.sh && fc-cache -f -r -v
	@cd .. && rm -rf fonts

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

config: $(TARGETS_CONFIG)

$(TARGETS_CONFIG):
	@echo Copying config $@ to $(CONFIG_PATH)
	@mkdir -p $(CONFIG_PATH)/$(@D)
	@cat $(subst /,-,$@) > $(CONFIG_PATH)/$@
	@echo Done.

clean: | vim_home.clean $(TARGETS_CLEAN)
