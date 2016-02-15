#!/bin/bash
#---------------------------------------------------------------------------#
# Script pour nettoyer les fichier de config de la carte réseau Sans-Fil
#
# Pour un mode plus bavard, utilisé l'option -v
#
#
#
#
#---------------------------------------------------------------------------#
# Localisation des fichier : 
rep="/Library/Preferences/SystemConfiguration/"
#
# Fichier à supprimer :
ficihers=()
fichiers+=("com.apple.airport.preferences.plist")
fichiers+=("com.apple.airport.preferences.plist-new")
fichiers+=("NetworkInterfaces.plist")
fichiers+=("preferences.plist")
fichiers+=("com.apple.wifi.message-tracer.plist")
#
#Dossier de backup
dBackup=".backup_02-2016"
#
#---------------------------------------------------------------------------#

var="$1"


#Mode verbose
if [ "$var" = "-v" ]
then
	mVerbose=true
else
	mVerbose=false
fi

# code de couleur pour la visibilité
ccRed=$(tput setaf 1)
ccGreen=$(tput setaf 2)
ccBlue=$(tput setaf 4)
ccNone=$(tput sgr0)

#verifie si le script est executé en mode superuser, termine si il ne l'est pas
if [[ $EUID -ne 0 ]]
then
	echo "Ce script doit être exécuté en mode sudo."
	exit 1
fi

# Désactive la connexion Sans-Fil si elle est active
nStatus=$(ifconfig en0 | grep "status" | cut -d " " -f 2)

echo
if [ $nStatus == "active" ]
then
	echo -e "$ccRed Sans-Fil Actif, désactivation...$ccNone"
	networksetup -setairportpower en0 off
else
	echo -e "$ccBlue Sans-fil désactivé$ccNone"
fi

echo

#Vérifie l'existence du dossier de backup et le créé si il n'existe pas
if [ -d "$rep$dBackup" ]
then
	if  $mVerbose  
	then 
		echo -e "$ccRed Le dossier backup $dBackup existe! $ccNone"
	fi
else
	if  $mVerbose  
	then
		echo -e "$ccBlue Le dossier Backup $dBackup n'existe pas, il sera créé $ccNone"
	fi
	mkdir $rep$dBackup
fi

echo

#verifie l'existence des fichiers et les copie dans le dossier de backup

for (( i=0; i<${#fichiers[@]}; i++ ))
do
	if [ -r $rep${fichiers[$i]} ]
	then
		if  $mVerbose  
		then
			echo -e "$ccGreen Trouvé!       $rep${fichiers[$i]}$ccNone"
		fi
		
		mv -f $rep${fichiers[$i]} "$rep$$dBackup{fichiers[$i]}" 
	else
		if  $mVerbose  
		then
				echo -e "$ccRed NON EXISTANT! $rep${fichiers[$i]}$ccNone"
		fi
	fi
done

echo

#Exécure le script de redémarrage
osascript -e 'tell app "loginwindow" to «event aevtrrst»'

#EOF