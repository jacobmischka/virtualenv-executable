Creates an executable launcher for a virtualenv-using python script.

Usage:

```bash
$ [ -e <venv exec path (default ".venv/bin/python3")> ] <script> <output executable path>

```

Example:

```bash
$ create-venv-executable ~/projects/project-name/script-name.py ~/.local/bin/executable-name
```
