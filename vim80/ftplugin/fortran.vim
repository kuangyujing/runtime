" Vim settings file
" Language:	Fortran 2008 (and older: Fortran 2003, 95, 90, 77, 66)
" Version:	0.50
" Last Change:	2015 Nov. 30
" Maintainer:	Ajit J. Thakkar <ajit@unb.ca>; <http://www2.unb.ca/~ajit/>
" Usage:	For instructions, do :help fortran-plugin from Vim
" Credits:
" Useful suggestions were made by Stefano Zacchiroli, Hendrik Merx, Ben
" Fritz, and David Barnett.

" Only do these settings when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

let s:cposet=&cpoptions
set cpoptions&vim

" Don't do other file type settings for this buffer
let b:did_ftplugin = 1

" Determine whether this is a fixed or free format source file
" if this hasn't been done yet using the priority:
" buffer-local value
" > global value
" > file extension as in Intel ifort, gcc (gfortran), NAG, Pathscale, and Cray compilers
if !exists("b:fortran_fixed_source")
  if exists("fortran_free_source")
    " User guarantees free source form
    let b:fortran_fixed_source = 0
  elseif exists("fortran_fixed_source")
    " User guarantees fixed source form
    let b:fortran_fixed_source = 1
  elseif expand("%:e") ==? "f\<90\|95\|03\|08\>"
    " Free-form file extension defaults as in Intel ifort, gcc(gfortran), NAG, Pathscale, and Cray compilers
    let b:fortran_fixed_source = 0
  elseif expand("%:e") ==? "f\|f77\|for"
    " Fixed-form file extension defaults
    let b:fortran_fixed_source = 1
  else
    " Modern fortran still allows both fixed and free source form
    " Assume fixed source form unless signs of free source form
    " are detected in the first five columns of the first s:lmax lines.
    " Detection becomes more accurate and time-consuming if more lines
    " are checked. Increase the limit below if you keep lots of comments at
    " the very top of each file and you have a fast computer.
    let s:lmax = 500
    if ( s:lmax > line("$") )
      let s:lmax = line("$")
    endif
    let b:fortran_fixed_source = 1
    let s:ln=1
    while s:ln <= s:lmax
      let s:test = strpart(getline(s:ln),0,5)
      if s:test !~ '^[Cc*]' && s:test !~ '^ *[!#]' && s:test =~ '[^ 0-9\t]' && s:test !~ '^[ 0-9]*\t'
	let b:fortran_fixed_source = 0
	break
      endif
      let s:ln = s:ln + 1
    endwhile
    unlet! s:lmax s:ln s:test
  endif
endif

" Set comments and textwidth according to source type
if (b:fortran_fixed_source == 1)
  setlocal comments=:!,:*,:C
else
  setlocal comments=:!
endif

" Set commentstring for foldmethod=marker
setlocal cms=!%s

" Tabs are not a good idea in Fortran so the default is to expand tabs
if !exists("fortran_have_tabs")
  setlocal expandtab
endif

setlocal include=^\\c#\\=\\s*include\\s\\+
setlocal suffixesadd+=.f08,.f03,.f95,.f90,.for,.f,.F,.f77,.ftn,.fpp

" Define patterns for the matchit plugin
if !exists("b:match_words")
  let s:notend = '\%(\<end\s\+\)\@<!'
  let s:notselect = '\%(\<select\s\+\)\@<!'
  let s:notelse = '\%(\<end\s\+\|\<else\s\+\)\@<!'
  let s:notprocedure = '\%(\s\+procedure\>\)\@!'
  let b:match_ignorecase = 1
  let b:match_words =
    \ '(:),' .
    \ '\<select\s*case\>:' . s:notselect. '\<case\>:\<end\s*select\>,' .
    \ s:notelse . '\<if\s*(.\+)\s*then\>:' .
    \ '\<else\s*\%(if\s*(.\+)\s*then\)\=\>:\<end\s*if\>,'.
    \ 'do\s\+\(\d\+\):\%(^\s*\)\@<=\1\s,'.
    \ s:notend . '\<do\>:\<end\s*do\>,'.
    \ s:notelse . '\<where\>:\<elsewhere\>:\<end\s*where\>,'.
    \ s:notend . '\<type\s*[^(]:\<end\s*type\>,'.
    \ s:notend . '\<forall\>:\<end\s*forall\>,'.
    \ s:notend . '\<associate\>:\<end\s*associate\>,'.
    \ s:notend . '\<enum\>:\<end\s*enum\>,'.
    \ s:notend . '\<interface\>:\<end\s*interface\>,'.
    \ s:notend . '\<subroutine\>:\<end\s*subroutine\>,'.
    \ s:notend . '\<function\>:\<end\s*function\>,'.
    \ s:notend . '\<module\>' . s:notprocedure . ':\<end\s*module\>,'.
    \ s:notend . '\<program\>:\<end\s*program\>'
endif

" File filters for :browse e
if has("gui_win32") && !exists("b:browsefilter")
  let b:browsefilter = "Fortran Files (*.f;*.for;*.f77;*.f90;*.f95;*.f03;*.f08;*.fpp;*.ftn)\t*.f;*.for;*.f77;*.f90;*.f95;*.f03;*.f08;*.fpp;*.ftn\n" .
    \ "All Files (*.*)\t*.*\n"
endif

let b:undo_ftplugin = "setl com< cms< et< inc< sua<"
	\ . "| unlet! b:match_ignorecase b:match_words b:browsefilter"

let &cpoptions=s:cposet
unlet s:cposet
