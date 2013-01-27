scriptencoding utf-8

"----------------------------------------------------------------------------
" NeoBundle
"----------------------------------------------------------------------------
" Initialize for NeoBundle {{{
set nocompatible   "Purge compatible with Vi

" Switch the protocol used by NeoBundle,
" according to description in '.vimrc.local' {{{
if filereadable($HOME . '/.vimrc.local')
  source $HOME/.vimrc.local
endif
"}}} Default Protocol: 'git'

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
"}}}

NeoBundleFetch 'Shougo/neobundle.vim'

" General {{{
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
NeoBundle 'moznion/shabadou.vim-animation', { 'depends': 'osyo-manga/shabadou.vim' }
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'molokai'
"}}}

" Input Support {{{
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'h1mesuke/textobj-wiw'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tsaleh/vim-matchit'
"}}}

" Perl {{{
NeoBundleLazy 'vim-perl/vim-perl'
NeoBundleLazy 'hotchpotch/perldoc-vim'
NeoBundleLazy 'c9s/perlomni.vim'
NeoBundleLazy 'moznion/corelist.vim'
NeoBundleLazy 'moznion/perl-module-version.vim'
func! s:LazyLoadForPerl()
  au FileType perl NeoBundleSource
        \ vim-perl
        \ perldoc-vim
        \ perlomni.vim
        \ corelist.vim
        \ perl-module-version.vim
endf
"}}}

" Ruby {{{
NeoBundleLazy 'vim-ruby/vim-ruby'
NeoBundleLazy 'taq/vim-rspec'
NeoBundleLazy 'tpope/vim-rails'
NeoBundleLazy 'romanvbabenko/rails.vim'
NeoBundleLazy 'rhysd/neco-ruby-keyword-args'
NeoBundleLazy 'ujihisa/unite-rake'
NeoBundleLazy 'basyura/unite-rails'
NeoBundleLazy 'rhysd/unite-ruby-require.vim'
NeoBundleLazy 'vim-scripts/ruby-matchit'
NeoBundleLazy 'rhysd/vim-textobj-ruby'
func! s:LazyLoadForRuby()
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
endf
"}}}

" JavaScript {{{
NeoBundleLazy 'pangloss/vim-javascript'
NeoBundleLazy 'jelera/vim-javascript-syntax'
NeoBundleLazy 'teramako/jscomplete-vim'
func! s:LazyLoadForJavaScript()
  au FileType javascript NeoBundleSource
        \ vim-javascript
        \ vim-javascript-syntax
        \ jscomplete-vim
endf
"}}}

" Java {{{
NeoBundleLazy 'vim-scripts/javacomplete', {
\   'build': {
\       'cygwin': 'javac autoload/Reflection.java',
\       'mac': 'javac autoload/Reflection.java',
\       'unix': 'javac autoload/Reflection.java',
\   },
\}
NeoBundleLazy 'moznion/jcommenter.vim'
NeoBundleLazy 'moznion/java_getset.vim'
func! s:LazyLoadForJava()
  au FileType java NeoBundleSource
        \ javacomplete
        \ jcommenter.vim
        \ java_getset.vim
endf
"}}}

" HTML/CSS {{{
NeoBundleLazy 'mattn/zencoding-vim'
NeoBundleLazy 'hail2u/vim-css3-syntax'
NeoBundleLazy 'lilydjwg/colorizer'
NeoBundleLazy 'othree/html5.vim', {
\   'build': {
\       'cygwin': 'make',
\       'mac': 'make',
\       'unix': 'make',
\   },
\}
func! s:LazyLoadForHtmlCss()
  au FileType html,css NeoBundleSource
        \ zencoding-vim
        \ vim-css3-syntax
        \ colorizer
        \ html5.vim
endf
"}}}

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif

"----------------------------------------------------------------------------
" Initialize
"----------------------------------------------------------------------------
" Reload .vimrc
nnoremap <silent> <C-s><C-r> :<C-U>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>

" Open .vimrc on new buffer
nnoremap <silent> <C-s><C-e> :e $MYVIMRC<CR>

" Open snippet definition file {{{
let s:snippetDir = $HOME . '/.vim/snippets/'
func! b:openSnippetFile()
  let s:snippetLocate = s:snippetDir . &filetype . '.snippets'
  execute ':e' . s:snippetLocate
endf
nnoremap <silent> <C-s><C-s> :call b:openSnippetFile()<CR>
"}}}

augroup detectfiletype
  au!
  au BufNewFile,BufRead *.t setf perl
  au BufNewFile,BufRead *.psgi setf perl
  au BufNewFile,BufRead *.pm setf perl
  au BufNewFile,BufRead *.tt setf tt2html
augroup END

augroup MyAutoCmd
  au!
  au BufNewFile * set fileformat=unix
  au BufNewFile * set fileencoding=utf-8
augroup END

filetype plugin indent on
syntax on

let g:mapleader = ','

"----------------------------------------------------------------------------
"For neocomplcache
"----------------------------------------------------------------------------
let g:acp_enableAtStartup = 0                           "Disable AutoComplPop.
let g:neocomplcache_enable_at_startup = 1               " Use neocomplcache.
let g:neocomplcache_min_syntax_length = 3               "Set minimum keyword length to pop up.
let g:neocomplcache_enable_smart_case = 1               "Use smart case.
let g:neocomplcache_enable_underbar_completion = 1      "Use under bar completion.
let g:neocomplcache_enable_camel_case_completion = 1    "Use camel case completion.
let g:neocomplcache_snippets_dir = "~/.vim/snippets"
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_ctags_arguments_list = {
\ 'perl' : '-R -h ".pm"'
\}

let g:neocomplcache_dictionary_filetype_lists = {
\ 'default': '',
\ 'perl'   : $HOME . '/.vim/dict/perl.dict'
\}

" Define keyword. {{{
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"}}}

" Enable heavy omni completion {{{
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"}}}

" Key mapping for neocomplcache {{{
" Select with <TAB>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" <CR>: close pop up and save indent.
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
func! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endf

" for snippets
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
smap <C-k> <Plug>(neocomplcache_snippets_expand)
"}}}

"----------------------------------------------------------------------------
"For vim-quickrun
"----------------------------------------------------------------------------
let g:quickrun_config = {
\ '*': {
\   'hook/simple_anim/enable' : 1,
\   'hook/simple_anim/wait' : 1,
\   'hook/time/enable': 1,
\   'runner': 'vimproc',
\   'runner/vimproc/updatetime': 40,
\   'outputter/buffer/split': ':botright 8sp',
\ }
\}
map <silent>\r :QuickRun<CR>
augroup QuickrunAutoCmd
    au!
    au FileType quickrun nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
    au FileType quickrun inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
augroup END

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
" Unite.vim
"----------------------------------------------------------------------------
let g:unite_enable_start_insert=0 "Inhibit to be the input mode when start unite
" Show a buffer list
noremap <silent><Leader>ub : <C-u>Unite buffer<CR>
" Show a file list
noremap <silent><Leader>uf : <C-u>UniteWithBufferDir -buffer-name=files file<CR>
" Show a list of used recently
noremap <silent><Leader>ur : <C-u>Unite file_mru<CR>
" Show a yanked list
noremap <silent><Leader>uy : <C-u>Unite -buffer-name=register register<CR>
" Show a list of file and buffer
noremap <silent><Leader>uu : <C-u>Unite buffer file_mru<CR>
" Show all of list
noremap <silent><Leader>ua : <C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

augroup UniteAutoCmd
  au!
  " Close unite buffer by pressing ESC-key twice
  au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
  au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
  " Open file by horizontal separate.
  au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  " Open file by vertical separate.
  au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
augroup END

"----------------------------------------------------------------------------
" vim-surround
"----------------------------------------------------------------------------
func! b:surroundAutoDetect(command)
  let s:command = (a:command == 'ci') ? 'di' : a:command
  let s:autoSurroundCommand = s:command . getline('.')[col('.')-1]

  if a:command == 'ci'
    silent execute 'normal!' . s:autoSurroundCommand
    startinsert
  else
    call feedkeys(s:autoSurroundCommand)
  endif
endf

nnoremap <silent>dii :call b:surroundAutoDetect('di')<CR>
nnoremap <silent>yii :call b:surroundAutoDetect('yi')<CR>
nnoremap <silent>cii :call b:surroundAutoDetect('ci')<CR>
nnoremap <silent>css :call b:surroundAutoDetect('cs')<CR>
nnoremap <silent>dss :call b:surroundAutoDetect('ds')<CR>

"----------------------------------------------------------------------------
" Searching
"----------------------------------------------------------------------------
set ignorecase  "Ignoring capital and lower case when searching
set smartcase   "If searching condition includes both of capital and lower, distinguish them
set incsearch   "Doing incremental search
set wrapscan    "Enable wrap search
set hlsearch    "Highlighting results of searching

" Hiding highlight of searching when typed Esc-Esc {{{
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#
"}}}

"----------------------------------------------------------------------------
" Editing
"----------------------------------------------------------------------------
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start  "Enable to delete indent and newline by backspace
set showmatch                   "Showing correspond parenthesis
set clipboard+=unnamed          "Use OS clip board

" Indent {{{
set autoindent
set smartindent
set cindent
set smarttab
set expandtab
"}}}

" For Japanese {{{
set formatoptions+=mM                             "wrap text for Japanese
au MyAutoCmd BufNewFile,BufRead * set iminsert=0  "Reset the Japanese input method
"}}}

" Checking spelling {{{
set spell
au MyAutoCmd BufNewFile,BufRead *.snippets set nospell
"}}}

" Removing white spaces on end of line when saved file {{{
au MyAutoCmd BufWritePre * call s:RemoveWhiteSpaceAtTail()
func! s:RemoveWhiteSpaceAtTail()
  if &ft != 'markdown'
    :%s/\s\+$//ge
  endif
endf
"}}}

" For pair characters {{{
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>
"}}}

"----------------------------------------------------------------------------
" When open the file
"----------------------------------------------------------------------------
" Remember cursor position when closed just before {{{
if has("autocmd")
  au MyAutoCmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
endif
"}}}

" Apply Skeleton {{{
augroup SkeletonAu
  au!
  au BufNewFile *.pl 0r ~/.vim/skeltons/skelton.pl
  au BufNewFile *.t 0r ~/.vim/skeltons/skelton.t
augroup END
"}}}

"----------------------------------------------------------------------------
" Others
"----------------------------------------------------------------------------
set wildmenu    "Use powerful command line auto-completion
set nobackup    "Inhibit making backup
set noswapfile  "Inhibit creating swap file
set autoread    "Reload automatically
set vb t_vb=    "Disable beep
set viminfo='50,<1000,s100,\"50
set whichwrap=b,s,h,l,<,>,[,]   "Don't stop cursole on head and end of line

" Escape INSERT mode, turn off the IME automatically {{{
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap :set iminsert=0
"}}}

" Kill the force killing {{{
nnoremap ZZ <NOP>
nnoremap ZQ <NOP>
"}}}

" Buffer {{{
nnoremap <silent><C-w>q     :bd<CR>
nnoremap <silent><C-w><C-q> :bd<CR>
nnoremap <silent><C-n>  :bn<CR>
nnoremap <silent><C-p>  :bp<CR>
"}}}

"----------------------------------------------------------------------------
"Displaying
"----------------------------------------------------------------------------
set number
set ruler
set wrap
set showcmd
set cursorline
set laststatus=2
set cmdheight=2

" Setting of color scheme {{{
set t_Co=256
colorscheme molokai
"}}}

" Highlighting noisy white spaces {{{
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
highlight TrailingSpaces ctermbg=red guibg=#FF0000
highlight Tabs ctermbg=black guibg=#000000
augroup HighlightingNoisySpaces
  au!
  au BufNewFile,BufRead * call matchadd('ZenkakuSpace', '　')
  au BufNewFile,BufRead * call matchadd('TrailingSpaces', ' \{-1,}$')
  au BufNewFile,BufRead * call matchadd('Tabs', '\t')
augroup END
"}}}

" Make line only the current window
augroup cch
  au! cch
  au WinLeave * set nocursorline
  au WinEnter,BufRead * set cursorline
augroup END

"----------------------------------------------------------------------------
" Shell script
"----------------------------------------------------------------------------
augroup ShellScriptAutoCmd
  au!
  au FileType sh set shiftwidth=2 tabstop=2
augroup END

"----------------------------------------------------------------------------
" Vim script
"----------------------------------------------------------------------------
augroup VimScriptAutoCmd
  au!
  au FileType vim set shiftwidth=2 tabstop=2
augroup END

"----------------------------------------------------------------------------
" Perl
"----------------------------------------------------------------------------
augroup PerlAutoCmd
  au!
  call s:LazyLoadForPerl()
  au FileType perl set shiftwidth=4 tabstop=4
augroup END

augroup eplAutoCmd
  au!
  au BufNewFile,BufRead *.html.ep set shiftwidth=2
  au BufNewFile,BufRead *.html.ep let mojo_highlight_data = 1
augroup END

" Template for *.pm {{{
func! s:pm_template()
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
endf
au PerlAutoCmd BufNewFile *.pm call s:pm_template()
"}}}

" Detect misprints about package name {{{
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
    echomsg "Maybe written package name is wrong."
    echomsg "Please correct it."
    echohl None
  endif
endf
au PerlAutoCmd BufWritePost *.pm call s:check_package_name()
"}}}

" Perltidy {{{
map <silent> <Leader>pt <Esc> :%! perltidy -se<CR>
map <silent> <Leader>ptv <Esc> :'<,'>! perltidy -se<CR>
"}}}

"----------------------------------------------------------------------------
" JavaScript
"----------------------------------------------------------------------------
augroup JavaScriptAutoCmd
  au!
  call s:LazyLoadForJavaScript()
  au FileType javascript set shiftwidth=4 tabstop=4
augroup END

"----------------------------------------------------------------------------
" HTML/CSS
"----------------------------------------------------------------------------
augroup HtmlCssAutoCmd
  au!
  call s:LazyLoadForHtmlCss()
  au FileType html,css ColorHighlight
  au FileTYpe html,css nnoremap <C-c><C-t> :<C-u>ColorToggle<CR>
augroup END

"----------------------------------------------------------------------------
" Ruby
"----------------------------------------------------------------------------
augroup RubyAutoCmd
  au!
  call s:LazyLoadForRuby()
  au FileType ruby set shiftwidth=2 tabstop=2
augroup END

"----------------------------------------------------------------------------
" Java
"----------------------------------------------------------------------------
augroup JavaAutoCmd
  au!
  call s:LazyLoadForJava()
  au FileType java setlocal
        \ omnifunc=javacomplete#Complete
        \ completefunc=javacomplete#CompleteParamsInfo
  au FileType java set shiftwidth=4 tabstop=4
  au FileType java map <C-c><C-j> :call JCommentWriter()<CR> "Set key map for jcommenter
augroup END


" Apply K&R style block to java_getset (This is unique function)
let b:javagetset_enable_K_and_R=1

" Add "this" keyword to member of getter and setter
let b:javagetset_add_this=1

" Syntax highlight
let g:java_highlight_all=1
let g:java_highlight_debug=1
let g:java_allow_cpp_keywords=1
let g:java_space_errors=1
let g:java_highlight_functions=1
