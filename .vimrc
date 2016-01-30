if has("mouse")
    set mouse=a
endif
:set wildmode=list:longest
:set nu
:set tabstop=4
:set shiftwidth=4
:set expandtab
syntax on
set clipboard=unnamed
if exists('&colorcolumn')
    set colorcolumn:80
endif
set hlsearch
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
set backspace=indent,eol,start

if has('autocmd')
  au BufRead,BufNewFile *.md set wm=2 tw=80
endif

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

let g:vim_markdown_folding_disabled=1
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
silent vertical all
