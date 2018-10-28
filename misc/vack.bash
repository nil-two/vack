_vack()
{
  local cur=${COMP_WORDS[COMP_CWORD]}

  case $COMP_CWORD in
    1)
      local cmds="install update remove list path enable disable init help"
      COMPREPLY=( $(compgen -W "$cmds" -- "$cur") )
      ;;
    *)
      local cmd=${COMP_WORDS[1]}
      case $cmd in
        i|install)
          case $cur in
            -*)
              local opts="-o -s -h -H --"
              COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
              ;;
            *)
              COMPREPLY=()
              ;;
          esac
          ;;
        u|update)
          case $cur in
            -)
              local opts="-a -h -H --"
              COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
              ;;
            *)
              local pkgs=$(vack list)
              COMPREPLY=( $(compgen -W "$pkgs" -- "$cur") )
              ;;
          esac
          ;;
        r|remove)
          case $cur in
            -)
              local opts="--"
              COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
              ;;
            *)
              local pkgs=$(vack list)
              COMPREPLY=( $(compgen -W "$pkgs" -- "$cur") )
              ;;
          esac
          ;;
        l|list)
          case $cur in
            -)
              local opts="-a -o -s --"
              COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
              ;;
            *)
              COMPREPLY=()
              ;;
          esac
          ;;
        p|path)
          case $cur in
            -)
              local opts="-a --"
              COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
              ;;
            *)
              local pkgs=$(vack list)
              COMPREPLY=( $(compgen -W "$pkgs" -- "$cur") )
              ;;
          esac
          ;;
        e|enable)
          case $cur in
            -)
              local opts="--"
              COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
              ;;
            *)
              local pkgs=$(vack list -s)
              COMPREPLY=( $(compgen -W "$pkgs" -- "$cur") )
              ;;
          esac
          ;;
        d|disable)
          case $cur in
            -)
              local opts="--"
              COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
              ;;
            *)
              local pkgs=$(vack list -o)
              COMPREPLY=( $(compgen -W "$pkgs" -- "$cur") )
              ;;
          esac
          ;;
        I|init)
          COMPREPLY=()
          ;;
        h|help)
          COMPREPLY=()
          ;;
      esac
      ;;
  esac
}
complete -F _vack vack
