setup() {
  load "setup.bash"
  _config_file_setup
}

@test "parse_config() overwrites \$config_description's default value." {
 assert [ "${config_description} == {config_options[description]}" ]
}

@test "parse_config() overwrites \$config_exclude's default value." {
  assert [ "${config_options[exclude]%,*}" == "${config_exclude[0]}" ]
  assert [ "${config_options[exclude]#*, }" == "${config_exclude[1]}" ]
}

@test "parse_config() overwrites \$config_include's default value." {
  assert [ "${config_options[include]%,*}" == "${config_include[0]}" ]
}


@test "parse_config() overwrites \$config_multiple's default value." {
  assert [ ${config_multiple} ]
}

@test "parse_config() overwrites \$config_outfile's default value." {
  assert [ "${config_outfile}" == "${config_options[outfile]}" ]
}

@test "parse_config() overwrites \$config_recurse's default value." {
  assert [ ${config_recurse} ]
}

@test "parse_config() overwrites \$config_title's default value." {
  assert [ "${config_title}" == "${config_options[title]}" ]
}

teardown() {
  rm "${configuration_file}"
}
