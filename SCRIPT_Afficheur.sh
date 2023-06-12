#!/bin/bash

# Répertoire local contenant les vidéos
videos="/home/pi/videos"

# Boucle de lecture de vidéo
while true; do
    # Parcours des fichiers du répertoire
    for file in "$videos"/*; do
        # Vérification si le fichier est une vidéo
        if [ -f "$file" ] && [[ "$file" == *.@(mp4|avi|mkv|mov) ]]; then
            cvlc "$file" --no-video-title-show --play-and-exit  # Lire la vidéo avec VLC en plein écran
        fi
    done
done

