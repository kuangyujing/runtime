" Vim syntax support file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Sep 12

" This file sets up the default methods for highlighting.
" It is loaded from "synload.vim" and from Vim for ":syntax reset".
" Also used from init_highlight().

if !exists("syntax_cmd") || syntax_cmd == "on"
  " ":syntax on" works like in Vim 5.7: set colors but keep links
  command -nargs=* SynColor hi <args>
  command -nargs=* SynLink hi link <args>
else
  if syntax_cmd == "enable"
    " ":syntax enable" keeps any existing colors
    command -nargs=* SynColor hi def <args>
    command -nargs=* SynLink hi def link <args>
  elseif syntax_cmd == "reset"
    " ":syntax reset" resets all colors to the default
    command -nargs=* SynColor hi <args>
    command -nargs=* SynLink hi! link <args>
  else
    " User defined syncolor file has already set the colors.
    finish
  endif
endif

highlight cursorline   cterm=none    ctermfg=none     ctermbg=none
highlight endofbuffer  cterm=none    ctermfg=none     ctermbg=none
highlight linenr       cterm=none    ctermfg=darkgray ctermbg=none
highlight nontext      cterm=none    ctermfg=darkgray ctermbg=none
highlight cursorlinenr cterm=none    ctermfg=yellow   ctermbg=none
highlight specialkey   cterm=none    ctermfg=darkred  ctermbg=none
highlight matchparen   cterm=none    ctermfg=yellow   ctermbg=none
highlight visual       cterm=none    ctermbg=darkred  ctermfg=none
highlight comment      cterm=none    ctermfg=gray     ctermbg=none
highlight constant     cterm=none    ctermfg=magenta  ctermbg=none
highlight special      cterm=none    ctermfg=red      ctermbg=none
highlight identifier   cterm=none    ctermfg=cyan     ctermbg=none
highlight statement    cterm=none    ctermfg=yellow   ctermbg=none
highlight preproc      cterm=none    ctermfg=blue     ctermbg=none
highlight type         cterm=none    ctermfg=green    ctermbg=none
highlight todo         cterm=reverse ctermfg=yellow   ctermbg=none
highlight error        cterm=reverse ctermfg=red      ctermbg=none

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
SynLink String		Constant
SynLink Character	Constant
SynLink Number		Constant
SynLink Boolean		Constant
SynLink Float		Number
SynLink Function	Identifier
SynLink Conditional	Statement
SynLink Repeat		Statement
SynLink Label		Statement
SynLink Operator	Statement
SynLink Keyword		Statement
SynLink Exception	Statement
SynLink Include		PreProc
SynLink Define		PreProc
SynLink Macro		PreProc
SynLink PreCondit	PreProc
SynLink StorageClass	Type
SynLink Structure	Type
SynLink Typedef		Type
SynLink Tag		Special
SynLink SpecialChar	Special
SynLink Delimiter	Special
SynLink SpecialComment	Special
SynLink Debug		Special

delcommand SynColor
delcommand SynLink
