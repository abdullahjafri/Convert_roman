#!/usr/bin/env bash

function roman_numeral() {
# This function will perform and selection for the case. to wich unit need to used for user inoput.
number="$1" # User input
digit=0 # Number of digit user provided
places="${#number}" # depending on the user provided number of digit, place will be use as case handler.

  while read -r -n1 digit; do # while function will use to read numbe rof digit one by one.
# Every case has three digits that will be used as input in next function.
    case "$places" in
    4)
      roman_digit "M" "" "" "$digit";;
    3)
      roman_digit "C" "D" "M" "$digit";;
    2)
      roman_digit "X" "L" "C" "$digit";;
    1)
      roman_digit "I" "V" "X" "$digit";;
    esac
    (( places -= 1 ))
  done <<< "$number"

  printf '\n'
  return
}
function roman_digit() {
# THis fucntion will take three inout based on above function output.
low="$1"  # first numerals
med="$2" # Second numerals
high="$3" # Third numerals
digit="$4" # how many times it need to be printed.
# Below if/else condition for each number in the loop.
  if [[ $digit -lt 4 ]]; then
    print_letters "$low" "$digit"
  elif [[ $digit -eq 4 ]]; then
    printf  "$low$med"
  elif [[ $digit -lt 9 ]]; then
    printf  "$med"
    print_letters "$low" $(( digit - 5 ))
  elif [[ $digit -eq 9 ]]; then
    printf "$low$high"
  else
    echo "Error: $digit not between 0 and 9." >&2
    exit 1
  fi
}
function print_letters() {
# below function will print each roman numerals based on the output from above fucntion
letter="$1" # roman letter
iteratet="$2" 3 how many timesit needs to print it.

  for ((i=0; i<iteratet; i++)); do
    printf '%s' "$letter" # here %s is just used to considered output as a string. This is one of the bash fucntion.
  done
}

# Main function Lies here. Which will take input from  the users.
number=$1
roman_numeral "$number"
