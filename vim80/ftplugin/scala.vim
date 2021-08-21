" Vim filetype plugin file
" Language:             Scala
" Maintainer:           Derek Wyatt
" URL:                  https://github.com/derekwyatt/vim-scala
" License:              Same as Vim
" Last Change:          02 August 2016
" ----------------------------------------------------------------------------

if exists('b:did_ftplugin') || &cp
  finish
endif
let b:did_ftplugin = 1

" Just like c.vim, but additionally doesn't wrap text onto /** line when
" formatting. Doesn't bungle bulleted lists when formatting.
if get(g:, 'scala_scaladoc_indent', 0)
  setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s2:/**,mb:*,ex:*/,s1:/*,mb:*,ex:*/,://
else
  setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/**,mb:*,ex:*/,s1:/*,mb:*,ex:*/,://
endif
setlocal commentstring=//\ %s

setlocal include='^\s*import'
setlocal includeexpr='substitute(v:fname,"\\.","/","g")'

setlocal path+=src/main/scala,src/test/scala
setlocal suffixesadd=.scala
