#!/bin/bash

# === Settings ===
TOTAL_COMMITS=200
FILES=(
  "array.go"
  "calc.go"
  "heart.py"
  "hello.py"
  "if-else.py"
  "maps.go"
  "median.py"
  "spiral.py"
  "while.py"
  "pingpong/pingpong.py"
  "xox/xox.py"
)
MESSAGES=(
  "Fix bug"
  "Refactor code"
  "Improve readability"
  "Update logic"
  "Add new feature"
  "Fix typo"
  "Clean up code"
  "Optimize function"
  "Add comment"
  "Simplify condition"
)

# === Helper Functions ===
generate_random_date() {
  local month=$(shuf -i 4-9 -n 1)
  local day=$(shuf -i 1-28 -n 1) # safe max day
  local hour=$(shuf -i 9-18 -n 1)
  local min=$(shuf -i 0-59 -n 1)
  local sec=$(shuf -i 0-59 -n 1)
  printf "2019-%02d-%02dT%02d:%02d:%02d" $month $day $hour $min $sec
}

edit_file() {
  local file=$1
  echo "# Auto edit $(date +%s)" >>"$file"
}

# === Main Logic ===
count=0
declare -A used_days

while [ $count -lt $TOTAL_COMMITS ]; do
  DATE=$(generate_random_date)
  DATE_DAY=$(echo $DATE | cut -d'T' -f1)

  # Skip this day 50% of the time (simulate gaps)
  if [ $((RANDOM % 2)) -eq 0 ]; then
    continue
  fi

  # 1–3 commits on this day
  commits_today=$((1 + RANDOM % 3))
  for _ in $(seq 1 $commits_today); do
    if [ $count -ge $TOTAL_COMMITS ]; then break; fi

    FILE="${FILES[$RANDOM % ${#FILES[@]}]}"
    MESSAGE="${MESSAGES[$RANDOM % ${#MESSAGES[@]}]}"

    edit_file "$FILE"

    GIT_AUTHOR_DATE="$DATE" GIT_COMMITTER_DATE="$DATE" git add "$FILE"
    GIT_AUTHOR_DATE="$DATE" GIT_COMMITTER_DATE="$DATE" git commit -m "$MESSAGE"

    echo "[$count] Commit on $DATE: $MESSAGE → $FILE"
    ((count++))
  done

  # Track used days (optional)
  used_days[$DATE_DAY]=1
done
