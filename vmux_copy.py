import vim
import sys
import re
import os

PATH = os.path.join(os.path.expanduser("~"), ".vim", ".vmux_copy_data")

def sanitize(str):
    return "'" + re.sub(re.compile("'"), "''", str) + "'"

def write_from_buffer():
    with open(PATH, "w") as f:
        f.write(vim.eval("@0"))

def read_into_buffer():
    lines = []
    with open(PATH, "r") as f:
        val = "".join(f.readlines())
        vim.command("let @\"=" + sanitize(val))

if __name__ == '__main__':
    if not os.path.isfile(PATH):
        f = open(PATH, "w+")
        f.close()
    if sys.argv[0] == 'write':
        write_from_buffer()
    elif sys.argv[0] == 'read':
        read_into_buffer()
