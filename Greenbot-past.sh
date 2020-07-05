# Input the date n-days ago
echo " -> Start date must be greater than End date"
echo -n " -> Start date (n-days ago) : "
read tgl1
echo -n " -> End date (n-days ago)   : "
read tgl2

# Check input, it is an integer?
if [[ ! $tgl1 =~ ^[0-9]+$ ]] || [[ ! $tgl2 =~ ^[0-9]+$ ]]; then
  echo " -> Integer not valid!"
  echo " -> Press Enter to close terminal"
  read
  exit
fi

# Compare 2 dates
if (($tgl2 >= $tgl1)); then
  echo " -> Start date must be greater than End date!"
  echo " -> Press Enter to close terminal"
  read
  exit
fi

# Start the loop
for ((j = $tgl1; j >= $tgl2; j--)); do               # Count Backwards
  for ((i = 1; i <= $(((RANDOM % 3) + 1)); i++)); do # Randomizing between 1 - 3
    commitMsg="chore(app): Commit in $(date)"
    echo "+---------------------------------------------------------+"
    echo "| -> $commitMsg  |"
    echo "$commitMsg" >>output.txt
    echo "+---------------------------------------------------------+"

    # Commit and push
    git add output.txt
    git commit --date "$j day ago" -m "$commitMsg"
    git push origin master

    echo "+------------------------------------------------------------+"
    echo "| -> Push on $j day ago, at $(date)   |"
    echo "+------------------------------------------------------------+"
  done
done

echo " -> Task completed! "
echo " -> Press Enter to close terminal"
read
