#!/bin/env bash

export PATH="${PWD}:tests/bats/bin:${PATH}"
export PROJECT_ROOT="${PWD%shelldoc*}shelldoc"

for f in $(ls -1 "${PROJECT_ROOT}/lib"); do
  shelldoc_lib_name="$(echo "LIB_${f:0:-5}" | tr "[:lower:]" "[:upper:]")"
  
  export "${shelldoc_lib_name}"="${PROJECT_ROOT}/lib/${f}"
done

export PROJECT_SETUP="${PROJECT_ROOT}/setup.bash"