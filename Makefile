INSTALL_PATH = ~/
VIM_HOME = $(INSTALL_PATH)/.vim

all: pathogen_plugin git_bundles vim_theme vimrc_file

pathogen_plugin:
	@[ -d $(VIM_HOME) ] || mkdir -p $(VIM_HOME)
	@[ -d $(VIM_HOME)/autoload ] || mkdir -p $(VIM_HOME)/autoload
	@echo Getting pathogen plugin...
	@curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
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
	@echo Getting Auto Pairs...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/jiangmiao/auto-pairs || true)
	@echo Done.
	@echo Getting Vim Easytags...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/xolox/vim-easytags.git || true)
	@echo Done.
	@echo Getting Vim Miscellaneous Autoload...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/xolox/vim-misc.git || true)
	@echo Done.
	@echo Getting Vim Bracketed Paste...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/ConradIrwin/vim-bracketed-paste.git || true)
	@echo Done.
	@echo Getting Vim Ruby...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/vim-ruby/vim-ruby.git || true)
	@echo Done.
	@echo Getting Vim Rails...
	@(cd $(VIM_HOME)/bundle && git clone git://github.com/tpope/vim-rails.git || true)
	@echo Done.
	@echo Getting Vim Bundler...
	@(cd $(VIM_HOME)/bundle && git clone git://github.com/tpope/vim-bundler.git || true)
	@echo Done.
	@echo Getting Vim Endwise...
	@(cd $(VIM_HOME)/bundle && git clone git://github.com/tpope/vim-endwise.git || true)
	@echo Done.
	@echo Getting Vim Fugitive...
	@(cd $(VIM_HOME)/bundle && git clone git://github.com/tpope/vim-fugitive.git || true)
	@echo Done.
	@echo Getting Vim Gitgutter...
	@(cd $(VIM_HOME)/bundle && git clone git://github.com/airblade/vim-gitgutter.git || true)
	@echo Done.
	@echo Getting Vim Haml...
	@(cd $(VIM_HOME)/bundle && git clone git://github.com/tpope/vim-haml.git || true)
	@echo Done.
	@echo Getting Vim Less...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/groenewege/vim-less.git || true)
	@echo Done.
	@echo Getting Vim CSS Color...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/ap/vim-css-color || true)
	@echo Done.
	@echo Getting Vim CSS3 Syntax...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/hail2u/vim-css3-syntax.git || true)
	@echo Done.
	@echo Getting Vim Emmet...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/mattn/emmet-vim.git || true)
	@echo Done.
	@echo Getting Vim CtrlP...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/kien/ctrlp.vim.git || true)
	@echo Done.
	@echo Getting Vim TComment...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/tomtom/tcomment_vim.git || true)
	@echo Done.
	@echo Getting Seti-ui theme...
	@(cd $(VIM_HOME)/bundle && git clone https://github.com/trusktr/seti.vim.git || true)
	@echo Done.

vim_theme:
	@[ -d $(VIM_HOME)/colors ] || mkdir -p $(VIM_HOME)/colors
	@echo Copying tibas colortheme...
	@cp colors/tibas.vim $(VIM_HOME)/colors/
	@echo Done.
	@echo Copying seti colortheme...
	@cp $(VIM_HOME)/bundle/seti.vim/colors/seii.vim $(VIM_HOME)/colors/seti.vim
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
	@rm -rf $(VIM_HOME)/bundle/vim-easytags
	@rm -rf $(VIM_HOME)/bundle/vim-misc
	@rm -rf $(VIM_HOME)/bundle/vim-bracketed-paste
	@rm -rf $(VIM_HOME)/bundle/vim-ruby
	@rm -rf $(VIM_HOME)/bundle/vim-rails
	@rm -rf $(VIM_HOME)/bundle/vim-bundler
	@rm -rf $(VIM_HOME)/bundle/vim-endwise
	@rm -rf $(VIM_HOME)/bundle/vim-fugitive
	@rm -rf $(VIM_HOME)/bundle/vim-gitgutter
	@rm -rf $(VIM_HOME)/bundle/vim-haml
	@rm -rf $(VIM_HOME)/bundle/vim-less
	@rm -rf $(VIM_HOME)/bundle/vim-css-color
	@rm -rf $(VIM_HOME)/bundle/vim-css3-syntax
	@rm -rf $(VIM_HOME)/bundle/emmet-vim
	@rm -rf $(VIM_HOME)/bundle/ctrl.vim
	@rm -rf $(VIM_HOME)/bundle/tcoment_vim
	@rm -rf $(VIM_HOME)/bundle/seti.vim
	@rm -f $(VIM_HOME)/colors/tibas.vim
	@echo Done.
	@echo Restoring old vimrc...
	@[ -f $(INSTALL_PATH)/.vimrc_old ] && mv $(INSTALL_PATH)/.vimrc $(INSTALL_PATH)/.vimrc_bkp \
					&&  @mv $(INSTALL_PATH)/.vimrc_old $(INSTALL_PATH)/.vimrc \
					|| echo Old vimrc doesn\'t exist.
	@echo Done.

