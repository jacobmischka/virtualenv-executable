Creates an executable launcher for a virtualenv-using python script.

Usage:

```bash
$ [ -l <venv exec path (default ".venv/bin/python3")> ] <script> <output executable path>

```

Example:

```
$ create-venv-executable ~/projects/project-name/script-name.py ~/.local/bin/executable-name
```
