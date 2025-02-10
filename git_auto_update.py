import os
import time
import subprocess
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

class GitAutoUpdater(FileSystemEventHandler):
    def __init__(self, repo_path):
        self.repo_path = repo_path

    def on_any_event(self, event):
        if event.event_type in ('modified', 'created', 'deleted', 'moved'):
            print(f"Change detected: {event.src_path}")
            self.update_git()

    def update_git(self):
        try:
            os.chdir(self.repo_path)
            subprocess.run(["git", "add", "."], check=True)
            subprocess.run(["git", "commit", "-m", "Auto-update"], check=True)
            subprocess.run(["git", "push"], check=True)
            print("Git repository updated successfully.")
        except subprocess.CalledProcessError as e:
            print(f"Error during Git update: {e}")

if __name__ == "__main__":
    repo_path = os.path.abspath('.')  # Répertoire du projet
    event_handler = GitAutoUpdater(repo_path)
    observer = Observer()
    observer.schedule(event_handler, repo_path, recursive=True)
    observer.start()

    print(f"Watching for changes in {repo_path}...")
    try:
        while True:
            time.sleep(5)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()
