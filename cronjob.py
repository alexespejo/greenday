from apscheduler.schedulers.blocking import BlockingScheduler
from datetime import datetime
import subprocess

def my_task():
    command = "zsh green.zsh"
    result = sbprocess.run(command, shell=True, capture_output=True, text=True)
    print("Output:", result.stdout)
    print("Error:", result.stderr)


scheduler = BlockingScheduler()
scheduler.add_job(my_task, 'cron', hour=12, minute=26)  # Runs every day at 12:25 PM

try:
    print("Scheduler started...")
    scheduler.start()
except (KeyboardInterrupt, SystemExit):
    pass
