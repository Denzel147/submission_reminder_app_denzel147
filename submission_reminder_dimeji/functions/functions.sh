#!/bin/bash
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in: $submissions_file"

    while IFS=, read -r student assignment status; do
        # Clean up the fields to remove extra spaces
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if the assignment matches and if the status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment"
        fi
    done < <(tail -n +2 "$submissions_file")
}

