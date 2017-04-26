let g:vmuxclipboard_python_version=0
if has('python')
    let g:vmuxclipboard_python_version=2
elseif has('python3')
    let g:vmuxclipboard_python_version=3
endif

let g:vmuxclipboard_path = "/" . join(split(fnamemodify(resolve(expand('<sfile>:p')), ':h'), "/")[:-2], "/") . '/py/vmux_clipboard.py'

function! WriteToVmuxClipboard()
    if g:vmuxclipboard_python_version == 2
python <<EOF
import sys
sys.argv = ['write']
EOF
        execute 'pyfile ' . g:vmuxclipboard_path
    elseif g:vmuxclipboard_python_version == 3
python3 <<EOF
import sys
sys.argv = ['write']
EOF
        execute 'py3file ' . g:vmuxclipboard_path
    else
        echom "vmux-clipboard error: vim not compiled with python"
        return
    endif
    echom "vmux-clipboard: yanked"
endfunction

function! ReadFromVmuxClipboard()
    if g:vmuxclipboard_python_version == 2
python <<EOF
import sys
sys.argv = ['read']
EOF
        execute 'pyfile ' . g:vmuxclipboard_path
    elseif g:vmuxclipboard_python_version == 3
python3 <<EOF
import sys
sys.argv = ['read']
EOF
        execute 'py3file ' . g:vmuxclipboard_path
    else
        echom "vmux-clipboard error: vim not compiled with python"
        return
    endif
    echom "vmux-clipboard: ready to put"
endfunction

command WriteToVmuxClipboard call WriteToVmuxClipboard()
command ReadFromVmuxClipboard call ReadFromVmuxClipboard()
