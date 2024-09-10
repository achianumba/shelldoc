# shelldoc [WIP]

Generate documentation from annotated shell scripts.

## To Do

- [x] Write bundler in BASH, not Make. 
- [x] Load user configuration to overwrite defaults.
- [x] Parse command line arguments to overwrite defaults and config file.
- [ ] Extract doclets from included scripts.
- [ ] Write doclets to multiple or a single file.
- [ ] Replace ***shelldoc.conf*** with shelldoc.ini?

## Config filename

***shelldoc.conf***

## Operators

- `$` - Shell script variable to be parsed and its output used to populate/replace field
- `%` - Shelldoc variable.  (This might need a way to specify whether to parse actual value or not. E.g., to parse value into docs, close it off with %)

## Development

- clone repo & sub modules
- `. setup.bash`
