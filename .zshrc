if [ "$TERM" = "xterm-256color" ]; then
    chpwd () { echo -n "_`dirs`\\" }


    preexec() {
        # see [zsh-workers:13180]
        # http://www.zsh.org/mla/workers/2000/msg03993.html
        emulate -L zsh
        local -a cmd; cmd=(${(z)2})
        case $cmd[1] in
            fg)
                if (( $#cmd == 1 )); then
                    cmd=(builtin jobs -l %+)
                else
                    cmd=(builtin jobs -l $cmd[2])
                fi
                ;;
            %*)
                cmd=(builtin jobs -l $cmd[1])
                ;;
            cd)
                if (( $#cmd == 2)); then
                    cmd[1]=$cmd[2]
                fi
                ;&
            *)
                echo -n "k$cmd[1]:t\\"
                prev=$cmd[1]
                return
                ;;
        esac

        local -A jt; jt=(${(kv)jobtexts})

        $cmd >>(read num rest
            cmd=(${(z)${(e):-\$jt$num}})
            echo -n "k$cmd[1]:t\\") 2>/dev/null

        prev=$cmd[1]
    }
    precmd() {
        #local prev; prev=`history -1 | sed "s/^[ 0-9]*//" | sed "s/ .*$//"  `
        echo -n "k$:$prev\\"
    }
    chpwd
fi
alias lt="ls -trl"
alias pd=popd
alias s=screen
alias l="ls -al"
title () {echo -n "\e]0;$*\a"}
setopt PROMPT_SUBST
export LANG=ja_JP.UTF-8
#export EDITOR=vim
export SVN_EDITOR=vim
export GIT_EDITOR=vim
export PERL_BADLANG=0
autoload -U compinit; compinit
setopt append_history
setopt auto_cd
setopt auto_list
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
#setopt auto_remove_slash
setopt auto_resume
setopt NO_beep
setopt brace_ccl
#setopt bsd_echo
#setopt chase_links
#setopt clobber
setopt correct
#setopt correct_all
setopt equals
setopt extended_glob
#setopt extended_history
setopt NO_flow_control
#setopt hash_cmds
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt NO_hup
setopt ignore_eof
setopt interactive_comments
setopt list_types
setopt long_list_jobs
setopt magic_equal_subst
#setopt mail_warning
setopt mark_dirs
#setopt menu_complete
setopt multios
setopt numeric_glob_sort
#setopt path_dirs
setopt print_eightbit
#setopt print_exit_value
#setopt pushd_ignore_dups
#setopt pushd_to_home
#setopt rm_star_silent
#setopt rm_star_wait
setopt short_loops
#setopt single_line_zle
#setopt xtrace
setopt prompt_subst
setopt share_history
setopt hist_no_store
unsetopt promptcr
setopt transient_rprompt
setopt autopushd

autoload predict-on
zle -N predict-on
zle -N predict-off
bindkey '^X^Z' predict-on
bindkey '^Z' predict-off
zstyle ':predict' verbose true

PROMPT=$BLUE'[${USER}@${HOSTNAME}] %(!.#.$) '$WHITE
function git_branch() { 
  local branch 
 
  if test -z $(git rev-parse --git-dir 2> /dev/null); then 
    branch='' 
  else 
    branch=" (${$(git symbolic-ref HEAD 2> /dev/null)#refs/heads/})" 
  fi
  echo -n "$branch" 
} 
#RPROMPT='$(git_branch)
RPROMPT=$GREEN'[%~]$(git_branch)'$WHITE
HISTFILE=$HOME/.zsh-history           # 履歴をファイルに保存する
HISTSIZE=100000                       # メモリ内の履歴の数
SAVEHIST=100000                       # 保存される履歴の数
setopt extended_history               # 履歴ファイルに時刻を記録
function history-all { history -E 1 } # 全履歴の一覧を出力する
setopt share_history
zstyle ':completion:*:default' menu select=1
umask 002

if [[ -f ~/.zshrc_local ]]; then
  source ~/.zshrc_local
fi
