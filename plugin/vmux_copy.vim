if has('python')
    let g:vmuxcopy_python_version=2
elseif has('python3')
    let g:vmuxcopy_python_version=3
endif

let g:vmuxcopy_path = "/" . join(split(fnamemodify(resolve(expand('<sfile>:p')), ':h'), "/")[:-2], "/") . '/py/vmux_copy.py'

function! WriteIntoVmuxBuf()
    if g:vmuxcopy_python_version == 2
python <<EOF
import sys
sys.argv = ['write']
EOF
        execute 'pyfile ' . g:vmuxcopy_path
    elseif g:vmuxcopy_python_version == 3
python3 <<EOF
import sys
sys.argv = ['write']
EOF
        execute 'py3file ' . g:vmuxcopy_path
    else
        echom "vmux_copy error: vim not compiled with python"
        return
    endif
    echom "vmux_copy: yanked"
endfunction

function! ReadFromVmuxBuf()
    if g:vmuxcopy_python_version == 2
python <<EOF
import sys
sys.argv = ['read']
EOF
        execute 'pyfile ' . g:vmuxcopy_path
    elseif g:vmuxcopy_python_version == 3
python3 <<EOF
import sys
sys.argv = ['read']
EOF
        execute 'py3file ' . g:vmuxcopy_path
    else
        echom "vmux_copy error: vim not compiled with python"
        return
    endif
    echom "vmux_copy: ready to put"
endfunction
