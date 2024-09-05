setup() {
  load "setup.bash"
  _common_setup
  source "${LIB_CONFIG}"
}

@test "\$config_configure has the correct default value." {
  assert [ "${config_configure}" == "${PROJECT_ROOT}/shelldoc.conf" ]
}

@test "\$config_description has the correct default value." {
  assert [ "${config_description}" == "\`shelldoc\` Documentation" ]
}

@test "\$config_exclude array is empty by default." {
  assert [ ${#config_exclude[@]} -eq 0 ]
}

@test "\$config_include array contains 2 items by default." {
  assert [ ${#config_include[@]} -eq 2 ]
}

@test "\$config_multiple is false by default." {
  assert [ "${config_multiple}" == "false" ]
}

@test "\$config_outfile has the correct default value." {
  assert [ "${config_outfile}" == "shelldoc" ]
}

@test "\$config_recurse is false by default." {
  assert [ "${config_recurse}" == "false" ]
}

@test "\$config_title has the correct default value." {
  assert [ "${config_title}" == "shelldoc" ]
}

@test "\$is_cmd_arg is false by default." {
  assert [ "${is_cmd_arg}" == false ]
}