#!/bin/env bash

set -e

_common_setup() {
  load "test_helper/bats-assert/load.bash"
  load "test_helper/bats-support/load.bash"
  source "${PROJECT_SETUP}"
}

_config_file() {
  _common_setup
  load "test_helper/config-file.bash"
}