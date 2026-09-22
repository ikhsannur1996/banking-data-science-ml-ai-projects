#!/usr/bin/env bash
#
# extract_bank_zips.sh
#
# Extract every *.zip sitting in this folder (the "DS Training" folder) into one
# folder per project, skip anything that already exists, then remove the .zip
# once the extraction has been verified.
#
# Rules
#   target folder = zip name without ".zip", without a trailing "_project"
#                   bank_nlp_project.zip          -> bank_nlp/
#                   bank_survival_analysis_project.zip -> bank_survival_analysis/
#   - if the target folder already holds every file from the zip -> SKIP + remove zip
#   - if the target folder exists but is incomplete -> fill only the missing
#     files (unzip -n never overwrites), then remove zip
#   - if the target folder does not exist -> extract it, then remove zip
#   - the zip is deleted only after every entry is verified on disk, so a
#     failed / partial extraction keeps the archive around
#
# Usage
#   ./extract_bank_zips.sh              extract, verify, delete the zips
#   ./extract_bank_zips.sh --dry-run    only print what would happen
#   ./extract_bank_zips.sh --keep-zip   extract + verify, keep the .zip files
#
set -o pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
DRY_RUN=0
KEEP_ZIP=0

for arg in "$@"; do
  case "$arg" in
    --dry-run)  DRY_RUN=1 ;;
    --keep-zip) KEEP_ZIP=1 ;;
    -h|--help)  sed -n '2,24p' "$0"; exit 0 ;;
    *) echo "Unknown option: $arg (try --help)" >&2; exit 2 ;;
  esac
done

shopt -s nullglob
zips=("$ROOT"/*.zip)

if [ "${#zips[@]}" -eq 0 ]; then
  echo "No .zip file found in: $ROOT"
  exit 0
fi

# --- helpers ----------------------------------------------------------------

# list_entries <zip> : file entries inside the zip (directories / macOS junk skipped)
list_entries() {
  unzip -Z1 "$1" | grep -v -E '^(__MACOSX/|.*\.DS_Store$)' | grep -v '/$' || true
}

# missing_entries <zip> <target_dir> : entries of the zip that are not on disk yet
missing_entries() {
  local zip="$1" target="$2" entry
  list_entries "$zip" | while IFS= read -r entry; do
    [ -n "$entry" ] || continue
    [ -e "$target/$entry" ] || printf '%s\n' "$entry"
  done
}

# --- main loop --------------------------------------------------------------

extracted=0
skipped=0
deleted=0
kept=0
failed=0

echo "Source folder: $ROOT"
echo

for zip in "${zips[@]}"; do
  zip_name="$(basename "$zip")"
  base="${zip_name%.zip}"
  case "$base" in
    *_project) target_name="${base%_project}" ;;
    *)         target_name="$base" ;;
  esac
  target="$ROOT/$target_name"
  entry_count="$(list_entries "$zip" | grep -c .)"

  if [ -d "$target" ] && [ -z "$(missing_entries "$zip" "$target")" ]; then
    action="SKIP"
  elif [ -d "$target" ]; then
    action="FILL"
  else
    action="EXTRACT"
  fi

  case "$action" in
    SKIP)
      echo "SKIP     $zip_name -> $target_name/  (already extracted, $entry_count file(s))"
      skipped=$((skipped + 1))
      ;;
    FILL)
      echo "FILL     $zip_name -> $target_name/  (folder exists, adding missing file(s) only)"
      if [ "$DRY_RUN" -eq 0 ]; then
        if unzip -n -q "$zip" -d "$target"; then
          extracted=$((extracted + 1))
        else
          echo "         !! unzip failed - keeping $zip_name"
          failed=$((failed + 1))
          continue
        fi
      fi
      ;;
    EXTRACT)
      echo "EXTRACT  $zip_name -> $target_name/  ($entry_count file(s))"
      if [ "$DRY_RUN" -eq 0 ]; then
        mkdir -p "$target"
        if unzip -q "$zip" -d "$target"; then
          extracted=$((extracted + 1))
        else
          echo "         !! unzip failed - keeping $zip_name"
          failed=$((failed + 1))
          continue
        fi
      fi
      ;;
  esac

  if [ "$DRY_RUN" -eq 1 ]; then
    echo "         (dry-run) would verify $target_name/ and then delete $zip_name"
    continue
  fi

  # verify before deleting anything
  remaining="$(missing_entries "$zip" "$target")"
  if [ -z "$remaining" ]; then
    if [ "$KEEP_ZIP" -eq 1 ]; then
      echo "         verified OK - --keep-zip, keeping $zip_name"
      kept=$((kept + 1))
    elif rm -f "$zip"; then
      echo "         verified OK - removed $zip_name"
      deleted=$((deleted + 1))
    else
      echo "         !! could not remove $zip_name"
      kept=$((kept + 1))
    fi
  else
    echo "         !! still missing, keeping $zip_name:"
    printf '%s\n' "$remaining" | sed 's/^/            /'
    kept=$((kept + 1))
  fi
done

# --- summary ----------------------------------------------------------------

echo
echo "Summary"
echo "  extracted/filled : $extracted"
echo "  skipped (existed): $skipped"
echo "  zip removed      : $deleted"
echo "  zip kept         : $kept"
echo "  failures         : $failed"

[ "$failed" -eq 0 ] || exit 1
exit 0
