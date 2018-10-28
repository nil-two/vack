vack
====

manage vim packages.

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
  i|install [-ohHs] <repository>...   # install the packages
  u|update [-ahH] <package>...        # update the packages
  r|remove <package>...               # remove the packages
  l|list [-aos]                       # list installed packages
  p|path [-a] <package>...            # show install directories of the packages
  e|enable <package>...               # move the packages to start
  d|disable <package>...              # move the packages to opt
  I|init                              # create the root package directory
  h|help                              # show this help message

environment-variables:
  VACK_PATH   # the root package directory (default: $HOME/.vim/pack/vack)
```

Installtion
-----------

vil is a simple shell script.

The following instructions assume that `~/bin` is on your `$PATH`. If that is not the case, you can substitute your favorite location.

```
curl -L https://raw.githubusercontent.com/kusabashira/vack/master/vack > ~/bin/vack
chmod 755 ~/bin/vack
```

Commands
--------

### vack install [-ohHs] \<repository\>...   

Install the packages from the repositories.

`-o` and `-s` are flags that change the instllation destination.
If `-o` is specified, they will be installed in `opt`,
and if `-s` is specified, they will be installed in `start`.
By default they will be installed to `start`.

`-h` and `-H` are flags that decide whether to execute `helptsgs`.
If `-h` is specified, it will be execute,
and if `-H` is specified, it won't be execute.
By default it will be executed.

```
$ vack i kusabashira/vim-incopen
(Install vim-incopen in start)

$ vack i -Ho kusabashira/vim-incopen
(Install vim-incopen in opt and don't execute helptags)
```

### vack update [-ahH] \<package\>...        

Update the packages.

If `-a` is specified, all packages will be updated.

`-h` and `-H` are flags that decide whether to execute `helptsgs`.
If `-h` is specified, it will be execute,
and if `-H` is specified, it won't be execute.
By default it will be executed.

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
If `-a` is specified, All packages will be listed,
and if `-o` is specified, only the opt packages will be listed,
and if `-s` is specified, only the start packages will be listed,
By default all package will be listed.

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

Show install directories of the packages.

If `-a` is specified, all directories will be shown.

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
(move vim-incopen from opt to start)
```

### vack disable \<package\>...              

Move the packages from start to opt.

```
$ vack d vim-incopen
(move vim-incopen from start to opt)
```

### vack init                              

Create the root package directory.

```
$ vack I
($VACK_PATH will be created)
```

### vack help                              

show this help message.

```
$ vack h
(usage printed)
```

Variables
---------

### `VACK_PATH`

The path of the root package directory.
Default value is `$HOME/.vim/pack/vack`.

Misc
----

### misc/vack.bash

It provides an auto-completion for Bash.

License
-------

MIT License

Author
------

nil2 <nil2@nil2.org>
