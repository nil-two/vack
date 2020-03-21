vack
====

Manage vim plugins.

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
manage Vim plugins.

commands:
  i|install [-os] <repository>...   # install the plugins
  u|update [-a] <plugin>...         # update the plugins
  r|remove <plugin>...              # remove the plugins
  l|list [-aos]                     # list installed plugins
  p|path [-a] <plugin>...           # show the path of the plugins
  e|enable <plugin>...              # move the plugins to start
  d|disable <plugin>...             # move the plugins to opt
  I|init                            # create the plugin directory
  h|help                            # print usage

environment-variables:
  VACKPATH   # the plugin directory (default: $HOME/.vim/pack/vack)
```

Requirements
------------

- Git

Installtion
-----------

1. Copy `vack` into your `$PATH`.
2. Make `vack` executable.

### Example

```
$ curl -L https://raw.githubusercontent.com/kusabashira/vack/master/vack > ~/bin/vack
$ chmod +x ~/bin/vack
```

Note: In this example, `$HOME/bin` must be included in `$PATH`.

Commands
--------

### vack install [-os] \<repository\>...

Install the plugins from the repositories.

`-o` and `-s` are flags that change the instllation destination.
If `-o` is specified, it installs the plugins into `opt`.
If `-s` is specified, it installs the plugins into `start`.
By default, it installes the plugins into `start`.

```
$ vack i kusabashira/vim-incopen
(Install vim-incopen into start)

$ vack i -o kusabashira/vim-incopen
(Install vim-incopen into opt)
```

### vack update [-a] \<plugin\>...

Update the plugins.

If `-a` is specified, it updates all plugins.

```
$ vack u kusabashira/vim-incopen
(Update vim-incopen)

$ vack -a
(Update all plugins)
```

### vack remove \<plugin\>...

Remove the plugins.

```
$ vack r kusabashira/vim-incopen
(Remove vim-incopen)
```

### vack list [-aos]

List installed plugins.

`-a`,`-o` and `s` are flags that change the target plugins.
If `-a` is specified, it lists all plugins.
If `-o` is specified, it lists only the opt plugins.
If `-s` is specified, it lists only the start plugins.
By default it lists all plugin.

```
$ vack l
vim-quickrun
vim-incopen
...

$ vack l -o
vim-incopen
...
```

### vack path [-a] \<plugin\>...

Show the path of the plugins.

If `-a` is specified, It shows all path of the plugins.

```
$ vack p vim-incopen
/home/user/.vim/pack/vack/opt/vim-incopen

$ vack p -a
/home/user/.vim/pack/vack/start/vim-quickrun
/home/user/.vim/pack/vack/opt/vim-incopen
...
```

### vack enable \<plugin\>...

Move the plugins to start.

```
$ vack e vim-incopen
(Move vim-incopen from opt to start)
```

### vack disable \<plugin\>...

Move the plugins to opt.

```
$ vack d vim-incopen
(Move vim-incopen from start to opt)
```

### vack init

Create the root plugin directory.

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

The path of the root plugin directory.
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
