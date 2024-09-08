cmd_options='-c a-different-config-file.ini -d "# Shelldoc configuration docs" -e "*.shell, *.bats" -i *.sh -m -o shelldoc.config.md -r -t "# Shelldoc configuration"'

cmd_long_options='--configure --description "# Shelldoc configuration docs" --exclude "*.shell, *.bats" --include *.sh --multiple --outfile shelldoc.config.m --recurse --title "# Shelldoc configuration"'

parse_cmd_opts $cmd_long_options

