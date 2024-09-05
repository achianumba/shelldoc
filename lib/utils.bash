readonly cmd="shelldoc"

print_usage() {
  usage_info=$(
    cat <<USAGE
\n
Usage: ${cmd} [-c CONFIG_FILE][-d DESCRIPTION] [-h] [-m] [-r] [-t TITLE]

Options:

  -c CONFIG_FILE
  --configure CONFIG_FILE\t Sets CONFIG_FILE as a project's
  \t configuration file.
 
  -d DESCRIPTION
  --description DESCRIPTION\t Sets DESCRIPTION to the 
  \t generated docs' description filed.

  -e PATTERN
  --exclude PATTERN\t Excludes files/doclets that match the 
  \t specified pattern\n\t from the generated documentation.

  -h, --help\t Display this help message.

  -i PATTERN
  --include PATTERN\t Generates documentation from files that
  \t match the specified pattern.

  -m
  --multiple\t Generate a multi-file documentation where
  \t each file's name matches it's source file's base name.

  -o
  --outfile\t Generated documentation file.
  \t Used as the name of the documentation when
  \t passed alongside -m or --multiple
  -r
  --recurse\t Scan all sub folders for comments.

  -t TITLE
  --title TITLE\t Sets the documenation's title.
 \n
USAGE
  )

  echo -e "${usage_info}" | expand -t 30
}

# Handle errors
# trap "print_usage" ERR
