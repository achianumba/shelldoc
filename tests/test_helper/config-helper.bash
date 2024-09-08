shelldoc_config=$(
  cat <<SHELLDOC_CONFIG
# Shelldoc configuration
description="# Shelldoc configuration docs"
exclude='*.shell, *.bats'
include='*.sh'
multiple=true
outfile='shelldoc.config.md'
recurse=true
title='# Shelldoc configuration'
SHELLDOC_CONFIG
)

declare -Ag config_options
config_options=(
  [configure]="a-different-config-file.ini"
  [description]='# Shelldoc configuration docs'
  [exclude]='*.shell, *.bats'
  [include]='*.sh'
  [multiple]=true
  [outfile]='shelldoc.config.md'
  [recurse]=true
  [title]='# Shelldoc configuration'
)

cmd_options='-c a-different-config-file.ini -d "# Shelldoc configuration docs" -e "*.shell, *.bats" -i *.sh -m -o shelldoc.config.md -r -t "# Shelldoc configuration"'
cmd_long_options='--configure --description "# Shelldoc configuration docs" --exclude "*.shell, *.bats" --include *.sh --multiple --outfile shelldoc.config.m --recurse --title "# Shelldoc configuration"'
