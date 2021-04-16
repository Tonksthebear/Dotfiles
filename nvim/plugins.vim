call plug#begin('~/.vim/plugged')

Plug 'Luxed/ayu-vim' " theme
Plug 'drewtempelmeyer/palenight.vim' "theme

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy search
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' } " preview window and ripgrep
Plug 'mhinz/vim-signify' " show git changes in sidebar
Plug 'Yggdroot/indentLine' " display thin vertical lines for indentation
Plug 'vim-airline/vim-airline' "status at bottom of vim

" -- Rails Support
Plug 'tpope/vim-rails'

" Niceties
Plug 'tpope/vim-endwise' " add closing words to functions
Plug 'tomtom/tcomment_vim' "autocomment
Plug 'ryanoasis/vim-devicons' " icons
Plug 'tmsvg/pear-tree' " pairs brackets and what not
Plug 'tyru/caw.vim'      " comment
Plug 'mhinz/vim-startify' " better vim start screen

" -- LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

" -- Completion
Plug 'hrsh7th/nvim-compe'

" -- Color
Plug 'norcalli/nvim-colorizer.lua'

" -- Snippets
Plug 'hrsh7th/vim-vsnip' | Plug 'kitagry/vs-snippets'

call plug#end()

