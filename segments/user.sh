
# Print the current date.

TMUX_POWERLINE_SEG_USER_FORMAT_DEFAULT="%U"

generate_segmentrc() {
  read -d '' rccontents  << EORC
  # date(1) format for the date. If you don't, for some reason, like ISO 8601 format you might want to have "%D" or "%m/%d/%Y".
  export TMUX_POWERLINE_SEG_USER_FORMAT="${1:-$TMUX_POWERLINE_SEG_USER_FORMAT_DEFAULT}"
EORC
  echo "$rccontents"
}

__process_settings() {
  if [ -z "$TMUX_POWERLINE_SEG_USER_FORMAT" ]; then
    export TMUX_POWERLINE_SEG_USER_FORMAT="${TMUX_POWERLINE_SEG_USER_FORMAT_DEFAULT}"
  fi
}

run_segment() {
  __process_settings
  GROUP=$(id -gn)
  TMUX_POWERLINE_SEG_USER=$TMUX_POWERLINE_SEG_USER_FORMAT
  TMUX_POWERLINE_SEG_USER=${TMUX_POWERLINE_SEG_USER//%U/$USER}
  TMUX_POWERLINE_SEG_USER=${TMUX_POWERLINE_SEG_USER//%G/$GROUP}
  echo $TMUX_POWERLINE_SEG_USER
  return 0
}
