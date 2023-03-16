# Atlantis
https://www.runatlantis.io/docs/installation-guide.html
## Setup Atlantis en production
-	Setup du serveur
-	Setup du VCS dans notre cas github
	   - Bot Atlantis
     - Webhook

## VCS
Settings -> Développer settings -> Personnal access tokens -> Tokens (classic)  
Ajouter un Personnal access token (classic) pour que le serveur puisse faire des requêtes d’API a github avec ce compte la
https://github.com/settings/tokens
### Settings
![webhook](image/tokken-1.png)
### Settings / Developer Settings
![webhook](image/tokken-2.png)
### New personnal access token
![webhook](image/tokken-3.png)
### Generated token
![webhook](image/tokken-4.png)


## Webhook
Setup un webhook github :
Setting -> Code and automation -> Webhook -> Add webhook
### Repo / Webhook
![webhook](image/webhook-1.png)
### Manage Webhook
![webhook](image/webhook-2.png)
### Event trigger
![webhook](image/webhook-event1.png)
### Droits
![webhook](image/webhook-event2.png)
### Active webhook
![webhook](image/webhook-event3.png)

## Serveur

```bash
URL=http://my_serveur
USERNAME=atlantisgithubbotusername
TOKEN=ghp_XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
SECRET="XXXXXXXXXXXXXXXXXXXXXXX"
REPO_ALLOWLIST=*

sudo atlantis server \
--atlantis-url="$URL" \
--gh-user="$USERNAME" \
--gh-token="$TOKEN" \
--gh-webhook-secret="$SECRET" \
--repo-allowlist="$REPO_ALLOWLIST"
```
Les variables peuvent être remplacé par des variables d'environnements commencant par ATLANTIS_ (Exemple: ATLANTIS_GH_USER == --gh-user)

## Vérification
Afin de vérifier que atlantis marche et tourne bien :
- Se connecter sur la page web tournant sur le port 80 (http) / 443 (https)
![webhook](image/atlantis80.png)
- Se connecter sur le port 4141 (http://mon_serveur:4141/events) via le navigateur  et vérifier que l’on récupère bien un code d’erreur **405**

## Production
Liste des points à sécuriser sur un serveur Atlantis:
- Secrets des webhooks
- Credentials des providers cloud (AWS, AZURE, GCP, ect...)
- Variables d'environnements au lieu d'harcoder les secrets dans des fichiers de configuration
- SSL / HTTPS
- Authentification page web Atlantis
- RCE Atlantis plan / apply sur le serveur Atlantis

Source avec plus d'information: https://cloud.hacktricks.xyz/pentesting-ci-cd/atlantis-security
