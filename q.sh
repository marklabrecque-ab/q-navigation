# Quick navigation function
q() {
  local target
  if [ -z "$1" ]; then
    target=~/Projects
  elif [ -d ~/Projects/"$1" ]; then
    target=~/Projects/"$1"
  elif [ -d ~/Projects/retainers/"$1" ]; then
    target=~/Projects/retainers/"$1"
  else
    target=~/Projects/"$1"
  fi
  if [ -d "$target/spaces" ]; then
    cd "$target/spaces"
  else
    cd "$target"
  fi
}

# Completion function for q()
_q() {
  local -a projects
  projects=(~/Projects/*(/:t) ~/Projects/retainers/*(/:t))
  _describe 'projects' projects
}
compdef _q q
