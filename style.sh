cat > style.sh <<'EOF'
#!/usr/bin/env bash
# Name: Jasmin | CS 3030 | Module 2 (Tutorial)
# Mini-Programming Walktrhough: Message Styler

#TO-DO:
    # Create repo to build & track features with branches
    # this script is all of the examples throughout the last several lessons compiled into one walkthrough.
        # Context: Message Styler - a tiny script that prints a greeting. 
        # Goal: Practice the full Git flow: create repo, make a feature on a branch, test,  merge to main, repeat.
        # Submission: None. This is for you to practice with branching before working with your lab.


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

#default name
name="stranger"

if [[ "${1:-}" == "-h" ]]; then
  usage
  exit 0
fi

echo "Hello, $name!"
EOF
