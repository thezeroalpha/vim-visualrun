if exists('g:loaded_visualrun_autoload')
  finish
endif
let g:loaded_visualrun_autoload = 1

function! visualrun#JoinSelection() abort
  try
    " Get selected text (restore @x in the 'finally' block)
    let x_save = @x
    silent! normal! gv"xy

    " Split & prepare the lines
    let lines = @x->split('\v'."\n".'(\s*\\)@!')
    call map(lines, 'substitute(v:val, "\\v\\n\\s*\\", "", "g")')
    call filter(lines, 'v:val !~ "^\s*$"')

    " All lines will be executed as one command
    return lines->join("\n")
  finally
    " Restore previous @x
    let @x = x_save
  endtry
endfunction
