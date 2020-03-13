_vack()
{
  local cur prev words cword split
  _init_completion || return

  local defaultIFS=$' \t\n'
  local IFS=$defaultIFS

  case $cword in
    1)
      COMPREPLY=( $(compgen -W 'install update remove list path enable disable init help' -- "$cur") )
      ;;
    *)
      case ${words[1]} in
        i|install)
          case $cur in
            -*) COMPREPLY=( $(compgen -W '-o -s --' -- "$cur") ) ;;
            *)  COMPREPLY=()
          esac
          ;;
        u|update)
          case $cur in
            -) COMPREPLY=( $(compgen -W '-a --' -- "$cur") ) ;;
            *) IFS=$'\n'; COMPREPLY=( $(compgen -W '$(vack list)' -- "$cur") ); IFS=$defaultIFS ;;
          esac
          ;;
        r|remove)
          case $cur in
            -) COMPREPLY=( $(compgen -W '--' -- "$cur") ) ;;
            *) IFS=$'\n'; COMPREPLY=( $(compgen -W '$(vack list)' -- "$cur") ); IFS=$defaultIFS ;;
          esac
          ;;
        l|list)
          case $cur in
            -) COMPREPLY=( $(compgen -W '-a -o -s --' -- "$cur") ) ;;
            *) COMPREPLY=() ;;
          esac
          ;;
        p|path)
          case $cur in
            -) COMPREPLY=( $(compgen -W '-a --' -- "$cur") ) ;;
            *) IFS=$'\n'; COMPREPLY=( $(compgen -W '$(vack list)' -- "$cur") ); IFS=$defaultIFS ;;
          esac
          ;;
        e|enable)
          case $cur in
            -) COMPREPLY=( $(compgen -W '--' -- "$cur") ) ;;
            *) IFS=$'\n'; COMPREPLY=( $(compgen -W '$(vack list -o)' -- "$cur") ); IFS=$defaultIFS ;;
          esac
          ;;
        d|disable)
          case $cur in
            -) COMPREPLY=( $(compgen -W '--' -- "$cur") ) ;;
            *) IFS=$'\n'; COMPREPLY=( $(compgen -W '$(vack list -s)' -- "$cur") ); IFS=$defaultIFS ;;
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
