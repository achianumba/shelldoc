setup() {
  load "setup.bash"
  _cmd_options_setup
  parse_cmd_opts "${cmd_options[@]}"
}

@test "parse_cmd_opts() overwrites \$config_file's default value using short options." {
 assert [ "${config_file}" == "${config_options[configure]}" ]
}

@test "parse_cmd_opts() overwrites \$config_description's default value using short options." {
 assert [ "${config_description}" == "${config_options[description]}" ]
}

@test "parse_cmd_opts() overwrites \$config_exclude's default value using short options." {
  assert [ "${config_options[exclude]%,*}" == "${config_exclude[0]}" ]
  assert [ "${config_options[exclude]#*, }" == "${config_exclude[1]}" ]
}

@test "parse_cmd_opts() overwrites \$config_include's default value using short options." {
  assert [ "${config_options[include]%,*}" == "${config_include[0]}" ]
}

@test "parse_cmd_opts() overwrites \$config_multiple's default value using short options." {
  assert [ ${config_multiple} ]
}

@test "parse_cmd_opts() overwrites \$config_outfile's default value using short options." {
  assert [ "${config_outfile}" == "${config_options[outfile]}" ]
}

@test "parse_cmd_opts() overwrites \$config_recurse's default value using short options." {
  assert [ ${config_recurse} ]
}

@test "parse_cmd_opts() overwrites \$config_title's default value using short options." {
  assert [ "${config_title}" == "${config_options[title]}" ]
}

