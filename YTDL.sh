#!/bin/bash

# Colors for output
COLOR_CYAN="\e[36m"
COLOR_GREEN="\e[32m"
COLOR_RED="\e[31m"
COLOR_RESET="\e[0m"

# Check if yt-dlp is not installed
if ! command -v yt-dlp &>/dev/null; then
    echo "yt-dlp is not installed. Please install it using:"
    echo -e "${COLOR_RED}sudo pip3 install -U yt-dlp${COLOR_RESET}"
    exit 1
fi

# Enter URL of the YouTube video/playlist
while true; do
    read -p "Enter YouTube Video/Playlist URL: " url
    if [ -z "$url" ]; then
        echo -e "${COLOR_RED}Error: URL cannot be empty, Please enter a valid YouTube URL.${COLOR_RESET}"
    else
        break
    fi
done

# Ask the user for the directory to save the download
while true; do
    read -p "Enter directory to save the videos (default is 'YTVids'): " directory
    directory="${directory:-YTVids}"  # Use default 'YTVids' if no input is provided

    # Check if the directory exists
    if [ -d "$directory" ]; then
        echo "Directory '$directory' already exists."
        break
    else
        # Ask to create the directory if it doesn't exist
        read -p "Directory '$directory' does not exist. Do you want to create it? (y/n): " create_dir
        if [[ "$create_dir" == "y" || "$create_dir" == "Y" ]]; then
            mkdir -p "$directory"
            echo "Created directory: $directory"
            break
        else
            echo "Please provide a valid directory."
        fi
    fi
done

# Display download options
echo -e "\n${COLOR_CYAN}Please choose a download option:${COLOR_RESET}"
echo "-----------------------------------------"
echo "1. Download Video Only"
echo "2. Download Audio Only"
echo "3. Download Both Video and Audio"
echo "-----------------------------------------"

read -p "Enter your choice (1-3): " choice

# Set the filename format
filename="$directory/%(title)s.%(ext)s"

# Download the video based on the user's choice
case $choice in
    1)
        echo "Downloading video only..."
        yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]" "$url" -o "$filename"
        ;;
    2)
        echo "Downloading audio only..."
        yt-dlp -x --audio-format mp3 "$url" -o "$filename"
        ;;
    3)
        echo "Downloading both video and audio..."
        yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]" "$url" -o "$filename"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo -e "${COLOR_GREEN}Download completed successfully!${COLOR_RESET}"
else
    echo -e "${COLOR_RED}Download failed. Please check the URL and try again.${COLOR_RESET}"
fi
