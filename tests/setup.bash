#!/bin/env bash

set -e

_common_setup() {
  load "test_helper/bats-assert/load.bash"
  load "test_helper/bats-support/load.bash"
  source "${PROJECT_SETUP}"
}

_config_setup() {
  _common_setup
  source "${LIB_CONFIG}"

  export shelldoc_config=$(
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
    [configure]="shelldoc.cmd.config"
    [description]='# Shelldoc configuration docs'
    [exclude]='*.shell, *.bats'
    [include]='*.sh'
    [multiple]=true
    [outfile]='shelldoc.config.md'
    [recurse]=true
    [title]='# Shelldoc configuration'
  )
}

_config_file_setup() {
  _config_setup
  configuration_file="${PROJECT_ROOT}/shelldoc.config"
  echo -e "${shelldoc_config}" >"${configuration_file}"
  config_file="${configuration_file}"
  parse_config
 }

_cmd_options_setup() {
  _config_file_setup

  cmd_options=(
    "-c" "shelldoc.cmd.config"
    "-d" "# Shelldoc configuration docs"
    "-e" "*.shell, *.bats"
    "-i" "*.sh"
    "-m"
    "-o" "shelldoc.config.md"
    "-r"
    "-t" "# Shelldoc configuration"
  )
  
  cmd_long_options=(
    "--configure" "shelldoc.cmd.config"
    "--description" "# Shelldoc configuration docs"
    "--exclude" "*.shell, *.bats"
    "--include" "*.sh"
    "--multiple"
    "--outfile" "shelldoc.config.md"
    "--recurse"
    "--title" "# Shelldoc configuration"
  )
 }
