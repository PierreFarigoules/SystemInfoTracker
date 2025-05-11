#  SystemInfoTracker

L'objectif est de créer deux scripts, un en **PowerShell**  et un en **Shell Bash**, afin de récupérer les informations d’un système et de les enregistrer automatiquement dans les formats **JSON**, **YAML** et **XML**.

---

##  Objectifs du Projet

- Créer deux scripts exécutables :
  - `info_system.ps1` (PowerShell)
  - `info_system.sh` (Bash)
- Récupérer automatiquement les informations suivantes :
  -  Nom de la machine
  -  Adresse IP
  -  Adresse MAC
  -  RAM disponible et totale
  -  Espace disque libre et total
  -  Date et heure système
  -  Nom et version de l’OS
- Générer trois fichiers de sortie :
  - `info.json`
  - `info.yaml`
  - `info.xml`

---


##  Fichiers attendus

```bash
SystemInfoTracker/
├── info_system.ps1        # Script PowerShell
├── info_system.sh         # Script Bash
├── info.json              # Données système au format JSON
├── info.yaml              # Données système au format YAML
├── info.xml               # Données système au format XML
└── README.md              # Présentation du projet
```