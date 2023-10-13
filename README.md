# Afficheur Dynamique

## PRE-REQUIS
- Raspberry Pi 4 Model B 4 ou 8Go
- Carte SD de 32 Go 
- Télécharger la dernière version de [Raspberry Pi OS Lite (Bulleyes)](https://www.raspberrypi.com/software/operating-systems/)
- Utiliser [Raspberry Pi Imager](https://www.raspberrypi.com/software/) pour préparer la carte SD avec ces paramètres :
    - Activer le SSH
    - Définir un utilisateur
    - Ne pas configurer le Wi-Fi
    - Définir les réglages locaux (Fuseau horaire et clavier) sur Français
  
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

### Autoriser VLC à s'exécuter au démarrage
```
sudo sed -i 's/geteuid/getppid/' /usr/bin/vlc
```

### Créer le dossier ou seront déposer les vidéo à lire :
```
mkdir /home/pi/videos
```

### Création du script de lecture automatique des vidéos :
Placer ces 2 scripts suivant sous `/home/pi`
1. `SCRIPT_Afficheur.sh`
2. `SCRIPT_Mappage_Base.sh` ou `SCRIPT_Mappage_ENTA.sh`

### Exécuter les scripts au démarrage :
Nous allons modifier le fichier `rc.local` :
```
sudo nano /etc/rc.local
``` 
Pour y ajouter ces 2 lignes :
```
sudo bash /home/pi/SCRIPT_Mappage_Base.sh &  # OU sudo bash /home/pi/SCRIPT_Mappage_ENTA.sh &
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

sudo bash /home/pi/SCRIPT_Mappage_Base.sh &  # OU sudo bash /home/pi/SCRIPT_Mappage_ENTA.sh &
sudo bash /home/pi/SCRIPT_Afficheur.sh

# Print the IP address
_IP=$(hostname -I) || true
if [ "$_IP" ]; then
  printf "My IP address is %s\n" "$_IP"
fi

exit 0
```
