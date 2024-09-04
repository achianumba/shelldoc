source ./utils.bash

## @var {file=$config_configure} - Project configuration file. #
config_configure="$(pwd)/shelldoc.conf"

## @var {string=$config_description} - Project/documentation description. #
config_description="${cmd} Documentation"

## @var {string=$config_exclude} - Comma-separated array of filename patterns to not parse. #
declare -a config_exclude=()

## @var {string=$config_include} - Comma-separated array of filename patterns to parse. #
declare -a config_include=(
  "*.sh"
  "*.bash"
  "*.zsh"
  "*.fish"
)

## @var {string=$config_multiple} - Generates multi-file documentation if true. #
config_multiple=false

## @var {string=$config_outfile} - Generated documentation file (or folder when using -m and -o options).
config_outfile="$(basename "${PWD}")"

## @var {string=$config_recurse} - Parse files in sub directories of included files.
config_recurse=false

## @var {string=$config_title} - The generated documentation's title.
config_title="${cmd}"

# Overwrite defaults with user's config file
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

    if [[ "${key}" == "include" || "${key}" == "exclude" ]]; then
      # Strip all spaces
      value="$(echo "${value}" | tr -d " ")"

      # Convert to array and overwrite default
      IFS="," read -r -a "config_${key}" <<<"${value}"
      continue
    fi

    # Dynamically overwrite defaults
    declare "config_${key}=${value}"
  done
fi

args="${@}"

# read arguments
opts=$(
  getopt -o "c:d:e:hi:mo:r:t" \
    -l "configure:,description:,exclude:,help:,include:,multiple,outfile:,recurse,title:" \
    --name "${cmd}" \
    -- "$@"
)

# Parse arguments
eval set -- "${opts}"

# Overwrite default config and config file
while [ $# -gt 0 ]; do
  case "${1}" in
  ## @option %config_configure #
  -c | --configure)
    config_configure="${2}"
    shift 2
    ;;

  ## @option %config_description #
  -d | --description)
    config_description="${2}"
    shift 2
    ;;

  ## @option %config_exclude #
  -e | --exclude)
    exclude_patterns="$(echo "${2}" | tr -d " ")"
    IFS="," read -r -a config_exclude <<<"${2}"
    shift 2
    ;;

  ## @option - Prints help/usage information #
  -h | --help)
    print_usage
    exit 0
    ;;

  ## @todo Consider allowing multiple -i options to pass one pattern each. #
  ## @option %config_include #
  -i | --include)
    include_patterns="$(echo "${2}" | tr -d " ")"
    IFS="," read -r -a config_include <<<"${2}"
    shift 2
    ;;

  ## @option %config_multiple #
  -m | --multiple)
    config_multiple=true
    shift
    ;;

  ## @option %configure_outfile #
  -o | --outfile)
    config_outfile="${2}"
    shift 2
    ;;

  ## @option %config_recurse #
  -r | --recurse)
    config_recurse=true
    shift
    ;;

  -t | --title)
    ## @option %config_title #
    config_title="${2}"
    shift 2
    ;;

  --)
    shift
    break
    ;;

  *)
    break
    ;;
  esac
  shift
done
