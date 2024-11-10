#!/bin/bash

# Loop through each user directory in /home
for user_dir in /home/*; do
  # Check if it's a directory
  if [ -d "$user_dir" ]; then
    echo "Creating decoy files in $user_dir..."
    
    # Create 100 decoy files
    for i in $(seq 1 100); do
      decoy_file="$user_dir/decoy_file_$i.txt"
      # Write random content to each decoy file
      echo "This is a decoy file number $i in $user_dir." > "$decoy_file"
      head -c 100 /dev/urandom | base64 >> "$decoy_file"
    done

    echo "100 decoy files created in $user_dir."
  fi
done

echo "Decoy file creation completed."
