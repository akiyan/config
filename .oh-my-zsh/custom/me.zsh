ZSH_THEME="ys"

setopt share_history
setopt extended_history               # 履歴ファイルに時刻を記録
function history-all { history -E 1 } # 全履歴の一覧を出力する

alias t="tmux -2"
setopt NO_beep
setopt NO_AUTO_CD
