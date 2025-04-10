#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

MERGED_FILE="$SCRIPT_DIR/vin.rc.merged"

separator="# ------------------------------------------------------------"
echo -e "#!/usr/bin/env bash\n" > "$MERGED_FILE"
for file in $(find "$SCRIPT_DIR/rc" -type f -name "rc-*" | sort); do
  if [ -f "$file" ]; then
    {
      echo -e "${separator}\n# $(realpath "$file")\n${separator}"
      cat "$file"
      echo -e "\n\n"
    } >>"$MERGED_FILE"
  fi
done
