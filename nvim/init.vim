scriptencoding utf-8

function! Source(name)
  if has('nvim')
    exec 'source' stdpath('config') . '/' . a:name . '.vim'
  else
    exec 'source' '~/.config/nvim/' . a:name . '.vim'
  endif
endfunc

call Source('plugins')

" -- Theme
set background=dark
colorscheme palenight

" Italics for my favorite color scheme
let g:palenight_terminal_italics=1

"" nvim-comp
set completeopt=menuone,noselect

" -- GUI
set number
syntax on
set tabstop=2
set shiftwidth=0
set expandtab
set smartindent
filetype plugin on
filetype plugin indent on
set fileformat=unix
" Show invisible characters
set listchars=trail:·,nbsp:_,tab:\ \
set list
set hlsearch
set incsearch
set laststatus=2
set nostartofline
set ruler
set showcmd
set noshowmode
set lazyredraw
set ignorecase
set smartcase
set autoread

set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

set ttimeoutlen=10

" Always show the signcolumn
set signcolumn=yes

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let delimitMate_expand_cr=1

" Make Y behave like other capitals
nnoremap Y y$

set diffopt+=iwhite

set scrolloff=5

set undofile " Persistent undo history
set undodir=~/.config/nvim/undo " Undo data location
set directory=~/.config/nvim/swap " Swap file location
set backupdir=~/.config/nvim/backup " Backup file location

" Alt+j/k moves lines down/up (macOS compatible)
nnoremap <A-j> :m+<CR>==
nnoremap ∆ :m+<CR>==
nnoremap <A-k> :m-2<CR>==
nnoremap ˚ :m-2<CR>==
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap ∆ :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv
vnoremap ˚ :m-2<CR>gv=gv

" Alt+h/l decreases/increases indentation level (macOS compatible)
nnoremap <A-h> <<
nnoremap ˙ <<
nnoremap <A-l> >>
nnoremap ¬ >>
vnoremap <A-h> <gv
vnoremap ˙ <gv
vnoremap <A-l> >gv
vnoremap ¬ >gv

set completeopt=menuone,noselect

set updatetime=300




let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
""

function! WorkspaceFolder()
  let project_roots = v:lua.vim.lsp.buf.list_workspace_folders()
  let project_root_count = len(project_roots)
  if (project_root_count == 1)
    return project_roots[0]
  elseif (project_root_count > 1)
    let choices = copy(project_roots)
    call map(choices, 'v:key + 1 . ". " . v:val') " format them
    let index = inputlist(["Specify project root directory"] + choices) - 1
    if (index >= 0 && index < project_root_count)
      return project_roots[index]
    endif
  endif
endfunction

set clipboard=unnamed

if !has('nvim')
  if exists('$TMUX')
    " tmux cursor
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    " iTerm2 cursor
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
endif

let g:tex_flavor='latex'
let g:tex_conceal='abdmg'
set spelllang=en_us,de_de

nnoremap <C-L> :nohlsearch<CR><C-L>

function! s:init_file() abort
  return stdpath("config") . "/init.vim"
endfunction
command! -nargs=0 Config execute "edit " . <SID>init_file()

function! s:lsp_config_file() abort
  return stdpath("config") . "/lua/lsp-settings.lua"
endfunction
command! -nargs=0 LspConfig execute "edit " . <SID>lsp_config_file()

function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

call Source('plugin-settings')

:lua require'init'
