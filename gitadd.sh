#!/bin/bash

# Navigate to the root of the git repository
cd "$(git rev-parse --show-toplevel)"

# Find all files recursively, excluding .git directory
find . -type f -not -path './.git/*' | while read file; do
    # Remove the leading ./ from the filename
    filename="${file#./}"
    
    # Add the file to git
    git add "$filename"
    
    # Commit the file with a message
    git commit -m "add: $filename"
done

echo "All files have been added and committed individually."