ABOUT
-----
`vmux-clipboard` is a vim plugin that enables yanking and pasting text between vim buffers across panes/windows of [tmux](https://tmux.github.io/), [byobu](byobu.co), [screen](https://www.gnu.org/software/screen/), and other terminal multiplexers

INSTALLATION
------------
* Using [pathogen](https://github.com/tpope/vim-pathogen):
    * clone the `vmux-clipboard` repo into `~/.vim/bundle`
    * make sure to include `execute pathogen#infect()` in your `.vimrc`
* Manually:
    * put `plugin/vmux_clipboard.vim` into `~/.vim/plugin/` and `py/vmux_clipboard.py` into `~/.vim/py/`

USAGE
-----
* running `:WriteToVmuxClipboard` will make your most recently yanked text available across multiplexer panes
* running `:ReadFromVmuxClipboard` will make the text in your vmux-clipboard available in the `"` register, which can be put with `p`
* add maps for the `:WriteToVmuxClipboard` and `:ReadFromVmuxClipboard` commands. Example:
    * `yy` + `,y` in one pane, `,p` + `p` in another:
    * ```
         let mapleader = ","
         map <silent> <leader>y :WriteToVmuxClipboard<cr>
         map <silent> <leader>p :ReadFromVmuxClipboard<cr>
      ```

REQUIREMENTS
------------
* `vim` compiled with either `+python` or `+python3`
    * check with `vim --version | grep python`
