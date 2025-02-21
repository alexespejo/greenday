#!/bin/zsh


# Write the content to the file

echo "$(date): Daily Commit!" >> "README.md"

# Check if the file was created successfully
if [ $? -eq 0 ]; then
    echo "Content written to README.md successfully."
else
    echo "Error writing to README.md"
    exit 1
fi

# Check if the current directory is a Git repository
if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    # Add the file to Git
    git add . 


    # Commit the changes
    git qush "dailly commit!"

    if [ $? -eq 0 ]; then
        echo "Changes committed successfully."
    else
        echo "Error committing changes."
        exit 1
    fi
else
    echo "This directory is not a Git repository. Cannot commit changes."
    exit 1
fi
