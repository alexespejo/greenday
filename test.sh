flag=1
echo "Starting!" 
commit_changes() {
    # Check if the current directory is a Git repository
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        # Add the file to Git
        git add .

        # Commit the changes
        git commit -m "daily commit!"

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

while true; do
	if [[ "$(date +%H:%M)" == "19:14" ]]; then
		if [ $flag -eq 1 ]; then
				commit_changes

				flag=0
		fi 
	else 
		flag=1
	fi
done
