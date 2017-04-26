import vim
import sys
import re
import os

PATH = os.path.join(os.path.expanduser("~"), ".vim", ".vmux_clipboard_data")

def sanitize(str):
    return "'" + re.sub(re.compile("'"), "''", str) + "'"

def write_to_clipboard():
    with open(PATH, "w") as f:
        f.write(vim.eval('@"'))

def read_from_clipboard():
    lines = []
    with open(PATH, "r") as f:
        val = "".join(f.readlines())
        vim.command("let @\"=" + sanitize(val))

if __name__ == '__main__':
    if not os.path.isfile(PATH):
        f = open(PATH, "w+")
        f.close()
    if sys.argv[0] == 'write':
        write_to_clipboard()
    elif sys.argv[0] == 'read':
        read_from_clipboard()
