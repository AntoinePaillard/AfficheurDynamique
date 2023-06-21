# Afficheur Dynamique

## PRE-REQUIS
- Raspberry Pi 4 Model B 4 ou 8Go
- Carte SD de 32 Go 
- Télécharger la dernière version de [Raspberry Pi OS Lite (Bulleyes)](https://www.raspberrypi.com/software/operating-systems/)
- Utiliser [Raspberry Pi Imager](https://www.raspberrypi.com/software/) pour installer RaspiOS sur une carte SD

## Configuration
Connectez-vous en SSH au Raspberry pour exécuter les commandes ci-dessous.
### Mise à jour de l'OS
```
sudo apt update && sudo apt upgrade
```

### Installation du serveur FTP et du lecteur Vidéo (VLC)  :
```
sudo apt install proftpd
```
```
sudo apt install vlc
```

### Permet de lancer VLC sans se connecter
```
sudo sed -i 's/geteuid/getppid/' /usr/bin/vlc
```

### Créer le dossier ou seront déposer les vidéo à lire :
```
mkdir /home/pi/videos
```

### Création du script de lecture automatique des vidéos :
Placer les scripts suivant sous `/home/pi`
- `SCRIPT_Afficheur.sh`
- `SCRIPT_Mappage_Base.sh` ou `SCRIPT_Mappage_ENTA.sh`

### Exécuter les scripts au démarrage :
Nous allons modifier le fichier `rc.local` :
```
sudo nano /etc/rc.local
``` 
Pour y ajouter ces 2 lignes :
```
sudo bash /home/pi/SCRIPT_Mappage.sh &
sudo bash /home/pi/SCRIPT_Afficheur.sh
```

Comme ceci :
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
