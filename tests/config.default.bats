setup() {
  load "setup.bash"
  _config_setup
}

@test "\$config_file has the correct default value." {
  assert [ "${config_file}" == "${PROJECT_ROOT}/shelldoc.conf" ]
}

@test "\$config_description has the correct default value." {
  assert [ "${config_description}" == "\`shelldoc\` Documentation" ]
}

@test "\$config_exclude array is empty by default." {
  assert [ -z ${config_exclude[@]} ]
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
