import json
import os
import subprocess


def get_git_config(key: str) -> str | None:
    try:
        return (
            subprocess.check_output(['git', 'config', '--get', key])
            .strip()
            .decode('utf-8')
        )
    except subprocess.CalledProcessError:
        return None


def update_cookiecutter_context() -> None:
    context_file = 'cookiecutter.json'
    if not os.path.exists(context_file):
        return

    with open(context_file, encoding='utf-8') as f:
        context = json.load(f)

    context['author'] = get_git_config('user.name')
    context['email'] = get_git_config('user.email') or 'default@example.com'

    with open(context_file, 'w', encoding='utf-8') as f:
        json.dump(context, f, indent=4)


update_cookiecutter_context()
