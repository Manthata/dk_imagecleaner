#!/bin/bash

# List all Docker images IDs
all_images=$(docker images -q)

# Initialize an empty string to hold images that are not used
unused_images=""

echo "Scanning for unused Docker images..."

# Loop through each image and check if it's used by any container
for image in $all_images; do
    # Check if the image is used by any container
    containers_using_image=$(docker ps -a --filter ancestor=$image -q)

    # If no containers are using the image, add it to the list of unused images
    if [ -z "$containers_using_image" ]; then
        unused_images+="$image "
    fi
done

# Check if there are any unused images
if [ -z "$unused_images" ]; then
    echo "No unused Docker images found."
else
    # Remove the unused images
    echo "Removing unused images..."
    docker rmi $unused_images
    echo "Unused images removed."
fi
