"----------------------------------------------------------------------------
" neobundle
"----------------------------------------------------------------------------
"" Purge compatible with Vi
set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
\   'build': {
\       'cygwin': 'make -f make_cygwin.mak',
\       'mac': 'make -f make_mac.mak',
\       'unix': 'make -f make_unix.mak',
\   },
\}
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'moznion/shabadou.vim-animation', {
\   'depends': 'osyo-manga/shabadou.vim'
\}
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Lokaltog/vim-powerline'

"" Input Support
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'yanktmp.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'h1mesuke/textobj-wiw'

"" Colorscheme
NeoBundle 'molokai'

"" Perl
NeoBundleLazy 'vim-perl/vim-perl'
NeoBundleLazy 'hotchpotch/perldoc-vim'
NeoBundleLazy 'c9s/perlomni.vim'
NeoBundleLazy 'moznion/corelist.vim'
NeoBundleLazy 'moznion/perl-module-version.vim'

"" Ruby
NeoBundleLazy 'vim-ruby/vim-ruby'
NeoBundleLazy 'taq/vim-rspec'
NeoBundleLazy 'taichouchou2/vim-rails'
NeoBundleLazy 'romanvbabenko/rails.vim'
NeoBundleLazy 'rhysd/neco-ruby-keyword-args'
NeoBundleLazy 'ujihisa/unite-rake'
NeoBundleLazy 'basyura/unite-rails'
NeoBundleLazy 'rhysd/unite-ruby-require.vim'
NeoBundleLazy 'vim-scripts/ruby-matchit'
NeoBundleLazy 'rhysd/vim-textobj-ruby'

"" JavaScript
NeoBundleLazy 'pangloss/vim-javascript'

"" Java
NeoBundleLazy 'vim-scripts/javacomplete', {
\   'build': {
\       'cygwin': 'javac autoload/Reflection.java',
\       'mac': 'javac autoload/Reflection.java',
\       'unix': 'javac autoload/Reflection.java',
\   },
\}
NeoBundleLazy 'moznion/jcommenter.vim'
NeoBundleLazy 'moznion/java_getset.vim'

"" HTML/CSS
NeoBundleLazy 'mattn/zencoding-vim'
NeoBundleLazy 'hail2u/vim-css3-syntax'
NeoBundleLazy 'skammer/vim-css-color'

filetype plugin indent on

"" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif

"----------------------------------------------------------------------------
"For neocomplcache
"----------------------------------------------------------------------------
"" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

"" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

"" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

"" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

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

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"" <CR>: close popup and save indent.
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
func! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endf

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
" For tcomment_vim
"----------------------------------------------------------------------------
let g:tcommentMapLeader1 = '<C-C>'

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
au FileType vim set shiftwidth=2 tabstop=2

"----------------------------------------------------------------------------
" Perl
"----------------------------------------------------------------------------
augroup filetypedetect
  au! BufNewFile,BufRead *.t setf perl
  au! BufNewFile,BufRead *.psgi setf perl
  au! BufNewFile,BufRead *.pm setf perl
  au! BufNewFile,BufRead *.tt setf tt2html
augroup END

au! BufNewFile,BufRead *.html.ep set shiftwidth=2
au! BufNewFile,BufRead *.html.ep let mojo_highlight_data = 1
au! FileType perl set shiftwidth=4 tabstop=4
au FileType perl NeoBundleSource
      \ vim-perl
      \ perldoc-vim
      \ perlomni.vim
      \ corelist.vim
      \ perl-module-version.vim

""  Template for *.pm
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
au FileType javascript NeoBundleSource
      \ vim-javascript
au FileType javascript set shiftwidth=4 tabstop=4

"----------------------------------------------------------------------------
" HTML/CSS
"----------------------------------------------------------------------------
au FileType html,css NeoBundleSource
      \ zencoding-vim
      \ vim-css3-syntax
      \ vim-css-color

"----------------------------------------------------------------------------
" Ruby
"----------------------------------------------------------------------------
au FileType ruby NeoBundleSource
      \ vim-ruby
      \ vim-rspec
      \ vim-rails
      \ rails.vim
      \ neco-ruby-keyword-args
      \ unite-rake
      \ unite-rails
      \ unite-ruby-require.vim
      \ ruby-matchit
      \ vim-textobj-ruby
au FileType ruby set shiftwidth=2 tabstop=2

"----------------------------------------------------------------------------
" Java
"----------------------------------------------------------------------------
au FileType java NeoBundleSource
      \ javacomplete
      \ jcommenter.vim
      \ java_getset.vim

au FileType java setlocal
      \ omnifunc=javacomplete#Complete
      \ completefunc=javacomplete#CompleteParamsInfo

au FileType java set
      \ shiftwidth=4
      \ tabstop=4

"" Set key map for jcommenter
au FileType java map <C-c><C-j> :call JCommentWriter()<CR>

"" Apply K&R style block to java_getset (This is unique function)
let b:javagetset_enable_K_and_R=1

"" Add "this" keyword to member of getter and setter
let b:javagetset_add_this=1

"" Syntax highlight
let g:java_highlight_all=1
let g:java_highlight_debug=1
let g:java_allow_cpp_keywords=1
let g:java_space_errors=1
let g:java_highlight_functions=1
