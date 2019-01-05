function! vimux#TestCurrentLine()
  " A regex for all files that you might want to test from
  let regex = '_spec\.rb$'
  let file = @%
  let check = matchstr(file, regex)
  wall " Write all
  if empty(check)
    " No Match
    call VimuxRunLastCommand()
  else
    " Match
    let test_string = "rspec " . file . ":" . line(".")
    echom test_string
    call VimuxRunCommand(test_string)
  endif
endfunction

function! vimux#RunLastCommand()
  wall " Write all
  call VimuxOpenRunner()
  call VimuxSendKeys("Up Enter")
endfunction

function! vimux#TestFullFile()
  let file = @%
  let test_string = "rspec " . file
  echom test_string
  wall " Write all
  call VimuxRunCommand(test_string)
endfunction

function! vimux#RubocopCurrentFile()
  let file = @%
  let test_string = "rubocop " . file
  echom test_string
  wall " Write all
  call VimuxRunCommand(test_string)
endfunction

function! vimux#StopSpring()
  let test_string = "bin/spring stop"
  call VimuxRunCommand(test_string)
endfunction
