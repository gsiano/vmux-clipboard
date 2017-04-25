if has('python')
    let g:vmuxcopy_python_version=2
elseif has('python3')
    let g:vmuxcopy_python_version=3
endif

let g:vmuxcopy_path = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/vmux_copy.py'

function! WriteIntoVmuxBuf()
python <<EOF
import sys
sys.argv = ['write']
EOF
    if g:vmuxcopy_python_version == 2
        execute 'pyfile ' . g:vmuxcopy_path
    elseif g:vmuxcopy_python_version == 3
        execute 'pyfile3 ' . g:vmuxcopy_path
    else
        echom "vmux_copy error: vim not compiled with python"
        return
    endif
    echom "vmux_copy: yanked"
endfunction

function! ReadFromVmuxBuf()
python <<EOF
import sys
sys.argv = ['read']
EOF
    if g:vmuxcopy_python_version == 2
        execute 'pyfile ' . g:vmuxcopy_path
    elseif g:vmuxcopy_python_version == 3
        execute 'pyfile3 ' . g:vmuxcopy_path
    else
        echom "vmux_copy error: vim not compiled with python"
        return
    endif
    echom "vmux_copy: ready to put"
endfunction
