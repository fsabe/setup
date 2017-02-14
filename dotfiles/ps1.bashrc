# reset color
reset="\[\e[0m\]"       # text reset

# regular colors
black="\[\e[0;30m\]"        # black
red="\[\e[0;31m\]"          # red
green="\[\e[0;32m\]"        # green
yellow="\[\e[0;33m\]"       # yellow
blue="\[\e[0;34m\]"         # blue
purple="\[\e[0;35m\]"       # purple
cyan="\[\e[0;36m\]"         # cyan
white="\[\e[0;37m\]"        # white

# high intensty colors
iblack="\[\e[0;90m\]"       # black
ired="\[\e[0;91m\]"         # red
igreen="\[\e[0;92m\]"       # green
iyellow="\[\e[0;93m\]"      # yellow
iblue="\[\e[0;94m\]"        # blue
ipurple="\[\e[0;95m\]"      # purple
icyan="\[\e[0;96m\]"        # cyan
iwhite="\[\e[0;97m\]"       # white

function __exit_status {
  [ $? != 0 ] && echo -e "$ired✗$reset "
}

function __git_info {
  if [[ -z "$(git status -z)" ]]; then
    state="${igreen}"
  else
    state="${ired}"
  fi

  echo -e "$state$(__git_ps1 ' %s')$reset"
}

function set_ps1 {
  PS1="$(__exit_status)$iblack\u $white\w$(__git_info) $ipurple\$ $reset"
}

PROMPT_COMMAND=set_ps1
