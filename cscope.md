# Build database

```bash
cscope -Rbkq
```

`-R` means to recurse into subdirectories.

`-b` means to build only, don't start the TUI.

`-k` means kernel mode, do not search `/usr/include`.

`-q` means building an inverted index for faster symbol lookup.

# Find this C symbol

```bash
cscope -d -L0 my_symbol
```

This is good for functions, macros, globals, struct names, enum names, typedefs.

# Find where a function or global is defined

```bash
cscope -d -L1 my_function
```

# Find functions called by a function

```bash
cscope -d -L1 my_function
```

# Find callers of a function

```bash
cscope -d -L3 my_function
```

# Find references to a variable, type, macro, or enum

Start broad:

```bash
cscope -d -L0 my_var
```

Find assignments:

```bash
cscope -d -L9 my_var
```

# Search for literal text

```bash
cscope -d -L4 "my text"
```

# Search with an egrep pattern

```bash
cscope -d -L6 'SYSCALL_DEFINE[0-9]\(.*open'
cscope -d -L6 'EXPORT_SYMBOL(_GPL)?\(.*\)'
cscope -d -L6 'DEFINE_.*\(.*lock'
cscope -d -L6 'struct[[:space:]]+file_operations'
cscope -d -L6 'MODULE_LICENSE'
```

# Search for a file

```bash
cscope -d -L7 myfile.c
```


# Using `cscope` with Vim
For Vimscript:
```vim
if filereadable("cscope.out")
  set csprg=cscope
  set csto=1
  set cst
  set nocsverb
  cs add cscope.out
  set csverb
endif
```

For Lua:
```lua
if vim.fn.filereadable("cscope.out") == 1 then
  vim.opt.csprg = "cscope"
  vim.opt.csto = 1
  vim.opt.cst = true
  vim.opt.csverb = false

  vim.cmd("cs add cscope.out")

  vim.opt.csverb = true
end
```
