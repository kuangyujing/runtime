" Vim filetype plugin file
" Language:	occam
" Copyright:	Christian Jacobsen <clj3@kent.ac.uk>, Mario Schweigler <ms44@kent.ac.uk>
" Maintainer:	Mario Schweigler <ms44@kent.ac.uk>
" Last Change:	23 April 2003

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1
let s:keepcpo= &cpo
set cpo&vim

"{{{  Formatting
" Break comment lines and insert comment leader in this case
setlocal comments+=:--
"}}}

"{{{  File browsing filters
" Win32 can filter files in the browse dialog
if has("gui_win32") && !exists("b:browsefilter")
  let b:browsefilter = "All Occam Files (*.occ *.inc)\t*.occ;*.inc\n" .
	\ "Occam Include Files (*.inc)\t*.inc\n" .
	\ "Occam Source Files (*.occ)\t*.occ\n" .
	\ "All Files (*.*)\t*.*\n"
endif
"}}}

"{{{  Undo settings
let b:undo_ftplugin = "setlocal shiftwidth< softtabstop< expandtab<"
	\ . " formatoptions< comments< textwidth<"
	\ . "| unlet! b:browsefiler"
"}}}

let &cpo = s:keepcpo
unlet s:keepcpo
