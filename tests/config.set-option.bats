setup() {
  load "setup.bash"
  _config_setup
}

@test "set_option overwrites \$config_description's default value." {
  set_option 'description' "${config_options[description]}"
  assert [ "${config_description}" == "${config_options[description]}" ]
}

@test "set_option overwrites \$config_exclude's default value." {
  set_option 'exclude' "${config_options[exclude]}"
  assert [ "${config_options[exclude]%,*}" == "${config_exclude[0]}" ]
  assert [ "${config_options[exclude]#*, }" == "${config_exclude[1]}" ]
}

@test "et_option overwrites \$config_include's default value." {
  set_option 'include' "${config_options[include]}"
  assert [ "${config_options[include]%,*}" == "${config_include[0]}" ]
}

@test "set_option overwrites \$config_multiple's default value." {
  set_option 'multiple' "${config_options[multiple]}"
  assert [ ${config_multiple} ]
}

@test "set_option overwrites \$config_outfile's default value." {
  set_option 'outfile' "${config_options[outfile]}"
  assert [ "${config_outfile}" == "${config_options[outfile]}" ]
}

@test "set_option overwrites \$config_recurse's default value." {
  set_option 'recurse' "${config_options[recurse]}"
  assert [ ${config_recurse} ]
}

@test "set_option overwrites \$config_title's default value." {
  set_option 'title' "${config_options[title]}"
  assert [ "${config_title}" == "${config_options[title]}" ]
}
