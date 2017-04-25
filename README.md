ABOUT
-----
`vmux_copy` is a vim plugin that enables yanking and pasting text between vim buffers across panes/windows of [tmux](https://tmux.github.io/), [byobu](byobu.co), [screen](https://www.gnu.org/software/screen/), and other terminal multiplexers

INSTALLATION
------------
* Using [pathogen](https://github.com/tpope/vim-pathogen):
    * clone the `vmux_copy` repo into `~/.vim/bundle`
    * make sure to include `execute pathogen#infect()` in your `.vimrc`
* Manually:
    * put `plugin/vmux_copy.vim` into `~/.vim/plugin/` and `py/vmux_copy.py` into `~/.vim/py/`

USAGE
-----
* calling `WriteIntoVmuxBuf()` will make your most recently yanked text available across multiplexer panes
* calling `ReadFromVmuxBuf()` will make your most recently vmux-yanked text available in your current multiplexed pane in the `"` vim register, which can be put with `p`
* add maps for the `WriteIntoVmuxBuf()` and `ReadFromVmuxBuf()` functions. Example:
    * `yy` + `,y` in one pane, `,p` + `p` in another:
    * ```
         let mapleader = ","
         map <silent> <leader>y :call WriteIntoVmuxBuf()<cr>
         map <silent> <leader>p :call ReadFromVmuxBuf()<cr>
      ```

REQUIREMENTS
------------
* `vim` compiled with either `+python` or `+python3`
    * check with `vim --version | grep python`
