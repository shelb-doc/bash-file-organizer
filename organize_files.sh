#!/bin/bash

# Function to create directories for file types if they don't exist
create_directories() {
    mkdir -p "$1"/Images
    mkdir -p "$1"/Documents
    mkdir -p "$1"/Scripts
    mkdir -p "$1"/Videos
}

# Function to move files based on extension
move_files() {
    for file in "$1"/*; do
        if [[ -f $file ]]; then
            case "${file,,}" in
                *.jpg|*.png|*.jpeg|*.gif)
                    mv "$file" "$1"/Images/
		    echo "Moved $file to Images";;
                *.pdf|*.txt|*.docx)
                    mv "$file" "$1"/Documents/
		    echo "Moved $file to Documents";;
                *.sh|*.py|*.js)
                    mv "$file" "$1"/Scripts/
		    echo "Moved $file to Scripts";;
	        *.mp4|*.mov|*.mkv)
		    mv "$file" "$1"/Videos/
		    echo "Moved $file to Videos";;
                *)
                    echo "Skipping $file, unknown file type.";;
            esac
        fi
    done
}

# Main script logic
if [[ -d $1 ]]; then
    echo "Organizing files in $1..."
    create_directories "$1"
    move_files "$1"
    echo "Done!"
else
    echo "Please provide a valid directory."
fi

