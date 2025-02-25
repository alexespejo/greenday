green_emojis=(🍏 🍐 🥒 🥬 🥦 🌿 🍀 🌱 🌲 🌳 🐢 🦖 🦎 ✅ 💚)
commit_changes() {
    random_emoji=${green_emojis[RANDOM % ${#green_emojis[@]}]}

    # write to file
    echo "### $(date): Daily $random_emoji!" >> "README.md"

    if [ $? -eq 0 ]; then
        echo "Content written to README.md successfully."
    else
        echo "Error writing to README.md"
        return 1
    fi

    # gets branch
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        # add changes to git 
        git add . 
        git qush "Daily $random_emoji"

        if [ $? -eq 0 ]; then
            echo -e "Changes committed successfully\n\nStarting again!"
        else
            echo "Error committing changes."
            return 1
        fi
    else
        echo "This directory is not a Git repository. Cannot commit changes."
        return 1
    fi
}

echo -e "Green Day! ❇️ \n" 
while true; do
	if [[ $(date +%H) -ge 00 ]]; then
    commit_changes
    sleep 43200 && echo "24 hours have passed!"
	fi
done
