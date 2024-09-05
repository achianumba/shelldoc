setup() {
   load "setup.bash"
  _common_setup
  source "${LIB_UTILS}"
}

@test "\$cmd is correct" {
  assert [ "${cmd}" == "shelldoc" ]
}

@test "print_usage runs successfully" {
  print_usage
}