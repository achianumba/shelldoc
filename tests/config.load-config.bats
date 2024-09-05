setup() {
  load "setup.bash"
  _config_file

  source "${LIB_CONFIG}"
  configuration_file="${PROJECT_ROOT}/shelldoc.config"
  echo -e "${shelldoc_config}" >"${configuration_file}"
  config_configure="${configuration_file}"
  load_config_file
}

@test "load_config_file() overwrites \$config_description's default value." {
  assert [ "${config_description}" == "${config_options[description]}" ]
}

#@test "load_config_file() overwrites \$config_exclude's default value." {
#  assert [ "${config_options[exclude]%,*}" == "${config_exclude[0]}" ]
#  assert [ "${config_options[exclude]#*.}" == "${config_exclude[1]}" ]
#}

#@test "et_option overwrites \$config_include's default value." {
#  assert [ "${config_options[include]%,*}" == "${config_include[0]}" ]
#}

#@test "load_config_file() overwrites \$config_multiple's default value." {
#  assert [ ${config_multiple} ]
#}

#@test "load_config_file() overwrites \$config_outfile's default value." {
#  assert [ "${config_outfile}" == "${config_options[outfile]}" ]
#}

#@test "load_config_file() overwrites \$config_recurse's default value." {
#  assert [ ${config_recurse} ]
#}

#@test "load_config_file() overwrites \$config_title's default value." {
#  assert [ "${config_title}" == "${config_options[title]}" ]
#}

teardown() {
  rm "${configuration_file}"
}