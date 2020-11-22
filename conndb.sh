#!/bin/bash




#Escribim un usage per a que l'usuari en cas que no sàpiga com actuar ho pugui veure fàcilment.
usage() {
    cat <<EOF
    ############################################################################
    
    conndb is a simple bash script used to provison a vagrant/lamp with adminer environment
    Using conndb is pretty simple, 
    
    #####################################################################
    
    The order must not be altered!
    conndb -u foo -h localhost -p 4000 -t
    
    conndb Usage:
	conndb -u DB_User
	       -h localhost
	       -p 4000
	       -t
	       
    -u tag is for the username  *	
    -h tag is for the hostname  *
    -p tag is for the port, default is 3306, use one from your convenience from 1024-65535
    -t tag is for connection purposes, test the connection
    
     * marked tags are needed!
     
     Enjoy!
    
EOF

exit 1
}
#Abans de res mirarem si l'usuari ha introduït algo al script, si no ha introduït res, saltarà la funció usage.
if [ -z $1 ]
then
	usage
	
fi






PORT=3306

#Getopts per a les opcions, u, h i p necessiten paràmetres si son invocades.
while getopts ":u:h:p:t" option; do
	
	case ${option} in
		


		u) #u de Usuari
			echo -e "Usuari --> $OPTARG\n"
			nomUser=$OPTARG
			#guardem la variable OPTARG en nomUser
			
			;;
	
		h) #h de Host
			echo -e "Host --> $OPTARG\n"
			nomHost=$OPTARG
			#guardem la variable OPTARG en nomHost
			
			;;
		p) #p de Port
			#si el port està entre el 65535 inclós fins al 1024 sense incloure, s'executarà el if sino surtira
			# amb exit 1.
			if [ $OPTARG -lt 65535 ] && [ $OPTARG -ge 1024 ];
			then
			echo -e "Port correcte\n"
			else
			echo -e "El port ha d'estar situat entre el 1024 (no inclós) i el 65535\n"
			exit 1
			fi
			port=$OPTARG
			
			;;
		
		t) #t per a la connexió de prova, paràmetre no necessari.
			echo -e "Connexió exitosa amb el nom d'usuari:$nomUser usant el host:$nomHost pel port:$port\n"
			
			;;
		:) #en cas que invoquin un paràmetre que necessiti un argument i l'usuari no l'introdueixi
			echo -e "ERROR: L'opció -$OPTARG necessita un argument!"
			exit 1
			;;
		\?) # en cas que l'usuari s'inventi lletres :)
			echo -e "ERROR: L'opció -$OPTARG no existeix al programa"
			usage
			exit 1
			;;
	
	esac
	
	
done
#reciclem els OPTIND per a que els Indicadors ja llegits per el programa s'eliminin.
shift $((OPTIND-1))
#Si només invoquem -u el script saltarà ja que és necessari invocar SI o SI -u i -h juntament.
#Sinó no ens deixarà.

if [ $OPTIND -eq 3 ];
	then
	echo "ERROR: El paràmetre -h és necessari per executar $0 correctament."
	exit 1
	fi
#If you want to see the script in real-motion / si vols veure l'script en funcionament real 
# visit / visita:
# 
# https://asciinema.org/a/B4u7owOO5ZVVSz4SApyh55Oaz
#

#GV
#Software lliure!








