## 🎥 YouTube Video/Playlist Downloader Script

This is a simple Bash script that uses `yt-dlp` to download videos or audio from YouTube videos or playlists. It allows you to choose between downloading video only, audio only, or both video and audio.

## 🚀 Features

- Download from **YouTube videos** or **playlists**.
- Choose to download:
  - Video only
  - Audio only (in MP3 format)
  - Both video and audio
- Saves files to a specified directory with customizable names.
- Provides an interactive interface for easy use.
- Checks if `yt-dlp` is installed and prompts for installation if missing.

## 🛠️ Prerequisites

Ensure `yt-dlp` is installed on your system. If not, you can install it using:

```bash
sudo pip3 install -U yt-dlp
```

### Installation in a Virtual Environment (Recommended for Newer Ubuntu Versions)

If you encounter an externally-managed-environment error, use a Python virtual environment:

```bash
# Install the venv module if it's not already installed
sudo apt install python3-venv

# Create a virtual environment in a directory named 'yt-dlp-env'
python3 -m venv yt-dlp-env

# Activate the virtual environment
source yt-dlp-env/bin/activate

# Now install yt-dlp using pip
sudo pip3 install -U yt-dlp

# To exit the virtual environment after running the script:
deactivate
```

## 📅 Installation

1. Download the script or clone this repository:

   ```bash
   git clone https://github.com/your-username/yt-dlp-downloader.git
   cd yt-dlp-downloader
   ```

2. Make the script executable if needed:

   ```bash
   chmod +x YTDL.sh
   ```

## 📌 Usage

1. Run the script:

   ```bash
   ./YTDL.sh
   ```

2. Follow the prompts:

   - **Enter the YouTube video/playlist URL**.
   - **Specify a directory** to save the downloads (default is `YTVids`).
   - **Choose a download option**:
     - `1` - Download video only
     - `2` - Download audio only (MP3)
     - `3` - Download both video and audio

3. The script will download the content based on your choice and save it to the specified directory.

## 🎬 Example Run

```
Enter YouTube Video/Playlist URL: https://www.youtube.com/playlist?list=PLexample
Enter directory to save the videos (default is 'YTVids'): MyDownloads

Please choose a download option:
-----------------------------------------
1. Download Video Only
2. Download Audio Only
3. Download Both Video and Audio
-----------------------------------------
Enter your choice (1-3): 1

Downloading video only...
[yt-dlp output]
Download completed successfully!
```

## 📜 Notes

- **Format**: Videos are downloaded in MP4 format, and audio in MP3.
- **Dependencies**: The script relies on `yt-dlp` for downloading content.
- Ensure you have sufficient storage space for large playlists.
