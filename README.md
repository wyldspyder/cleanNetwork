# cleanNetwork
Bash Script utilisé pour nettoyer les fichiers de configuration de réseau sans-fil de Mac OS X.
le Script doit être éxécuter en mode superadmin (sudo)
Un mode verbose existe (-v)


l'ordre d'exécution :

1. désactivation du Wi-Fi,
2. dépacement de fichiers situé dans le dossier suivant dans un dossier backup
   
   path des fichiers : /Library/Preferences/SystemConfiguration/  

   Fichiers:

	com.apple.airport.preferences.plist
	com.apple.airport.preferences.plist-new
	NetworkInterfaces.plist
	preferences.plist
	com.apple.wifi.message-tracer.plist


3. déclenche un script de redémarage
