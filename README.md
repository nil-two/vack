vack
====

Manage vim packages.

```
$ vack i thinca/vim-quickrun
(Install vim-quickrun)

$ vack u vim-quickrun
(Update vim-quickrun)
```

Usage
-----

```
$ vack <command> [...]
manage Vim packages.

commands:
  i|install [-os] <repository>...   # install the packages
  u|update [-a] <package>...        # update the packages
  r|remove <package>...             # remove the packages
  l|list [-aos]                     # list installed packages
  p|path [-a] <package>...          # show install directory of the package
  e|enable <package>...             # move the packages to start
  d|disable <package>...            # move the packages to opt
  I|init                            # create the package directory
  h|help                            # show this help message

environment-variables:
  VACKPATH   # the package directory (default: $HOME/.vim/pack/vack)
```

Requirements
------------

- Git

Installtion
-----------

1. Copy `vack` into your `$PATH`.
2. Make `vack` Executable.

### Example

```
$ curl -L https://raw.githubusercontent.com/kusabashira/vack/master/vack > ~/bin/vack
$ chmod +x ~/bin/vack
```

Note: In this example, `$HOME/bin` must be included in `$PATH`.

Commands
--------

### vack install [-os] \<repository\>...   

Install the packages from the repositories.

`-o` and `-s` are flags that change the instllation destination.
If `-o` is specified, it installs the packages into `opt`.
If `-s` is specified, it installs the packages into `start`.
By default, it installes the packages into `start`.

```
$ vack i kusabashira/vim-incopen
(Install vim-incopen into start)

$ vack i -o kusabashira/vim-incopen
(Install vim-incopen into opt)
```

### vack update [-a] \<package\>...        

Update the packages.

If `-a` is specified, it updates all packages.

```
$ vack u kusabashira/vim-incopen
(Update vim-incopen)

$ vack -a
(Update all packages)
```

### vack remove \<package\>...               

Remove the packages.

```
$ vack r kusabashira/vim-incopen
(Remove vim-incopen)
```

### vack list [-aos]                       

List installed packages.

`-a`,`-o` and `s` are flags that change the target packages.
If `-a` is specified, it lists all packages.
If `-o` is specified, it lists only the opt packages.
If `-s` is specified, it lists only the start packages.
By default it lists all package.

```
$ vack l
vim-quickrun
vim-incopen
...

$ vack l -o
vim-incopen
...
```

### vack path [-a] \<package\>...            

Show the path of the packages.

If `-a` is specified, It shows all path of the packages.

```
$ vack p vim-incopen
/home/user/.vim/pack/vack/opt/vim-incopen

$ vack p -a
/home/user/.vim/pack/vack/start/vim-quickrun
/home/user/.vim/pack/vack/opt/vim-incopen
...
```

### vack enable \<package\>...               

Move the packages from opt to start.

```
$ vack e vim-incopen
(Move vim-incopen from opt to start)
```

### vack disable \<package\>...              

Move the packages from start to opt.

```
$ vack d vim-incopen
(Move vim-incopen from start to opt)
```

### vack init                              

Create the root package directory.

```
$ vack I
(Create $VACKPATH)
```

### vack help                              

Print usage.

```
$ vack h
(Print usage)
```

Variables
---------

### VACKPATH

The path of the root package directory.
Default value is `$HOME/.vim/pack/vack`.

Misc
----

### misc/vack.bash

An auto-completion script for Bash.

### misc/\_vack

An auto-completion script for Zsh.

License
-------

MIT License

Author
------

nil2 <nil2@nil2.org>
