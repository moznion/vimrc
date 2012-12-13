"vim:set ts=8 sts=2 sw=2 tw=0:

"----------------------------------------------------------------------------
"Vundle
"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'yanktmp.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'tpope/vim-surround'

Bundle 'molokai'

"Perl
Bundle 'hotchpotch/perldoc-vim'
Bundle 'c9s/perlomni.vim'

"JavaScript
Bundle 'pangloss/vim-javascript'

"HTML/CSS
Bundle 'mattn/zencoding-vim'
Bundle 'hail2u/vim-css3-syntax'

filetype plugin indent on

"----------------------------------------------------------------------------
"Searching
"
"Ignoring capital and lower when searching
set ignorecase

"If searching condition includes both of capital and lower, distinguish them
set smartcase

"Doing incremental search
set incsearch

"Highlighting results of searching
set hlsearch

"Hiding highlight of searching results when typed Esc-Esc
set hlsearch
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

"When searching, if target go to last of file go ahead
set wrapscan
"----------------------------------------------------------------------------

"----------------------------------------------------------------------------
"Editing
"
"Width of tab on display
set tabstop=4

"Width of tab
set shiftwidth=4

"Input tab in head of col, it makes indentation number of 'shiftwidth'
set smarttab

"Expanding tab to space
set expandtab

"Make indentation automatically
set autoindent
"set paste

"Make powerfull indentation when insert newline
set smartindent

"Make indentation to written by C
set cindent

"Enabled to delete indent and newline by backspace
set backspace=indent,eol,start

"Showing correspond parenthesis
set showmatch

"Use powerful command line autocompletion
set wildmenu

"Corresponding wrap of text for Japanese
set formatoptions+=mM

"Reset of Japanese input method
au BufNewFile,BufRead * set iminsert=0

"Using clip board of OS
set clipboard+=unnamed

"Yanked characters are stored to clip board of system
set clipboard=unnamed

"If INSERT mode, type 'Ctrl + k' then paste contents of clip both
"imap "*pa TODO
"----------------------------------------------------------------------------

"----------------------------------------------------------------------------
"Displaying
"
"Displaying number of cols
set number

"Displaying ruler
set ruler

"Displaying tabs and newlines
"set list

"Which character as output tabs and newlines
set listchars=tab:>-,extends:<,trail:-,eol:<

"Wrapping long term
set wrap

"Always display the status line
set laststatus=2

"Height of command line
set cmdheight=2

"Show commands on status line
set showcmd

"Show mode on status line
set showmode

"Show title
set title

"Show hex if target is a disabled print character

"Color scheme
colorscheme molokai

"When INSERT mode, change the color of status line
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END
function! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endfunction
" help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
let n = a:nr
let r = ""
while n
let r = '0123456789ABCDEF'[n % 16] . r
let n = n / 16
endwhile
return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
let out = ''
let ix = 0
while ix < strlen(a:str)
let out = out . Nr2Hex(char2nr(a:str[ix]))
let ix = ix + 1
endwhile
return out
endfunc

"Showing full-pitch space
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"Enable highlight current focused line
set cursorline

"Make line only the current window
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END

"Enable syntax highlight
syntax on


"----------------------------------------------------------------------------
"When open files
"
"Remenber cursor position when closed just before
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

"Make skeleton
augroup SkeletonAu
    autocmd!
    autocmd BufNewFile *.pl 0r ~/.vim/skeltons/skelton.pl
augroup END

"----------------------------------------------------------------------------
"Others
"
"Purge compatible with Vi
set nocompatible

"Removing white spaces on end of line when saved
autocmd BufWritePre * :%s/\s\+$//ge

"Don't make backup
set nobackup

"Don't make swap file
set noswapfile

"If rewrite other where, reload automatically
set autoread

"Don't call beep
set vb t_vb=

"Setting of viminfo
set viminfo='50,<1000,s100,\"50

"Escape INSERT mode, turn off the IME automatically
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap :set iminsert=0

"Don't stop cursole on head and end of line
set whichwrap=b,s,h,l,<,>,[,]

"----------------------------------------------------------------------------
"Perl
"
au BufNewFile,BufRead *.pl set shiftwidth=4
au BufNewFile,BufRead *.pm set shiftwidth=4
au BufNewFile,BufRead *.t  set shiftwidth=4

au BufNewFile,BufRead *.html.ep set shiftwidth=2
au BufNewFile,BufRead *.html.ep let mojo_highlight_data = 1

"----------------------------------------------------------------------------
"JavaScript
"
au BufNewFile,BufRead *.js set shiftwidth=4
au BufNewFile,BufRead *.js set tabstop=4

"----------------------------------------------------------------------------
"For neocomplcache
"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Select with <TAB>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

let g:neocomplcache_ctags_arguments_list = {
  \ 'perl' : '-R -h ".pm"'
  \ }

let g:neocomplcache_snippets_dir = "~/.vim/snippets"
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default'    : '',
  \ 'perl'       : $HOME . '/.vim/dict/perl.dict'
  \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" for snippets
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
smap <C-k> <Plug>(neocomplcache_snippets_expand)

"----------------------------------------------------------------------------
"For vim-quickrun
"
" Split horizontally
" Always show processing time
let g:quickrun_config={'*': {'split': '', 'hook/time/enable': '1'}}
set splitbelow

"----------------------------------------------------------------------------
"For yanktmp
"
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>