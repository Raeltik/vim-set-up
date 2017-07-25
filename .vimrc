let mapleader=','
let maplocalleader=' '
set shell:/bin/sh

" Just Vundle things {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Bundles listed in here
" Plugin 'name/repo'
" Plugin 'git://site/repo.git
" Plugin 'file://path/to/plugin


" Templates {{{
Plugin 'aperezdc/vim-template'
" }}}

" Programming {{{
" Python {{{
Plugin 'davidhalter/jedi-vim'
Plugin 'klen/python-mode'
let g:pymode_lint = 0
Plugin 'tmhedberg/simpylfold'
let g:SimpylFold_docstring_preview = 1

" }}}
" Syntax highlight {{{
Plugin 'gmarik/vim-markdown'
Plugin 'timcharper/textile.vim'
"}}}

" Git integration {{{
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'

nnoremap <leader>W :Gwrite<CR>
nnoremap <leader>C :Gcommit -v<CR>
nnoremap <leader>S :Gstatus \| 7<CR>
inoremap <leader>W <Esc><leader>W
inoremap <leader>C <Esc><leader>C
inoremap <leader>S <Esc><leader>S

Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
"}}}
"}}}

" Utility {{{

Plugin 'Raimondi/delimitMate'

Plugin 'AndrewRadev/splitjoin.vim'
nmap sj :SplitjoinJoin<cr>
nmap sk :SplitjoinSplit<cr>

Plugin 'sjl/gundo.vim'

" statusline {{{


" }}}
" }}}
" Plugin 'SuperTab' {{{
Plugin 'bogado/file-line'
Plugin 'junegunn/vim-easy-align'
Plugin 'vim-scripts/lastpos.vim'

Plugin 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key='<LocalLeader>'
" }}}

" Colors
Plugin 'sjl/badwolf'
let g:badwolf_darkgutter = 1
" Make the tab line much lighter than the background.
let g:badwolf_tabline = 3

call vundle#end()            " required
filetype plugin indent on    " required
" End Vundle
" }}}
" Let's do all the rest of the config!
filetype on
colorscheme badwolf

set relativenumber
set number

" statusline {{{
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2

" }}}

" Text stuff {{{
" Folding {{{

set foldmethod=marker

" Default open all folds
set foldlevel=100

" Toggle folding
nnoremap \ za
vnoremap \ za

" }}}

" Cut/Paste {{{

" to/from the clipboard
map <Leader>y "*y
map <Leader>p "*p

" toggle paste mode
map <Leader>P :set invpaste<CR>

" }}}

" Toggle the search results highlighting {{{

map <silent><Leader>eq :set invhlsearch<CR>

" }}}

" Toggle line numbers {{{

nnoremap <silent><Leader>l :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
  if !&number && !&relativenumber
      set number
      set norelativenumber
  elseif &number && !&relativenumber
      set nonumber
      set relativenumber
  elseif !&number && &relativenumber
      set number
      set relativenumber
  elseif &number && &relativenumber
      set nonumber
      set norelativenumber
  endif
endfunction

" Set the relative number for default
set number
set relativenumber

" }}}

" Show hidden chars {{{

nmap <Leader>eh :set list!<CR>
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

" }}}


" Delete trailing whitespaces {{{

nmap <silent><Leader>et :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" }}}

" Text statistics {{{

" get the total of lines, words, chars and bytes (and for the current position)
map <Leader>es g<C-G>
let delimitMate_expand_space = 1
" }}}
" }}}
