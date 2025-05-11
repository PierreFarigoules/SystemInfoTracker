#!/bin/bash

# info

nom=$(hostname)
ip=$(hostname -I | awk '{print $1}')
mac=$(cat /sys/class/net/ens160/address)
mem=$(free -h | grep Mem | awk '{print $2}')  #grep pour filtre la ligne Mem
disque=$(df -h / | grep '/' | awk '{print$2}') #awk pour extraire la colonne et $2 signigi 2eme colonne
Date=$(date)
system=$(cat /etc/os-release)




cat <<EOF > info.yaml #EOF sert à délimiter une section, début et fin d'une section, il nous sert a pas marqué echo à toute les lignes
Nom de la machine: "$nom"
Adresse ip: "$ip"
Adresse MAC: "$mac"
RAM: "$mem"
Espace disque: "$disque"
Date: "$Date"
Info du system: "$system"
EOF




#JSON
cat <<EOF > info.json
{
  "Nom de la machine": "$nom",
  "Adresse ip": "$ip",
  "adresse MAC": "$mac",
  "RAM": "$mem",
  "Espace disque": "$disque",
  "date": "$Date",
  "info du system": "$system",
}
EOF



#XML
cat <<EOF > info.xml
<systeme>
  <nom_de_la_machine>$nom</nom_de_la_machine>
  <adresse_ip>$ip</adresse_ip>
  <adresse_mac>$mac</adresse_mac>
  <ram>$mem</ram>
  <espace_disque>$disque</espace_disque>
  <date>$Date</date>
  <info_du_system>$system</info_du_system>
</systeme>
EOF

echo "fichier enregistrées en yaml json et xml :)"
