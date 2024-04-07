import shutil
from pathlib import Path


def run():
    to_delete = set()
    to_delete.update(
        (Path.home() / "Library/Caches").glob("*")
    )
    to_delete.update(
        path
        for path in (Path.home() / ".cache").glob("*")
        if path.name != "pre-commit"
    )
    to_delete.update([
        # To find large service worker caches: find ~/Library -type d -name CacheStorage 2>/dev/null | grep "Service Worker" | xargs -I{} du -h -d 0 {} | sort -h  # noqa: 501
        "/Users/mark/Library/Containers/com.tinyspeck.slackmacgap/Data/Library/Application Support/Slack/Service Worker/CacheStorage",  # noqa: E501
        "/Users/mark/Library/Application Support/Microsoft/Teams/Service Worker/CacheStorage",  # noqa: E501
    ])
    to_delete = set(Path(path) for path in to_delete)

    for path in sorted(to_delete):
        print(path)

    if input("Delete? [yN] ") != "y":
        print("Skipping")
        return

    for path in to_delete:
        try:
            if path.is_dir():
                shutil.rmtree(path)
            else:
                path.unlink()
        except Exception:
            print(f"Failed to delete: {path}")


if __name__ == "__main__":
    run()
