if exists('g:loaded_visualrun') || &cp
  finish
endif
let g:loaded_visualrun = 1

let s:cpo_save = &cpo
set cpo&vim

" Create a mapping: <c-\><c-n> puts us in normal mode, then execute selection
vnoremap <silent> <Plug>VisualRunCommands <c-\><c-n>:exe visualrun#JoinSelection()<cr>

let &cpo = s:cpo_save
unlet s:cpo_save
