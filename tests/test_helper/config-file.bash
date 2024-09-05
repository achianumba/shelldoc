shelldoc_config=$(
  cat <<SHELLDOC_CONFIG
# Shelldoc configuration
description="# Shelldoc configuration docs"
exclude="*.shell, *.bats"
include="*.sh"
multiple=true
outfile="shelldoc.config.md"
recurse=true
title="# Shelldoc configuration"
SHELLDOC_CONFIG
)

declare -A config_options=(
  [description]="# Shelldoc configuration docs"
  [exclude]="*.shell, *.bats"
  [include]="*.sh"
  [multiple]=true
  [outfile]="shelldoc.config.md"
  [recurse]=true
  [title]="# Shelldoc configuration"
)
