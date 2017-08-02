#!/bin/sh

set -euo pipefail

OPTIND=1

VENV_EXEC_PATH='.venv/bin/python3'

while getopts "e:" opt; do
	case "$opt" in
		e)
			VENV_EXEC_PATH="$OPTARG"
			;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
			;;
	esac
done

shift $((OPTIND-1))

if [ $# -lt 2 ]; then
	echo "Usage: [ -e <venv exec path (default '$VENV_EXEC_PATH')> ] <script> <output executable path>"
	exit 1
fi

# https://stackoverflow.com/a/3915420/5377793
SCRIPT_DIR="$(cd "$(dirname "$1")"; pwd)"
SCRIPT_NAME="$(basename "$1")"

EXECUTABLE_DEST="$2"

echo "
#!/bin/sh

$SCRIPT_DIR/$VENV_EXEC_PATH $SCRIPT_DIR/$SCRIPT_NAME \"\$@\"
" > "$EXECUTABLE_DEST"

chmod +x "$EXECUTABLE_DEST"
