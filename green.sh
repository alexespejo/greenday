green_emojis=(🍏 🍐 🥒 🥬 🥦 🌿 🍀 🌱 🌲 🌳 🐢 🦖 🦎 ✅ 💚)
commit_changes() {
    random_emoji=${green_emojis[RANDOM % ${#green_emojis[@]}]}

    echo "### $(date): Daily $random_emoji!" >> "README.md"

    if [ $? -eq 0 ]; then
        echo "Content written to README.md successfully."
    else
        echo "Error writing to README.md"
        return 1
    fi

    if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        git add . 
        git qush "Daily $random_emoji"

        if [ $? -eq 0 ]; then
            echo -e "\n\nChanges committed successfully"
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
    sleep 86400 && echo "24 hours have passed!"
	fi
done
