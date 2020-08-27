"  _   _ ________  _________  _____
" | | | |_   _|  \/  || ___ \/  __ \
" | | | | | | | .  . || |_/ /| /  \/
" | | | | | | | |\/| ||    / | |
" \ \_/ /_| |_| |  | || |\ \ | \__/\
"  \___/ \___/\_|  |_/\_| \_| \____/
"
" Retinazer's vimrc
" https://github.com/retinazer/dots

let mapleader=" "

" Install Plugins
call plug#begin('~/.vim/plugged')
" Utility
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " Asynchronus color highlighting
Plug 'tpope/vim-surround' " Change surrounds
Plug 'tpope/vim-commentary' " Comment/uncomment lines or blocks
Plug 'tpope/vim-eunuch' " Add unix commands to vim
Plug 'tpope/vim-fugitive' " Git control
Plug 'itchyny/lightline.vim' " Statusline
Plug 'alvan/vim-closetag' " Auto close tags
Plug 'vim-scripts/auto-pairs' " Generate auto pairs
Plug 'airblade/vim-gitgutter' " Show git diff info in gutter
Plug 'vimwiki/vimwiki' " Maintain your own wiki
Plug 'mcchrish/nnn.vim' " File browser
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Multi cursors
Plug 'junegunn/fzf.vim' " Fuzzy search files

" Autocompletion
Plug 'ncm2/ncm2' " Slim, fast, and hackable completion framework for neovim
Plug 'roxma/nvim-yarp' " Remote plugin framework used for ncm2
Plug 'ncm2/ncm2-tmux' " Provide word completions from other tmux panes
Plug 'ncm2/ncm2-bufword' " Completion words from current buffer
Plug 'ncm2/ncm2-path' " Path completion
Plug 'ncm2/ncm2-ultisnips' " Ultisnips integration for ncm2
Plug 'ncm2/ncm2-cssomni' " CSS completion
Plug 'ncm2/ncm2-tern' " Ternjs based javascript completion for ncm2
Plug 'SirVer/ultisnips' " Code snippets engine
Plug 'honza/vim-snippets' " The snippets (seperate from engine)
call plug#end()

" NCM2 Settings
autocmd BufEnter * call ncm2#enable_for_buffer() " enable ncm2 for all buffers
set completeopt=noinsert,menuone,noselect " IMPORTANT: :help Ncm2PopupOpen for more information
set shortmess+=c " suppress the annoying 'match x of y', 'The only match' and 'Pattern not found' messages

" The basics
syntax on
set encoding=UTF-8
set nocompatible
set number relativenumber
set nobackup
set nowritebackup
set termguicolors
filetype plugin indent on

" Save file as sudo when no sudo permissions
cmap w!! w !sudo tee > /dev/null %

" Tab space and shift width
set ts=2 sw=2
set laststatus=2

" Enable autocompletion
set wildmode=longest,list,full

" Settings for lightline
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
set noshowmode " Turn of showing of mode
let g:lightline = {
  \   'colorscheme': 'spacelamp',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': ''
  \}

" Remap switching between splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Clear search highlighting with Escape key
nnoremap <silent><esc> :noh<return><esc>

" Colorscheme
colorscheme spacelamp

" VimWiki
let g:vimwiki_list = [{'path': '~/.local/share/vimwiki/',}]"

" NNN Settings
nnoremap <leader>n :NnnPicker '%:p:h'<CR>
let g:nnn#layout = { 'left': '~20%' } " or right, up, down
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

" Fix splits
set splitbelow splitright

" Remove trailing whitespace on buffer write
autocmd BufWritePre * %s/\s\+$//e

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" Fix indenting visual block
vmap < <gv
vmap > >gv

" Mappings for tabs
nnoremap tn :tabnew<space>

nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>

nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" Compile SASS
autocmd BufWritePost *.sass,*.scss !sass ./*.s*ss ./main.css

" Compile Groff MS to PDF
autocmd BufWritePost *.ms !groff -ms ./*.ms -T pdf > %:r.pdf

" Ultisnips
" Press enter key to trigger snippet expansion
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" Vim Hexokinase
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
" let g:Hexokinase_highlighters = [
" \   'virtual',
" \   'sign_column',
" \   'background',
" \   'backgroundfull',
" \   'foreground',
" \   'foregroundfull'
" \ ]

" pattern to look for
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\ ]
