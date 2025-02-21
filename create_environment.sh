#!/bin/bash

# Ask for the user's name
read -p "Enter your name: " yourName

# Create the main directory
main_directory="submission_reminder_${yourName}"
mkdir -p "$main_directory"

# Create all the subdirectories
mkdir -p "$main_directory/config" "$main_directory/functions" "$main_directory/data" "$main_directory/logs"

# Create the file config.env
echo -e "ASSIGNMENT=\"Shell Navigation\"\nDAYS_REMAINING=2" > "$main_directory/config/config.env"

# Create functions.sh
cat << 'EOF' > "$main_directory/functions/functions.sh"
#!/bin/bash

function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    while IFS=, read -r student assignment status; do
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file")
}
EOF

# Create submissions.txt
cat << EOF > "$main_directory/data/submissions.txt"
student,assignment,submission_status
Chinemerem,Shell Navigation,not submitted
Chiagoziem,Git,submitted
Divine,Shell Navigation,not submitted
Anissa,Shell Basics,submitted
Denzel,Shell Navigation,submitted
Casper,Shell Basics,not submitted
Lamine,Git,not submitted
Simeon,Git,submitted
Herve,Shell Navigation,not submitted
Dave,Shell Basics,submitted
Henry,Git,Submitted
EOF

# Create reminder.sh
cat << 'EOF' > "$main_directory/reminder.sh"
#!/bin/bash

source "$(dirname "$0")/config/config.env"
source "$(dirname "$0")/functions/functions.sh"

submissions_file="$(dirname "$0")/data/submissions.txt"

echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

# Create startup.sh
echo -e '#!/bin/bash\n$(dirname "$0")/reminder.sh' > "$main_directory/startup.sh"

# Make scripts executable
chmod +x "$main_directory/reminder.sh" "$main_directory/startup.sh" "$main_directory/functions/functions.sh"

echo "Setup is complete! GO ahead and run ./startup.sh inside $main_directory to test."
