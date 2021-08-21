" Vim filetype plugin file
" Language:	Vroom (vim testing and executable documentation)
" Maintainer:	David Barnett (https://github.com/google/vim-ft-vroom)
" Last Change:	2014 Jul 23

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo-=C


let b:undo_ftplugin = 'setlocal iskeyword< comments< commentstring<'

" To allow tag lookup and autocomplete for whole autoload functions, '#' must be
" a keyword character. This also conforms to the behavior of ftplugin/vim.vim.
setlocal iskeyword+=#

" Vroom files have no comments (text is inert documentation unless indented).
setlocal comments=
setlocal commentstring=


let &cpo = s:cpo_save
unlet s:cpo_save
