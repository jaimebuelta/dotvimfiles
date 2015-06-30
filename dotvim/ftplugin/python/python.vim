set nosmartindent
set equalprg=autopep8\ -p\ 10\ -

" Highlight over 79 characters
:au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)

