"----------------------------------------------------------------------------
" Vundle
"----------------------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'yanktmp.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'osyo-manga/shabadou.vim'
Bundle 'moznion/shabadou.vim-animation'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'

"" Colorscheme
Bundle 'molokai'

"" Perl
Bundle 'vim-perl/vim-perl'
Bundle 'hotchpotch/perldoc-vim'
Bundle 'c9s/perlomni.vim'
Bundle 'moznion/corelist.vim'
Bundle 'moznion/perl-module-version.vim'

"" JavaScript
Bundle 'pangloss/vim-javascript'

"" HTML/CSS
Bundle 'mattn/zencoding-vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'skammer/vim-css-color'

filetype plugin indent on

"----------------------------------------------------------------------------
"For neocomplcache
"----------------------------------------------------------------------------
"" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

"" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

"" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

"" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

"" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1

"" Select with <TAB>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

let g:neocomplcache_ctags_arguments_list = {
\ 'perl' : '-R -h ".pm"'
\}

let g:neocomplcache_snippets_dir = "~/.vim/snippets"
"" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
\ 'default': '',
\ 'perl'   : $HOME . '/.vim/dict/perl.dict'
\}

"" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"" for snippets
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
smap <C-k> <Plug>(neocomplcache_snippets_expand)

"----------------------------------------------------------------------------
"For vim-quickrun
"----------------------------------------------------------------------------
"" Split horizontally
"" Always show processing time
let g:quickrun_config = {
\ '*': {
\   "hook/simple_anim/enable" : 1,
\   "hook/simple_anim/wait" : 1,
\   'hook/time/enable': 1,
\   'runner': 'vimproc',
\   'runner/vimproc/updatetime': 40,
\   'outputter/buffer/split': ':botright 8sp',
\ }
\}
au FileType quickrun nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType quickrun inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"----------------------------------------------------------------------------
"For yanktmp
"----------------------------------------------------------------------------
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

"----------------------------------------------------------------------------
"For Syntastic
"----------------------------------------------------------------------------
let g:syntastic_mode_map = {
\ 'mode': 'active',
\ 'active_filetypes': ['javascript'],
\ 'passive_filetypes': [],
\}
let g:syntastic_javascript_checker = 'jslint'

"----------------------------------------------------------------------------
"For Unite.vim
"----------------------------------------------------------------------------
"" Inhibit to be the input mode when start unite
let g:unite_enable_start_insert=0
"" Show a buffer list
noremap <silent> ,ub :<C-u>Unite buffer<CR>
"" Show a file list
noremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"" Show a list of used recently
noremap <silent> ,ur :<C-u>Unite file_mru<CR>
"" Show a yanked list
noremap <silent> ,uy :<C-u>Unite -buffer-name=register register<CR>
"" Show a list of file and buffer
noremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
"" Show all of list
noremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"" Close unite buffer by pressing ESC-key twice
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"" Open file by horizontal separate.
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"" Open file by vertical separate.
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

"----------------------------------------------------------------------------
"Searching
"----------------------------------------------------------------------------
"" Ignoring capital and lower case when searching
set ignorecase

"" If searching condition includes both of capital and lower, distinguish them
set smartcase

"" Doing incremental search
set incsearch

"" Highlighting results of searching
set hlsearch

"" Hiding highlight of searching results when typed Esc-Esc
set hlsearch
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

"" When searching, if target go to last of file go ahead
set wrapscan

"----------------------------------------------------------------------------
"Editing
"----------------------------------------------------------------------------
"" Width of tab on display
set tabstop=4

"" Width of tab
set shiftwidth=4

"" Input tab in head of col, it makes indentation number of 'shiftwidth'
set smarttab

"" Expanding tab to space
set expandtab

"" Make indentation automatically
set autoindent

"" Make powerfull indentation when insert newline
set smartindent

"" Make indentation to written by C
set cindent

"" Enabled to delete indent and newline by backspace
set backspace=indent,eol,start

"" Showing correspond parenthesis
set showmatch

"" Use powerful command line autocompletion
set wildmenu

"" Corresponding wrap of text for Japanese
set formatoptions+=mM

"" Reset of Japanese input method
au BufNewFile,BufRead * set iminsert=0

"" Using clip board of OS
set clipboard+=unnamed

"" Yanked characters are stored to clip board of system
set clipboard=unnamed

"" Enabled function of checking spelling
set spell
au BufNewFile,BufRead *.snippets set nospell

"" If INSERT mode, type 'Ctrl + k' then paste contents of clip both
"imap "*pa TODO

"" For pair characters
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>
au BufNewFile,BufRead /*.pl\|*.t\|*.pm imap // //<Left>
au BufNewFile,BufRead /*.pl\|*.t\|*.pm imap /// ///<Left>

"----------------------------------------------------------------------------
"When open files
"----------------------------------------------------------------------------
"" Remenber cursor position when closed just before
if has("autocmd")
  autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif
endif

"" Make skeleton
augroup SkeletonAu
  au!
  au BufNewFile *.pl 0r ~/.vim/skeltons/skelton.pl
  au BufNewFile *.t 0r ~/.vim/skeltons/skelton.t
augroup END

"----------------------------------------------------------------------------
"Others
"----------------------------------------------------------------------------
"" Purge compatible with Vi
set nocompatible

"" Removing white spaces on end of line when saved
autocmd BufWritePre * call s:RemoveWhiteSpaceAtTail()
func! s:RemoveWhiteSpaceAtTail()
  if &ft != 'markdown'
    :%s/\s\+$//ge
  endif
endf

"" Don't make backup
set nobackup

"" Don't make swap file
set noswapfile

"" If rewrite other where, reload automatically
set autoread

"" Don't call beep
set vb t_vb=

"" Setting of viminfo
set viminfo='50,<1000,s100,\"50

"" Escape INSERT mode, turn off the IME automatically
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap :set iminsert=0

"" Don't stop cursole on head and end of line
set whichwrap=b,s,h,l,<,>,[,]

"----------------------------------------------------------------------------
"Displaying
"----------------------------------------------------------------------------
"" Displaying number of cols
set number

"" Displaying ruler
set ruler

"" Which character as output tabs and newlines
set listchars=tab:>-,extends:<,trail:-,eol:<

"" Wrapping long term
set wrap

"" Always display the status line
set laststatus=2

"" Height of command line
set cmdheight=2

"" Show commands on status line
set showcmd

"" Color scheme
set t_Co=256
colorscheme molokai

"" Show hex if target is a disabled print character
func! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endf

"" help eval-examples
"" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endf

"" The function String2Hex() converts each character in a string to a two
"" character Hex string.
func! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endf

"" Showing full-pitch space
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"" Enable highlight current focused line
set cursorline

"" Make line only the current window
augroup cch
  au! cch
  au WinLeave * set nocursorline
  au WinEnter,BufRead * set cursorline
augroup END

"" Enable syntax highlight
syntax on

"----------------------------------------------------------------------------
" Vim script
"----------------------------------------------------------------------------
au BufNewFile,BufRead .vimrc set shiftwidth=2
au BufNewFile,BufRead *.vim set shiftwidth=2

"----------------------------------------------------------------------------
" Perl
"----------------------------------------------------------------------------
augroup filetypedetect
  au! BufNewFile,BufRead *.t setf perl
  au! BufNewFile,BufRead *.psgi setf perl
  au! BufNewFile,BufRead *.pm setf perl
  au! BufNewFile,BufRead *.tt setf tt2html
augroup END
au BufNewFile,BufRead *.t set shiftwidth=4
au BufNewFile,BufRead *.pl set shiftwidth=4
au BufNewFile,BufRead *.pm set shiftwidth=4
au BufNewFile,BufRead *.html.ep set shiftwidth=2
au BufNewFile,BufRead *.html.ep let mojo_highlight_data = 1

""  Template for *.pl
function! s:pm_template()
  let path = substitute(expand('%'), '.*lib/', '', 'g')
  let path = substitute(path, '[\\/]', '::', 'g')
  let path = substitute(path, '\.pm$', '', 'g')

  call append(0, 'package ' . path . ';')
  call append(1, 'use strict;')
  call append(2, 'use warnings;')
  call append(3, 'use utf8;')
  call append(4, '')
  call append(5, '')
  call append(6, '')
  call append(7, '1;')
  call cursor(6, 0)
  " echomsg path
endfunction
au BufNewFile *.pm call s:pm_template()

""  Detect a misprint package name
func! s:get_package_name()
  let mx = '^\s*package\s\+\([^ ;]\+\)'
  for line in getline(1, 5)
    if line =~ mx
      return substitute(matchstr(line, mx), mx, '\1', '')
    endif
  endfor
  return ""
endf
func! s:check_package_name()
    let path = substitute(expand('%:p'), '\\', '/', 'g')
    let name = substitute(s:get_package_name(), '::', '/', 'g') . '.pm'
    if path[-len(name):] != name
        echohl WarningMsg
        echomsg "Maybe package name is different from stored path."
        echomsg "Please correct it."
        echohl None
    endif
endf
au! BufWritePost *.pm call s:check_package_name()

""  Perltidy
map <silent> ,pt <Esc> :%! perltidy -se<CR>
map <silent> ,ptv <Esc> :'<,'>! perltidy -se<CR>

"----------------------------------------------------------------------------
" JavaScript
"----------------------------------------------------------------------------
au BufNewFile,BufRead *.js set shiftwidth=4
au BufNewFile,BufRead *.js set tabstop=4
