" Vim filetype plugin file
" Language: R
" Maintainer: Jakson Alves de Aquino <jalvesaq@gmail.com>
" Homepage: https://github.com/jalvesaq/R-Vim-runtime
" Last Change:	Tue Apr 07, 2015  04:38PM

" Only do this when not yet done for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

setlocal iskeyword=@,48-57,_,.
setlocal commentstring=#\ %s
setlocal comments=:#',:###,:##,:#

if has("gui_win32") && !exists("b:browsefilter")
  let b:browsefilter = "R Source Files (*.R)\t*.R\n" .
        \ "Files that include R (*.Rnw *.Rd *.Rmd *.Rrst)\t*.Rnw;*.Rd;*.Rmd;*.Rrst\n" .
        \ "All Files (*.*)\t*.*\n"
endif

let b:undo_ftplugin = "setl cms< com< isk< | unlet! b:browsefilter"

let &cpo = s:cpo_save
unlet s:cpo_save
