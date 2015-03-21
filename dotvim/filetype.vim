" my filetype file
if exists("dis_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.as  setfiletype actionscript
augroup END
