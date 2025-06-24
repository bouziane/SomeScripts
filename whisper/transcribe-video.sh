#!/bin/bash
shopt -s expand_aliases
source ~/.zshrc

# Vérifie que le fichier vidéo est fourni en argument
if [ -z "$1" ]; then
  echo "Usage: $0 <fichier_video>"
  exit 1
fi

# Variables
INPUT_VIDEO="$1"
VIDEO_DIR="$(dirname "$INPUT_VIDEO")"
BASENAME="$(basename "${INPUT_VIDEO%.*}")"
AUDIO_FILE="${VIDEO_DIR}/${BASENAME}.mp3"

# Extraction de l'audio avec FFmpeg
echo "Extraction de l'audio depuis la vidéo..."
ffmpeg -i "${INPUT_VIDEO}" -vn -acodec libmp3lame -q:a 2 "${AUDIO_FILE}"

# Vérifie si l'extraction a réussi
if [ ! -f "${AUDIO_FILE}" ]; then
  echo "❌ Erreur lors de l'extraction audio."
  exit 1
fi

# Transcription avec Whisper
echo "Début de la transcription..."
transcribe \
  -f "${AUDIO_FILE}"

echo "✅ Transcription terminée !"
echo "Fichiers générés dans : ${VIDEO_DIR}/"
