green_emojis=(🍏 🍐 🥒 🥬 🥦 🌿 🍀 🌱 🌲 🌳 🐢 🦖 🦎 ✅ 💚)
commit_changes() {
    random_emoji=${green_emojis[RANDOM % ${#green_emojis[@]}]}

    # Append the current date to README.md
    echo "### $(date): Daily Commit!" >> "README.md"

    # Check if the file was updated successfully
    if [ $? -eq 0 ]; then
        echo "Content written to README.md successfully."
    else
        echo "Error writing to README.md"
        return 1
    fi

    # Check if the current directory is a Git repository
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        # Add the file to Git
        git add . 

        # Commit the changes
        git qush -m "Daily $random_emoji"

        if [ $? -eq 0 ]; then
            echo "Changes committed successfully."
        else
            echo "Error committing changes."
            return 1
        fi
    else
        echo "This directory is not a Git repository. Cannot commit changes."
        return 1
    fi
}

flag=1
echo "Green Day! ❇️" 
while true; do
	if [[ $(date +%H) -ge 00 ]]; then
		if [ $flag -eq 1 ]; then
				commit_changes
				flag=0
		fi 
	fi

	if [[ $(date +%H) -eq 00 ]]; then
		flag=1
	fi 
done
