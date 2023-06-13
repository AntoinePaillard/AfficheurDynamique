#!/bin/bash

# Montage des lecteurs réseau
sudo mount -t cifs -o username=<Mon utilisateur>,password=<Mon mot de passe> //Chemin/resau/ou/son/stocké/les/videos /home/pi/treville

sleep 5

while true; do
  # Copie des fichiers de TREVILLE vers GF
  sudo rsync -av --ignore-existing /home/pi/treville/* /home/pi/videos/

  # Suppression des fichiers de GF qui ne sont pas présents dans TREVILLE
  sudo rsync -av --delete /home/pi/treville/ /home/pi/videos/

  # Attente de 20 secondes avant la prochaine synchronisation
  sleep 20
done
