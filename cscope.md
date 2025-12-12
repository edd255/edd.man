# Build database

```
cscope -Rbkq
```

# Run TUI

```
cscope -d
```

# Find where a function is defined

```
cscope -d -L1 my_function
```

# Find where a function is called

```
cscope -d -L2 my_function
```

# Find references to a variable

```
cscope -d -L0 my_var
```

# Search for a text string

```
cscope -d -L4 "error"
```

# Search for a file

```
cscope -d -L7 myfile.c
```

# Using `cscope` with Vim
```
set csprg=cscope
set csto=1
set cst
set nocsverb
cs add cscope.out
set csverb
```
