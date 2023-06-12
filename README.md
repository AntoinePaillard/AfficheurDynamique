# AfficheurDynamique

# PRE-REQUIS
- Télécharger la dernière version de RaspiOS (Buster) -> https://downloads.raspberrypi.org/raspios_oldstable_lite_armhf/images/
- Utiliser Raspberry Pi Imager pour installer RaspiOS sur une carte SD -> https://www.raspberrypi.com/software/

# Configuration

Mise à jour de l'OS
```
sudo apt update && sudo apt upgrade
```

## Installation du serveur FTP et du lecteur Vidéo (VLC)  :
```
sudo apt install proftpd
```
```
sudo apt install vlc
```

## permet de lancer VLC en tant qu'admin
```
sudo sed -i 's/geteuid/getppid/' /usr/bin/vlc
```

## Créer le dossier ou seront déposer les vidéo à lire :
```
mkdir /home/pi/videos
```

## Création du script de lecture automatique des vidéos :
Placer `SCRIPT_Afficheur.sh` et `/home/pi/SCRIPT_Mappage.sh` sous `/home/pi`

## Pour rendre le Raspberry Pi totalement autonome, il faut lancer ce script dès le démarrage. Il suffit d’éditer le rc.local avec :
```sudo nano /etc/rc.local```

## Exécution des sctips au démarrage
```
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

sudo bash /home/pi/SCRIPT_Mappage.sh &
sudo bash /home/pi/SCRIPT_Afficheur.sh

# Print the IP address
_IP=$(hostname -I) || true
if [ "$_IP" ]; then
  printf "My IP address is %s\n" "$_IP"
fi

exit 0
```
