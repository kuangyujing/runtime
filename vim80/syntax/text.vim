" Language: text
" Maintainer: Kuangyu Jing
" Latest Revision: April 15, 2020

if exists("b:current_syntax")
  finish
endif

"syntax match Label '\<\u\i\+'
"syntax match Constant '\<\d\+\>'
syntax match Identifier '^\s*[\-+*]'
syntax match Comment '\<\@<!#.*$'

syntax match Todo '\<TODO\>'
syntax match Error '\<FIXME\>'
syntax match SpellBad '\<XXX\>'
syntax match Special '\<DONE\>'

let b:current_syntax = 'text'

