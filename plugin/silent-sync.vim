

let s:shell=expand("<sfile>:p:h")
let s:shell.='/silent-sync.sh'

let s:sync='! ' . s:shell . ' please_sync_this_project '
let s:ssh=s:shell . ' please_give_me_ssh '


let g:console_toggle = 0
function ConsoleToggle()
    if g:console_toggle == 0
        :50sp
        :wincmd j
		exe "ConqueTerm /bin/bash"
        let g:console_toggle=1
    elseif g:console_toggle == 1
        :wincmd j
   	    :bd 
        let g:console_toggle=0
    endif
endfunction

function SSHToggle()
    if g:console_toggle == 0
        :50sp
        :wincmd j
		exe "ConqueTerm /bin/bash -c ' " . s:ssh . " " . expand('%:p') . " '"
        let g:console_toggle=1
    elseif g:console_toggle == 1
        :wincmd j
   	    :bw 
        let g:console_toggle=0
    endif
endfunction

function Sync()
    exe s:sync . expand('%:p')
endfunction

map   <F5>      :call ConsoleToggle() <CR>
imap  <F5> <Esc>:call ConsoleToggle() <CR>


map   <F6>      :call SSHToggle() <CR>
imap  <F6> <Esc>:call SSHToggle() <CR>


map   <F7>      :call Sync() <CR>
imap  <F7> <Esc>:call Sync() <CR>

