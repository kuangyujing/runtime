" Vim filetype plugin file
" Language:             mutt RC File
" Previous Maintainer:  Nikolai Weibull <now@bitwi.se>
" Latest Revision:      2006-04-19

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

let b:undo_ftplugin = "setl com< cms< inc<"

setlocal comments=:# commentstring=#\ %s

let &l:include = '^\s*source\>'

let &cpo = s:cpo_save
unlet s:cpo_save
