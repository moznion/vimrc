"vim:set ts=8 sts=2 sw=2 tw=0:

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
"colorscheme TODO

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

au BufNewFile,BufRead *.html.ep set shiftwidth=2
au BufNewFile,BufRead *.html.ep let mojo_highlight_data = 1

"----------------------------------------------------------------------------
"JavaScript
"
au BufNewFile,BufRead *.js set shiftwidth=4
au BufNewFile,BufRead *.js set tabstop=4
