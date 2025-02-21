# submission_reminder_app_denzel147
Submission Reminder App

Overview

This project is a Shell Script-Based Reminder System that helps track student assignment submissions. It reads a list of students and their assignment statuses from submissions.txt and sends reminders to those who haven't submitted their work.

Features

Creates a structured directory with necessary files

Stores assignment details in config.env

Reads from submissions.txt to check submission status

Outputs reminders for students who haven't submitted their work

Can be executed using a simple startup script.

Repository Setup

Created a new GitHub repository named submission_reminder_app_denzel147.

Cloned the repository to the Intranet Web Terminal

Setting Up the Environment

I created a script named create_environment.sh to automate the setup. This created the required directories and files.
Files Created

config/config.env: Stores assignment name and remaining days.

data/submissions.txt: Contains student names, assignments, and submission statuses.

functions/functions.sh: Defines the check_submissions function to verify assignment submissions.

reminder.sh: Reads configuration, checks submissions, and outputs reminders.

startup.sh: A wrapper script to launch reminder.sh easily.


Running the Scripts

Checking Submissions
bash reminder.sh - This checks for students who haven't submitted their assignments.

Automating Execution
./startup.sh - This script runs reminder.sh automatically.

This script runs reminder.sh automatically.

Common Issues & Fixes

Issue: Only Three Students Show in Output

Fix: Remove Windows-style line endings:

sed -i 's/\r$//' ./data/submissions.txt

Issue: dos2unix: command not found

Fix:

tr -d '\r' < ./data/submissions.txt > temp.txt && mv temp.txt ./data/submissions.txt

Conclusion

This project successfully tracks assignment submissions and provides reminders using shell scripting and automation.
I hope this explains everything and thank you for this enjoyable task!
Author: Dimeji
