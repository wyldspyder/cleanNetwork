# cleanNetwork
Bash Script utilisé pour nettoyer les fichiers de configuration de réseau sans-fil de Mac OS X.

Ce Script doit être éxécuter en mode superadmin (sudo).

Un mode verbose existe (-v).

Après le redémarrage de l'ordinateur, il vous faudra renommer votre ordinateur. Pour effectuer la tâche allé dans:

1. préférence système -> partage
2. cliquer sur modifier
3. renomer à votre convenance (si vous ne savez pas quoi utilisé, prenez votre nom de courriel mirego)
 
Il se peut quel'ordinateur ne se reconnecte pas automatiquement au réseau sans-fil. Dans ce cas, cliquer sur votre icône réseau et choisisser mirego-ap.

## Exécution du script

1. Désactive le Wi-Fi si il n'est pas déjà désactivé
2. Créé un dossier caché de backup dans le dossier original si il n'est pas déjà créé
3. déplace les fichier si il existe dans le dossier de backup
4. démarre le script de redémarrage



## Annexe

path des fichiers 
- /Library/Preferences/SystemConfiguration/  

Fichiers
- com.apple.airport.preferences.plist
- com.apple.airport.preferences.plist-new
- NetworkInterfaces.plist
- preferences.plist
- com.apple.wifi.message-tracer.plist

