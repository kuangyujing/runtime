" Vim filetype plugin
" Language:	Sass
" Maintainer:	Tim Pope <vimNOSPAM@tpope.org>
" Last Change:	2016 Aug 29

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = "setl com< cms< def< inc< inex< ofu< sua<"

setlocal comments=://
setlocal commentstring=//\ %s
setlocal define=^\\s*\\%(@mixin\\\|=\\)
setlocal includeexpr=substitute(v:fname,'\\%(.*/\\\|^\\)\\zs','_','')
setlocal omnifunc=csscomplete#CompleteCSS
setlocal suffixesadd=.sass,.scss,.css

let &l:include = '^\s*@import\s\+\%(url(\)\=["'']\='
