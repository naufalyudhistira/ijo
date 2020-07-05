for ((i = 1; i <= $(((RANDOM % 3) + 1)); i++)); do # Randomizing between 1 - 3
  echo ""
  commitMsg="chore(app): Commit in $(date)"
  echo "+---------------------------------------------------------+"
  echo "| -> $commitMsg  |"
  echo "$commitMsg" >>output.txt
  echo "+---------------------------------------------------------+"

  # Commit and push
  git add output.txt
  git commit -m "$commitMsg"
  git push origin master

  echo "+-----------------------------------------------------+"
  echo "| -> Push $i times, at $(date)   |"
  echo "+-----------------------------------------------------+"
  echo ""
done
echo " -> Task completed! "
echo " -> Press Enter to close terminal"
read
