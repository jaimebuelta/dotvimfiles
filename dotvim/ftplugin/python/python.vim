set nosmartindent
" set equalprg=autopep8\ -p\ 10\ -
set shiftround

" Highlight over 79 characters
:au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)

function! <SID>EasyPep8()
  set lazyredraw
  " Close any existing cwindows.
  cclose
  let l:grepformat_save = &grepformat
  let l:grepprogram_save = &grepprg
  set grepformat&vim
  set grepformat&vim
  let &grepformat = '%f:%l:%m'
  let &grepprg = 'pep8 --select E303'
  if &readonly == 0 | update | endif
  silent! grep! %
  let &grepformat = l:grepformat_save
  let &grepprg = l:grepprogram_save
  let l:mod_total = 0
  let l:win_count = 1
  " Determine correct window height
  " windo let l:win_count = l:win_count + 1
  " if l:win_count <= 2 | let l:win_count = 4 | endif
  " windo let l:mod_total = l:mod_total + winheight(0)/l:win_count |
  "       \ execute 'resize +'.l:mod_total
  " Open cwindow
  " execute 'belowright copen '.l:mod_total
  " nnoremap <buffer> <silent> c :cclose<CR>
  " set nolazyredraw
  " redraw!
  let tlist=getqflist() ", 'get(v:val, ''bufnr'')')
  if empty(tlist)
	  echomsg "PEP8 correct"
  else
      for rline in reverse(tlist)
         echomsg "Removing" rline['lnum']  - 1 "," rline['lnum'] "d"
         let lline=rline['lnum']-1
         exec "normal! ".lline.",".rline['lnum']."d"

      endfor
  endif
endfunction

" Remove easy pep8
" :au BufWinEnter * :call <SID>EasyPep8()
