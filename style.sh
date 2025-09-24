#!/usr/bin/env bash
# Name: Jasmin | CS 3030 | Module 2 (Tutorial)
# Mini-Programming Walktrhough: Message Styler


usage() {
  cat <<TXT
Usage: ${0##*/} [-h] [-n NAME]
Options:
  -h      Show this help message
  -n NAME Greet NAME (default: stranger)

Examples:
  ${0##*/} -n Mackenzie
  ${0##*/} -h
TXT
}

error() {
  echo "Error: $1"
  usage
  exit 2
}

name="stranger"     # default name
count=1             # default count
upper=false         # default upper

# parse option (-h, -n NAME, -c COUNT, -u)
while getopts ":hn:c:u" opt; do        # inside getopts string ( u )
  case "$opt" in
    h) usage; exit 0 ;;           # show help
    n) name="$OPTARG" ;;          # show name
    c) count="$OPTARG" ;;         # show count; taskB added
    u) upper=true ;;              # set upper case flag
    \?) error "Unknown option: -$OPTARG" ;;
    :) error "Missing argument for -$OPTARG" ;;
  esac
done


# Validate count (must be integer >= 1)
if ! [[ "$count" =~ ^[1-9][0-9]*$ ]]; then
  error "COUNT must be a positive integer (>=1)."
fi


# Handle positional custom message; taskD added
shift $((OPTIND-1))
custom="${1:-}"

# Build the message ONCE (don’t overwrite it later); from taskD instructions
# msg="${custom:-Hello, $name!}"

# Build message; taskD added (chatgpt suggested; same as above, but easier to read and debug)
if [[ -n "$custom" ]]; then
  msg="$custom"
else
  msg="Hello, $name!"
fi


# Print greeting COUNT times
for ((i=1; i<=count; i++)); do
  # if true, translating characters
  if [ "$upper" = true ]; then
    echo "$msg" | tr '[:lower:]' '[:upper:]'
  else
    echo "$msg"
  fi
done