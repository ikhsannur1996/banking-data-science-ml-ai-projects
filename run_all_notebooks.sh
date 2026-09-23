#!/bin/zsh
# Execute all project notebooks in place and report success/failure per notebook.
# Requires: main conda env for most projects; conda env "tf312" (Python 3.12 + TensorFlow)
# for the computer-vision notebook (09), because TensorFlow has no Python 3.14 build.
cd "$(dirname "$0")"
JUPYTER=$(command -v jupyter || echo /opt/anaconda3/bin/jupyter)
TF_JUPYTER=/opt/anaconda3/envs/tf312/bin/jupyter
RESULT=/tmp/nb_run_results.txt
: > "$RESULT"
for f in */*.ipynb; do
  folder="${f:h:t}"
  echo ">>> $folder ..." >> "$RESULT"
  RUNNER="$JUPYTER"
  [[ "$folder" == 09_computer_vision ]] && RUNNER="$TF_JUPYTER"
  "$RUNNER" nbconvert --to notebook --execute --inplace "$f" \
    --ExecutePreprocessor.timeout=1800 2>>"$RESULT"
  if [ $? -eq 0 ]; then
    echo "OK $folder" >> "$RESULT"
  else
    echo "FAIL $folder" >> "$RESULT"
  fi
done
echo "DONE" >> "$RESULT"


