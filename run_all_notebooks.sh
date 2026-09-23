#!/bin/zsh
# Execute all project notebooks in place and report success/failure per notebook.
cd "$(dirname "$0")"
JUPYTER=$(command -v jupyter || echo /opt/anaconda3/bin/jupyter)
RESULT=/tmp/nb_run_results.txt
: > "$RESULT"
for f in */*.ipynb; do
  folder="${f:h:t}"
  echo ">>> $folder ..." >> "$RESULT"
  "$JUPYTER" nbconvert --to notebook --execute --inplace "$f" \
    --ExecutePreprocessor.timeout=900 2>>"$RESULT"
  if [ $? -eq 0 ]; then
    echo "OK $folder" >> "$RESULT"
  else
    echo "FAIL $folder" >> "$RESULT"
  fi
done
echo "DONE" >> "$RESULT"

