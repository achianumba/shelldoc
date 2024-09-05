source "${LIB_UTILS}"

## @var {file=$config_configure} - Project configuration file. #
# Weird name but matches dynamically declared command line option
config_configure="$(pwd)/shelldoc.conf"

## @var {string=$config_description} - Project/documentation description. #
config_description="\`${cmd}\` Documentation"

## @var {array=$config_exclude} - A comma-separated array of filename patterns to exclude from $config_include. #
config_exclude=()

## @var {array=$config_include} - Comma-separated array of filename patterns to parse. #
config_include=("*.sh" "*.bash")

## @var {boolean=$config_multiple} - Generates multi-file documentation if true. #
config_multiple=false

## @var {string=$config_outfile} - Generated documentation file (or folder when using -m and -o options). #
config_outfile="$(basename "${PROJECT_ROOT}")"

## @var {boolean=$config_recurse} - Parse files in sub directories of included files.
config_recurse=false

## @var {string=$config_title} - The generated documentation's title.
config_title="${cmd}"

## @var {boolean=$is_cmd_arg} #
is_cmd_arg=false

## @var {number=$shift_count=count} - Number of indexes to move when parsing command line args #
shift_count=0

##
# @arg {string} $1 - Config file field or command line option
# @arg {string|boolean} $2 - Config file field or command line option argument
#
set_option() {
  ## @var {boolean=$is_cmd_arg} #
  is_cmd_arg=false

  if [[ "$1" =~ ^\- ]]; then
    is_cmd_arg=true
  fi

  # Overwrite default config or config file configs
  case "${1}" in
  ## @option %config_configure #
  -c | --configure)
    config_configure="${2}"
    shift_count=2
    return 0
    ;;

  ## @option %config_description #
  -d | --description | description)
    config_description="${2}"
    shift_count=2
    return 0
    ;;

  ## @option %config_exclude #
  -e | --exclude | exclude)
    exclude_patterns="$(echo "${2}" | tr -d " ")"
    IFS="," read -r -a patterns <<<"${2}"

    config_exclude=(${patterns[@]})
    shift_count=2
    return 0
    ;;

  ## @option - Prints help/usage information #
  -h | --help)
    print_usage
    exit 0
    ;;

  ## @todo Consider allowing multiple -i options to pass one pattern each. #
  ## @option %config_include #
  -i | --include | include)
    patterns="$(echo "${2}" | tr -d " ")"
    IFS="," read -r -a patterns <<<"${2}"
    config_include=(${patterns[@]})
    shift_count=2
    return 0
    ;;

  ## @option %config_multiple #
  -m | --multiple | multiple)
    config_multiple=true
    shift_count=1
    return 0
    ;;

  ## @option %configure_outfile #
  -o | --outfile | outfile)
    config_outfile="${2}"
    shift_count=2
    return 0
    ;;

  ## @option %config_recurse #
  -r | --recurse | recurse)
    config_recurse=true
    shift_count=1
    return 0
    ;;

  -t | --title | title)
    ## @option %config_title #
    config_title="${2}"
    shift_count=2
    return 0
    ;;

  --)
    return 0
    ;;

  *)
    [ "${is_cmd_arg}" == false ] && echo -e "${cmd}: Error\nUnknown configuration field '${1}' in ${config_configure}" && exit 1
    ;;
  esac
}

## Overwrites defaults with user's config file
load_config_file() {
  if [ -e "${config_configure}" ]; then
    # Process each line
    mapfile -t lines <"${config_configure}"

    for line in "${lines[@]}"; do
      # Skip empty lines or comments
      [[ -z "$line" || "$line" =~ ^# ]] && continue

      # Split the line into key and value
      IFS='=' read -r key value <<<"$line"
      # Trim leading/trailing whitespace
      key=$(echo "${key}" | xargs)
      value=$(echo "${value}" | xargs)

      set_option "${key}" "${value}"
    done
  fi
}

# Parse arguments
parse_cmd_args() {
  # Define arguments
  opts=$(
    getopt -o "c:d:e:hi:mo:r:t" \
      -l "configure:,description:,exclude:,help:,include:,multiple,outfile:,recurse,title:" \
      --name "${cmd}" \
      -- "$@"
  )

  eval set -- "${opts}"

  # Overwrite default config and config file
  while [ $# -gt 0 ]; do
    set_option "${1}" "${2}"
    $is_cmd_arg && shift $shift_count
  done
}
