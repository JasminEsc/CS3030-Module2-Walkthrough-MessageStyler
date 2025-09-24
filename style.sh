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

name="stranger"   # default name
count=1           # default count; taskB added

# parse option (-h, -n NAME, -c COUNT)
while getopts ":hn:c:" opt; do        # inside getopts string ( c: ); taskB added
  case "$opt" in
    h) usage; exit 0 ;;           # show help
    n) name="$OPTARG" ;;          # show name
    c) count="$OPTARG" ;;         # show count; taskB added
    \?) error "Unknown option: -$OPTARG" ;;
    :) error "Missing argument for -$OPTARG" ;;
  esac
done

# Validate count (must be integer >= 1); taskB added
if ! [[ "$count" =~ ^[1-9][0-9]*$ ]]; then
  error "COUNT must be a positive integer (>=1)."
fi

# Print greeting COUNT times; taskB added
for ((i=1; i<=count; i++)); do
  echo "Hello, $name!"
done
