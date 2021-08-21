" Vim filetype plugin file
" Previous Maintainer:  Nikolai Weibull <now@bitwi.se>
" Latest Revision:      2007-12-04

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

let b:undo_ftplugin = "setl com< cms<"

setlocal comments=:# commentstring=#\ %s

let &cpo = s:cpo_save
unlet s:cpo_save
