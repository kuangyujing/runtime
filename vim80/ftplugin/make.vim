" Vim filetype plugin file
" Language:	Make
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2013 Apr 22

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = "setl et< sts< com< cms< inc<"

" Make sure a hard tab is used, required for most make programs
setlocal noexpandtab

" Set 'comments' to format dashed lists in comments
setlocal com=sO:#\ -,mO:#\ \ ,b:#

" Set 'commentstring' to put the marker after a #.
setlocal commentstring=#\ %s

" Including files.
let &l:include = '^\s*include'

" For matchit.vim, suggested by Albert Netymk.
if exists("loaded_matchit")
  let b:match_words = '\<if\(n\)\=\(eq\|def\)\>:\<else\>:\<endif\>,\<define\>:\<endef\>'
endif
