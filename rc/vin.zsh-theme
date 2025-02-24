#!/usr/bin/env zsh

# used prompt expansions:
#
# %F{color}  set fg color
# %f         reset fg color
#
# %K{color}  set bg color
# %k         reset bg color
#
# %D{%H:%M}  24h clock with leading zero (01:23)
#
# %n         username
# %m         hostname up to first dot
# %~         cwd, ~ instead of home path

prompt_status() {
  # 23:14
  echo -n "%F{blue}%D{%H:%M}%f"
  # ✘ (only when the last execution was failed)
  echo -n "%(?::%F{red}✘%f)"
}

prompt_user() {
  # sub@fantine❯
  if [[ $UID -ne 0 ]]
  then
    echo -n "%F{green}%n@%m%F{cyan}❯%f"
  fi
}

prompt_dir() {
  local dir="$PWD"
  local home="$HOME"
  local root="/"

  if [[ "$dir" == "$home"* ]]; then
    dir="~${dir#$home}"
    root="~/"
  fi

  local -a path_parts
  path_parts=("${(@s:/:)dir}")
  local depth=${#path_parts}

  if (( depth > 3 )); then
    echo -n "${root}.../${path_parts[-1]}"
  else
    echo -n "$dir"
  fi
}

prompt_git() {
  # Git 저장소 내부인지 확인
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    local git_repo git_branch git_tag git_commit

    # Git 저장소 이름 가져오기
    git_repo=$(basename "$(git rev-parse --show-toplevel)")

    # 현재 브랜치 가져오기
    git_branch=$(git symbolic-ref -q --short HEAD 2>/dev/null)
    if [[ -n "$git_branch" ]]; then
      echo -n ":%F{magenta}[$git_repo]%f%F{cyan}$git_branch%f"
      return
    fi

    # 태그 가져오기
    git_tag=$(git describe --tags 2>/dev/null)
    if [[ -n "$git_tag" ]]; then
      echo -n "%F{red}[$git_repo]%f%F{yellow}$git_tag%f"
      return
    fi

    # 커밋 해시 가져오기
    git_commit=$(git rev-parse --short HEAD 2>/dev/null)
    echo -n "%F{yellow}[$git_repo]%f%F{green}$git_commit%f"
  fi
}


prompt_end() {
  # ¶ (for root)
  # ❯ (for others)
  if [[ "$UID" -eq 0 ]]
  then
    echo -n "%F{red}¶%f"
  else
    echo -n "%F{cyan}❯%f"
  fi
}

# 23:14✘sub@fantine❯~/.oh-my-zsh/custom:develop❯
build_prompt() {
  prompt_status
  prompt_user
  prompt_dir
  prompt_git
  prompt_end
}
PROMPT='$(build_prompt) '

# show elapsed time at the RPROMPT if slower than 3sec.
start-timer() {
  ZSH_SUBLEE_TIMER="$SECONDS"
}
stop-timer-rprompt() {
  RPROMPT=''
  if [[ -z "$ZSH_SUBLEE_TIMER" ]]
  then
    return
  fi

  local elapsed
  elapsed="$(($SECONDS - $ZSH_SUBLEE_TIMER))"
  unset ZSH_SUBLEE_TIMER

  if [[ "$elapsed" -lt 3 ]]
  then
    # ~3sec: show nothing
    RPROMPT=''
  elif [[ "$elapsed" -lt 600 ]]
  then
    # 3sec~10min: ↳42sec (yellow)
    RPROMPT="%F{yellow}↳%S${elapsed}sec%s%f"
  else
    # 10min~: ↳23min (red)
    RPROMPT="%F{red}↳%S$((elapsed/60))min%s%f"
  fi
}
add-zsh-hook preexec start-timer
add-zsh-hook precmd  stop-timer-rprompt
