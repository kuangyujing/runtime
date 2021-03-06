" Vim filetype plugin
" Language:    Hamster Script
" Version:     2.0.6.0
" Maintainer:  David Fishburn <dfishburn dot vim at gmail dot com>
" Last Change: 2017 Mar 18

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

let b:undo_ftplugin = "setl com< commentstring< | unlet! b:match_ignorecase b:match_words b:match_skip"

" Use the # sign for comments
setlocal comments=:#

" Comments start with a double quote
setlocal commentstring=#%s

" Move around functions.
noremap <silent><buffer> [[ :call search('^\s*sub\>', "bW")<CR>
noremap <silent><buffer> ]] :call search('^\s*sub\>', "W")<CR>
noremap <silent><buffer> [] :call search('^\s*endsub\>', "bW")<CR>
noremap <silent><buffer> ][ :call search('^\s*endsub\>', "W")<CR>

" Move around comments
noremap <silent><buffer> ]# :call search('^\s*#\@!', "W")<CR>
noremap <silent><buffer> [# :call search('^\s*#\@!', "bW")<CR>

" Let the matchit plugin know what items can be matched.
if exists("loaded_matchit")
  let b:match_ignorecase = 0
  let b:match_words =
	\ '\<sub\>:\<return\>:\<endsub\>,' .
        \ '\<do\|while\|repeat\|for\>:\<break\>:\<continue\>:\<loop\|endwhile\|until\|endfor\>,' .
	\ '\<if\>:\<else\%[if]\>:\<endif\>' 

  " Ignore ":syntax region" commands, the 'end' argument clobbers if-endif
  " let b:match_skip = 'getline(".") =~ "^\\s*sy\\%[ntax]\\s\\+region" ||
  "	\ synIDattr(synID(line("."),col("."),1),"name") =~? "comment\\|string"'
endif

setlocal ignorecase
let &cpo = s:cpo_save
unlet s:cpo_save
setlocal cpo+=M		" makes \%( match \)
